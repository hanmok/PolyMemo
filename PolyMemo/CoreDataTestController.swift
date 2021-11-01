//
//  ViewController.swift
//  treeTest
//
//  Created by Mac mini on 2021/10/30.
//

import UIKit
import CoreData

class CoreDataTestController: UIViewController {

    // MARK: - Properties
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    var nodes: [Category]?
    
    private let createButton: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.addTarget(self, action: #selector(handleCreateAction), for: .touchUpInside)
        btn.setTitle("create", for: .normal)
        btn.setTitleColor(.black, for: .normal)
        btn.backgroundColor = .gray
        return btn
    }()
    
    private let fetchButton: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.addTarget(self, action: #selector(handleFetchAction), for: .touchUpInside)
        btn.setTitle("fetch", for: .normal)
        btn.setTitleColor(.black, for: .normal)
        btn.backgroundColor = .gray
        return btn
    }()
    
    private let removeButton: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.addTarget(self, action: #selector(handleRemoveAction), for: .touchUpInside)
        btn.setTitle("remove", for: .normal)
        btn.setTitleColor(.black, for: .normal)
        btn.backgroundColor = .gray
        return btn
    }()
    
    private let makeRelationButton: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.addTarget(self, action: #selector(handleCreateRelationAction), for: .touchUpInside)
        btn.setTitle("CreateRelation", for: .normal)
        btn.setTitleColor(.black, for: .normal)
        btn.backgroundColor = .gray
        return btn
    }()
    
    private let testButton: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.addTarget(self, action: #selector(testAction), for: .touchUpInside)
        btn.setTitle("test", for: .normal)
        btn.setTitleColor(.black, for: .normal)
        btn.backgroundColor = .gray
        return btn
    }()
    
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let uistack = UIStackView(arrangedSubviews: [createButton, fetchButton, removeButton, makeRelationButton, testButton])
        uistack.spacing = 20
        uistack.axis = .vertical
        uistack.distribution = .fillEqually
        uistack.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(uistack)
        
        uistack.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        uistack.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        
        uistack.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        uistack.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive  = true
    }
    
    // MARK: - Handlers
    @objc func testAction() {
        print("test")
    }
    
    
    @objc func handleCreateAction() {
        print("handleCreateAction pressed")
        create()
    }
    
    @objc func handleFetchAction() {
        fetch()
    }
    
    @objc func handleRemoveAction() {
        remove()
    }
    
    @objc func handleCreateRelationAction() {
        createRelation()
    }
    
    func fetch() {
        do {
            let request = Category.fetchRequest() as NSFetchRequest<Category>
            
            self.nodes = try context.fetch(request)
            print("items: \(String(describing: self.nodes))")
            print("nodes.count: \(String(describing: self.nodes?.count))")
        } catch {
            print("failed to fetch")
        }
        
        
    }
    
    func createRelation() {
        
        let category1 = Category(context: self.context)
           
        let category2 = Category(context: self.context)
        
        let category3 = Category(context: self.context)
        let category4 = Category(context: self.context)
        let itemNode1 = Item(context: self.context)
        let itemNode2 = Item(context: self.context)
        let itemNode3 = Item(context: self.context)
        
        category1.title = "I' FN1.title"
        category2.title = "I'm FN2.title"
        category3.title = "I'm FN3.title"
        category4.title = "I'm FN4.title"
        
        itemNode1.name = "I'm MN1.title"
//        itemNode2.title = "I'm itemNode 2"
        itemNode2.name = "I'm MN2.title"
        itemNode2.createdAt = Date()
        itemNode3.name = "I'm MN3.title"
        

        category1.addToItems([itemNode1, itemNode2, itemNode3])
        
        do {
            try self.context.save()
            
        } catch {
            print("failed create")
        }
        fetch()

        category1.addToItems([category2, category3, category4])
//        print("category1.children.count: \(category1.children?.count)")
        print("category1.items.count: \(String(describing: category1.items?.count))")
        print("category1.items: \(String(describing: category1.items))")
           // how come it has three nodes ? zzzz i got it..
        fetch()
    }
    
   


    
    func create() {
        let category = Category(context: self.context)
        
        do {
            try self.context.save()
            
        } catch {
            print("failed create")
        }
        fetch()
    }

    
    func remove() {

        repeat {
            fetch()
            guard let nodeToRemove = self.nodes?[0] else { return }
            self.context.delete(nodeToRemove)
            do {
                try self.context.save()
                fetch()
            } catch {
                print("failed to remove")
            }
        } while ( nodes?.count != 0)
    }
}
