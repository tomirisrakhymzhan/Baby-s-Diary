//
//  AddBabyView.swift
//  Baby's Diary
//
//  Created by Томирис Рахымжан on 08/07/2024.
//

import UIKit

class AddBabyView: UIView {
    
    let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        return scrollView
    }()
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 16
        return stackView
    }()
    
    let babyNameView = LabeledTextFieldView(labelText: String(localized: "Add_Baby_Name"), keyboardType: .default)
    let birthDateView = DatePickerView(labelText: String(localized: "Add_Baby_DOB"))
    let weightView = LabeledTextFieldView(labelText: String(localized: "Add_Baby_Weight") + ", " + String(localized: "cm"), keyboardType: .decimalPad)
    let heightView = LabeledTextFieldView(labelText: String(localized: "Add_Baby_Height") + ", " + String(localized: "cm") , keyboardType: .decimalPad)
    let headCircumferenceView = LabeledTextFieldView(labelText: String(localized: "Add_Baby_Head_Circumference") + ", " + String(localized: "cm") , keyboardType: .decimalPad)
    
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
        addSubview(scrollView)
        scrollView.addSubview(stackView)
        stackView.addArrangedSubview(babyNameView)
        stackView.addArrangedSubview(birthDateView)
        stackView.addArrangedSubview(weightView)
        stackView.addArrangedSubview(heightView)
        stackView.addArrangedSubview(headCircumferenceView)
    }
    
    private func setupConstraints() {
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        stackView.translatesAutoresizingMaskIntoConstraints = false
        birthDateView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            
            stackView.topAnchor.constraint(equalTo: scrollView.contentLayoutGuide.topAnchor, constant: 16),
            stackView.leadingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.leadingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.trailingAnchor, constant: -16),
            stackView.bottomAnchor.constraint(equalTo: scrollView.contentLayoutGuide.bottomAnchor, constant: -16),
            stackView.widthAnchor.constraint(equalTo: scrollView.frameLayoutGuide.widthAnchor, constant: -32)
            
        ])
    }
    
}
