//
//  ViewController.swift
//  NetworkingDemo
//
//  Created by JETS Mobile Lab - 2 on 5/5/19.
//  Copyright © 2019 ITI. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var activityIndecator = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.gray)

    @IBOutlet weak var myLabel: UILabel!
    @IBAction func startTask(_ sender: UIButton) {
        let url = URL(string: "https://api.androidhive.info/json/movies.json")
        
        let request = URLRequest(url: url!)
        
        let session = URLSession(configuration: URLSessionConfiguration.default)
       // UIApplication.shared.isNetworkActivityIndicatorVisible = true
        activityIndecator.startAnimating()
        let task = session.dataTask(with: request) { (data, respons, error) in
            do{
            var output = try JSONSerialization.jsonObject(with: data!, options: .allowFragments) as! Array<Dictionary<String,Any>>
                
                var dict = output[0]
                print(dict["title"]!)
                DispatchQueue.main.async {
                    self.myLabel.text = dict["title"]! as! String
                    //UIApplication.shared.isNetworkActivityIndicatorVisible = false
                    
                    self.activityIndecator.stopAnimating()
                }
                
            }
            catch{
                print("Error!")
            }
        }.resume()
        //task.resume()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        activityIndecator.center = view.center
        self.view.addSubview(activityIndecator)
        // Do any additional setup after loading the view, typically from a nib.
    }


}

