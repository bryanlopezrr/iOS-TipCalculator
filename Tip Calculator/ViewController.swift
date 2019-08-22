//
//  ViewController.swift
//  Tip Calculator
//
//  Created by Bryan Lopez on 8/21/19.
//  Copyright © 2019 Bryan Lopez. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    /* Global tip percentage variables at 15%, 18%, and 20% along
       with the set 7.5% tax rate that is in 'Florida' */
    let tipPercentages = [0.15, 0.18, 0.20]
    let taxRate = 0.075
    
    /* Appropriate variables that are connected to respective fields,
       labels, controllers and images.
       To be altered later on the program...*/
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    //Extra additions from video tutorial =>
    @IBOutlet weak var taxLabel: UILabel!
    @IBOutlet weak var reactionImg: UIImageView!
    @IBOutlet weak var spendingHabit: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    /* Function to endEditing and start the calculate Tip function */
    @IBAction func onTap(_ sender: Any) {
        //print("You have tapped outside") test print to console
        view.endEditing(true)
    }
    
    /* This function contains all the logic to calculate the appropriate
       values for the bill, tax, tip and total.
       I used the . text/image operator to change the actual content of the object label, field or image */
    @IBAction func calculateTip(_ sender: Any) {
        //variables to hold the amounts gotten from labels along with casting to do arithmetic with variables
        let bill = Double(billField.text!) ?? 0
        let tax = bill * taxRate
        let tip = (bill + tax) * tipPercentages[tipControl.selectedSegmentIndex]
        
        taxLabel.text = String(format: "$%.2f" , tax)
        tipLabel.text = String(format: "$%.2f" , tip)
        totalLabel.text = String(format: "$%.2f" , bill + tax + tip)
        
        
        /* Extra logic to chose the appropriate image for the amount
           spent on a meal.
         Three categories are broken into:
         - anything > 120 is expensive
         - anything < 45 is inexpensive
         - the rest is average
         */
        if((bill + tax + tip) > 120.00){
            reactionImg.image = UIImage(named: "cry")
            spendingHabit.text = "Expensive meal"
        }
        else if((bill + tax + tip) < 45.00){
            reactionImg.image = UIImage(named: "nice")
            spendingHabit.text = "Inexpensive meal"
        }
        else{
            reactionImg.image = UIImage(named: "yikes")
            spendingHabit.text = "Average meal"
        }
        
        /* The app could be modified to add more functionality and maybe split the tab or have other screens. The UI could be improved as well as some of the sample calculators shown
         */
        
    }
    
}




