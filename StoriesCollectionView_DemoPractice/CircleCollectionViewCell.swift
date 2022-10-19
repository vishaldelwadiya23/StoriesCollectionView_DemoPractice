//
//  CircleCollectionViewCell.swift
//  StoriesCollectionView_DemoPractice
//
//  Created by tmtech1 on 19/10/22.
//

import UIKit

class CircleCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "CircleCollectionViewCell"
    
    private let imgView: UIImageView = {
       
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = 120.0/2.0
        imageView.layer.borderWidth = 2
        imageView.layer.borderColor = UIColor.blue.cgColor
        //imageView.backgroundColor = .blue
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(imgView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        imgView.frame = bounds
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        imgView.image = nil
    }
    
    public func configure(with imageName: String) {
        
        imgView.image = UIImage(named: imageName)
    }
    
}
