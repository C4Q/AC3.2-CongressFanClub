//
//  NewsTableViewCell.swift
//  (Elected) Officials
//
//  Created by C4Q on 11/13/16.
//  Copyright © 2016 Harichandan Singh. All rights reserved.
//

import UIKit

class NewsTableViewCell: UITableViewCell {

    var url: URL?
    
    @IBOutlet weak var snippetLabel: UILabel!
    override func awakeFromNib() {

        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBAction func articleButtonTapped(_ sender: UIButton) {
        UIApplication.shared.open(url!)
        
    }

}
