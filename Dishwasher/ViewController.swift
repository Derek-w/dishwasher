//
//  ViewController.swift
//  Dishwasher
//
//  Created by Admin on 5/14/18.
//  Copyright © 2018 Admin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var dishwasherCollectionView: UICollectionView!
    var products = [Dishwaser]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ProductService.getProducts(){[unowned self] dishwashers in self.products = dishwashers
            DispatchQueue.main.async {
                self.dishwasherCollectionView.reloadData()
            }
        // Do any additional setup after loading the view, typically from a nib.
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

extension ViewController: UICollectionViewDelegate {
    
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.size.width/2, height: 400.0)
        }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        <#code#>
    }
}

extension ViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return products.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DishwasherCollectionViewCell.identifier, for: indexPath)
        guard let dishwasherCell = cell as? DishwasherCollectionViewCell else { return }
        let dishwasher = products[indexPath.row]
        dishwasherCell.configure(with: dishwasher)
    }
}

