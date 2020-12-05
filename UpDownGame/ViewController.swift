//
//  ViewController.swift
//  UpDownGame
//
//  Created by 김준섭 on 2020/12/03.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Properties
    // MARK: IBOutlets
    @IBOutlet weak var resultUpDown: UILabel!
    @IBOutlet weak var turnCount: UILabel!
    @IBOutlet weak var inputValue: UITextField!
    
    // MARK: Stored Properties
    var randomNumber: Int = 0
    var count: Int = 0
    
    
    // MARK: - Methods
    @IBAction func touchUpSubmitButton(_ sender: UIButton) {
        // 빈값일때
        if self.inputValue.text == "" {
            print("입력값 없음")
            return
        }
        if let textInput: Int = Int(self.inputValue.text!) {
            self.count += 1
            self.turnCount.text = "\(self.count)"
            
            if textInput > randomNumber {
                self.resultUpDown.text = "DOWN!"
            }
            else if textInput < randomNumber {
                self.resultUpDown.text = "UP!"
            }
            else {
                self.resultUpDown.text = "정답입니다!"
            }
        }
        else {
            print("입력값이 잘못되었습니다")
            return
        }
        // Int가 아닐 때
    }
    @IBAction func touchUpResetButton(_ sender: UIButton) {
        self.initializeGame()
    }
    
    @IBAction func tapBackground(_ sender: UITapGestureRecognizer) {
        self.view.endEditing(true)
    }
    
    // MARK: Custom Methods
    func initializeGame() {
        self.randomNumber = Int(arc4random_uniform(101))
        self.count = 0
        
        self.resultUpDown.text = "Start!"
        self.turnCount.text = "\(count)"
        self.inputValue.text = nil
        
        print("임의의 숫자 \(self.randomNumber)")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.initializeGame()
    }


}

