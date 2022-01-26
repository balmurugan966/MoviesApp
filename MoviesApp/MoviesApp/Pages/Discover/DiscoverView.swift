//
//  DiscoverView.swift
//  MoviesApp
//
//  Created by Balamurugan on 25/01/2022.
//

import UIKit

final class DiscoverView: UIView {
    let collectionView: UICollectionView = {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(0.5),
            heightDimension: .fractionalHeight(1.0))
        let itemLayout = NSCollectionLayoutItem(layoutSize: itemSize)
        itemLayout.contentInsets = .init(top: 8, leading: 8, bottom: 8, trailing: 8)
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .fractionalWidth(0.85))
        let groupLayout = NSCollectionLayoutGroup.horizontal(
            layoutSize: groupSize,
            subitem: itemLayout,
            count: 2)
        let section = NSCollectionLayoutSection(group: groupLayout)
        section.contentInsets = .init(top: 8, leading: 8, bottom: 8, trailing: 8)
        let layout = UICollectionViewCompositionalLayout(section: section)
        let this = UICollectionView(frame: .zero, collectionViewLayout: layout)
        this.backgroundColor = .clear
        return this
    }()

    convenience init() {
        self.init(frame: .zero)
        configureView()
        configureSubviews()
        configureConstraints()
    }

    private func configureView() {
        backgroundColor = .movieBackgroundColor
    }

    private func configureSubviews() {
        addSubview(collectionView)
    }

    private func configureConstraints() {
        collectionView.anchor(top: safeAreaLayoutGuide.topAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor)
    }
}
