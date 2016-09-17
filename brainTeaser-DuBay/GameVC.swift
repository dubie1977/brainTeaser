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
    
    var currentCard: Card!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        currentCard = createCardFromNib()
        currentCard.center = AnimationEngine.screenCenterPosition
        self.view.addSubview(currentCard)

    }

    
    @IBAction func yesPressed(sender: UIButton){
        
        if sender.titleLabel?.text == "YES"{
            checkAnswer()
        } else {
            titleLbl.text = "Does this card match the previous?"
        }
        showNextCard()
    }
    
    @IBAction func noPressed(sender: UIButton){
        checkAnswer()
        showNextCard()
    }
    
    func showNextCard(){
        
        if let current = currentCard{
            let cardToRemove = current
            currentCard = nil
            
            AnimationEngine.animateToPosition(cardToRemove, position: AnimationEngine.offScreenLeftPosition, completion: { (anim: POPAnimation!, finished: Bool) in
                cardToRemove.removeFromSuperview()
            })
        }
        
        if let next = createCardFromNib(){
            next.center = AnimationEngine.offScreenRightPosition
            self.view.addSubview(next)
            currentCard = next
            
            if noButton.hidden{
                noButton.hidden = false
                yesButton.setTitle("YES", forState: .Normal)
            }
            
            AnimationEngine.animateToPosition(next, position: AnimationEngine.screenCenterPosition, completion: { (anim:POPAnimation!, finished: Bool) in
                
            })
        }
        
    }
    
    func createCardFromNib() -> Card?{
        return NSBundle.mainBundle().loadNibNamed("Card", owner: self, options: nil)[0] as? Card
        
    }
    
    func checkAnswer(){
    
    }
    
    


}
