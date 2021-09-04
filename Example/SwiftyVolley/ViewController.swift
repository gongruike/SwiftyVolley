//
//  ViewController.swift
//  SwiftyVolley
//
//  Created by Ruike Gong on 04/17/2021.
//  Copyright (c) 2021 Ruike Gong. All rights reserved.
//

import UIKit
import SwiftyVolley
import Alamofire


/**
 {
   "data": {
     "id": "5b8b9572e116fb3714e6ffff",
     "content": "十月到幽州，戈鋋若罗星。",
     "popularity": 2470,
     "origin": {
       "title": "经乱离后天恩流夜郎忆旧游书怀赠江夏韦太守良宰",
       "dynasty": "唐代",
       "author": "李白",
       "content": [
         "天上白玉京，十二楼五城。仙人抚我顶，结发受长生。",
         "误逐世间乐，颇穷理乱情。九十六圣君，浮云挂空名。",
         "天地赌一掷，未能忘战争。试涉霸王略，将期轩冕荣。",
         "时命乃大谬，弃之海上行。学剑翻自哂，为文竟何成。",
         "剑非万人敌，文窃四海声。儿戏不足道，五噫出西京。",
         "临当欲去时，慷慨泪沾缨。叹君倜傥才，标举冠群英。",
         "开筵引祖帐，慰此远徂征。鞍马若浮云，送余骠骑亭。",
         "歌钟不尽意，白日落昆明。十月到幽州，戈鋋若罗星。",
         "君王弃北海，扫地借长鲸。呼吸走百川，燕然可摧倾。",
         "心知不得语，却欲栖蓬瀛。弯弧惧天狼，挟矢不敢张。",
         "揽涕黄金台，呼天哭昭王。无人贵骏骨，騄耳空腾骧。",
         "乐毅倘再生，于今亦奔亡。蹉跎不得意，驱马还贵乡。",
         "逢君听弦歌，肃穆坐华堂。百里独太古，陶然卧羲皇。",
         "征乐昌乐馆，开筵列壶觞。贤豪间青娥，对烛俨成行。",
         "醉舞纷绮席，清歌绕飞梁。欢娱未终朝，秩满归咸阳。",
         "祖道拥万人，供帐遥相望。一别隔千里，荣枯异炎凉。",
         "炎凉几度改，九土中横溃。汉甲连胡兵，沙尘暗云海。",
         "草木摇杀气，星辰无光彩。白骨成丘山，苍生竟何罪。",
         "函关壮帝居，国命悬哥舒。长戟三十万，开门纳凶渠。",
         "公卿如犬羊，忠谠醢与菹。二圣出游豫，两京遂丘墟。",
         "帝子许专征，秉旄控强楚。节制非桓文，军师拥熊虎。",
         "人心失去就，贼势腾风雨。惟君固房陵，诚节冠终古。",
         "仆卧香炉顶，餐霞漱瑶泉。门开九江转，枕下五湖连。",
         "半夜水军来，浔阳满旌旃。空名适自误，迫胁上楼船。",
         "徒赐五百金，弃之若浮烟。辞官不受赏，翻谪夜郎天。",
         "夜郎万里道，西上令人老。扫荡六合清，仍为负霜草。",
         "日月无偏照，何由诉苍昊。良牧称神明，深仁恤交道。",
         "一忝青云客，三登黄鹤楼。顾惭祢处士，虚对鹦鹉洲。",
         "樊山霸气尽，寥落天地秋。江带峨眉雪，川横三峡流。",
         "万舸此中来，连帆过扬州。送此万里目，旷然散我愁。",
         "纱窗倚天开，水树绿如发。窥日畏衔山，促酒喜得月。",
         "吴娃与越艳，窈窕夸铅红。呼来上云梯，含笑出帘栊。",
         "对客小垂手，罗衣舞春风。宾跪请休息，主人情未极。",
         "览君荆山作，江鲍堪动色。清水出芙蓉，天然去雕饰。",
         "逸兴横素襟，无时不招寻。朱门拥虎士，列戟何森森。",
         "剪凿竹石开，萦流涨清深。登台坐水阁，吐论多英音。",
         "片辞贵白璧，一诺轻黄金。谓我不愧君，青鸟明丹心。",
         "五色云间鹊，飞鸣天上来。传闻赦书至，却放夜郎回。",
         "暖气变寒谷，炎烟生死灰。君登凤池去，忽弃贾生才。",
         "桀犬尚吠尧，匈奴笑千秋。中夜四五叹，常为大国忧。",
         "旌旆夹两山，黄河当中流。连鸡不得进，饮马空夷犹。",
         "安得羿善射，一箭落旄头。"
       ],
       "translate": null
     },
     "matchTags": [
       "华北",
       "幽州"
     ],
     "recommendedReason": "",
     "cacheAt": "2021-06-27T17:42:21.607547"
   },
   "token": "rLP6IZmVELocJut85iJ5f+mEe5l95D+g",
   "ipAddress": "111.199.190.183",
   "warning": null
 }
 */

struct Samele: Decodable {
    
    let status: String

    let token: String

    let ipAddress: String

    let warning: String?
    
    let data: Samele.Data

    struct Data: Decodable {
        
        let id: String

        let content: String

        let popularity: Int
        
        let matchTags: [String]
        
        let recommendedReason: String

        let cacheAt: String
        
        let origin: Origin
        
        struct Origin: Decodable {
            
            let title: String

            let dynasty: String

            let author: String

            let content: [String]

            let translate: String?
        }
        
    }
        
}

extension Endpoint {
    static func sample() -> Endpoint<Samele> {
        .init(path: "one.json")
    }
}

class ViewController: UIViewController {

    lazy var apiClient: APIClient = {
       return APIClient(requestEncoder: DefaultRequestEncoder(baseURL: URL(string: "https://v2.jinrishici.com/")!))
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func topBtnDidClicked(_ sender: Any) {
        ///
        apiClient.request(endpoint: .sample()) { (result) in
            ///
            print(result)
        }
    }
    
}

