//
//  GameVC.swift
//  brainTeaser-DuBay
//
//  Created by Joseph DuBay on 9/15/16.
//  Copyright © 2016 DuBay Designs. All rights reserved.
//

import UIKit
import pop

class GameVC: UIViewController {

    @IBOutlet weak var yesButton: CustomButton!
    @IBOutlet weak var noButton: CustomButton!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var numberRightLbl: UILabel!
    
    var currentCard: Card!
    var lastCard: Card?
    var numberRight = 0
    var totalAnswers = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        currentCard = createCardFromNib()
        currentCard.center = AnimationEngine.screenCenterPosition
        self.view.addSubview(currentCard)

    }

    
    @IBAction func yesPressed(_ sender: UIButton){
        
        if sender.titleLabel?.text == "YES"{
            checkAnswer(answer: true)
        } else {
            titleLbl.text = "Does this card match the previous?"
        }
        showNextCard()
    }
    
    @IBAction func noPressed(_ sender: UIButton){
        checkAnswer(answer: false)
        showNextCard()
    }
    
    func showNextCard(){
        numberRightLbl.text = "You have been right \(numberRight) times out of \(totalAnswers)"
        numberRightLbl.isHidden = false
        
        if let current = currentCard{
            let cardToRemove = current
            lastCard = current
            currentCard = nil
            
            AnimationEngine.animateToPosition(cardToRemove, position: AnimationEngine.offScreenLeftPosition, completion: { (anim: POPAnimation?, finished: Bool) in
                cardToRemove.removeFromSuperview()
            })
        }
        
        if let next = createCardFromNib(){
            next.center = AnimationEngine.offScreenRightPosition
            self.view.addSubview(next)
            currentCard = next
            
            if noButton.isHidden{
                noButton.isHidden = false
                yesButton.setTitle("YES", for: UIControlState())
            }
            
            AnimationEngine.animateToPosition(next, position: AnimationEngine.screenCenterPosition, completion: { (anim:POPAnimation?, finished: Bool) in
                
            })
        }
        
    }
    
    func createCardFromNib() -> Card?{
        return Bundle.main.loadNibNamed("Card", owner: self, options: nil)?[0] as? Card
        
    }
    
    func checkAnswer(answer: Bool){
        
        if let last = lastCard{
            if (last.currentShape == currentCard.currentShape){
                if(answer){
                    numberRight += 1
                    print(numberRight)
                } else {
                    print("wrong")
                }
            } else if(!answer){
                numberRight += 1
                print(numberRight)
            } else{
                print("wrong")
            }
        }
        
        totalAnswers += 1
        
    }
    
    


}
