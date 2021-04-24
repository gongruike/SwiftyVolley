//
//  RequestQueue.swift
//  SwiftyVolley
//
//  Created by GRK on 2021/4/17.
//

import Alamofire

open class RequestQueue {
    
    public let session: Session
    
    private let maximumActiveRequestCount: Int

    private var activeRequestCount: Int = 0
    
    private var queuedRequests: [RequestType] = []

    private let synchronizationQueue: DispatchQueue = {
        let name = String(format: "swifty.volley.request.queue.synchronizationqueue-%08x%08x", arc4random(), arc4random())
        return DispatchQueue(label: name)
    }()
    
    public init(configuration: URLSessionConfiguration = RequestQueue.defaultURLSessionConfiguration(),
                maximumActiveRequestCount: Int = 4) {
        self.session = Session(configuration: configuration, startRequestsImmediately: false)
        self.maximumActiveRequestCount = maximumActiveRequestCount
    }
    
    open func add(_ request: RequestType) {
        //
        synchronizationQueue.async {
            if self.isActiveRequestCountBelowMaximumLimit() {
                self.start(request)
            } else {
                self.queuedRequests.append(request)
            }
        }
    }
}

extension RequestQueue {
    //
    func onRequestStarted(_ request: RequestType) {
        synchronizationQueue.async {
            
        }
    }
    
    func onRequestFinished(_ request: RequestType) {
        synchronizationQueue.async {
            self.activeRequestCount -= 1

            self.startNextRequestIfNecessary()
        }
    }
    
    func onRequestFailed(_ request: RequestType, error: Error) {
        synchronizationQueue.async {
            self.activeRequestCount -= 1

            self.startNextRequestIfNecessary()
        }
    }
}

extension RequestQueue {
    
    private func start(_ request: RequestType) {
        dispatchPrecondition(condition: .onQueue(synchronizationQueue))

        activeRequestCount += 1
        request.start(in: self)
    }
    
    private func dequeue() -> RequestType? {
        dispatchPrecondition(condition: .onQueue(synchronizationQueue))

        var request: RequestType?
        if !queuedRequests.isEmpty {
            request = queuedRequests.removeFirst()
        }
        return request
    }
    
    private func startNextRequestIfNecessary() {
        dispatchPrecondition(condition: .onQueue(synchronizationQueue))

        guard isActiveRequestCountBelowMaximumLimit() else { return }
        guard let request = dequeue() else { return }
        
        start(request)
    }

    private func isActiveRequestCountBelowMaximumLimit() -> Bool {
        dispatchPrecondition(condition: .onQueue(synchronizationQueue))

        return activeRequestCount < maximumActiveRequestCount
    }
}

extension RequestQueue {
    open class func defaultURLSessionConfiguration() -> URLSessionConfiguration {
        let configuration = URLSessionConfiguration.default

        configuration.headers = .default
        configuration.httpShouldSetCookies = true
        configuration.httpShouldUsePipelining = false

        configuration.requestCachePolicy = .useProtocolCachePolicy
        configuration.allowsCellularAccess = true
        configuration.timeoutIntervalForRequest = 10

        configuration.urlCache = RequestQueue.defaultURLCache()

        return configuration
    }

    open class func defaultURLCache() -> URLCache {
        let memoryCapacity = 20 * 1024 * 1024
        let diskCapacity = 150 * 1024 * 1024
        let diskPath = "swifty.volley.request.queue"

        return URLCache(memoryCapacity: memoryCapacity,
                        diskCapacity: diskCapacity,
                        diskPath: diskPath)
    }
}
