//
//  SampleModel.swift
//  PolyMemo
//
//  Created by Mac mini on 2021/11/07.
//

import UIKit

// This is Wrong Model !

struct CategorySample {
    let createdAt: Date
    let modifiedAt: Date
    let id: UUID
    let title: String
    let items: [ItemSample]
}

struct ItemSample {
    let name: String
    let comment: String

    let avgRate: Double
    let maxRate: Int

//    let link: URL // it need to be String. that's much more simple.
    let link: String
    let location: String

    let images: UIImage
    let memo: String
    
    let createdAt: Date = Date()
    let modifiedAt: Date

    let rates: [RateSample]
    let parentCategory: CategorySample
}

struct RateSample {
    let aspectMemo: String
    let aspectTitle: String
    let score: Double
}
// There's error in my model..
