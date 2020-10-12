//
//  DetailViewController.swift
//  StarWars
//
//  Created by Ghassan  albakuaa  on 10/12/20.
//

import UIKit

class DetailViewController: UIViewController {
    
    
    var charHeight: UILabel?
    var charMass: UILabel?
    var charHair: UILabel?
    var character: Character?
    var charSkin: UILabel?
    var charEyes: UILabel?
    var planet: String?
    var films: UILabel?
    var charName: UILabel?
    var charHome: UILabel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUp()
        self.charName?.text = self.character?.name
        self.charHair?.text = self.character?.hairColor.capitalized
        self.charEyes?.text = self.character?.eyeColor.capitalized
        self.charHome?.text = planet
        self.charHeight?.text = self.character?.height
        self.charMass?.text = self.character?.mass
        
        var filmsList: String = "Films:"
        
        guard (self.character?.films) != nil else {
            return
        }
        self.character?.films.forEach({ (film) in
            filmsList.append("\n" + film)
            })
            
        self.films?.text = filmsList
    }
    
    private func setUp() {
        
        let vStack = UIStackView(frame: .zero)
        vStack.translatesAutoresizingMaskIntoConstraints = false
        vStack.axis = .vertical
        vStack.distribution = .fillEqually
   
        
        let hStack = UIStackView(frame: .zero)
        hStack.translatesAutoresizingMaskIntoConstraints = false
        hStack.axis = .horizontal
        hStack.distribution = .fillEqually
     
        
        
        let hStack2 = UIStackView(frame: .zero)
        hStack2.translatesAutoresizingMaskIntoConstraints = false
        hStack2.axis = .horizontal
        hStack2.distribution = .fillEqually
       
        
        let name = UILabel(frame: .zero)
        name.translatesAutoresizingMaskIntoConstraints = false
        name.textColor = .systemRed
        name.textAlignment = .center
       
        
        let height = UILabel(frame: .zero)
        height.translatesAutoresizingMaskIntoConstraints = false
        name.textColor = .systemRed
        height.textAlignment = .center
       
        
        let mass = UILabel(frame: .zero)
        mass.translatesAutoresizingMaskIntoConstraints = false
        name.textColor = .systemRed
        mass.textAlignment = .center
        
        
        let hair = UILabel(frame: .zero)
        hair.translatesAutoresizingMaskIntoConstraints = false
        name.textColor = .systemRed
        hair.textAlignment = .center
    
        
        let skin = UILabel(frame: .zero)
        skin.translatesAutoresizingMaskIntoConstraints = false
        name.textColor = .systemRed
        skin.textAlignment = .center
    
        
        let eyes = UILabel(frame: .zero)
        eyes.translatesAutoresizingMaskIntoConstraints = false
        name.textColor = .systemRed
        eyes.textAlignment = .center
       
        
        let home = UILabel(frame: .zero)
        home.translatesAutoresizingMaskIntoConstraints = false
        name.textColor = .systemRed
        home.textAlignment = .center
       
        
        let films = UILabel(frame: .zero)
        films.translatesAutoresizingMaskIntoConstraints = false
        films.textColor = .systemYellow
        films.textAlignment = .center
        films.numberOfLines = 0
       
        
        let scroll = UIScrollView(frame: .zero)
        scroll.translatesAutoresizingMaskIntoConstraints = false
        scroll.flashScrollIndicators()
    
        vStack.addArrangedSubview(name)
        hStack.addArrangedSubview(hair)
        hStack.addArrangedSubview(eyes)
        
        hStack2.addArrangedSubview(home)
        hStack2.addArrangedSubview(height)
        hStack2.addArrangedSubview(mass)
        
        vStack.addArrangedSubview(hStack)
        vStack.addArrangedSubview(hStack2)
        vStack.addArrangedSubview(films)
        
        scroll.addSubview(vStack)
        self.view.largeContentImage = UIImage(named: "galaxy")
        self.view.addSubview(scroll)
        
        
        scroll.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 0).isActive = true
        scroll.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0).isActive = true
        scroll.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 0).isActive = true
        scroll.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 0).isActive = true
        
        scroll.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier:
                                        1).isActive = true
        scroll.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 1).isActive = true
        
        vStack.topAnchor.constraint(equalTo: scroll.topAnchor, constant: 0).isActive = true
        vStack.bottomAnchor.constraint(equalTo: scroll.bottomAnchor, constant: 0).isActive = true
        vStack.leadingAnchor.constraint(equalTo: scroll.leadingAnchor, constant: 0).isActive = true
        vStack.trailingAnchor.constraint(equalTo: scroll.trailingAnchor, constant: 0).isActive = true
        
        hStack2.leadingAnchor.constraint(equalTo: vStack.leadingAnchor, constant: 8).isActive = true
        hStack2.trailingAnchor.constraint(equalTo: vStack.trailingAnchor, constant: -8).isActive = true
        vStack.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 1).isActive = true
        
        self.charName = name
        self.charHeight = height
        self.charMass = mass
        self.charHair = hair
        self.charSkin = skin
        self.charEyes = eyes
        self.charHome = home
        self.films = films
    }
}


