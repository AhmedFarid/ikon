//
//  phonesDetials.swift
//  ikon
//
//  Created by FARIDO on 9/17/18.
//  Copyright © 2018 FARIDO. All rights reserved.
//

import UIKit
import Kingfisher

class phonesDetials: UIViewController {

    var singelItem: Phone?
    
    @IBOutlet weak var phoneImage: UIImageView!
    @IBOutlet weak var phoneName: UILabel!
    @IBOutlet weak var phoneDes: UILabel!
    @IBOutlet weak var phonemodel: UILabel!
    @IBOutlet weak var phoneprice: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        phoneName.text = singelItem?.productsName
        phoneDes.text = singelItem?.productsDescription
        phonemodel.text = singelItem?.productsModel
        phoneprice.text = (singelItem?.productsPrice)!+" SR"
        
        
        phoneImage.kf.indicatorType = .activity
        if let url = URL(string: "http://ikongo.com/site/"+(singelItem?.productsImage)!){
            //print(url)
            phoneImage.kf.setImage(with: url, placeholder: #imageLiteral(resourceName: "placeholder"), options: nil, progressBlock: nil, completionHandler: nil)
        }
        
    }
    @IBAction func addToCartBtn(_ sender: Any) {
        guard (helper.getApiToken() != nil)  else {
            self.showAlert(title: "Filed to Add Cart", message: "please login frist")
            return
        }
        let newCart = Cart(context: context)
        newCart.productId = singelItem?.productsId
        newCart.productName = singelItem?.productsName
        newCart.productDes = singelItem?.productsDescription
        newCart.productPrice = singelItem?.productsPrice
        newCart.productImage = singelItem?.productsImage
        do{
        ad.saveContext()
            self.showAlert(title: "Add to cart", message: "Added to cart successfully go to cart to request order")
        } catch {
            print("error in coreData")
        }
    }
}
