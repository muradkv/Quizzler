//
//  CustomView.swift
//  Quizzler
//
//  Created by murad on 27.09.2024.
//

import UIKit

class MainView: UIView {
    //MARK: - Properties
    
    private let backgroundBubbles: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Background-Bubbles")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private let mainVerticalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .fillProportionally
        stackView.axis = .vertical
        stackView.spacing = 10
        return stackView
    }()
    
    private let questionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Question text"
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 30, weight: .bold)
        label.textColor = .white
        return label
    }()
    
    private let progressView: UIProgressView = {
        let progressView = UIProgressView()
        progressView.translatesAutoresizingMaskIntoConstraints = false
        progressView.tintColor = UIColor(red: 255 / 255, green: 117 / 255, blue: 168 / 255, alpha: 1)
        progressView.trackTintColor = .white
        return progressView
    }()
    
    let trueButton = QuizAnswerButton(title: "True")
    let falseButton = QuizAnswerButton(title: "False")
    
    //MARK: - Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Setup UI
    
    private func setupUI() {
        backgroundColor = UIColor(red: 51 / 255, green: 59 / 255, blue: 90 / 255, alpha: 1)
        addSubview(backgroundBubbles)
        addSubview(mainVerticalStackView)
        mainVerticalStackView.addArrangedSubview(questionLabel)
        mainVerticalStackView.addArrangedSubview(trueButton)
        mainVerticalStackView.addArrangedSubview(falseButton)
        mainVerticalStackView.addArrangedSubview(progressView)
        
        NSLayoutConstraint.activate([
            backgroundBubbles.bottomAnchor.constraint(equalTo: bottomAnchor),
            backgroundBubbles.leadingAnchor.constraint(equalTo: leadingAnchor),
            backgroundBubbles.trailingAnchor.constraint(equalTo: trailingAnchor),
            backgroundBubbles.heightAnchor.constraint(equalToConstant: 102),
            
            mainVerticalStackView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            mainVerticalStackView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            mainVerticalStackView.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor),
            mainVerticalStackView.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor),
            
            trueButton.heightAnchor.constraint(equalToConstant: 80),
            falseButton.heightAnchor.constraint(equalToConstant: 80),
            
            progressView.heightAnchor.constraint(equalToConstant: 10)
        ])
    }
    
    func updateTextLabel(text: String) {
        questionLabel.text = text 
    }
    
    func updateProgressView(progress: Float) {
        progressView.setProgress(progress, animated: true)
    }
}
