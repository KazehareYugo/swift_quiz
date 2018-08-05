//
//  ViewController.swift
//  Quiz
//
//  Created by Kazehare Yugo on 2018/08/05.
//  Copyright © 2018年 xyz.app. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var questionLabel: UILabel!
    
    var
    //labelを紐づけた
    var currentQuestionNum: Int = 0
    //表示している問題番号を変数として定義
    let questions: [[String: Any]] = [
        //question関数　定数で
        ["q":"iphoneアプリを開発する統合環境はZcodeである。",
         "a": false],
        ["q":"Xcodeの画面の右側にはユーティリティーズがある",
         "a": true],
        ["q":"UILabelは文字列を表示する際に利用する。",
         "a": true]
        //辞書配列を使って問題のリストを作る
        
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        showQuestion()
    }


    @IBAction func tappedNoButton(_ sender: UIButton) {
        checkAnswer(yourAnswer: false)
    }
    
    @IBAction func tappedYesButton(_ sender: UIButton) {
        checkAnswer(yourAnswer: true)
    }
    func showQuestion(){
        let question = questions[currentQuestionNum]
        
        if let questionnText = question["q"] as? String {
            questionLabel.text = questionnText
        }
    }
    
    func checkAnswer(yourAnswer: Bool) {
        let question = questions[currentQuestionNum]
        
        if let ans = question["a"] as? Bool {
            if yourAnswer == ans {
               
                
            }else {
                showAlert(message: "不正解です")
                
            }
             currentQuestionNum += 1
        }
        
        if currentQuestionNum >= questions.count {
            currentQuestionNum = 0
            
        }
        showQuestion()
    }
    
    func showAlert(message:String) {
        //ここで新たな関数定義アラートを出すやつ
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        let closeAction = UIAlertAction(title: "次へ", style: .cancel, handler: nil)
        alert .addAction(closeAction)
        self.present(alert, animated: true, completion: nil)
        
    }
    
}


