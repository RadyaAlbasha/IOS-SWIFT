//
//  MovieTableViewController.swift
//  MovieList
//
//  Created by JETS Mobile Lab - 2 on 5/5/19.
//  Copyright © 2019 ITI. All rights reserved.
//

import UIKit

class MovieTableViewController: UITableViewController,AddMovieProtocol {
    
    var moviesArr : Array<Movie>?
    var movie = Movie()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let m1 = Movie()
        m1.title = "Dawn of the Planet of the Apes"
        m1.rating = "8.3"
        m1.releaseYear = 2014
        m1.genor = ["Action", "Drama", "Sci-Fi"]
        m1.image = "1-2.jpg"
        
        let m2 = Movie()
        m2.title = "District 9"
        m2.rating = "8"
        m2.releaseYear = 2009
        m2.genor = ["Action", "Sci-Fi", "Thriller"]
        m2.image = "2.jpg"
        
        let m3 = Movie()
        m3.title = "Transformers: Age of Extinction"
        m3.rating = "6.3"
        m3.releaseYear = 2014
        m3.genor = ["Action", "Adventure", "Sci-Fi"]
        m3.image = "3.jpg"
        
        let m4 = Movie()
        m4.title = "X-Men: Days of Future Past"
        m4.rating = "8.4"
        m4.releaseYear = 2014
        m4.genor = ["Action", "Sci-Fi", "Thriller"]
        m4.image = "4.jpg"
        
        let m5 = Movie()
        m5.title = "The Machinist"
        m5.rating = "7.8"
        m5.releaseYear = 2004
        m5.genor = ["Drama", "Thriller"]
        m5.image = "5.jpg"
        
        moviesArr = [m1,m2,m3,m4,m5]
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    func addNewMovie(newMovie: Movie) {
        moviesArr?.append(newMovie)
        self.tableView.reloadData()
    }
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return moviesArr!.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        // Configure the cell...
        cell.textLabel?.text = moviesArr![indexPath.row].title
        cell.imageView?.image = UIImage(named: moviesArr![indexPath.row].image!)
        if   cell.imageView?.image == nil {
             cell.imageView?.image = UIImage(named: ("apple.png"))
        }
        return cell
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        var str = segue.destination.restorationIdentifier
        if str == "MovieViewController"{
            let movieVC = segue.destination as! ViewController
            //movieVC.firstVC=self
            movieVC.movie = moviesArr![(self.tableView.indexPathForSelectedRow?.row)!]
        }
       else
        {
            let addMVC = segue.destination as! AddMovieViewController
            addMVC.firstVC=self
        }
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
