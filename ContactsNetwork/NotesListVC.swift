//
//  ViewController.swift
//  Lesson_4
//
//  Created by Maxim Vitovitsky on 12.11.2019.
//  Copyright © 2019 NapoleonIT. All rights reserved.
//

import UIKit

class NotesListVC: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var textForCreate = ""
    var numberForCreate = ""
    
    private var notes = [Note]() {
        didSet {
            tableView.reloadData()
        }
    }
    
    func randomInt(min: Int, max: Int) -> Int {
        return min + Int(arc4random_uniform(UInt32(max - min + 1)))
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        API.loadNotes { notesArray in
            self.notes = notesArray}
        tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension NotesListVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "noteCell") as! NoteCell
        cell.setup(with: notes[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
}
