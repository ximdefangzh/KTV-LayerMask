//
//  ViewController.swift
//  KTV&&LayerMask
//
//  Created by ximdefangzh on 2017/7/31.
//  Copyright © 2017年 ximdefangzh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    lazy var blackLabel:UILabel = {
        let label = UILabel(frame: CGRect(x: 50, y: 100, width: 300, height: 50))
        label.textColor = UIColor.black
        label.font = UIFont.systemFont(ofSize: 20)
        label.text = "阴天，在不开灯的房间，当所有思绪，都一点一点沉淀"
        return label
    }()
    
    lazy var greenLabel:UILabel = {
        let label = UILabel(frame: CGRect(x: 50, y: 100, width: 300, height: 50))
        label.textColor = UIColor.green
        label.font = UIFont.systemFont(ofSize: 20)
        label.text = "阴天，在不开灯的房间，当所有思绪，都一点一点沉淀"
        return label
    }()
    
    lazy var greenLabelLayerMask:CALayer = {
        let layer = CALayer()
        layer.frame = CGRect(x: -300, y: 0, width: 300, height: 50)
        layer.backgroundColor = UIColor.white.cgColor
        return layer
    }()
    
    lazy var actionBtn:UIButton = {
        let btn = UIButton()
        btn.bounds = CGRect(x: 0, y: 0, width: 100, height: 50)
        btn.setTitle("begin", for: UIControlState.normal)
        btn.setTitleColor(UIColor.black, for: UIControlState.normal)
        btn.backgroundColor = UIColor.lightGray
        btn.addTarget(self, action: #selector(btnClick), for: UIControlEvents.touchUpInside)
        return btn
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        view.addSubview(actionBtn)
        actionBtn.center = self.view.center
        
        view.addSubview(blackLabel)
        view.addSubview(greenLabel)
        greenLabel.layer.mask = greenLabelLayerMask
    }

    func btnClick(){
        let anim = CABasicAnimation(keyPath: "position.x")
        anim.toValue = 150
        anim.duration = 3
        anim.fillMode = kCAFillModeForwards
        anim.isRemovedOnCompletion = false
        greenLabelLayerMask.add(anim, forKey: "green")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

