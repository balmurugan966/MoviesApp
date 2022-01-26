//
//  ViewExtensions.swift
//  iOSUtilities
//
//  Created by Balamurugan on 25/01/2022.
//

import UIKit

//MARK:- Debounce
public func debounce(interval: Int, queue: DispatchQueue, action: @escaping (() -> Void)) -> () -> Void {
    let dispatchDelay = DispatchTimeInterval.milliseconds(interval)
    
    return {
        
        let dispatchTime: DispatchTime = DispatchTime.now() + dispatchDelay
        
        queue.asyncAfter(deadline: dispatchTime) {
            
            action()
            
        }
    }
}

//MARK:- UILabel
extension UILabel {
    public func setUpGenLabel(text:String, textColor:UIColor = .black, font:UIFont, numberOfLines:Int = 1,textAlignment:NSTextAlignment = .left){
        self.text = text
        self.font = font
        self.textColor = textColor
        self.sizeToFit()
        self.numberOfLines = numberOfLines
        self.textAlignment = textAlignment
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}


//MARK:- UIImageView
extension UIImageView {
    public func setUpImageView(image:String, contentMode:UIView.ContentMode = .scaleAspectFill){
        self.image = UIImage(named: image)
        self.contentMode = contentMode
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}

//MARK:- UIViewController
extension UIViewController{
    
    public func setupNavSettings(){
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = UIColor.clear
        self.navigationController?.navigationBar.tintColor = UIColor.white
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: UIBarButtonItem.Style.done, target: self, action: nil)
    }
    
    public func simpleAlert(alertType:UIAlertController.Style? = .alert, title:String?, message:String = ""){
        let actionSheet = UIAlertController(title: title, message: message, preferredStyle: alertType ?? .alert)
        actionSheet.addAction(UIAlertAction(title: "OKAY", style: .cancel, handler: nil))
        present(actionSheet, animated: true, completion: nil)
    }
    
    public func animateView(action:(() -> ())? = nil, completedaction:(() -> ())? = nil){
        UIView.animate(withDuration: 0.4, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 8, options: .curveEaseInOut, animations: {
            action!()
        }, completion: { _ in
            completedaction!()
        })
    }
    
}

extension UIView {
    
    public func anchor(top: NSLayoutYAxisAnchor? = nil, leading: NSLayoutXAxisAnchor? = nil, bottom: NSLayoutYAxisAnchor? = nil, trailing: NSLayoutXAxisAnchor? = nil, padding: UIEdgeInsets = .zero, size: CGSize = .zero) {
        
        translatesAutoresizingMaskIntoConstraints = false
        
        if let top = top {
            topAnchor.constraint(equalTo: top, constant: padding.top).isActive = true
        }
        
        if let leading = leading {
            leadingAnchor.constraint(equalTo: leading, constant: padding.left).isActive = true
        }
        
        if let bottom = bottom {
            bottomAnchor.constraint(equalTo: bottom, constant: -padding.bottom).isActive = true
        }
        
        if let trailing = trailing {
            trailingAnchor.constraint(equalTo: trailing, constant: -padding.right).isActive = true
        }
        
        if size.width != 0 {
            widthAnchor.constraint(equalToConstant: size.width).isActive = true
        }
        
        if size.height != 0 {
            heightAnchor.constraint(equalToConstant: size.height).isActive = true
        }
        
    }
    
    public func fillSuperview(padding: UIEdgeInsets = .zero) {
        translatesAutoresizingMaskIntoConstraints = false
        guard let superviewTopAnchor = superview?.topAnchor,
              let superviewBottomAnchor = superview?.bottomAnchor,
              let superviewLeadingAnchor = superview?.leadingAnchor,
              let superviewTrailingAnchor = superview?.trailingAnchor else { return }
        return anchor(top: superviewTopAnchor, leading: superviewLeadingAnchor, bottom: superviewBottomAnchor, trailing: superviewTrailingAnchor, padding: padding)
    }
    
    public func fillSuperviewSafeAreaLayoutGuide(padding: UIEdgeInsets = .zero) {
        guard let superviewTopAnchor = superview?.safeAreaLayoutGuide.topAnchor,
              let superviewBottomAnchor = superview?.safeAreaLayoutGuide.bottomAnchor,
              let superviewLeadingAnchor = superview?.safeAreaLayoutGuide.leadingAnchor,
              let superviewTrailingAnchor = superview?.safeAreaLayoutGuide.trailingAnchor else { return}
        return anchor(top: superviewTopAnchor, leading: superviewLeadingAnchor, bottom: superviewBottomAnchor, trailing: superviewTrailingAnchor, padding: padding)
    }
    
    public func centerXTo(_ anchor: NSLayoutXAxisAnchor) {
        translatesAutoresizingMaskIntoConstraints = false
        centerXAnchor.constraint(equalTo: anchor).isActive = true
    }
    
    public func centerYTo(_ anchor: NSLayoutYAxisAnchor) {
        translatesAutoresizingMaskIntoConstraints = false
        centerYAnchor.constraint(equalTo: anchor).isActive = true
    }
    
    public func centerXToSuperview() {
        translatesAutoresizingMaskIntoConstraints = false
        if let superviewCenterXAnchor = superview?.centerXAnchor {
            centerXAnchor.constraint(equalTo: superviewCenterXAnchor).isActive = true
        }
    }
    
    public func centerYToSuperview() {
        translatesAutoresizingMaskIntoConstraints = false
        if let superviewCenterYAnchor = superview?.centerYAnchor {
            centerYAnchor.constraint(equalTo: superviewCenterYAnchor).isActive = true
        }
    }
    
    public func widthConstraints(_ anchor: NSLayoutDimension) {
        translatesAutoresizingMaskIntoConstraints = false
        widthAnchor.constraint(equalTo: anchor).isActive = true
    }
    
    public func heightConstraints(_ anchor: NSLayoutDimension , size: CGFloat = 0.0) {
        translatesAutoresizingMaskIntoConstraints = false
        heightAnchor.constraint(equalTo: anchor, constant: size).isActive = true
    }
    
    public func addSubviews(_ views: UIView...) {
        views.forEach { addSubview($0) }
    }
    
}
