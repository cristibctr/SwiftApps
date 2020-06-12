//
//  RoutesTableViewController.swift
//  RouteFinder
//
//  Created by Bucataru Cristian on 5/17/17.
//  Copyright © 2017 Bucataru Cristian. All rights reserved.
//

import UIKit

enum selectedScope:Int {
    case City = 0
    case Title = 1
}
class RoutesTableViewController: UITableViewController, UISearchBarDelegate {
    var routes = [Route]()
    
    private func loadRoutes(){
        routes = [Route]()
        guard let route1 = Route(title: "Simple bike route around Iasi", description: "Iasi") else {
            fatalError("Unnable to initiate route1")
        }
        guard let route2 = Route(title: "Marathon for the bests", description: "New York") else {
            fatalError("Unnable to initiate route2")
        }
        guard let route3 = Route(title: "No mountain? Run with us around Bucharest", description: "Bucharest") else {
            fatalError("Unnable to initiate route3")
        }
        guard let route4 = Route(title: "Easy city bike route", description: "Madrid") else {
            fatalError("Unnable to initiate route4")
        }
        guard let route5 = Route(title: "Iti fur bicla ma", description: "Ciurea") else {
            fatalError("Unnable to initiate route5")
        }
        guard let route6 = Route(title: "ATV race in desert", description: "Al-Abar") else {
            fatalError("Unnable to initiate route6")
        }
        guard let route7 = Route(title: "Pro mountain skying", description: "Budapest") else {
            fatalError("Unnable to initiate route7")
        }
        
        routes += [route1, route2, route3, route4, route5, route6, route7]
    }
    
    func searchBarSetup(){
        let SearchBar = UISearchBar(frame: CGRect(x:0, y:0, width:(UIScreen.main.bounds.width), height: 70))
        SearchBar.showsScopeBar = true
        SearchBar.scopeButtonTitles = ["City", "Title"]
        
        SearchBar.delegate = self as! UISearchBarDelegate
        self.tableView.tableHeaderView = SearchBar
    }
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty{
            loadRoutes()
            self.tableView.reloadData()
        }
        else {filterTableView(ind: searchBar.selectedScopeButtonIndex, text: searchText)}
    }
    func filterTableView(ind: Int, text: String){
        switch ind{
        case selectedScope.City.rawValue:
            routes = routes.filter({ (mod) -> Bool in
             return (mod.description?.lowercased().contains(text.lowercased()))!
            })
            self.tableView.reloadData()
        case selectedScope.Title.rawValue:
            routes = routes.filter({ (mod) -> Bool in
                return (mod.title?.lowercased().contains(text.lowercased()))!
            })
            self.tableView.reloadData()
        default:
            print ("STOP IT! GET SUM HELP!")
        }
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        loadRoutes()
        self.searchBarSetup()
        self.tabBarController!.tabBar.layer.borderWidth = 0.50
        self.tabBarController!.tabBar.layer.borderColor = UIColor.clear.cgColor
        self.tabBarController?.tabBar.clipsToBounds = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return routes.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "RoutesTableViewCell", for: indexPath) as? RoutesTableViewCell else {
            fatalError("The dequeued cell is not an instance of RoutesTableViewCell.")
        }
        let route = routes[indexPath.row]
        cell.titleCell.text = route.title
        cell.detailCell.text = route.description
        return cell
    }

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

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
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
