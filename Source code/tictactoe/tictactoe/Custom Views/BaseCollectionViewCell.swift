//
//  BaseCollectionViewCell.swift
//  tictactoe
//
//  Created by Ankit on 27/05/19.
//  Copyright © 2019 Ankit. All rights reserved.
//

import UIKit


protocol BaseCollectionCellProtocol {
    static var identifier : String {get}
    static var nib : UINib {get}
}
