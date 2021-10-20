//
//  ViewController.swift
//  RandomPhoto
//
//  Created by Gaurab thapa on 20/10/21.
//

import UIKit

class ViewController: UIViewController {
    
    
    private let imageView:UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = .white
        return imageView
    }()
    
    private let button:UIButton = {
        let button  = UIButton()
        button.backgroundColor = .black
        button.setTitle("Next Photo", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 25
        
        return button
    }()
    
    let colors: [UIColor] = [
        .systemRed,.systemBlue,.systemCyan,.systemGray,.systemMint,.systemPink,.systemBrown,.systemGray4
    ]

    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .darkGray
        view.addSubview(imageView)
        imageView.frame = CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height-160)
        imageView.center = view.center
        view.addSubview(button)
        getPhoto()
        button.addTarget(self, action: #selector(didTapOnButton), for: .touchUpInside)
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        button.frame = CGRect(x: 30,
                              y: view.frame.size.height-40-view.safeAreaInsets.bottom,
                              width: view.frame.size.width-60,
                              height: 50
        )
    }
    
    @objc func didTapOnButton(){
        getPhoto()
        view.backgroundColor = colors.randomElement()
    }

    func getPhoto(){
        let urlString = "https://source.unsplash.com/random/600x600"
        let url = URL(string: urlString)!
        guard let data = try? Data(contentsOf: url) else{
            return
        }
        imageView.image = UIImage(data: data)
    }
    
    
}

