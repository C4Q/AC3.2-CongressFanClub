//
//  CongressViewController.swift
//  (Elected) Officials
//
//  Created by Harichandan Singh on 11/7/16.
//  Copyright © 2016 Harichandan Singh. All rights reserved.
//

import UIKit

class CongressViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UICollectionViewDataSource, UICollectionViewDelegate {
    //MARK: - Properties
    let states: [(name: String, key: String)] = [(name: "Alabama", key: "AL"),
                                                 (name: "Alaska", key: "AK"),
                                                 (name: "Arizona", key: "AZ"),
                                                 (name: "Arkansas", key: "AR"),
                                                 (name: "California", key: "CA"),
                                                 (name: "Colorado", key: "CO"),
                                                 (name: "Connecticut", key: "CT"),
                                                 (name: "Delaware", key: "DE"),
                                                 (name: "Florida", key: "FL"),
                                                 (name: "Georgia", key: "GA"),
                                                 (name: "Hawaii", key: "HI"),
                                                 (name: "Idaho", key: "ID"),
                                                 (name: "Illinois", key: "IL"),
                                                 (name: "Indiana", key:"IN" ),
                                                 (name: "Iowa", key: "IA"),
                                                 (name: "Kansas", key: "KS"),
                                                 (name: "Kentucky", key: "KY"),
                                                 (name: "Louisiana", key: "LA"),
                                                 (name: "Maine", key: "ME"),
                                                 (name: "Maryland", key: "MD"),
                                                 (name: "Massachusetts", key: "MA"),
                                                 (name: "Michigan", key: "MI"),
                                                 (name: "Minnesota", key: "MN"),
                                                 (name: "Mississippi", key: "MS"),
                                                 (name: "Missouri", key: "MO"),
                                                 (name: "Montana", key: "MT"),
                                                 (name: "Nebraska", key: "NE"),
                                                 (name: "Nevada", key: "NV"),
                                                 (name: "New Hampshire", key: "NH"),
                                                 (name: "New Jersey", key: "NJ"),
                                                 (name: "New Mexico", key: "NM"),
                                                 (name: "New York", key: "NY"),
                                                 (name: "North Carolina", key: "NC"),
                                                 (name: "North Dakota", key: "ND"),
                                                 (name: "Ohio", key: "OH"),
                                                 (name: "Oklahoma", key: "OK"),
                                                 (name: "Oregon", key: "OR"),
                                                 (name: "Pennsylvania", key: "PA"),
                                                 (name: "Rhode Island", key: "RI"),
                                                 (name: "South Carolina", key: "SC"),
                                                 (name: "South Dakota", key: "SD"),
                                                 (name: "Tennessee", key: "TN"),
                                                 (name: "Texas", key: "TX"),
                                                 (name: "Utah", key: "UT"),
                                                 (name: "Vermont", key: "VT"),
                                                 (name: "Virginia", key: "VA"),
                                                 (name: "Washington", key: "WA"),
                                                 (name: "West Virginia", key: "WV"),
                                                 (name: "Wisconsin", key: "WI"),
                                                 (name: "Wyoming", key: "WY"),
                                                 (name: "Puerto Rico", key: "PR")
    ]
    var congressMembers: [CongressionalData] = [CongressionalData]()
    
    //MARK: - Outlets
    @IBOutlet weak var statePickerView: UIPickerView!
    
    
    //MARK: - Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        loadCongressMembers()
    }
    
    internal func loadCongressMembers() {
        APIRequestManager.manager.getData(apiEndpoint: CongressionalData.apiEndpoint) { (data: Data?) in
            if let d = data {
                if let congressMembers = CongressionalData.createCongressionalDataArray(from: d) {
                    self.congressMembers = congressMembers
                }
            }
        }
    }
    
    internal func filterByRoleType(roleType: String) -> [CongressionalData] {
        return congressMembers.filter { $0.roleType == roleType }
    }
    
    
    //MARK: - Picker View Data Source Methods
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return states.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return states[row].name
    }
    
    
    //MARK: - Picker View Delegate Method
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        //Filter function by State
    }
    
    
    //    //MARK: - Collection View Data Source Methods
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 0:
            return filterByRoleType(roleType: "senator").count
        case 1:
            return filterByRoleType(roleType: "representative").count
        default:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CongressMemberCell", for: indexPath)
        
        switch indexPath.section {
        case 0:
            let currentSenator = filterByRoleType(roleType: "senator").filter({ (CongressionalData: CongressionalData) -> Bool in
                CongressionalData.state == states[statePickerView.selectedRow(inComponent: 1)].key
            })
            cell.congressMemberNameLabel.text = currentSenator[indexPath.row].name
        default:
            let currentRep = filterByRoleType(roleType: "representative").filter({ (CongressionalData: CongressionalData) -> Bool in
                CongressionalData.state == states[statePickerView.selectedRow(inComponent: 1)].key
            })
            cell.congressMemberNameLabel.text = currentRep[indexPath.row].name
        }
        
        return cell

    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
