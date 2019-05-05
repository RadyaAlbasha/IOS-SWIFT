//
//  AddMovieViewController.swift
//  MovieList
//
//  Created by JETS Mobile Lab - 2 on 5/5/19.
//  Copyright © 2019 ITI. All rights reserved.
//

import UIKit

class AddMovieViewController: UIViewController {

    @IBOutlet weak var titleText: UITextField!
    
    @IBOutlet weak var imageText: UITextField!
    
    @IBOutlet weak var ratingText: UITextField!
    
    @IBOutlet weak var releasText: UITextField!
    
    @IBOutlet weak var gonreText: UITextField!
    var movie = Movie()
    override func viewDidLoad() {
        super.viewDidLoad()

        movie.title = titleText.text
        movie.releaseYear = Int(releasText.text!)!
        movie.genor = [gonreText.text] as? [String]
        movie.image=imageText.text
        movie.rating = ratingText.text
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let movieVC = segue.destination as! MovieTableViewController
        //movieVC.firstVC=self
        movieVC.movie = movie
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
