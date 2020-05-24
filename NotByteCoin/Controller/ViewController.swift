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
class ViewController: UIViewController {
    
    @IBOutlet weak var bitcoinLabel: UILabel!
    @IBOutlet weak var currencyLabel: UILabel!
    @IBOutlet weak var currencyPicker: UIPickerView!
                                //STEP #A6. Next, we need to tell Xcode how many rows this picker should have using the pickerView:numberOfRowsInComponent: method.
    
    var coinManager = CoinManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        coinManager.delegate = self
                                //STEP #A4. set the ViewController.swift as the datasource for the picker. Find viewDidLoad() and add set the ViewController class as the datasource to the currencyPicker object.
        currencyPicker.dataSource = self
                                //STEP #A9. Set the ViewController class as the delegate of the currencyPicker.
        currencyPicker.delegate = self
    }
}

//MARK: - CoinManagerDelegate

extension ViewController: CoinManagerDelegate {
    
    func didUpdatePrice(price: String, currency: String) {
        
        DispatchQueue.main.async {
            self.bitcoinLabel.text = price
            self.currencyLabel.text = currency
        }
    }
    
    func didFailWithError(error: Error) {
        print(error)
    }
}

//MARK: - UIPickerViewDataSource, UIPickerViewDelegate

extension ViewController: UIPickerViewDataSource, UIPickerViewDelegate {
                                //STEP #A1. Create the following 3 IBOutlets and name them according to the image below: "bitcoinLabel", "currencyLabel" and "currencyPicker"
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
                                //STEP #A13. Great. We’ve got a functioning Picker View. But nothing happens when you make a selection. Let’s change that. Use Xcode’s auto-suggest to add this delegate method:
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
                                //STEP #A14. Let’s print that row number to see which one gets selected when we scroll our UIPickerView.
//        print(row)
                                //STEP #A15. Let’s change that print statement to print the currency selected instead. See if you can change the code to print the currency value selected instead of the row number.
                                //STEP #A16.Go to the CoinManager for the next step...
//        print(coinManager.currencyArray[row])
                                //STEP #A17. Update the pickerView(didSelectRow:) method to pass the selected currency to the CoinManager via the getCoinPrice() method.
        let selectedCurrency = coinManager.currencyArray[row]
        coinManager.getCoinPrice(for: selectedCurrency)
    }
}















