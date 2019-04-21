//
//  AddWordViewController.swift
//  EasyDictrionary
//
//  Created by Андрей Беляев on 03/04/2019.
//  Copyright © 2019 Андрей Беляев. All rights reserved.
//

import UIKit

class AddWordViewController: UIViewController {

    @IBOutlet weak var translateText: UILabel!
    @IBOutlet weak var wordText: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
//        let key = "dict.1.1.20190420T192214Z.2fec19be2e94ca8e.f3b6afea5b114a3de5cf12913b6656f656cba1df"
//        let baseURL = URL(string: "https://dictionary.yandex.net/api/v1/dicservice.json/lookup?key=" + key + "&lang=en-ru")
//        let fullURL = URL(string: "&text=time", relativeTo: baseURL)
//        //https://dictionary.yandex.net/api/v1/dicservice.json/lookup?key=dict.1.1.20190420T192214Z.2fec19be2e94ca8e.f3b6afea5b114a3de5cf12913b6656f656cba1df&lang=en-ru&text=time
//        let sessionconfiguration = URLSessionConfiguration.default
//        let session = URLSession(configuration: sessionconfiguration)
//        
//        let request = URLRequest(url: fullURL)
//        let dataTask = session.dataTask(with: fullURL!) { (data, response, error)
//            
//        }
//        dataTask.resume()
    }
    
    @IBAction func searchWord(_ sender: UITextField) {
        
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
