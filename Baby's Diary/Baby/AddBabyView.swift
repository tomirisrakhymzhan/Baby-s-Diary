//
//  AddBabyView.swift
//  Baby's Diary
//
//  Created by Томирис Рахымжан on 08/07/2024.
//

import UIKit

class AddBabyView: UIView {
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 16
        return stackView
    }()
    
    private let titleLabel: UILabel = createLabel(text: String(localized: "Add_Baby_View_Title"), font: .boldSystemFont(ofSize: 24))
    
    private let babyNameView = LabeledTextFieldView(labelText: String(localized: "Add_Baby_Name"), keyboardType: .default)
    
    let birthDateView = CustomCalendarView(labelText: String(localized: "Add_Baby_DOB"))
    
    private let weightView = LabeledTextFieldView(labelText: String(localized: "Add_Baby_Weight"), keyboardType: .numberPad)
    
    private let heightView = LabeledTextFieldView(labelText: String(localized: "Add_Baby_Height"), keyboardType: .numberPad)
    
    private let headCircumferenceView = LabeledTextFieldView(labelText: String(localized: "Add_Baby_Head_Circumference"), keyboardType: .numberPad)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup(){
        setupViews()
        setupConstraints()
    }
    
    private func setupViews() {
        backgroundColor = .white
        addSubview(stackView)
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(babyNameView)
        stackView.addArrangedSubview(birthDateView)
        stackView.addArrangedSubview(weightView)
        stackView.addArrangedSubview(heightView)
        stackView.addArrangedSubview(headCircumferenceView)
    }
    
    private func setupConstraints() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        birthDateView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            
        ])
    }
    
    private static func createLabel(text: String, font: UIFont = .systemFont(ofSize: 17)) -> UILabel {
        let label = UILabel()
        label.text = text
        label.font = font
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }
}
