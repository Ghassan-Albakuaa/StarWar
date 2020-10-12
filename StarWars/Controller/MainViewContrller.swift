//
//  MainViewContrller.swift
//  StarWars
//
//  Created by Ghassan  albakuaa  on 10/12/20.
//

import UIKit

class MainViewController: UIViewController{
    
    var pageNumber: Int = 1
    var tableView: UITableView?
    var filmDict: [String: [String]] = [:]
    var homeDict: [String: Home] = [:]
    var charList: [Character] = []{
        didSet {
            DispatchQueue.main.async {
                self.tableView?.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pagenation()
        setUp()
        
    }
    
    
    
    func pagenation() {
        NetworkManager.shared.getCharacterList(page: self.pageNumber){ result in
            switch result {
            case .success(let characterList):
                self.charList.append(contentsOf: characterList.results)
                characterList.results.forEach
                    {
                        Character in
                        
                        NetworkManager.shared.getHome(homeURL: Character.homeworld) { (home) in
                            self.homeDict[Character.name] = home
                        }
                        
                        Character.films.forEach
                            {
                                film in
                                NetworkManager.shared.getFilms(filmUrl: film)
                                {
                                    flicks  in
                                    
                                    guard let movies = flicks else {return}
                                    
                                    if self.filmDict[Character.name] != nil
                                    {
                                        self.filmDict[Character.name]?.append(movies.title)
                                    }
                                    else
                                    {
                                        self.filmDict[Character.name] = [movies.title]
                                    }
                                    
                                }
                        }
                }
                
            case .failure(let error):
            
                print("error ")
                print(error)
            }
        }
        self.pageNumber = self.pageNumber + 1
    }
    
    func setUp() {
        self.view.backgroundColor = .white
        let table = UITableView(frame: .zero)
        table.translatesAutoresizingMaskIntoConstraints = false
        
        table.delegate = self
        table.dataSource = self
        table.prefetchDataSource = self
        
        
        table.register(StarTabelView.self, forCellReuseIdentifier: StarTabelView.reuseId)
        
        self.view.addSubview(table)
        self.tableView = table
    }
}

extension MainViewController: UITableViewDelegate, UITableViewDataSource
{
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.charList.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: StarTabelView.reuseId, for: indexPath) as? StarTabelView else {return UITableViewCell()}
        
        var imageView = UIImageView(frame: .init(x: 10, y: 10, width: cell.frame.width - 10, height: cell.frame.height - 10))
        let image = UIImage(named: "galaxy")
        cell.backgroundColor = .clear
        imageView.image = image
        
        cell.backgroundView = UIView()
       
        
        cell.name?.text = charList[indexPath.row].name + ":"
        cell.home?.text =  self.homeDict[self.charList[indexPath.row].name]?.name
        cell.height?.text = "Height: " + charList[indexPath.row].height + "\""
        cell.mass?.text = "Mass: " + charList[indexPath.row].mass
        cell.hair?.text = charList[indexPath.row].hairColor.capitalized
        cell.eyes?.text = charList[indexPath.row].eyeColor.capitalized + " Eyes"
        return cell
    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let vc = DetailViewController()
        vc.planet = self.homeDict[self.charList[indexPath.row].name]?.name

        vc.character = self.charList[indexPath.row]
        //vc.films?.text = self.filmDict[self.characterList
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
}

extension MainViewController: UITableViewDataSourcePrefetching {
    func tableView(_ tableView: UITableView, prefetchRowsAt indexPaths: [IndexPath]) {
        if self.charList.count < 50
        {
            let lastCalls = IndexPath(row: self.charList.count - 1, section: 0)
            guard indexPaths.contains(lastCalls) else { return }
            self.pagenation()
            
        }
    }
}

