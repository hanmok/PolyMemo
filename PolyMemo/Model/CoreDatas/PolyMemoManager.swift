//
//  PolyMemoManager.swift
//  PolyMemo
//
//  Created by Mac mini on 2021/11/04.
//

import Foundation
import CoreData

/*
 This manager works purely on the 'mainContext'.
 it's context can b eset externally.
 if you wanted to pass in a context configured purely for in-memory you could.
 
 This enables you to write unit tests that don't collide with app data.
 We well as run them quickly in memory
 */


struct PolyMemoManager {
    let mainContext: NSManagedObjectContext
    
    init(mainContext: NSManagedObjectContext = CoreDataStack.shared.mainContext) {
        self.mainContext = mainContext
    }
    
    @discardableResult
    func createCategory(with title: String) -> Category? {
        let category = Category(context: mainContext)
        
        category.title = title
        
        do {
            try mainContext.save()
            return category
        } catch let error {
            print("Failed to create \(error)")
        }
        
        return nil
    }
    
    func fetchCategories() -> [Category]? {
        let fetchRequest = NSFetchRequest<Category>(entityName: "Category")
        
        do {
            let categories = try mainContext.fetch(fetchRequest)
            return categories
        } catch let error {
            print("Failed to fetch categories: \(error)")
        }
        return nil
    }
    
    func fetchCategory(with title: String) -> Category? {
        let fetchRequest = NSFetchRequest<Category>(entityName: "Category")
        fetchRequest.fetchLimit = 1
        fetchRequest.predicate = NSPredicate(format: "title == %@", title)
        
        do {
            let categories = try mainContext.fetch(fetchRequest)
            return categories.first
        } catch let error {
            print("Failed to fetch: \(error)")
        }
        return nil
    }
    
    func updateCategory(category: Category) {
        do {
            try mainContext.save()
        } catch let error {
            print("Failed to update: \(error)")
        }
    }
    
    func deleteCategory(category: Category) {
        mainContext.delete(category)
        
        do {
            try mainContext.save()
        } catch let error {
            print("Failed to delete: \(error)")
        }
    }
}


