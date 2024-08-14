//
//  PickerView.swift
//  AvatarSync
//
//  Created by Roman Litvinovich on 13.08.24.
//

import UIKit

class PickerView: UIView {
    //MARK: -- Properties
    private let label: UILabel = {
        $0.textAlignment = .center
        $0.textColor = Constants.PickerViewConstants.textColor
        $0.font = Constants.PickerViewConstants.labelfont
        $0.backgroundColor = Constants.PickerViewConstants.labelBackgroundColor
        $0.layer.masksToBounds = true
        $0.layer.cornerRadius = Constants.PickerViewConstants.cornerRadius
        return $0
    }(UILabel())
    
    let picker: UIPickerView = {
        return $0
    }(UIPickerView())
    
    //MARK: -- Init methods
    init(labelText: String, pickerDelegate: UIPickerViewDelegate & UIPickerViewDataSource) {
        super.init(frame: .zero)
        
        label.text = labelText
        picker.delegate = pickerDelegate
        picker.dataSource = pickerDelegate
        
        configurePicker()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: -- Configure Picker
private extension PickerView {
    func configurePicker() {
        addSubviews(label,picker)
        
        NSLayoutConstraint.activate([
            label.heightAnchor.constraint(equalToConstant: Constants.PickerViewConstants.labelHeight),
            label.topAnchor.constraint(equalTo: topAnchor),
            label.leadingAnchor.constraint(equalTo: leadingAnchor),
            label.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            picker.topAnchor.constraint(equalTo: label.bottomAnchor, constant: Constants.PickerViewConstants.pickerTop),
            picker.leadingAnchor.constraint(equalTo: leadingAnchor),
            picker.trailingAnchor.constraint(equalTo: trailingAnchor),
            picker.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
