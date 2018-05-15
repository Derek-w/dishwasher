//
//  DishwasherCollectionViewCell.swift
//  Dishwasher
//
//  Created by Admin on 5/14/18.
//  Copyright © 2018 Admin. All rights reserved.
//

import UIKit

let queue = OperationQueue()


class DishwasherCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    static let identifier = "DishwasherCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        layer.borderColor = UIColor.lightGray.cgColor
        layer.borderWidth = 1.0
    }
    
    func configure(with dishwasher: Dishwasher){
        
        titleLabel.text = dishwasher.title
        priceLabel.text = "00.00"
        imageView.downloadImage(at: "https:"+dishwasher.image)
    }
    
}


extension UIImageView {
    
    func downloadImage(at urlString: String){
        
        guard let url = URL(string: urlString) else {
            return
        }
        
        let block = BlockOperation(){
            
            URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
                
                if error != nil {
                    print(error!)
                    return
                }
                
                DispatchQueue.main.async {
                    self.image = UIImage(data: data!)
                }
            }).resume()
        }
        queue.cancelAllOperations()
        
        queue.addOperation(block)
    }
}



