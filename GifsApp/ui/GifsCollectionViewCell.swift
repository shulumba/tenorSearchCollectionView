//
//  GifsCollectionViewCell.swift
//  GifsApp
//
//  Created by Shulumba Igor on 18.10.2022.
//

import UIKit
import SDWebImage

class GifsCollectionViewCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        addViews()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let gifsImageView: SDAnimatedImageView = {
        let view = SDAnimatedImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.gifsImageView.stopAnimating()
    }
    
    private func addViews() {
        addSubview(gifsImageView)
        NSLayoutConstraint.activate([gifsImageView.topAnchor.constraint(equalTo: topAnchor),
                                     gifsImageView.bottomAnchor.constraint(equalTo: bottomAnchor),
                                     gifsImageView.leftAnchor.constraint(equalTo: leftAnchor),
                                     gifsImageView.rightAnchor.constraint(equalTo: rightAnchor)])
        
    }
    
    public func setGifsImage(url: URL?){
        guard let url = url else { return }
        self.gifsImageView.sd_imageIndicator = SDWebImageActivityIndicator.gray
        self.gifsImageView.sd_setImage(with: url) { image, error, cache, url in
            
        }
    }
}

