//
//  TableViewCell.swift
//  Anchor
//
//  Created by Felipe Glautier  on 17/05/21.
//

import UIKit

class TableViewCell: UITableViewCell {
      
    lazy var introductionLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 4
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        label.textColor = .black
        label.text = ""
    
        return label
    }()
    
    lazy var label1: UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        label.textColor = .black
        label.text = ""
        
        return label
    }()
    
    lazy var label2: UILabel = {
        let label = UILabel()
        label.numberOfLines = 3
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        label.textColor = .black
        label.text = ""
       
        return label

    }()

    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
         createSubviews()
         setupConstraints()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }


    func setup(fund: Fund) {
        introductionLabel.text = fund.simpleName
        self.label1.text = fund.specification.fundSuitabilityProfile.name
        self.label2.text = "R$ \(fund.operability.minimumInitialApplicationAmount)"
        
    }
    
    private func createSubviews() {
        addSubview(introductionLabel)
        addSubview(label1)
        addSubview(label2)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            introductionLabel.topAnchor.constraint(equalTo: topAnchor, constant: 70),
            introductionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 32),
            introductionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -200),
            introductionLabel.heightAnchor.constraint(equalTo: label1.heightAnchor, constant: -50),
            introductionLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 10),
            
            
            label1.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            label1.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 280),
            label1.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -32),
            label1.heightAnchor.constraint(equalTo: label2.heightAnchor, constant: -50),
            label1.bottomAnchor.constraint(equalTo: introductionLabel.bottomAnchor),
            
            label2.topAnchor.constraint(equalTo: topAnchor, constant: 55),
            label2.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 280),
            label2.heightAnchor.constraint(equalTo: heightAnchor, constant: -50),
            label2.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -32),
            label2.bottomAnchor.constraint(equalTo: introductionLabel.bottomAnchor),
        ])
    }

}
