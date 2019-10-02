//
//  TicTacBoardView.swift
//  tictactoe
//
//  Created by Ankit Shrivastava on 28/05/19.
//  Copyright © 2019 Ankit. All rights reserved.
//

import UIKit

protocol TicTacBoardViewDelegate : AnyObject {
    func showResult(message: String)
}

class TicTacBoardView: UIView {
    
    weak var delegate : TicTacBoardViewDelegate?
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var collectionViewBoard: UICollectionView!
    var viewModel : TicTacViewModel!
    
    // MARK: Methods
    override public init(frame: CGRect) {
        super.init(frame: frame)
        loadView()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        loadView()
    }
    
    func loadView()  {
        viewModel = TicTacViewModel(delegate: self)
        Bundle.main.loadNibNamed("TicTacBoardView", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        setUICollection()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        collectionViewBoard.reloadData()
    }
    
    // MARK: UI Methods
    func setUICollection(){
        collectionViewBoard.delegate = self
        collectionViewBoard.dataSource = self
        collectionViewBoard.register(TicTacCollectionViewCell.nib, forCellWithReuseIdentifier: TicTacCollectionViewCell.identifier)
        self.collectionViewBoard.isUserInteractionEnabled = true
        collectionViewBoard.reloadData()
    }
    
    func resetGame(text:String){
        isUserInteractionEnabled = true
        viewModel.resetGame(text: text)
    }
    
}

// MARK: UICollectionViewDelegate Methods
extension TicTacBoardView : UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        viewModel.continuePlay(row: indexPath.section, column: indexPath.row)
    }
}

// MARK: UICollectionViewDataSource Methods
extension TicTacBoardView : UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return viewModel.boardSize
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.boardSize
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TicTacCollectionViewCell.identifier, for: indexPath) as? TicTacCollectionViewCell{
            cell.tictac = viewModel.tictacData[indexPath.section][indexPath.row]
            return cell
        }
        return UICollectionViewCell()
    }
}

// MARK: UICollectionViewDelegateFlowLayout Methods
extension TicTacBoardView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat{
        
        return 0.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = ((collectionView.bounds.size.width) / CGFloat(viewModel.boardSize))
        return CGSize(width: width, height: width)
    }
    
}

// MARK: TicTacViewModelDelegate Methods
extension TicTacBoardView: TicTacViewModelDelegate {
    func didResetGame() {
        collectionViewBoard.collectionViewLayout.invalidateLayout()
        collectionViewBoard.reloadData()
        setUICollection()
    }
    
    func continueGameAt(row: Int, column: Int, validatedMove: Bool) {
        if validatedMove {
            collectionViewBoard.reloadData()
            viewModel.checkWinner()
        }
    }
    
    func gameDidFinish(winner: TicTac) {
        switch winner {
        case .playerOne:
            delegate?.showResult(message: "Player One")
        case .playerTwo:
            delegate?.showResult(message: "Player Two")
        case .notPlayed:
            break
        }
    }
}
