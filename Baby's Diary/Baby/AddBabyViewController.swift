//
//  AddBabyViewController.swift
//  Baby's Diary
//
//  Created by Томирис Рахымжан on 08/07/2024.
//

import UIKit

class AddBabyViewController: UIViewController {
    private let addBabyView = AddBabyView()
    private let loadingView = LoadingView(message: String(localized: "Adding_Baby"))
    
    override func loadView() {
        view = addBabyView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        setupTapGesture()
        setupCalendarView()
        setupActions()
    }
    
    func setupNavigationBar(){
        title = String(localized: "Add_Baby_View_Title")
    }
    
    private func setupTapGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
        view.addGestureRecognizer(tapGesture)
    }
    
    private func setupCalendarView() {
        let singleDateSelection = UICalendarSelectionSingleDate(delegate: self)
        addBabyView.birthDateView.calendarView.selectionBehavior = singleDateSelection
    }
    
    private func setupActions() {
        addBabyView.addButton.addTarget(self, action: #selector(addBabyButtonTapped), for: .touchUpInside)
    }
    
    @objc private func handleTap(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    @objc private func addBabyButtonTapped() {
        loadingView.show(on: view)
                
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.loadingView.hide()
        }
    }
}

extension AddBabyViewController: UICalendarSelectionSingleDateDelegate {
    func dateSelection(_ selection: UICalendarSelectionSingleDate, didSelectDate dateComponents: DateComponents?) {
        guard let date = dateComponents?.date else { return }
        print("Selected Date:", date)
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.locale = Locale.autoupdatingCurrent
        let selectedDate = dateFormatter.string(from: date)
        addBabyView.birthDateView.chooseDateButton.setTitle(selectedDate, for: .normal)
        addBabyView.birthDateView.toggleCalendarView()
    }
}
