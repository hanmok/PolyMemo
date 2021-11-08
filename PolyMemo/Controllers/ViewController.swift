//
//  ViewController.swift
//  PolyMemo
//
//  Created by Mac mini on 2021/11/02.
//

import UIKit
import CoreData

class ViewController: UIViewController {

//    let itemSample1 = ItemSample(name: "my Item", comment: "hot!", avgRate: 3.7, maxRate: 5, link: "www.google.com", location: "경기도 안양시.. ", images: UIImage(systemName: "pencil")!, memo: "This is my long and long memo", modifiedAt: Date())
    
//    lazy var itemController = ItemController(item: itemSample1)
    
    private let textView : UITextView = {
        let tv = UITextView()
        return tv
    }()
    
    private let toItemButton: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitleColor(.black, for: .normal)
        btn.setTitle("to Item Controller", for: .normal)
        btn.addTarget(self, action: #selector(handleNavigation), for: .touchUpInside)
        btn.backgroundColor = .white
        return btn
    }()
    
//    let testItem = Item(context: NSManagedObjectContext()
    
    @objc func handleNavigation(_ sender: UIButton) {
//        let nav = itemController
//        navigationController?.pushViewController(nav, animated: true)
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(toItemButton)
        toItemButton.translatesAutoresizingMaskIntoConstraints = false
        toItemButton.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        toItemButton.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        toItemButton.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        toItemButton.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        
    }
}
