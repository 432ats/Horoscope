//
//  ResultViewController.swift
//  Horoscope
//
//  Created by AtsushiShimizu on 2020/05/07.
//  Copyright © 2020 ats432. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ResultViewController: UIViewController {

    var sign = 0
    let signImage = UIImageView()
    
    @IBOutlet weak var signLabel: UILabel!
    @IBOutlet weak var rankLabel: UILabel!
    @IBOutlet weak var commentLabel: UILabel!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.getHoroscope()
    }
    
    // 占いAPIの取得（JSON形式）
    func getHoroscope() {
        
        
        
        let now = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = DateFormatter.dateFormat(fromTemplate: "yyyy/MM/dd", options: 0, locale: Locale(identifier: "ja_JP"))
        let nowStr = dateFormatter.string(from: now)
        
        let requestString = "http://api.jugemkey.jp/api/horoscope/free/" + nowStr
        
//        //
//        let backgroundImage = UIImage(named: "dodo")!
//        self.view.backgroundColor = UIColor(patternImage: backgroundImage)
//        //
        
        AF.request(requestString).responseJSON { response in
            
            let jsonObject = response.value!
            let json = JSON(jsonObject)
            
            let result = json["horoscope"][nowStr][self.sign]
            let rank = result["rank"].stringValue
            let sign = result["sign"].stringValue
            let content = result["content"].stringValue
            
            self.signLabel.text = sign
            self.rankLabel.text = rank
            self.commentLabel.text = content
            
            
            
        }
        

    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
