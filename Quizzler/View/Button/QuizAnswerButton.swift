//
//  QuizAnswerButton.swift
//  Quizzler
//
//  Created by murad on 24.09.2024.
//

import UIKit

class QuizAnswerButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(title: String) {
        self.init(frame: .zero)
        setTitle(title, for: .normal)
    }
    
    private func setup() {
        translatesAutoresizingMaskIntoConstraints = false
        layer.cornerRadius = 12
        layer.borderWidth = 5
        layer.borderColor = UIColor(red: 76 / 255, green: 98 / 255, blue: 140 / 255, alpha: 1).cgColor
        titleLabel?.font = UIFont.systemFont(ofSize: 25)
        clipsToBounds = true
    }
}
