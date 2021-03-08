//
//  BountyCell.swift
//  BountyList
//
//  Created by gigas on 2021/03/08.
//

import UIKit

class GridCell: UICollectionViewCell {
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var bountyLabel: UILabel!
    
    func update(info: BountyInfo) {
        self.nameLabel.text = info.name
        self.imgView.image = UIImage(named: "\(info.name).jpg")
        self.bountyLabel.text = "\(info.bounty)"
    }
}
