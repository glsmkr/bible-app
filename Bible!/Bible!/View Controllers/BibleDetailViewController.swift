//
//  ViewController.swift
//  Bible!
//
//  Created by Julian A. Fordyce on 2/24/19.
//  Copyright © 2019 Glas Labs. All rights reserved.
//

import UIKit

class BibleDetailViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
       updateViews()
    }

    func updateViews() {
        guard let results = result else { return }
        referenceLabel?.text = results.reference
        contentLabel?.text = results.content
    }
    

    
    
    // MARK: - Properties
    
    var result: Result? {
        didSet {
            updateViews()
        }
    }
    
    var bibleController: BibleController?
    @IBOutlet weak var referenceLabel: UILabel!
    @IBOutlet weak var contentLabel: UILabel!
    @IBOutlet weak var cardView: UIView!
    
    
    
}

