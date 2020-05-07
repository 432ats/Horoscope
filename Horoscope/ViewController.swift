//
//  ViewController.swift
//  Horoscope
//
//  Created by AtsushiShimizu on 2020/05/07.
//  Copyright © 2020 ats432. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    var seiza = [
        "牡羊座",
        "牡牛座",
        "双子座",
        "蟹座",
        "獅子座",
        "乙女座",
        "天秤座",
        "蠍座",
        "射手座",
        "山羊座",
        "水瓶座",
        "魚座"
    ]

    @IBOutlet weak var pickerView: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.pickerView.delegate = self
        self.pickerView.dataSource = self
    }
    
    @IBAction func didTapHoroscopeButton(_ sender: Any) {
        self.performSegue(withIdentifier: "ResultSegue", sender: nil)
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return self.seiza.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return self.seiza[row]
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "ResultSegue") {
            let next: ResultViewController = segue.destination as! ResultViewController
            
            next.sign = self.pickerView.selectedRow(inComponent: 0)
        }
    }
}

