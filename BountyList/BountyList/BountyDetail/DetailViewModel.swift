//
//  DetailViewModel.swift
//  BountyList
//
//  Created by gigas on 2021/03/08.
//

import Foundation

class DetailViewModel {
    var bountyInfo: BountyInfo?
    
    func update(model: BountyInfo?) {
        bountyInfo = model
    }
}
