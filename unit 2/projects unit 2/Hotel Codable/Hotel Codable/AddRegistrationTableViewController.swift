//
//  AddRegistrationTableViewController.swift
//  Hotel
//
//  Created by Jane Madsen on 3/17/25.
//

import UIKit

class AddRegistrationTableViewController: UITableViewController {
    
    var roomType: RoomType?
    
    @IBOutlet var firstNameTextField: UITextField!
    @IBOutlet var lastNameTextField: UITextField!
    @IBOutlet var emailTextField: UITextField!
    
    @IBOutlet var checkInDateLabel: UILabel!
    @IBOutlet var checkInDatePicker: UIDatePicker!
    @IBOutlet var checkOutDateLabel: UILabel!
    @IBOutlet var checkOutDatePicker: UIDatePicker!
    
    @IBOutlet var roomTypeDetailLabel: UILabel!
    
    let checkInDateLabelCellIndexPath = IndexPath(row: 0, section: 1)
    let checkInDatePickerCellIndexPath = IndexPath(row: 1, section: 1)
    let checkOutDateLabelCellIndexPath = IndexPath(row: 2, section: 1)
    let checkOutDatePickerCellIndexPath = IndexPath(row: 3, section: 1)
    
    var isCheckInDatePickerVisible: Bool = false {
        didSet {
            checkInDatePicker.isHidden = !isCheckInDatePickerVisible
        }
    }
    var isCheckOutDatePickerVisible: Bool = false {
        didSet {
            checkOutDatePicker.isHidden = !isCheckOutDatePickerVisible
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let midnightToday = Calendar.current.startOfDay(for: Date.now)
        checkInDatePicker.minimumDate = midnightToday
        checkInDatePicker.date = midnightToday
        
        updateDateViews()
        updateRoomType()
    }

    @IBAction func doneBarButtonTapped(_ sender: Any) {
        let firstName = firstNameTextField.text ?? ""
        let lastName = lastNameTextField.text ?? ""
        let email = emailTextField.text ?? ""
        let checkInDate = checkInDatePicker.date
        let checkOutDate = checkOutDatePicker.date
        
        print("First name: \(firstName)")
        print("Last name: \(lastName)")
        print("email: \(email)")
        print("Check-in date: \(checkInDate)")
        print("Check-out date: \(checkOutDate)")
        print("Room Type: \(roomType?.name ?? "Not set")")
    }
    
    @IBAction func datePickerValueChanged(_ sender: Any) {
        updateDateViews()
    }
    
    @IBSegueAction func segueToRoomTypeSelection(_ coder: NSCoder) -> RoomTypeSelectionTableViewController? {
        let roomTypeSelectionVC = RoomTypeSelectionTableViewController(coder: coder)
        
        roomTypeSelectionVC?.roomType = self.roomType
        roomTypeSelectionVC?.delegate = self
        
        return roomTypeSelectionVC
    }
    
    func updateDateViews() {
        checkInDateLabel.text = checkInDatePicker.date.formatted(date: .abbreviated, time: .omitted)
        
        checkOutDatePicker.minimumDate = Calendar.current.date(byAdding: .day, value: 1, to: checkInDatePicker.date)
        checkOutDateLabel.text = checkOutDatePicker.date.formatted(date: .abbreviated, time: .omitted)
    }
    
    func updateRoomType() {
        if let roomType = self.roomType {
            roomTypeDetailLabel.text = roomType.name
        } else {
            roomTypeDetailLabel.text = "Not set"
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath {
        case checkInDatePickerCellIndexPath where isCheckInDatePickerVisible == false:
            return 0
        case checkOutDatePickerCellIndexPath where isCheckOutDatePickerVisible == false:
            return 0
        default:
            return UITableView.automaticDimension
        }
    }
    
    override func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath {
        case checkInDatePickerCellIndexPath:
            return 190
        case checkOutDatePickerCellIndexPath:
            return 190
        default:
            return UITableView.automaticDimension
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        if indexPath == checkInDateLabelCellIndexPath {
            isCheckInDatePickerVisible.toggle()
        } else if indexPath == checkOutDateLabelCellIndexPath {
            isCheckOutDatePickerVisible.toggle()
        } else {
            return
        }
        
        tableView.beginUpdates()
        tableView.endUpdates()
    }
}

// MARK: - Room Type Selection Delegate

extension AddRegistrationTableViewController: RoomTypeSelectionDelegate {
    func roomTypeSelectionTableViewController(_ controller: RoomTypeSelectionTableViewController, didSelectRoomType roomType: RoomType) {
        self.roomType = roomType
        updateRoomType()
    }
}
