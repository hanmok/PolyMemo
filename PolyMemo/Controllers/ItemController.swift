//
//  ItemController.swift
//  PolyMemo
//
//  Created by Mac mini on 2021/11/07.
//

import UIKit

class ItemController: UIViewController {

//    var viewModel: ItemViewModel? {
//        didSet { configure() }
//    }
//
//    func configure() {
//
//    }
//
//    init(<#parameters#>) {
//        <#statements#>
//    }
    
    init(item: ItemSample) {
        self.item = item
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.text = " this is my titleLabel !"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var item: ItemSample
//
//    init(item: ItemSample) {
////        super.init(coder: NSCoder.init())!
//        super.init()
//        self.item = item
//    }
    
//    init() {
//        super.init(nibName: nil, bundle: nil)
//    }
    
//    convenience init(item: ItemSample) {
//        self.init(item: item)
//        self.item = item
//    }
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        self.title = "myyy title!"
        
        self.title = item.name
        navigationController?.navigationBar.isHidden = true
//        navigationController?.navigationItem.backButtonTitle = ""
        
        navigationController?.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
//        navigationController?.navigationBar
//        navigationController?.navigationItem.backButtonDisplayMode = .minimal
        
        view.addSubview(titleLabel)
        titleLabel.center(inView: view)
        titleLabel.setDimensions(height: 100, width: view.frame.size.width)
    }
    
    
    
}
