//
//  ViewController.swift
//  CurrencyConverter
//
//  Created by Sabri Çetin on 28.05.2024.
//

import UIKit

class ViewController: UIViewController {
    

    @IBOutlet weak var cadLabel: UILabel!
    @IBOutlet weak var chfLabel: UILabel!
    @IBOutlet weak var gbpLabel: UILabel!
    @IBOutlet weak var jpyLabel: UILabel!
    @IBOutlet weak var usdLabel: UILabel!
    @IBOutlet weak var tryLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func getRatesClicked(_ sender: Any) {
        
        /* APİ Nasıl Kullanılır Sırası İle
         
            1-) Request & Session                Web adresine Gitmek
            2-) Response & Data                  Datayı almak
            3-) Parsing & JSON Serialization     Bu datayı işlemek
        */
        
        //1. Adım
        let url = URL(string: "http://data.fixer.io/api/latest?access_key=ac3cf451e543de55a8dd77f41845a3d9")
        let session = URLSession.shared
        
        //Closure
        
        let task = session.dataTask(with: url!) { data, response, error in
            if error != nil {
                let alert = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: UIAlertController.Style.alert);
                let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
                alert.addAction(okButton)
                self.present(alert, animated: true , completion: nil)
            }
            else {
                //2. Adım
                if data != nil {
                    do {
                        let jsonResponse = try   JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as! Dictionary<String , Any >

                        //ASYNC
                        DispatchQueue.main.async {
                            
                           //3. Adım
                            
                            if let rates = jsonResponse["rates"] as? [String : Any] {
                               // print (rates)
                                if let cad = rates ["CAD"] as? Double {
                                    self.cadLabel.text = "CAD : \(cad)"
                                }
                                if let chf = rates ["CHF"] as? Double {
                                    self.chfLabel.text = "CHF : \(chf)"
                                }
                                if let gbp = rates ["GBP"] as? Double {
                                    self.gbpLabel.text = "GBP: \(gbp)"
                                }
                                if let jpy = rates ["JPY"] as? Double {
                                    self.jpyLabel.text = "JPY : \(jpy)"
                                }
                                if let usd = rates ["USD"] as? Double {
                                    self.usdLabel.text = "USD : \(usd)"
                                }
                                if let turkish = rates ["TRY"] as? Double {
                                    self.tryLabel.text = "TRY : \(turkish)"
                                }
                            }
                        }
                    } catch {
                        print ("Error")
                    }
                }
            }
        }
        task.resume()
    }
}

