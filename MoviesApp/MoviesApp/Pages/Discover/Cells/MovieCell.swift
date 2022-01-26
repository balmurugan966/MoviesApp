//
//  MovieCell.swift
//  Moviestar
//
//  Created by Balamurugan on 25/01/2022.
//

import UIKit
import iOSUtilities

final class MovieCell: UICollectionViewCell {
    
    let titleLabel: UILabel = {
        let this = UILabel()
        this.setUpGenLabel(text: "", textColor: .white, font: .systemFont14Medium,
                           numberOfLines: 3)
        return this
    }()
 
    let imageView: ImageLoader = {
        let this = ImageLoader()
        this.contentMode = .scaleToFill
        this.backgroundColor = .red
        this.clipsToBounds = true
        this.layer.cornerRadius = CGFloat.size18
        return this
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        configureSubviews()
        configureConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureSubviews() {
        addSubview(titleLabel)
        addSubview(imageView)
    }
    
    private func configureConstraints() {
        
        imageView.anchor(top: topAnchor)
        
        imageView.heightConstraints(contentView.heightAnchor, size: -CGFloat.size60)
        imageView.widthConstraints(contentView.widthAnchor)
        
        titleLabel.anchor(top: imageView.bottomAnchor, leading: contentView.leadingAnchor, trailing: contentView.trailingAnchor, padding: UIEdgeInsets(top: CGFloat.size10, left: 0, bottom: 0, right: 0))
        
    }
}

extension MovieCell {
    struct ViewModel: Hashable {
        let id: String
        let title: String
        let image:String
        let year:String
        let uuid:String
    }
    
    func populate(data: ViewModel) {
        titleLabel.text = "\(data.title) (\(data.year))"
        imageView.loadImageWithUrl(URL(string: data.image) ?? URL(fileURLWithPath: ""))
    }
}
