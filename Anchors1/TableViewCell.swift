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
        label.numberOfLines = .max
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        label.textColor = .black
        label.text = ""
    
        return label
    }()
    
    lazy var FundTitle: UILabel = {
        var label = UILabel()

        label.numberOfLines = .max
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        label.textColor = .black
        label.text = ""

        return label
    }()
    
    lazy var TitleOfTheValores: UILabel = {
        let label = UILabel()
        label.numberOfLines = .max
        label.textAlignment =  .center
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
        self.FundTitle.text = fund.specification.fundSuitabilityProfile.name
        self.TitleOfTheValores.text = "R$ \(fund.operability.minimumInitialApplicationAmount)"
    }
    
    private func createSubviews() {
        addSubview(introductionLabel)
        addSubview(FundTitle)
        addSubview(TitleOfTheValores)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            introductionLabel.topAnchor.constraint(equalTo: topAnchor, constant: 50),
            introductionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 32),
            introductionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -200),
            introductionLabel.heightAnchor.constraint(equalTo: heightAnchor, constant: -100),
            
            FundTitle.topAnchor.constraint(equalTo: topAnchor, constant: -20),
            FundTitle.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 160),
            FundTitle.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -32),
            FundTitle.heightAnchor.constraint(equalTo: heightAnchor),
    
            TitleOfTheValores.topAnchor.constraint(equalTo: topAnchor, constant: 30),
            TitleOfTheValores.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 160),
            TitleOfTheValores.heightAnchor.constraint(equalTo: heightAnchor, constant: -10),
            TitleOfTheValores.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -32),

        ])
    }

}
