//
//  ViewController.swift
//  HeroE
//
//  Created by Owen on 2021/5/18.
//
import Hero
import UIKit

class ViewController: UIViewController {
    @IBOutlet var tableView: UITableView!
    weak var cell: ATableViewCell?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ATableViewCell", for: indexPath) as! ATableViewCell
        cell.vc = self
        return cell
    }


    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }


}

