//
//  ViewController.swift
//  testGit
//
//  Created by bettersoft on 9/14/21.
//

import UIKit
import FSCalendar

class ViewController: UIViewController, FSCalendarDelegate, FSCalendarDataSource, FSCalendarDelegateAppearance {

    @IBOutlet var fsCalendar: FSCalendar!
    var formatter = DateFormatter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fsCalendar.scrollDirection = .horizontal
        fsCalendar.scope = .month
        fsCalendar.delegate = self
        fsCalendar.dataSource = self
        
        fsCalendar.allowsMultipleSelection = true
        
        // Do any additional setup after loading the view.
        // Return to Fix launch screen
        // Return to fix bugs PVT : Hotfixs 1 2 3 4
        // Return to fix bugs P'pom : iPhone6 stuck on launch screen
        // Drop1 : add name in trx today and sale report
    }
    
    // Datasource
    
    func minimumDate(for calendar: FSCalendar) -> Date {
        return Date()
    }
    
    func maximumDate(for calendar: FSCalendar) -> Date {
        return Date().addingTimeInterval((24*60*60)*60)
    }
    
    func calendar(_ calendar: FSCalendar, numberOfEventsFor date: Date) -> Int {
        formatter.dateFormat = "dd-MM-yyyy"
        guard let eventDate = formatter.date(from: "29-09-2021") else {return 0}
        if date.compare(eventDate) == .orderedSame {
            return 2
        }
        return 0
    }

    // Delegate
    
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        formatter.dateFormat = "dd-MM-yyyy"
        print("Date Selected == \(formatter.string(from : date))")
    }
    
    func calendar(_ calendar: FSCalendar, didDeselect date: Date, at monthPosition: FSCalendarMonthPosition) {
        formatter.dateFormat = "dd-MM-yyyy"
        print("Date De-Selected == \(formatter.string(from : date))")
    }
    
    func calendar(_ calendar: FSCalendar, shouldSelect date: Date, at monthPosition: FSCalendarMonthPosition) -> Bool {
        formatter.dateFormat = "dd-MM-yyyy"
        guard let excludedDate = formatter.date(from: "30-09-2021") else {return true}
        
        if date.compare(excludedDate) == .orderedSame {
            return false
        }
        
        return true
    }
    
    func calendar(_ calendar: FSCalendar, appearance: FSCalendarAppearance, titleDefaultColorFor date: Date) -> UIColor? {
        formatter.dateFormat = "dd-MM-yyyy"
        guard let excludedDate = formatter.date(from: "30-09-2021") else {return nil}
        
        if date.compare(excludedDate) == .orderedSame {
            return .red
        }
        
        return nil
    }

}

