import FSCalendar
import SwiftUI
import Then
import SnapKit

class CustomCalendarVC: UIViewController, FSCalendarDelegate, FSCalendarDelegateAppearance, FSCalendarDataSource {
    private var viewModel: HomeViewModel

    private var selectedDate = Date()

    init(viewModel: HomeViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let fscalendar = FSCalendar().then {
        $0.locale = Locale(identifier: "en")
        $0.appearance.weekdayFont = .systemFont(ofSize: 14, weight: .light)
        $0.appearance.weekdayTextColor = UIColor(named: "SubtitleColor")
        $0.calendarWeekdayView.weekdayLabels[0].textColor = .red
        $0.appearance.caseOptions = FSCalendarCaseOptions.weekdayUsesUpperCase
        
        $0.appearance.headerDateFormat = "MMM, YYYY"
        $0.weekdayHeight = 50
        $0.appearance.headerTitleFont = .systemFont(ofSize: 25, weight: .bold)
        $0.appearance.headerTitleColor = UIColor(named: "LargeTitleColor")
        $0.appearance.headerTitleAlignment = .center
        $0.appearance.headerSeparatorColor = UIColor(named: "SeparatorColor")
        $0.appearance.borderDefaultColor = UIColor(named: "StrokeColor")
        $0.appearance.borderSelectionColor = UIColor(named: "BlueColor")
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
    private let separatorLine = UIView().then {
        $0.backgroundColor = UIColor(named: "SeparatorColor")
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

        fscalendar.select(self.selectedDate)
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
    }

    func addView() {
        [
            fscalendar,
            backView,
            separatorLine
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
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.height.equalTo(view.frame.size.height - 450)
        }
        backView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(58)
            $0.height.equalTo(25)
            $0.horizontalEdges.equalToSuperview().inset(24)
        }
        separatorLine.snp.makeConstraints {
            $0.top.equalTo(backView.snp.bottom).offset(7)
            $0.horizontalEdges.equalToSuperview().inset(14)
            $0.height.equalTo(1)
        }
        sunLabel.snp.makeConstraints {
            $0.top.bottom.equalToSuperview()
            $0.left.equalToSuperview().inset(8)
        }
        monLabel.snp.makeConstraints{
            $0.top.bottom.equalToSuperview()
            $0.left.equalTo(sunLabel.snp.right).offset(26)
        }
        tueLabel.snp.makeConstraints {
            $0.top.bottom.equalToSuperview()
            $0.left.equalTo(monLabel.snp.right).offset(26)
        }
        wedLabel.snp.makeConstraints {
            $0.top.bottom.equalToSuperview()
            $0.left.equalTo(tueLabel.snp.right).offset(28)
        }
        thuLabel.snp.makeConstraints {
            $0.top.bottom.equalToSuperview()
            $0.left.equalTo(wedLabel.snp.right).offset(26)
        }
        friLabel.snp.makeConstraints {
            $0.top.bottom.equalToSuperview()
            $0.left.equalTo(thuLabel.snp.right).offset(30)
        }
        satLabel.snp.makeConstraints {
            $0.top.bottom.equalToSuperview()
            $0.left.equalTo(friLabel.snp.right).offset(30)
        }
    }
    
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        calendar.select(date)
        viewModel.selectedDate = date
        viewModel.onAppear()
    }
}

struct CustomCalendarView: UIViewControllerRepresentable {
    var viewModel: HomeViewModel

    init(viewModel: HomeViewModel) {
        self.viewModel = viewModel
    }

    typealias UIViewControllerType = UIViewController
    
    func makeUIViewController(context: Context) -> UIViewController {
        let customCalendarVC = CustomCalendarVC(viewModel: viewModel)
        return customCalendarVC
    }
    
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        //updates view
        DispatchQueue.main.async {
            viewModel.objectWillChange.send()
        }
    }
}

struct CustomCalendar: View {
    @StateObject var viewModel: HomeViewModel

    var body: some View {
        CustomCalendarView(viewModel: viewModel)
    }
}
