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
     var firstVC : AddMovieProtocol?
    override func viewDidLoad() {
        super.viewDidLoad()

        titleText.text = ""
        releasText.text = ""
        gonreText.text = ""
        imageText.text = ""
        ratingText.text = ""
       /**/
        // Do any additional setup after loading the view.
    }
    
    @IBAction func AddMovie(_ sender: UIBarButtonItem) {
        self.navigationController?.popViewController(animated: true)
        
        if(releasText.text != "" && titleText.text != ""){
            movie.title = titleText.text
            movie.releaseYear = Int(releasText.text!)!
            movie.genor = gonreText.text?.components(separatedBy: " , ")//[gonreText.text] as? [String]
            print(movie.genor)
            movie.image=imageText.text
            movie.rating = ratingText.text
            firstVC?.addNewMovie(newMovie: movie)
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
