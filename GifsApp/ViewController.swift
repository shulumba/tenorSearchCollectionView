//
//  ViewController.swift
//  GifsApp
//
//  Created by Shulumba Igor on 18.10.2022.
//

import UIKit
//import GifsCollectionView

class ViewController: UIViewController {
    var gifsCollectionView: GifsCollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.addGifsCollectionView()
    }

    func addGifsCollectionView() {
        gifsCollectionView = GifsCollectionView.init()
        gifsCollectionView.delegate = self
        self.view.addSubview(gifsCollectionView)
        gifsCollectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            gifsCollectionView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 0),
            gifsCollectionView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            gifsCollectionView.leftAnchor.constraint(equalTo: self.view.leftAnchor),
            gifsCollectionView.rightAnchor.constraint(equalTo: self.view.rightAnchor)
        ])
        
        gifsCollectionView.setTenorApiKey(apiKey: "D1HMEZJG1XYE")
        gifsCollectionView.startLoadingGifs()
    }
}

extension ViewController: GifsCollectionViewDelegate {
    func didSelectGifsItem(gifItem: GifsItem) {
        print("didSelectGifsItem \(gifItem.gifID) URL \(gifItem.gifItemURL)")
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
    }
    
}
