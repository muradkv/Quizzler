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
    
    let quiz = QuestionData().getData()
    
    var questionsAnswered = 0
    
    //MARK: - Life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        setupButtons()
        updateUI()
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
    
    private func setupButtons() {
        trueButton.addAction(UIAction(handler: { [weak self] action in
            self?.buttonPressed(sender: self?.trueButton)
        }), for: .touchUpInside)
        
        falseButton.addAction(UIAction(handler: { [weak self] action in
            self?.buttonPressed(sender: self?.falseButton)
        }), for: .touchUpInside)
    }
    
    //MARK: - Methods
    
    private func buttonPressed(sender: UIButton?) {
        let userAnswer = sender?.currentTitle
        
        if userAnswer == quiz[questionsAnswered].answer {
            sender?.backgroundColor = .green
        } else {
            sender?.backgroundColor = .red
        }
        
        if questionsAnswered == quiz.count - 1 {
            questionsAnswered = 0
        } else {
            questionsAnswered += 1
        }
        
        updateUI()
    }
    
    private func updateUI() {
        questionLabel.text = quiz[questionsAnswered].text
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) { [weak self] in
            self?.trueButton.backgroundColor = .clear
            self?.falseButton.backgroundColor = .clear
        }
    }
}

