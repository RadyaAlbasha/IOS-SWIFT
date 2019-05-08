//
//  MovieTableViewController.swift
//  MovieList
//
//  Created by JETS Mobile Lab - 2 on 5/5/19.
//  Copyright © 2019 ITI. All rights reserved.
//

import UIKit
import CoreData
class MovieTableViewController: UITableViewController,AddMovieProtocol {
    
    ///var moviesArr : Array<Movie>?
    var moviesArr : Array<NSManagedObject>?
    //var movie = Movie()
    override func viewDidLoad() {
        super.viewDidLoad()
      
        
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

//    func addNewMovie(newMovie: Movie) {
//        moviesArr?.append(newMovie)
//        self.tableView.reloadData()
//    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        //bgeb ely 3amlalo save kolo
        let appDeleget = UIApplication.shared.delegate as! AppDelegate
        let manegerContext = appDeleget.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "MovieModel")
        do{
            moviesArr = try manegerContext.fetch(fetchRequest)
        }catch{
            print(error)
        }
        
    }
    func addNewMovie(newMovie: NSManagedObject) {
        let appDeleget = UIApplication.shared.delegate as! AppDelegate
        let manegerContext = appDeleget.persistentContainer.viewContext
        //let entity = NSEntityDescription.entity(forEntityName: "MovieModel", in: manegerContext)
        do{
            try manegerContext.save()
            moviesArr!.append(newMovie)
            self.tableView.reloadData()
        }
        catch let error as NSError{
            print(error.localizedDescription)
        }
    }
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
       /// return moviesArr!.count
        return moviesArr!.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        // Configure the cell...
        //cell.textLabel?.text = moviesArr![indexPath.row].title
        if(moviesArr != nil){
            cell.textLabel?.text = moviesArr![indexPath.row].value(forKey: "title") as? String
            cell.imageView?.downloaded(from: moviesArr![indexPath.row].value(forKey: "image") as! String)
            //cell.imageView?.downloaded(from:  moviesArr![indexPath.row].image!)
            // cell.imageView?.image = UIImage(named: moviesArr![indexPath.row].image!)
            if   cell.imageView?.image == nil {
                cell.imageView?.image = UIImage(named: ("apple.png"))
            }
        }
        
        return cell
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let str = segue.destination.restorationIdentifier
        if str == "MovieViewController"{
            let movieVC = segue.destination as! ViewController
            //movieVC.firstVC=self
            //movieVC.movie = moviesArr![(self.tableView.indexPathForSelectedRow?.row)!]
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

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let appDeleget = UIApplication.shared.delegate as! AppDelegate
            let manegerContext = appDeleget.persistentContainer.viewContext
            manegerContext.delete(moviesArr![indexPath.row])
            //el trteb mohem amsa7 men el array b3den ams7ha men el view
            moviesArr!.remove(at: indexPath.row)
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
            do{
                try manegerContext.save()
            }catch{
                print("Error")
            }
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }
    

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
