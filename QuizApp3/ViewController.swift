//
//  ViewController.swift
//  QuizAppSwift
//
//  Created by 池田享浩 on 2016/01/13.
//  Copyright © 2016年 takahiro ikeda. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    //headerファイルにあったもの
    @IBOutlet weak var daimei: UILabel!
    @IBOutlet weak var mondaibun: UITextView!
    @IBOutlet weak var nextbuttonp: UIButton!
    @IBOutlet weak var mbuttonp: UIButton!
    @IBOutlet weak var bbuttonp: UIButton!
    
    //.mにあったもの
    var count: NSInteger!
    var tensuu: NSInteger!
    var soundFileName: String!
    var timer:NSTimer!
    
    var player: AVAudioPlayer!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        count = 1
        
        initialize()
    }

    func initialize(){
        tensuu = 0
        daimei.text = "第1問"
        mondaibun.text = "ゾロの夢は、世界一の剣豪になることである。"
        mondaibun.font = UIFont.systemFontOfSize(CGFloat(12))
        mondaibun.editable = false
        nextbuttonp.hidden = true
        mbuttonp.hidden = false
        bbuttonp.hidden = false
    }
    
    @IBAction func mbutton(sender: UIButton){
        nextbuttonp.hidden = false
        mbuttonp.hidden = true
        bbuttonp.hidden = true
        switch (count) {
        case 1:
            mondaibun.text = "正解!"
            seikai()
            tensuu = tensuu + 1
            break
        case 2:
            mondaibun.text = "正解!"
            seikai()
            tensuu = tensuu + 1
            break
        case 3:
            mondaibun.text = "正解!"
            seikai()
            tensuu = tensuu + 1
            break
        case 4:
            mondaibun.text = "正解!"
            seikai()
            tensuu = tensuu + 1
            break
        case 5:
            mondaibun.text = "正解!"
            seikai()
            tensuu = tensuu + 1
            break

        default:
            break
        }
        count = count + 1
    }
    
    @IBAction func bbutton(sender: UIButton){
        nextbuttonp.hidden = false
        mbuttonp.hidden = true
        bbuttonp.hidden = true
        switch(count) {
        case 1:
            mondaibun.text = "残念!"
            huseikai()
            break
        case 2:
            mondaibun.text = "残念!"
            huseikai()
            break
        case 3:
            mondaibun.text = "残念!"
            huseikai()
            break
        case 4:
            mondaibun.text = "残念!"
            huseikai()
            break
        case 5:
            mondaibun.text = "残念!"
            huseikai()
            break
        default:
            break
        }
        count = count + 1
        
    }
    
    @IBAction func nextbutton(sender: UIButton){
        if(count<=5){
            nextbuttonp.hidden = true
            mbuttonp.hidden = false
            bbuttonp.hidden = false
        }
        
        switch(count){
        case 2:
            daimei.text = "第2問"
            mondaibun.text = "ナミの夢は、世界中の海図を書くことである。"
            break
        case 3:
            daimei.text = "第3問"
            mondaibun.text = "サンジの夢は、伝説の海オールブルーを見つけることである。"
            break
        case 4:
            daimei.text = "第4問"
            mondaibun.text = "ウソップの夢は、勇敢なる海の戦士になあることである。"
            break
        case 5:
            daimei.text = "第5問"
            mondaibun.text = "チョッパーの夢は、なんでも治せる医者になることである。"
            break
        case 6:
            daimei.text = nil
            let kekka = tensuu * 100/5
            mondaibun.text = "正解率は、\(kekka)％です。最初に戻ります"
            count = count + 1
            break
        default:
            count = 1
            initialize()
            break
        }
        
    }
    
    func seikai(){
        //soundFileName = "maru"
        playsound("maru")
        timer = NSTimer.scheduledTimerWithTimeInterval(2.0, target: self, selector: Selector("stop"), userInfo: nil, repeats: false)
    }
    
    func huseikai(){
        //soundFileName = "batu"
        playsound("batu")
        timer = NSTimer.scheduledTimerWithTimeInterval(2.0, target: self, selector: Selector("stop"), userInfo: nil, repeats: false)
    }
    
    
    func stop(){
        
        player.stop()
        
    }
    
    func playsound(soundFileName: String){
        let url = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource(soundFileName, ofType:"m4a")!)
        
        do {
            player = try AVAudioPlayer(contentsOfURL: url)
            
        } catch {
            player = nil
            
        }
       
        player.play()
        
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

