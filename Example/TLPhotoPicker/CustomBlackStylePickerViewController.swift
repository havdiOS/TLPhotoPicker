//
//  CustomBlackStylePickerViewController.swift
//  TLPhotoPicker_Example
//
//  Created by wade.hawk on 2018. 8. 28..
//  Copyright © 2018년 CocoaPods. All rights reserved.
//

import Foundation
import TLPhotoPicker

extension UIImage {
    public func colorMask(color:UIColor) -> UIImage {
        let rect = CGRect(x:0, y:0, width:size.width, height:size.height)
        let rendererFormat = UIGraphicsImageRendererFormat()
        rendererFormat.opaque = false
        rendererFormat.scale = scale
        let renderer = UIGraphicsImageRenderer(size: rect.size, format: rendererFormat)
        let newImage = renderer.image { imageRendererContext in
            imageRendererContext.cgContext.setFillColor(color.cgColor)
            imageRendererContext.cgContext.setBlendMode(.sourceAtop)
            imageRendererContext.cgContext.fill(rect)
            draw(in: rect)
        }
        return newImage
    }
}

class CustomBlackStylePickerViewController: TLPhotosPickerViewController {
    override func makeUI() {
        super.makeUI()
        self.customNavItem.leftBarButtonItem = UIBarButtonItem.init(barButtonSystemItem: .stop, target: nil, action: #selector(customAction))
        self.view.backgroundColor = UIColor.black
        self.collectionView.backgroundColor = UIColor.black
        self.navigationBar.barStyle = .black
        self.titleLabel.textColor = .white
        self.subTitleLabel.textColor = .white
        self.navigationBar.tintColor = .white
        self.popArrowImageView.image = TLBundle.podBundleImage(named: "pop_arrow")?.colorMask(color: .black)
        self.albumPopView.popupView.backgroundColor = .black
        self.albumPopView.tableView.backgroundColor = .black
    }
    
    @objc func customAction() {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = super.tableView(tableView, cellForRowAt: indexPath) as! TLCollectionTableViewCell
        cell.backgroundColor = .black
        cell.titleLabel.textColor = .white
        cell.subTitleLabel.textColor = .white
        cell.tintColor = .white
        return cell
    }
}
