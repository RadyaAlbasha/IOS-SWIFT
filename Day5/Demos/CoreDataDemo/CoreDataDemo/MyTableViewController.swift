//
//  MyTableViewController.swift
//  CoreDataDemo
//
//  Created by JETS Mobile Lab - 2 on 5/7/19.
//  Copyright © 2019 ITI. All rights reserved.
//

import UIKit
import CoreData
class MyTableViewController: UITableViewController {

    //var movies = Array<MovieClass>()
    var movies = Array<NSManagedObject>()
    var counter = 1
    @IBAction func addMovie(_ sender: UIBarButtonItem) {
        let appDeleget = UIApplication.shared.delegate as! AppDelegate
        let manegerContext = appDeleget.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "Movie", in: manegerContext)
        let movie = NSManagedObject(entity: entity! , insertInto: manegerContext)
        movie.setValue("Movie \(counter)", forKey: "title")
        movie.setValue(5.8, forKey: "rate")
        movie.setValue(3000, forKey: "releasDate")
        do{
            try manegerContext.save()
            movies.append(movie)
            self.tableView.reloadData()
        }
        catch let error as NSError{
            print(error.localizedDescription)
        }
         counter += 1
        /*var movie  =
            MovieClass(title: "Movie \(counter)", releasData: 2000, rate: 5.0)
        movies.append(movie)
        counter += 1
        self.tableView.reloadData()*/
    }
    override func viewDidLoad() {
        super.viewDidLoad()
       /* var movie  =
            MovieClass(title: "Movie1 \(counter)", releasData: 2000, rate: 5.0)
        counter += 1
        movies.append(movie)
         movies.append(MovieClass(title: "Movie2", releasData: 2000, rate: 5.0))*/
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return movies.count
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        //bgeb ely 3amlalo save kolo
        let appDeleget = UIApplication.shared.delegate as! AppDelegate
         let manegerContext = appDeleget.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Movie")
        do{
            movies = try manegerContext.fetch(fetchRequest)
        }catch{
            print(error)
        }
        
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        // Configure the cell...
        //cell.textLabel?.text = movies[indexPath.row].title
        cell.textLabel?.text = movies[indexPath.row].value(forKey: "title") as! String
        return cell
    }
 

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
       
        if editingStyle == .delete {
            let appDeleget = UIApplication.shared.delegate as! AppDelegate
            let manegerContext = appDeleget.persistentContainer.viewContext
            manegerContext.delete(movies[indexPath.row])
           //el trteb mohem amsa7 men el array b3den ams7ha men el view
            movies.remove(at: indexPath.row)
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
