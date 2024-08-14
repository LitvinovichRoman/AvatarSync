//
//  CharacterCreationView.swift
//  AvatarSync
//
//  Created by Roman Litvinovich on 13.08.24.
//

import UIKit

protocol CharacterCreationViewProtocol: AnyObject {
    func showSuccess()
    func showError(message: String)
}

class CharacterCreationView: BaseView, CharacterCreationViewProtocol {
    var presenter: CharacterCreationViewPresenterProtocol!
    var model: CharacterModelProtocol!
    private var selectedAvatar: UIImage?
    var stackView = UIStackView()
    private var alertController: UIAlertController?
    
    private lazy var collectionView: UICollectionView = {
        let layout = ResizableLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.backgroundColor = .clear
        collectionView.register(AvatarCell.self, forCellWithReuseIdentifier: Constants.CharacterCreationViewConstants.reuseIdentifier)
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    private lazy var selectCharacterLabel = TitleLabel(text: Constants.CharacterCreationViewConstants.selectCharacterLabelText)
    private lazy var setParametersLabel = TitleLabel(text: Constants.CharacterCreationViewConstants.setParametersLabelText)
    
    private lazy var agePickerView: PickerView = {
        return $0
    }(PickerView(labelText: Constants.CharacterCreationViewConstants.agePickerViewTitle, pickerDelegate: self))
    
    private lazy var heightPickerView: PickerView = {
        return $0
    }(PickerView(labelText: Constants.CharacterCreationViewConstants.heightPickerViewTitle, pickerDelegate: self))
    
    private lazy var weightPickerView: PickerView = {
        return $0
    }(PickerView(labelText: Constants.CharacterCreationViewConstants.weightPickerViewTitle, pickerDelegate: self))
    
    private lazy var createButton: CreateButton = {
        $0.addTarget(self, action: #selector(createButtonTapped), for: .touchUpInside)
        return $0
    }(CreateButton(title: Constants.CharacterCreationViewConstants.createButtonTitle))
    
    //MARK: -- Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureBackground(with: Resources.Images.Backgrounds.appBackground)
        configureLayout()
        view.layoutIfNeeded()
        selectCentralAvatar()
    }
    
    private func selectCentralAvatar() {
        let centerOffsetX = collectionView.bounds.width / 2
        let centerIndexPath = collectionView.indexPathForItem(at: CGPoint(x: centerOffsetX + collectionView.contentOffset.x, y: collectionView.bounds.height / 2))
        
        if let indexPath = centerIndexPath {
            selectedAvatar = model.avatars[indexPath.item]
            if let avatar = selectedAvatar {
                presenter.avatarSelected(avatar)
            } else { print("Selected avatar is nil") }
        }
    }

}

//MARK: - Actions
extension CharacterCreationView {
    @objc private func createButtonTapped() {
        let age = agePickerView.picker.selectedRow(inComponent: 0)
        let height = heightPickerView.picker.selectedRow(inComponent: 0)
        let weight = weightPickerView.picker.selectedRow(inComponent: 0)
        
        if let avatar = selectedAvatar {
            presenter.createCharacter(avatar: avatar, age: age, height: height, weight: weight)
        } else {
            presenter.createCharacter(avatar: UIImage(), age: age, height: height, weight: weight)
        }
    }
    
    func showSuccess() {
        guard alertController == nil else { return }
        let alert = UIAlertController(title: Constants.CharacterCreationViewConstants.alertTitle,
                                      message: Constants.CharacterCreationViewConstants.alertMessage,
                                      preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: Constants.CharacterCreationViewConstants.alertActionTitle, 
                                      style: .default,
                                      handler: { _ in  self.alertController = nil }))
        alertController = alert
        present(alert, animated: true, completion: nil)
    }
    
    func showError(message: String) {
        guard alertController == nil else { return }
        let alert = UIAlertController(title: Constants.CharacterCreationViewConstants.errorAlertTitle,
                                      message: message,
                                      preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: Constants.CharacterCreationViewConstants.alertActionTitle,
                                      style: .default,
                                      handler: { _ in self.alertController = nil }))
        alertController = alert
        present(alert, animated: true, completion: nil)
    }
}

//MARK: - Configure layout
extension CharacterCreationView {
    func setupStackView() {
        stackView = UIStackView(arrangedSubviews: [agePickerView, heightPickerView, weightPickerView])
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = Constants.CharacterCreationViewConstants.stackViewSpacing
    }
    
    func configureLayout() {
        setupStackView()
        view.addSubviews(selectCharacterLabel, setParametersLabel, collectionView, stackView, createButton)
        setSelectCharacterLabelConstraint()
        setCollectionViewConstraint()
        setSetParametersLabelConstraint()
        setStackViewConstraint()
        setCreateButtonConstraint()
    }
    
    //MARK: -- setSelectCharacterLabelConstraint
    func setSelectCharacterLabelConstraint()  {
        NSLayoutConstraint.activate([
            selectCharacterLabel.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor, constant: Constants.CharacterCreationViewConstants.topAnchor),
            selectCharacterLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Constants.CharacterCreationViewConstants.leadingAnchor),
            selectCharacterLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: Constants.CharacterCreationViewConstants.trailingAnchor)
        ])
    }
    
    //MARK: -- setCollectionViewConstraint
    func setCollectionViewConstraint() {
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: selectCharacterLabel.safeAreaLayoutGuide.topAnchor, constant: Constants.CharacterCreationViewConstants.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Constants.CharacterCreationViewConstants.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: Constants.CharacterCreationViewConstants.trailingAnchor),
            collectionView.heightAnchor.constraint(equalToConstant: Constants.CharacterCreationViewConstants.collectionViewHeight)
        ])
    }
    
    //MARK: -- setSetParametersLabelConstraint
    func setSetParametersLabelConstraint() {
        NSLayoutConstraint.activate([
            setParametersLabel.topAnchor.constraint(equalTo: collectionView.bottomAnchor, constant: Constants.CharacterCreationViewConstants.topAnchor),
            setParametersLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Constants.CharacterCreationViewConstants.leadingAnchor),
            setParametersLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: Constants.CharacterCreationViewConstants.trailingAnchor)
        ])
    }
     //MARK: -- setStackViewConstraint
    func setStackViewConstraint() {
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: setParametersLabel.bottomAnchor, constant: Constants.CharacterCreationViewConstants.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Constants.CharacterCreationViewConstants.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: Constants.CharacterCreationViewConstants.trailingAnchor),
            stackView.heightAnchor.constraint(equalToConstant: Constants.CharacterCreationViewConstants.stackViewHeight)
        ])
    }
     //MARK: -- setCreateButtonConstraint
    func setCreateButtonConstraint() {
        NSLayoutConstraint.activate([
            createButton.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: Constants.CharacterCreationViewConstants.createButtonTop),
            createButton.centerXAnchor.constraint(equalTo: contentView.centerXAnchor)
        ])
    }
    
}

// MARK: - UICollectionViewDataSource & UICollectionViewDelegateFlowLayout
extension CharacterCreationView: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return model.avatars.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.CharacterCreationViewConstants.reuseIdentifier, for: indexPath) as! AvatarCell
        let avatar = model.avatars[indexPath.item]
        cell.avatarImage.image = avatar
        return cell
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        selectCentralAvatar()
    }
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        if velocity.x == 0 {
            selectCentralAvatar()
        }
    }
}

// MARK: - UIPickerViewDataSource & UIPickerViewDelegate
extension CharacterCreationView: UIPickerViewDataSource, UIPickerViewDelegate {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int { return 1}

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerView == agePickerView.picker ? 101 : 301
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return "\(row)"
    }
}



