//
//  ViewController.swift
//  CALayer
//
//  Created by JD on 2017/6/15.
//  Copyright © 2017年 JD. All rights reserved.
//

import UIKit

let screenWidth:CGFloat = UIScreen.main.bounds.width
let screenHeight:CGFloat = UIScreen.main.bounds.height



class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
//        let testVC:UIImageView  = UIImageView.init(frame: CGRect.init(x: 10, y: 100, width: screenWidth-20, height: screenWidth-20))
//        testVC.image = #imageLiteral(resourceName: "timg.jpeg")
//        self.view.addSubview(testVC)
//        
//        //添加圆角  
////        testVC.layer.cornerRadius = 30
////        testVC.layer.masksToBounds = true
//        
//        
//        //添加阴影  注意:如果有圆角的话，阴影效果添加将会无效
//        testVC.layer.shadowColor = UIColor.black.cgColor
//        testVC.layer.shadowOpacity = 0.8
//        testVC.layer.shadowRadius = 30;
//        testVC.layer.shadowOffset = CGSize.init(width: 0, height: -1)
//        
//        
//        //上述方式将使用离屏渲染，在性能上的消耗很大，为了加快渲染，我们添加下面的代码。
//        testVC.layer.shadowPath = UIBezierPath.init(rect: testVC.bounds).cgPath
        self.userShaper()
    }
    
    //使用CAShperlayer
    func userShaper(){
        
        //创建一个底色  
        let BgView:UIView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: 200, height: 200))
        BgView.center = self.view.center
        BgView.backgroundColor = UIColor.black
        self.view.addSubview(BgView)
        
        let leftG : CAGradientLayer = CAGradientLayer.init()
        leftG.colors = [UIColor.red.cgColor,UIColor.orange.cgColor,UIColor.yellow.cgColor]
        leftG.locations = [0,0.5,0.9]
        leftG.startPoint = CGPoint.init(x: 0, y: 0)
        leftG.endPoint = CGPoint.init(x: 0, y: 1.0)
        leftG.frame = CGRect.init(x: 0, y: 0, width: 100, height: 200)
        
        let rightG : CAGradientLayer = CAGradientLayer.init()
        rightG.colors = [UIColor.blue.cgColor,UIColor.init(red: 50/255.0, green: 1.0, blue: 163/255.0, alpha: 1.0).cgColor,UIColor.green.cgColor,UIColor.yellow.cgColor]
        rightG.locations = [0,0.35,0.7,0.9]
        rightG.startPoint = CGPoint.init(x: 0, y: 0)
        rightG.endPoint = CGPoint.init(x: 0, y: 1.0)
        rightG.frame = CGRect.init(x: 100, y: 0, width: 100, height: 200)
        
        BgView.layer.addSublayer(leftG)
        BgView.layer.addSublayer(rightG)
        
        let lineWidth:CGFloat = 10.0  //线宽
        let CASharp:CAShapeLayer = CAShapeLayer.init()
        CASharp.lineWidth = lineWidth
        CASharp.lineCap = "round"
        CASharp.lineJoin = "round"  //包角为圆形

        //创建路径
//        let path : UIBezierPath = UIBezierPath.init(roundedRect: BgView.bounds, cornerRadius: 10.0)
//        let rect:CGRect = CGRect.init(x: BgView.bounds.origin.x+width/2.0, y:BgView.bounds.origin.y+width/2.0, width:  BgView.bounds.size.width-width, height: BgView.bounds.size.height-width)
////        let path : UIBezierPath = UIBezierPath.init(ovalIn: rect)
//        
        //通过调整起始角度 来控制环形的长度
        let path1:UIBezierPath = UIBezierPath.init(arcCenter:CGPoint.init(x: 100, y: 100), radius: BgView.frame.width/2.0 - lineWidth, startAngle:0, endAngle: CGFloat(Double.pi), clockwise: true)
        
        CASharp.strokeColor = UIColor.blue.cgColor
        CASharp.path = path1.cgPath
        CASharp.fillColor = UIColor.clear.cgColor
        
        BgView.layer.mask = CASharp
        
        print("完成")
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

