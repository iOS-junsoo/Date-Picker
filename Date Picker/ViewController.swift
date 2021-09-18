import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var ageTxt: UITextField!
    
    let datePicker = UIDatePicker()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //DatePicker 생성
        createDatePicker()
        datePicker.preferredDatePickerStyle = .wheels//DatePicker의 구동 형태
        datePicker.locale = Locale(identifier: "ko-KR") //DatePicekr 한글버전
        
    }

    func createDatePicker() {
        
        ageTxt.textAlignment = .center //text Field에 중앙정렬로
        
        // Toolbar 설정부분
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        // bar button 설정부분
        let doneBtn = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(donePressed))
        toolbar.setItems([doneBtn], animated: true) //done 버튼 생성
        
        // tool bar 할당
        ageTxt.inputAccessoryView = toolbar
        
        // text field에 date picker 할당
        ageTxt.inputView = datePicker
        
        //date picker mode
        datePicker.datePickerMode = .time
        //date picker의 형태를 date 형태로 할것인지 time 형태로 할것인지 결정
    }
    
    @objc func donePressed() {
        let formatter = DateFormatter()
        formatter.dateStyle = .none
        formatter.timeStyle = .medium
        
        ageTxt.text = formatter.string(from: datePicker.date)
        self.view.endEditing(true)
    }
    
}

