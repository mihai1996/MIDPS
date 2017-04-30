//
//  ViewController2.swift
//  D05
//
//  Created by mihai_lascu on 4/28/17.
//  Copyright © 2017 mihai_lascu. All rights reserved.
//
//
import UIKit

var name = [(name:"Ecole 42", desc: "Academy", x: 48.8965812, y: 2.318375999999944),
(name:"Chisinau", desc: "Plahotniuc", x: 47.025136, y: 28.832911),
(name:"Paris", desc: "Fance", x: 48.857953, y: 2.342706),
(name:"Londra", desc: "Leps", x: 51.511041, y: -0.121537)]
//let color:[UIColor] = [.red, .yellow, .green, .blue]

class ViewController2: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView1: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    ///
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let barViewControllers = self.tabBarController?.viewControllers
        let svc = barViewControllers![0] as! ViewController
        svc.indice = indexPath.row
        svc.displayMap()
        tabBarController?.selectedIndex = 0
    }
    ////
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return name.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView1.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = name[indexPath.row].name
        return cell
    }
}
