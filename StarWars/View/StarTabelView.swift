//
//  StarTabelView.swift
//  StarWars
//
//  Created by Ghassan  albakuaa  on 10/12/20.
//

import UIKit

class StarTabelView: UITableViewCell {
    
    static let reuseId: String = "StarTableViewCell"
    
    var name: UILabel?
    var height: UILabel?
    var skin: UILabel?
    var eyes: UILabel?
    var home: UILabel?
    var mass: UILabel?
    var hair: UILabel?
   
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setUp()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUp() {
        self.contentView.backgroundColor = .clear
        
        let vStack = UIStackView(frame: .zero)
        vStack.translatesAutoresizingMaskIntoConstraints = false
        vStack.axis = .vertical
        vStack.backgroundColor = .clear
        vStack.distribution = .fillEqually
        
        let hStack = UIStackView(frame: .zero)
        hStack.translatesAutoresizingMaskIntoConstraints = false
        hStack.axis = .horizontal
        hStack.backgroundColor = .clear
        hStack.distribution = .fillEqually

        
        let hStack2 = UIStackView(frame: .zero)
        hStack2.translatesAutoresizingMaskIntoConstraints = false
        hStack2.axis = .horizontal
        hStack2.backgroundColor = .clear
        hStack2.distribution = .fillEqually
        
        let name = UILabel(frame: .zero)
        name.translatesAutoresizingMaskIntoConstraints = false
        name.textColor = .systemYellow
        name.backgroundColor = .clear
        name.textAlignment = .center
        
        let height = UILabel(frame: .zero)
        height.translatesAutoresizingMaskIntoConstraints = false
        height.textColor = .systemYellow
        height.backgroundColor = .clear
        height.textAlignment = .center
        
        let mass = UILabel(frame: .zero)
        mass.translatesAutoresizingMaskIntoConstraints = false
        mass.textColor = .systemYellow
        mass.backgroundColor = .clear
        mass.textAlignment = .center
        
        let hair = UILabel(frame: .zero)
        hair.translatesAutoresizingMaskIntoConstraints = false
        hair.textColor = .systemYellow
        hair.backgroundColor = .clear
        hair.textAlignment = .center
        
        let skin = UILabel(frame: .zero)
        skin.translatesAutoresizingMaskIntoConstraints = false
        skin.textColor = .systemYellow
        skin.backgroundColor = .clear
        skin.textAlignment = .center
        
        let eyes = UILabel(frame: .zero)
        eyes.translatesAutoresizingMaskIntoConstraints = false
        eyes.textColor = .systemYellow
        eyes.backgroundColor = .clear
        eyes.textAlignment = .center
        
        let home = UILabel(frame: .zero)
        home.translatesAutoresizingMaskIntoConstraints = false
        home.textColor = .systemYellow
        home.backgroundColor = .clear
        home.textAlignment = .center
        
//        hStack.addArrangedSubview(imageView)
        hStack.addArrangedSubview(name)
        hStack.addArrangedSubview(hair)
        hStack.addArrangedSubview(eyes)
        hStack2.addArrangedSubview(home)
        hStack2.addArrangedSubview(height)
        hStack2.addArrangedSubview(mass)
        vStack.addArrangedSubview(hStack)
        vStack.addArrangedSubview(hStack2)
        
        self.contentView.addSubview(vStack)
        
        vStack.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 8).isActive = true
        vStack.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 8).isActive = true
        vStack.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -8).isActive = true
        vStack.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -8).isActive = true
        
        name.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        
        self.name = name
        self.height = height
        self.mass = mass
        self.hair = hair
        self.skin = skin
        self.eyes = eyes
        self.home = home
    }
    
}


