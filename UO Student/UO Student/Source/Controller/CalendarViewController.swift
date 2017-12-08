//
//  CalendarController.swift
//  UO Student
//
//  Created by Logan Poole on 12/3/17.
//  Copyright © 2017 Logan Poole. All rights reserved.


import CoreData
import UIKit
import JTAppleCalendar

class CalendarViewController: UIViewController {
    //MARK: Properties (IBOutlets)
    @IBOutlet weak var calendarView: JTAppleCalendarView!
    @IBOutlet weak var yearLabel: UILabel!
    @IBOutlet weak var monthLabel: UILabel!
    //MARK: Properties (Private)
    private let duckGreen = UIColor(red: 12, green: 93, blue: 63)
    private let duckLightGreen = UIColor(red: 12, green: 196, blue: 63)
    private let duckGold  = UIColor(red: 251, green: 229, blue: 116)
    private let todaysDate = Date()
    private let formatter :DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = Calendar.current.timeZone
        dateFormatter.locale = Calendar.current.locale
        dateFormatter.dateFormat = "yyyy MM dd"
        return dateFormatter
        }()
    //MARK: Setup Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCalendarView()
        calendarView.scrollToDate(Date(), animateScroll: false)
    }
    
    func setupCalendarView() {
        calendarView.minimumLineSpacing = 0
        calendarView.minimumInteritemSpacing = 0
        calendarView.scrollToDate(Date())
        calendarView.selectDates([Date()])
        calendarView.visibleDates { (visibleDates) in
            self.setupViewsofCalendar(from: visibleDates)
        }
    }
    func setupViewsofCalendar(from visibleDates: DateSegmentInfo) {
        guard let date = visibleDates.monthDates.first?.date else {return}
        self.formatter.dateFormat = "yyyy"
        self.yearLabel.text = self.formatter.string(from: date)
        
        self.formatter.dateFormat = "MMMM"
        self.monthLabel.text = self.formatter.string(from: date)
    }
    func handleCellSelect(view: JTAppleCell?, cellState: CellState) {
        guard let cell = view as? CalendarCell else {return}
        if cellState.isSelected {
            cell.dayMarker.isHidden = false
        } else {
            cell.dayMarker.isHidden = true
        }
    }
    func handleCellVisible(view: JTAppleCell?, cellState: CellState) {
        guard let cell = view as? CalendarCell else {return}
        if cellState.dateBelongsTo == .thisMonth {
            cell.isHidden = false
        } else {
            cell.isHidden = true
        }
    }
    func handleCellTextColor(view: JTAppleCell?, cellState: CellState) {
        guard let cell = view as? CalendarCell else {return}
        
        formatter.dateFormat = "yyyy MM dd"
        let todaysDateString = formatter.string(from: todaysDate)
        let monthDateString = formatter.string(from: cellState.date)
        
        if todaysDateString == monthDateString {
            cell.dateLabel.textColor = duckLightGreen
        } else {
            cell.dateLabel.textColor = (cellState.isSelected ? duckGreen : duckGreen)
        }
        
        
    }
}

extension CalendarViewController: JTAppleCalendarViewDataSource {
    
    func configureCalendar(_ calendar: JTAppleCalendarView) -> ConfigurationParameters {
        let parameters = ConfigurationParameters(startDate: todaysDate,
                                                 endDate: formatter.date(from: "2020 01 01")! ,
                                                 numberOfRows: 6, // Only 1, 2, 3, & 6 are allowed
                                                calendar: Calendar.current,
                                                generateInDates: .forAllMonths,
                                                generateOutDates: .tillEndOfGrid,
                                                firstDayOfWeek: .sunday)
        
        return parameters
    }
    
}

extension CalendarViewController: JTAppleCalendarViewDelegate {
    func calendar(_ calendar: JTAppleCalendarView, cellForItemAt date: Date, cellState: CellState, indexPath: IndexPath) -> JTAppleCell {
        let cell = calendar.dequeueReusableJTAppleCell(withReuseIdentifier: "CalendarCell", for: indexPath) as! CalendarCell
        
        cell.dateLabel.text = cellState.text
        cell.cellBackgroundImage.image = UIImage(named: "CalendarBack2.png")
        handleCellSelect(view: cell, cellState: cellState)
        handleCellTextColor(view: cell, cellState: cellState)
        handleCellVisible(view: cell, cellState: cellState)
        return cell
    }
    func calendar(_ calendar: JTAppleCalendarView, willDisplay cell: JTAppleCell, forItemAt date: Date, cellState: CellState, indexPath: IndexPath) {
        guard let calendarCell = cell as? CalendarCell else {return}
        
        calendarCell.dateLabel.text = cellState.text
        handleCellSelect(view: cell, cellState: cellState)
        handleCellTextColor(view: cell, cellState: cellState)
        handleCellVisible(view: cell, cellState: cellState)

    }
    func calendar(_ calendar: JTAppleCalendarView, didSelectDate date: Date, cell: JTAppleCell?, cellState: CellState) {
        handleCellSelect(view: cell, cellState: cellState)
        handleCellTextColor(view: cell, cellState: cellState)
        handleCellVisible(view: cell, cellState: cellState)
    }
    func calendar(_ calendar: JTAppleCalendarView, didDeselectDate date: Date, cell: JTAppleCell?, cellState: CellState) {
        handleCellSelect(view: cell, cellState: cellState)
        handleCellTextColor(view: cell, cellState: cellState)
        handleCellVisible(view: cell, cellState: cellState)
    }
    
    func calendar(_ calendar: JTAppleCalendarView, didScrollToDateSegmentWith visibleDates: DateSegmentInfo) {
        guard let date = visibleDates.monthDates.first?.date else {return}
        formatter.dateFormat = "yyyy"
        yearLabel.text = formatter.string(from: date)
        
        formatter.dateFormat = "MMMM"
        monthLabel.text = formatter.string(from: date)
    }
}
