//
//  CongressMemberCollectionViewCell.swift
//  (Elected) Officials
//
//  Created by Harichandan Singh on 11/8/16.
//  Copyright © 2016 Harichandan Singh. All rights reserved.
//

import UIKit

class CongressMemberCollectionViewCell: UICollectionViewCell {
    //MARK: - Outlets
    @IBOutlet weak var congressMemberImageView: UIImageView!
    @IBOutlet weak var congressMemberNameLabel: UILabel!

    
    //MARK: - Methods
    override func prepareForReuse() {
        congressMemberImageView.image = nil
    }
    
}
