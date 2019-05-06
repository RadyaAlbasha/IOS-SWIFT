//
//  MainViewController.swift
//  MovieList
//
//  Created by Esraa Hassan on 5/6/19.
//  Copyright © 2019 ITI. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    var moviesArr = [Movie]()
     var m = Movie()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let url = URL(string: "https://api.androidhive.info/json/movies.json")
        
        let request = URLRequest(url: url!)
        
        let session = URLSession(configuration: URLSessionConfiguration.default)
        
        let task = session.dataTask(with: request) { (data, respons, error) in
            do{
                var output = try JSONSerialization.jsonObject(with: data!, options: .allowFragments) as! Array<Dictionary<String,Any>>
                for n in 0..<output.count{
                    var dict = output[n]
                    print(dict["title"]!)
                    print(dict["rating"]!)
                    print(dict["genre"]!)
                    print(dict["releaseYear"]!)
                    print(dict["image"]!)
                    self.m = Movie()
                    self.m.title = dict["title"]! as! String
                    if let quantity = dict["rating"]! as? NSNumber {
                        self.m.rating = quantity.stringValue
                    }
                    else if let quantity = dict["rating"]! as? String {
                        self.m.rating = quantity
                    }
                    self.m.genor = (dict["genre"]! as! Array<String>)//[gonreText.text] as? [String]
                    self.m.releaseYear = dict["releaseYear"]! as! Int
                    self.m.image = dict["image"]! as! String
                    self.moviesArr.append(self.m)
                }
            }
            catch{
                print("Error!")
            }
            }.resume()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       let movieTVC = segue.destination as! MovieTableViewController
        movieTVC.moviesArr = self.moviesArr
       // movieTVC.addMovies(newMovies: self.moviesArr)
        
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
