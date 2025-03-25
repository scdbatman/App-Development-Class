
import UIKit

protocol EmployeeDetailTableViewControllerDelegate: AnyObject {
    func employeeDetailTableViewController(_ controller: EmployeeDetailTableViewController, didSave employee: Employee)
}

class EmployeeDetailTableViewController: UITableViewController, UITextFieldDelegate, EmployeeTypeTableViewControllerDelegate {
    func employeeTypeTableViewController(_ controller: EmployeeTypeTableViewController, didSelect employeeType: EmployeeType) {
        self.employeeType = employeeType
        employeeTypeLabel.text = employeeType.description
        employeeTypeLabel.textColor = .black
        updateSaveButtonState()
        
    }
    

    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var dobLabel: UILabel!
    @IBOutlet var employeeTypeLabel: UILabel!
    @IBOutlet var saveBarButtonItem: UIBarButtonItem!
    
    @IBOutlet var dobPicker: UIDatePicker!
    
    weak var delegate: EmployeeDetailTableViewControllerDelegate?
    var employeeType: EmployeeType?
    var employee: Employee?
    var isEditingBirthday = false {
        didSet{
            
            tableView.beginUpdates()
            tableView.endUpdates()
        }
    }
    let dobPickerCellIndexPath = IndexPath(row: 2, section: 0)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateView()
        updateSaveButtonState()
    }
    
    func updateView() {
        if let employee = employee {
            navigationItem.title = employee.name
            nameTextField.text = employee.name
            
            dobLabel.text = employee.dateOfBirth.formatted(date: .abbreviated, time: .omitted)
            dobLabel.textColor = .label
            employeeTypeLabel.text = employee.employeeType.description
            employeeTypeLabel.textColor = .label
        } else {
            navigationItem.title = "New Employee"
        }
    }
    
    private func updateSaveButtonState() {
        let hasEmployeeType = employeeTypeLabel.text?.isEmpty == false
        let hasName = nameTextField.text?.isEmpty == false
        let shouldEnableSaveButton = hasName && hasEmployeeType
       
        saveBarButtonItem.isEnabled = shouldEnableSaveButton
    }
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        guard let name = nameTextField.text else {
            return
        }
        guard let unwrappedEmployeeType = employeeType else{
            return
        }
        
        let employee = Employee(name: name, dateOfBirth: dobPicker.date, employeeType: unwrappedEmployeeType)
        delegate?.employeeDetailTableViewController(self, didSave: employee)
    }
    
    @IBAction func cancelButtonTapped(_ sender: Any) {
        employee = nil
    }

    @IBAction func nameTextFieldDidChange(_ sender: UITextField) {
        updateSaveButtonState()
    }

    @IBAction func dobDatePickerChanged(_ sender: Any) {
        dobLabel.text = dobPicker.date.formatted(date: .abbreviated, time: .omitted)
    }
    
    @IBSegueAction func showEmployeeTypes(_ coder: NSCoder) -> EmployeeTypeTableViewController? {
        let employeeTypeVC = EmployeeTypeTableViewController(coder: coder)
        employeeTypeVC?.delegate = self
        return employeeTypeVC
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath == dobPickerCellIndexPath {
            return 0
        } else {
            return UITableView.automaticDimension
        
        }
    }
    
    override func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath == dobPickerCellIndexPath {
            return 200
        }else {
            return UITableView.automaticDimension
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if indexPath == dobPickerCellIndexPath {
            isEditingBirthday.toggle()
            dobLabel.text = dobPicker.date.formatted(date: .abbreviated, time: .omitted)
        } else {
            return
        }
        
        tableView.beginUpdates()
        tableView.endUpdates()
    }
    
}
