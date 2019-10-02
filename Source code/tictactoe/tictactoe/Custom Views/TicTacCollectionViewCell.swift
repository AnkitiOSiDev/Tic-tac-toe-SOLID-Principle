//
//  TicTacCollectionViewCell.swift
//  tictactoe
//
//  Created by Ankit on 27/05/19.
//  Copyright © 2019 Ankit. All rights reserved.
//

import UIKit

class TicTacCollectionViewCell: UICollectionViewCell , BaseCollectionCellProtocol{
    static var identifier: String {
        return "TicTacCollectionViewCell"
    }
    
    static var nib: UINib {
        return UINib(nibName: "TicTacCollectionViewCell", bundle: nil)
    }
    
    @IBOutlet weak var lblPlayedIcon: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    var tictac  : TicTac? {
        didSet {
            guard let objTicToc = tictac else {
                return
            }
            lblPlayedIcon.text = objTicToc.text
        }
        
    }
    
    
}
