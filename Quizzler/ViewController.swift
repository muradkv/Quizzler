//
//  ViewController.swift
//  Quizzler
//
//  Created by murad on 24.09.2024.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: - Properties
    
    let backgroundBubbles: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Background-Bubbles")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    let mainVerticalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .fillProportionally
        stackView.axis = .vertical
        stackView.spacing = 10 
        return stackView
    }()
    
    let questionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Question text"
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 30, weight: .bold)
        label.textColor = .white
        return label
    }()
    
    let trueButton = QuizAnswerButton(title: "True")
    let falseButton = QuizAnswerButton(title: "False")
    
    //MARK: - Life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    //MARK: - Setup UI
    
    private func setupUI() {
        view.backgroundColor = UIColor(red: 51 / 255, green: 59 / 255, blue: 90 / 255, alpha: 1)
        view.addSubview(backgroundBubbles)
        view.addSubview(mainVerticalStackView)
        mainVerticalStackView.addArrangedSubview(questionLabel)
        mainVerticalStackView.addArrangedSubview(trueButton)
        mainVerticalStackView.addArrangedSubview(falseButton)
        
        NSLayoutConstraint.activate([
            backgroundBubbles.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            backgroundBubbles.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundBubbles.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundBubbles.heightAnchor.constraint(equalToConstant: 102),
            
            mainVerticalStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            mainVerticalStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            mainVerticalStackView.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            mainVerticalStackView.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            
            trueButton.heightAnchor.constraint(equalToConstant: 80),
            falseButton.heightAnchor.constraint(equalToConstant: 80)
        ])
    }

}

