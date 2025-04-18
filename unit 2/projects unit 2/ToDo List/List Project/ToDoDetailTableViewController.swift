//
//  ToDoDetailTableViewController.swift
//  List Project
//
//  Created by Samuel Bradshaw  on 4/18/25.
//

import UIKit

class ToDoDetailTableViewController: UITableViewController {
    
    @IBOutlet var saveButton: UIBarButtonItem!
    @IBOutlet var titleTextField: UITextField!
    @IBOutlet var isCompleteButton: UIButton!
    @IBOutlet var dueDateLabel: UILabel!
    @IBOutlet var datePicker: UIDatePicker!
    @IBOutlet var noteTextView: UITextView!
    
    var toDo: ToDo?
    var isDatePickerHidden = true
    let dateLabelIndexPath = IndexPath(row: 0, section: 1)
    let datePickerIndexPath = IndexPath(row: 1, section: 1)
    let noteLabelIndexPath = IndexPath(row: 0, section: 2)


    
    override func viewDidLoad() {
        super.viewDidLoad()
        var currentDate: Date
        if let toDo = toDo {
            navigationItem.title = "To-Do"
            titleTextField.text = toDo.title
            isCompleteButton.isSelected = toDo.isComplete
            currentDate = toDo.dueDate
            noteTextView.text = toDo.notes
        } else {
            currentDate = Date().addingTimeInterval(24*60*60)
        }
        datePicker.date = currentDate
        updateDueDateLabel(date: currentDate)
        updateSaveButtonState()

    }
    
    func updateSaveButtonState() {
        let shouldEnableSaveButton = titleTextField.text?.isEmpty == false
        saveButton.isEnabled = shouldEnableSaveButton
    }
    func updateDueDateLabel(date: Date) {
        dueDateLabel.text = date.formatted(.dateTime.month(.defaultDigits).day().year(.twoDigits).hour().minute())
    }
    @IBAction func titleEditingChanged(_ sender: UITextField) {
        updateSaveButtonState()
    }
    @IBAction func returnPressed(_ sender: UITextField) {
        sender.resignFirstResponder()
    }
    @IBAction func isCompleteButtonTapped(_ sender: UIButton) {
        isCompleteButton.isSelected.toggle()
    }
    
    @IBAction func dateChanged(_ sender: UIDatePicker) {
        updateDueDateLabel(date: sender.date)
    }
    
    
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath {
        case datePickerIndexPath where isDatePickerHidden:
            return 0
        case noteLabelIndexPath:
            return 200
        default:
            return UITableView.automaticDimension
        }
    }
    
    override func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath {
        case datePickerIndexPath:
            return 216
        case noteLabelIndexPath:
            return 200
        default:
            return UITableView.automaticDimension
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath == dateLabelIndexPath {
            isDatePickerHidden.toggle()
            updateDueDateLabel(date: datePicker.date)
            tableView.beginUpdates()
            tableView.endUpdates()
            
            
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        guard segue.identifier == "saveUnwind" else { return }
       
        let title = titleTextField.text!
        let isComplete = isCompleteButton.isSelected
        let dueDate = datePicker.date
        let notes = noteTextView.text
        
        if toDo != nil {
            toDo?.title = title
            toDo?.isComplete = isComplete
            toDo?.dueDate = dueDate
            toDo?.notes = notes
        } else {
            toDo = ToDo(title: title, isComplete: isComplete, dueDate: dueDate, notes: notes)
        }
        
       
    }
    
    
}
