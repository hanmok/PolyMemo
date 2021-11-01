//
//  ViewController.swift
//  treeTest
//
//  Created by Mac mini on 2021/10/30.
//

import UIKit
import CoreData

class CoreTestVC: UIViewController {

    // MARK: - Properties
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    var nodes: [FolderNode]?
    
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
            let request = FolderNode.fetchRequest() as NSFetchRequest<FolderNode>
            
            self.nodes = try context.fetch(request)
            print("items: \(self.nodes)")
            print("nodes.count: \(self.nodes?.count)")
        } catch {
            print("failed to fetch")
        }
        
        
    }
    
    func createRelation() {
        
        let folderNode1 = FolderNode(context: self.context)
           
        let folderNode2 = FolderNode(context: self.context)
        
        let folderNode3 = FolderNode(context: self.context)
        let folderNode4 = FolderNode(context: self.context)
        let memoNode1 = Memo(context: self.context)
        let memoNode2 = Memo(context: self.context)
        let memoNode3 = Memo(context: self.context)
        
        folderNode1.title = "I' FN1.title"
        folderNode2.title = "I'm FN2.title"
        folderNode3.title = "I'm FN3.title"
        folderNode4.title = "I'm FN4.title"
        
        memoNode1.title = "I'm MN1.title"
//        memoNode2.title = "I'm memoNode 2"
        memoNode2.title = "I'm MN2.title"
        memoNode2.createdAt = Date()
        memoNode3.title = "I'm MN3.title"
        
        folderNode1.addToMemos([memoNode1, memoNode2, memoNode3])
        
        do {
            try self.context.save()
            
        } catch {
            print("failed create")
        }
        fetch()
        folderNode1.addToChildren([folderNode2, folderNode3, folderNode4])
        
        print("folderNode1.children.count: \(folderNode1.children?.count)")
        print("folderNode1.memos: \(folderNode1.memos)")
           // how come it has three nodes ? zzzz i got it..
        fetch()
    }
    
   


    
    func create() {
        let folderNode = FolderNode(context: self.context)
        
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
