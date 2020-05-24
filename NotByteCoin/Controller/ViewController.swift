//
//  ViewController.swift
//  NotByteCoin
//
//  Created by Raymond Choy on 5/23/20.
//  Copyright © 2020 thechoygroup. All rights reserved.
//

import UIKit
                                //STEP #A2. add a protocol called UIPickerViewDataSource to the class below.
                                //STEP #A3. After adding this new protocol an error altert will pop up. Select "fix" on the pop-up bubble.
                                //STEP #A8. Add the protocol UIPickerViewDelegate to the class declaration
class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
        func numberOfComponents(in pickerView: UIPickerView) -> Int {
                                //STEP #A5. Now let’s actually provide the data and add the implementation for the first method numberOfComponents(in:) to determine how many columns we want in our picker. Type in "return 1"
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return coinManager.currencyArray.count
    }
    
                                //STEP #A10. Next, add the delegate method pickerView(titleForRow:), start typing pickerView and select the method from the drop down list.
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
                                //STEP #A11. This method expects a String as an output. The String is the title for a given row. When the PickerView is loading up, it will ask its delegate for a row title and call the above method once for every row. So when it is trying to get the title for the first row, it will pass in a row value of 0 and a component (column) value of 0.
                                //STEP #A12. So inside the method, we can use the row Int to pick the title from our currencyArray.
        return coinManager.currencyArray[row]
    }
    
    
                                //STEP #A1. Create the following 3 IBOutlets and name them according to the image below: "bitcoinLabel", "currencyLabel" and "currencyPicker"
    @IBOutlet weak var bitcoinLabel: UILabel!
    @IBOutlet weak var currencyLabel: UILabel!
    @IBOutlet weak var currencyPicker: UIPickerView!
                                //STEP #A6. Next, we need to tell Xcode how many rows this picker should have using the pickerView:numberOfRowsInComponent: method.
    
    let coinManager = CoinManager()

        override func viewDidLoad() {
            super.viewDidLoad()
            
                            //STEP #A4. set the ViewController.swift as the datasource for the picker. Find viewDidLoad() and add set the ViewController class as the datasource to the currencyPicker object.
            currencyPicker.dataSource = self
                            //STEP #A9. Set the ViewController class as the delegate of the currencyPicker.
            currencyPicker.delegate = self
        }
    }

    






    
    

    

    






