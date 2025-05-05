//
//  AnimalCollectionViewController.swift
//

import UIKit

class AnimalCollectionViewController: UIViewController {
    let animals = [
        Animal(name: "fox", emoji: "🦊"),
        Animal(name: "penguin", emoji: "🐧"),
        Animal(name: "elephant", emoji: "🐘"),
        Animal(name: "tiger", emoji: "🐯"),
        Animal(name: "lion", emoji: "🦁"),
        Animal(name: "snake", emoji: "🐍"),
        Animal(name: "rabbit", emoji: "🐇"),
    ]
    
    let cellRegistration = UICollectionView.CellRegistration<AnimalCollectionViewCell, Animal>(cellNib: UINib(nibName: "AnimalCollectionViewCell", bundle: Bundle(for: AnimalCollectionViewCell.self))) { cell, indexPath, animal in
        cell.emojiLabel.text = animal.emoji
        cell.nameLabel.text = animal.name
    }
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }

}

extension AnimalCollectionViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return animals.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let animal = animals[indexPath.item]
        return collectionView.dequeueConfiguredReusableCell(using: cellRegistration, for: indexPath, item: animal)
    }
}

#Preview {
    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    let controller =  storyboard.instantiateInitialViewController()!
    return controller
}
