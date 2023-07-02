//
//  CustomCalendar.swift
//  MYLOG_iOS
//
//  Created by 강인혜 on 2/7/23.
//

import FSCalendar
import SwiftUI
import Then
import SnapKit

class CustomCalendarVC: UIViewController, FSCalendarDelegate, FSCalendarDelegateAppearance, FSCalendarDataSource {
    lazy var selectedData = Date()
    let fscalendar = FSCalendar().then {
        $0.appearance.weekdayFont = .systemFont(ofSize: 14, weight: .light)
        $0.appearance.weekdayTextColor = UIColor(named: "SubtitleColor")
        $0.calendarWeekdayView.weekdayLabels[0].textColor = .red
        $0.appearance.caseOptions = FSCalendarCaseOptions.weekdayUsesUpperCase
        
        $0.appearance.headerDateFormat = "MMM, YYYY"
        $0.appearance.headerTitleFont = .systemFont(ofSize: 25, weight: .bold)
        $0.appearance.headerTitleColor = UIColor(named: "LargeTitleColor")
        $0.appearance.headerTitleAlignment = .center
        $0.appearance.headerSeparatorColor = UIColor(named: "SeparatorColor")
        $0.appearance.borderDefaultColor = UIColor(named: "StrokeColor")
        $0.appearance.selectionColor = UIColor(named: "SelectedDateColor")
        $0.appearance.titleFont = UIFont.systemFont(ofSize: 20, weight: .medium)
        $0.appearance.titleDefaultColor = .black
        $0.appearance.titleSelectionColor = .black
        $0.appearance.titleTodayColor = .black
        $0.appearance.todayColor = .clear
        
        $0.appearance.headerMinimumDissolvedAlpha = 0.0
//        $0.frame = CGRect(x: 0, y: 0, width: view.frame.size.width - 48, height: view.frame.size.width)
        
        $0.placeholderType = .none
    }
    
    private let sunLabel = UILabel().then {
        $0.text = "SUN"
        $0.textColor = UIColor(named: "RedColor")
        $0.font = .systemFont(ofSize: 14, weight: .light)
    }
    private let monLabel = UILabel().then {
        $0.text = "MON"
        $0.textColor = UIColor(named: "SubtitleColor")
        $0.font = .systemFont(ofSize: 14, weight: .light)
    }
    private let tueLabel = UILabel().then {
        $0.text = "TUE"
        $0.textColor = UIColor(named: "SubtitleColor")
        $0.font = .systemFont(ofSize: 14, weight: .light)
    }
    private let wedLabel = UILabel().then {
        $0.text = "WED"
        $0.textColor = UIColor(named: "SubtitleColor")
        $0.font = .systemFont(ofSize: 14, weight: .light)
    }
    private let thuLabel = UILabel().then {
        $0.text = "THU"
        $0.textColor = UIColor(named: "SubtitleColor")
        $0.font = .systemFont(ofSize: 14, weight: .light)
    }
    private let friLabel = UILabel().then {
        $0.text = "FRI"
        $0.textColor = UIColor(named: "SubtitleColor")
        $0.font = .systemFont(ofSize: 14, weight: .light)
    }
    private let satLabel = UILabel().then {
        $0.text = "SAT"
        $0.textColor = UIColor(named: "BlueColor")
        $0.font = .systemFont(ofSize: 14, weight: .light)
    }

    private let backView = UIView().then {
        $0.backgroundColor = .white
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addView()
        setLayout()
        
        fscalendar.delegate = self
        fscalendar.dataSource = self
        
        fscalendar.select(self.selectedData)
        
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
    }

    func addView() {
        [
            fscalendar,
            backView
        ].forEach {
            view.addSubview($0)
        }
        [
            sunLabel,
            monLabel,
            tueLabel,
            wedLabel,
            thuLabel,
            friLabel,
            satLabel
        ].forEach {
            backView.addSubview($0)
        }
    }
    
    func setLayout() {
        fscalendar.snp.makeConstraints {
            $0.top.equalToSuperview().inset(73)
            $0.horizontalEdges.equalToSuperview().inset(24)
            $0.height.equalTo(view.frame.size.height/2)
        }
        backView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(118)
            $0.height.equalTo(22)
            $0.horizontalEdges.equalToSuperview().inset(24)
        }
        monLabel.snp.makeConstraints {
            $0.top.left.bottom.equalToSuperview()
        }
        tueLabel.snp.makeConstraints {
            $0.top.bottom.equalToSuperview()
            $0.left.equalTo(monLabel.snp.right).offset(backView.frame.size.width*0.7)
        }
        wedLabel.snp.makeConstraints {
            $0.top.bottom.equalToSuperview()
            $0.left.equalTo(tueLabel.snp.right).offset(backView.frame.size.width*0.7)
        }
        thuLabel.snp.makeConstraints {
            $0.top.bottom.equalToSuperview()
            $0.left.equalTo(wedLabel.snp.right).offset(backView.frame.size.width*0.7)
        }
        friLabel.snp.makeConstraints {
            $0.top.bottom.equalToSuperview()
            $0.left.equalTo(thuLabel.snp.right).offset(backView.frame.size.width*0.7)
        }
        satLabel.snp.makeConstraints {
            $0.top.right.bottom.equalToSuperview()
            $0.left.equalTo(friLabel.snp.right).offset(backView.frame.size.width*0.7)
        }
    }
}

struct CustomCalendarView: UIViewControllerRepresentable {
    typealias UIViewControllerType = UIViewController
    
    func makeUIViewController(context: Context) -> UIViewController {
        let customCalendarVC = CustomCalendarVC()
        return customCalendarVC
    }
    
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        //updates view
    }
}

struct CustomCalendar: View {
    var body: some View {
        CustomCalendarView()
    }
}
