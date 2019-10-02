//
//  ViewController.swift
//  tictactoe
//
//  Created by Ankit on 27/05/19.
//  Copyright © 2019 Ankit. All rights reserved.
//

import UIKit

class BoardViewController: UIViewController {
    
    @IBOutlet weak var txtBoardSize: UITextField!
    @IBOutlet weak var viewBoard: TicTacBoardView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUIFeilds()
        viewBoard.delegate = self
    }
    
    // MARK: UI Methods
    func setUIFeilds(){
        txtBoardSize.delegate = self
    }
    
    func showAlert(player: String)  {
        let alertController = UIAlertController.init(title: "Tic tac Toe", message: "\(player)  is Wiiner", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .cancel) { [weak self] (action) in
            guard let wSelf = self  else{
                return
            }
            wSelf.viewBoard.resetGame(text: wSelf.txtBoardSize.text ?? "")
        }
        alertController.addAction(okAction)
        present(alertController, animated: true) { [weak self] in
            guard let wSelf = self  else{
                return
            }
            wSelf.viewBoard.isUserInteractionEnabled = false
        }
    }
}

// MARK: UITextFieldDelegate Methods
extension BoardViewController: UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        viewBoard.resetGame(text: txtBoardSize.text ?? "")
        return true
    }
}

// MARK: TicTacBoardViewDelegate Methods
extension BoardViewController: TicTacBoardViewDelegate{
    func showResult(message: String) {
        showAlert(player: message)
    }
}
