//
//  ViewController.swift
//  MovieList
//
//  Created by JETS Mobile Lab - 2 on 5/5/19.
//  Copyright © 2019 ITI. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var releaseLabel: UILabel!
    @IBOutlet weak var genreLabel: UILabel!
    var movie = Movie()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        titleLabel.text = movie.title!
        ratingLabel.text = movie.rating!
        releaseLabel.text = String(movie.releaseYear)
        genreLabel.text = ""
        for g in 0..<(movie.genor?.count)!{
            genreLabel.text?.append((movie.genor?[g])!);
            genreLabel.text?.append(" , ");
        }
        myImage.image = UIImage(named: (movie.image)!)
    }


}

