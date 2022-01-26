//
//  DetailConstraints.swift
//  MoviesApp
//
//  Created by Balamurugan on 25/01/2022.
//

import UIKit

extension DiscoverDetailView {
    func configureConstraints() {
        scrollView.anchor(top: safeAreaLayoutGuide.topAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor)
        let screensize: CGRect = UIScreen.main.bounds
        let screenWidth = screensize.width
        let scrollViewSize = CGSize(width: screenWidth, height: 0)
        mainView.anchor(top: scrollView.topAnchor, leading: scrollView.leadingAnchor, bottom: scrollView.bottomAnchor, trailing: scrollView.trailingAnchor, size: scrollViewSize)
        
        discoverDetailHeaderViewOne.posterImage.anchor(top: mainView.topAnchor, leading: mainView.leadingAnchor, trailing: mainView.trailingAnchor,  padding: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0))
        
        discoverDetailHeaderViewOne.titleLabel.anchor(top: discoverDetailHeaderViewOne.posterImage.bottomAnchor, leading: mainView.leadingAnchor, trailing: discoverDetailHeaderViewTwo.fourKView.trailingAnchor, padding: UIEdgeInsets(top: CGFloat.size10, left: CGFloat.size20, bottom: 0, right: CGFloat.size40))
        
        discoverDetailHeaderViewOne.ratingImage.anchor(top: discoverDetailHeaderViewOne.titleLabel.bottomAnchor, leading: mainView.leadingAnchor, padding: UIEdgeInsets(top: CGFloat.size10, left: CGFloat.size20, bottom: 0, right: 0))
        
        discoverDetailHeaderViewOne.ratingLabel.anchor(leading: discoverDetailHeaderViewOne.ratingImage.trailingAnchor, padding: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: CGFloat.size5))
        discoverDetailHeaderViewOne.ratingLabel.centerYTo(discoverDetailHeaderViewOne.ratingImage.centerYAnchor)
        
        discoverDetailHeaderViewOne.directorLabel.anchor(top: discoverDetailHeaderViewOne.ratingImage.bottomAnchor, leading: mainView.leadingAnchor, trailing: mainView.trailingAnchor, padding: UIEdgeInsets(top: CGFloat.size5, left: CGFloat.size20, bottom: 0, right: CGFloat.size5))
        
        discoverDetailHeaderViewOne.lineView.anchor(top: discoverDetailHeaderViewOne.directorLabel.bottomAnchor, leading: mainView.leadingAnchor, trailing: mainView.trailingAnchor, padding: UIEdgeInsets(top: CGFloat.size10, left: CGFloat.size20, bottom: 0, right: CGFloat.size20),size: CGSize(width: 0, height: CGFloat.lineHeight))
        
        discoverDetailHeaderViewTwo.fourKView.anchor(trailing: mainView.trailingAnchor, padding: UIEdgeInsets(top: CGFloat.size10, left: CGFloat.size20, bottom: 0, right: CGFloat.size20),size: CGSize(width: CGFloat.size25, height: CGFloat.size25))
        discoverDetailHeaderViewTwo.fourKView.centerYTo(discoverDetailHeaderViewOne.titleLabel.centerYAnchor)
        
        discoverDetailHeaderViewTwo.fourKLabel.centerYTo(discoverDetailHeaderViewTwo.fourKView.centerYAnchor)
        discoverDetailHeaderViewTwo.fourKLabel.centerXTo(discoverDetailHeaderViewTwo.fourKView.centerXAnchor)
        
        discoverDetailHeaderViewTwo.releaseDateLabel.anchor(top: discoverDetailHeaderViewOne.lineView.bottomAnchor,leading: discoverDetailHeaderViewOne.titleLabel.leadingAnchor, padding: UIEdgeInsets(top: CGFloat.size10, left: 0, bottom: 0, right: 0))
        
        discoverDetailHeaderViewTwo.releaseDateText.anchor(top: discoverDetailHeaderViewTwo.releaseDateLabel.bottomAnchor,leading: discoverDetailHeaderViewTwo.releaseDateLabel.leadingAnchor, padding: UIEdgeInsets(top: CGFloat.size5, left: 0, bottom: 0, right: 0))
        
        discoverDetailBodyView.genreLabel.anchor(leading: discoverDetailHeaderViewTwo.releaseDateLabel.trailingAnchor, padding: UIEdgeInsets(top: 0, left: CGFloat.size50, bottom: 0, right: 0))
        discoverDetailBodyView.genreLabel.centerYTo(discoverDetailHeaderViewTwo.releaseDateLabel.centerYAnchor)
        
        collectionView.anchor(top: discoverDetailBodyView.genreLabel.bottomAnchor, leading: discoverDetailBodyView.genreLabel.leadingAnchor, trailing: mainView.trailingAnchor, padding: UIEdgeInsets(top: CGFloat.size20, left: 0, bottom: 0, right: CGFloat.size20), size: CGSize(width: 0, height: CGFloat.size20))
        
        discoverDetailBodyView.lineViewTwo.anchor(top: collectionView.bottomAnchor, leading: mainView.leadingAnchor, trailing: mainView.trailingAnchor, padding: UIEdgeInsets(top: CGFloat.size5, left: CGFloat.size20, bottom: 0, right: CGFloat.size20), size: CGSize(width: 0, height: CGFloat.lineHeight))
        
        discoverDetailBodyView.synopsisLabel.anchor(top: discoverDetailBodyView.lineViewTwo.bottomAnchor, leading: discoverDetailHeaderViewOne.titleLabel.leadingAnchor, padding: UIEdgeInsets(top: CGFloat.size20, left: 0, bottom: 0, right: 0))
        
        discoverDetailBodyView.synopsisText.anchor(top: discoverDetailBodyView.synopsisLabel.bottomAnchor, leading: discoverDetailHeaderViewOne.titleLabel.leadingAnchor, bottom: scrollView.bottomAnchor,trailing: discoverDetailBodyView.lineViewTwo.trailingAnchor, padding: UIEdgeInsets(top: CGFloat.size10, left: 0, bottom: 0, right: 0))
        
    }
}
