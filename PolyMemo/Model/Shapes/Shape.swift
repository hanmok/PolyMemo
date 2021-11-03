//
//  DemoView.swift
//  polyShapesTest
//
//  Created by Mac mini on 2021/11/03.
//

import UIKit

class DemoView: UIView {
    
    /*
     only override draw() if you perform custom drawing.
     // An empty implementation adversely affects performance during animation.
     override func draw(_ rect: CGRect) {
        // Drawing code
     }
     
     */
    
    
    // advanced operator 공부해야함..
    // sin, cos, : rad (cos(pi): -1.0, sin(pi): almost 0
    // direction: clockwise, startPoint: positive x axis. ( -> )
    var path: UIBezierPath!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = .clear
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func createRectangle() {
        
        let length = self.frame.size.width / 2
        let centerLength = length
        let centerPoint = CGPoint(x: length, y: length)

        print("cos(pi): \(cos(CGFloat.pi)), sin(pi): \(sin(CGFloat.pi))")

        path = UIBezierPath()
        
        path.move(to: centerPoint)
    
        path.addLine(to: CGPoint(x: self.frame.size.width / 2 + length * cos(CGFloat.pi * 0 ), y: length + length * sin(CGFloat.pi * 0 )))

        path.addLine(to: CGPoint(x: self.frame.size.width / 2 + length * cos(CGFloat.pi / 2), y: length + length * sin(CGFloat.pi / 2)))

        path.addLine(to: CGPoint(x: centerLength + length * cos(CGFloat.pi  ), y: centerLength + length * sin(CGFloat.pi)))

        path.addLine(to: CGPoint(x: centerLength + length * cos(CGFloat.pi * 3 / 2  ), y: centerLength + length * sin(CGFloat.pi * 3 / 2)))

        path.close()

    }
    
//    func createShape(rateInfo: [Double]) {
//        path = UIBezierPath()
////        let points = rateInfo
//    }
    
    override func draw(_ rect: CGRect) {
        self.createRectangle()
        
        UIColor.orange.setFill()
        path.fill()
        
//        UIColor.purple.setStroke()
//        path.stroke()
        
        
        
    }
}
