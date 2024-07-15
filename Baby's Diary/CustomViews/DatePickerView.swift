//
//  CustomCalendarView.swift
//  Baby's Diary
//
//  Created by Томирис Рахымжан on 11/07/2024.
//

import UIKit

class DatePickerView: UIView {
    
    private var isCalendarViewVisible = false

    let label: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 17)
        return label
    }()
    
    let chooseDateButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle(String(localized: "Not_Chosen"), for: .normal)
        button.setTitleColor(.systemPurple, for: .normal)
        button.layer.cornerRadius = 5
        button.backgroundColor =  UIColor.systemPurple.withAlphaComponent(0.1)
        return button
    }()
    
    let calendarView: UICalendarView = {
        let calendar = UICalendarView()
        calendar.backgroundColor = .white
        calendar.tintColor = .purple
        calendar.layer.cornerRadius = 10
        calendar.layer.borderColor = UIColor.lightGray.cgColor
        calendar.layer.borderWidth = 1
        calendar.layer.shadowColor = UIColor.black.cgColor
        calendar.layer.shadowOpacity = 0.2
        calendar.layer.shadowOffset = CGSize(width: 0, height: 3)
        calendar.layer.shadowRadius = 10
        calendar.isHidden = true
        return calendar
    }()
    
    let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 4
        return stackView
    }()
    
    init(labelText: String) {
        super.init(frame: .zero)
        label.text = labelText
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        setupView()
        setupActions()
        setupConstraints()
    }
    
    private func setupView() {
        addSubview(stackView)
        stackView.addArrangedSubview(label)
        stackView.addArrangedSubview(chooseDateButton)
        stackView.addArrangedSubview(calendarView)
    }
    
    private func setupActions() {
        chooseDateButton.addTarget(self, action: #selector(toggleCalendarView), for: .touchUpInside)
    }
    
    private func setupConstraints() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        calendarView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
        ])
    }
    
    @objc func toggleCalendarView() {
        isCalendarViewVisible.toggle()
        calendarView.isHidden = !isCalendarViewVisible

        UIView.animate(withDuration: 0.3) {
            self.layoutIfNeeded()
        }
    }
}

