//
//  ViewController.swift
//  MovieList
//
//  Created by JETS Mobile Lab - 2 on 5/5/19.
//  Copyright © 2019 ITI. All rights reserved.
//

import UIKit
import CoreData
class ViewController: UIViewController {
    
    @IBOutlet weak var myImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var releaseLabel: UILabel!
    @IBOutlet weak var genreLabel: UILabel!
   // var movie = Movie()
    var movie = NSManagedObject()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        titleLabel.text = movie.value(forKey: "title") as? String //movie.title!
        ratingLabel.text = movie.value(forKey: "rating") as? String//movie.rating!
        releaseLabel.text = movie.value(forKey: "releaseYear") as? String//String(movie.releaseYear)
        genreLabel.text = ""
        var genor = movie.value(forKey: "genor") as! Array<String>
        for g in 0..<genor.count{
            genreLabel.text?.append((genor[g]));
            if g != (genor.count) - 1{
                genreLabel.text?.append(" , ");
            }
        }
        myImage.downloaded(from:  movie.value(forKey: "image") as! String)
        //myImage.image = UIImage(named: (movie.image)!)
        if  myImage.image == nil {
            myImage.image = UIImage(named: ("apple.png"))
        }
    }
    
    
}

