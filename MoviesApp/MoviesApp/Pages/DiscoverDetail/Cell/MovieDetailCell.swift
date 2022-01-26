//
//  MovieDetailCell.swift
//  Moviestar
//
//  Created by Balamurugan on 25/01/2022.
//

import UIKit
import iOSUtilities

final class MovieDetailCell: UICollectionViewCell {
    
    let titleLabel: UILabel = {
        let this = UILabel()
        this.setUpGenLabel(text: "", textColor: .movieColorGray2, font: .systemFont14Medium,
                           numberOfLines: 1, textAlignment: .center)
        this.textAlignment = .left
        return this
    }()
    
    let titleView: UIView = {
        let this = UIView()
        this.backgroundColor = .blue
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
    }
    
    private func configureConstraints() {
        titleLabel.anchor(top: contentView.topAnchor, leading: contentView.leadingAnchor, bottom: contentView.bottomAnchor, trailing: contentView.trailingAnchor, padding: UIEdgeInsets(top: 0, left: CGFloat.size10, bottom: CGFloat.size10, right: 0))
    }
}

extension MovieDetailCell {
    struct ViewModel: Hashable {
        let genre: String
    }
    
    func populate(data: ViewModel) {
        titleLabel.text = data.genre
    }
}
