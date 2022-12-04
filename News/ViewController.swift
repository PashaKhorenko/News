//
//  ViewController.swift
//  News
//
//  Created by Pasha Khorenko on 09.02.2022.
//

import UIKit
import SafariServices

class ViewController: UIViewController {

    var article: Article!
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var safariButton: UIButton!
    @IBOutlet weak var activityIndecator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.layer.cornerRadius = 15
        imageView.layer.borderWidth = 3
        imageView.layer.borderColor = UIColor.gray.cgColor
        
        activityIndecator.hidesWhenStopped = true

        titleLabel.text = article.title
        descriptionLabel.text = article.description
        
        
        DispatchQueue.main.async {
            // загрузка(отображение) картинки
            if let url = URL(string: self.article.urlToImage) {
                if let data = try? Data(contentsOf: url) {
                    self.imageView.image = UIImage(data: data)
                    
                    //скрытие крутилки после загрузки(отображения) картинки
                    self.activityIndecator.stopAnimating()
                }
            }
        }
                
        if URL(string: article.url) == nil {
            //отключаем кнопку
            safariButton.isEnabled = false
        }
        
    }
    
    
    @IBAction func buttonAction(_ sender: UIButton) {
        
        guard let url = URL(string: article.url) else { return }
        
        let safariCV = SFSafariViewController(url: url)
        present(safariCV, animated: true, completion: nil)
    }
    

}
