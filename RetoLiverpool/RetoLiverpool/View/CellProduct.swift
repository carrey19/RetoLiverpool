//
//  CellProduct.swift
//  RetoLiverpool
//
//  Created by Carlos Carrera Reyes on 26/12/18.
//  Copyright © 2018 Carlos Carrera Reyes. All rights reserved.
//

import UIKit

class CellProduct: UICollectionViewCell {
    public var lblTitle: UILabel!
    public var lblPrice: UILabel!
    public var ivProduct: UIImageView!
    override init(frame: CGRect) {
        super.init(frame: frame)
        ivProduct = UIImageView(frame: CGRect(x: self.frame.width*0.2, y: 0, width: self.frame.width*0.6, height: self.frame.height*0.5))
        self.addSubview(ivProduct)
        lblTitle = UILabel(frame: CGRect(x: self.frame.width*0.05, y: ivProduct.frame.height, width: self.frame.width*0.9, height: self.frame.height*0.4))
        lblTitle.numberOfLines = 2
        lblTitle.font = UIFont.boldSystemFont(ofSize: 10)
        self.addSubview(lblTitle)
        lblPrice = UILabel(frame: CGRect(x: self.frame.width*0.05, y: self.frame.height*0.8, width: self.frame.width*0.9, height: self.frame.height*0.2))
        lblPrice.textColor = UIColor.red
        lblPrice.font = UIFont.boldSystemFont(ofSize: 12)
        self.addSubview(lblPrice)
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
