//
//  AppDelegate.swift
//  slider
//
//  Created by Benjamin Naugle on 1/14/15.
//  Copyright (c) 2015 0806564. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    var _background: UIColor?
    var _ycurrent: UITextField?
    var _xcurrent: UITextField?
    var _multiply: UITextField?
    var _add: UITextField?
    var _slider_1: UISlider?
    var _slider_2: UISlider?
    var _xnumber: Float = 0.0
    var _ynumber: Float = 0.0
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        
        _background = UIColor(white: 80, alpha: 1)
        window = UIWindow(frame: UIScreen.mainScreen().bounds)
        window?.backgroundColor = _background
        window?.makeKeyAndVisible()
        
        _slider_1 = UISlider(frame: CGRect(x: UIScreen.mainScreen().bounds.height/16,
            y: UIScreen.mainScreen().bounds.height/2,
            width: (UIScreen.mainScreen().bounds.width - UIScreen.mainScreen().bounds.height/6),
            height: 25))
        
       // _slider_1?.value = 0
        
        window?.addSubview(_slider_1!)
        
        _slider_1?.addTarget(self, action: "slider_changed_1", forControlEvents: UIControlEvents.TouchDragInside)
        
        _slider_2 = UISlider(frame: CGRect(x: UIScreen.mainScreen().bounds.height/16,
            y: (UIScreen.mainScreen().bounds.height/2 - 50),
            width: (UIScreen.mainScreen().bounds.width - UIScreen.mainScreen().bounds.height/6),
            height: 25))
        //_slider_2?.value = 0.0
        window?.addSubview(_slider_2!)
        _slider_2?.addTarget(self, action: "slider_changed_2", forControlEvents: UIControlEvents.TouchDragInside)
        
        
        var y_label = UILabel(frame: CGRectMake(UIScreen.mainScreen().bounds.height/64,
            UIScreen.mainScreen().bounds.height/2,
            UIScreen.mainScreen().bounds.height/25, 25))
        y_label.backgroundColor = _background
        y_label.text = "Y"
        window?.addSubview(y_label)
        
        
        var x_label = UITextField(frame: CGRectMake(UIScreen.mainScreen().bounds.height/64,
            (UIScreen.mainScreen().bounds.height/2 - 50),
            UIScreen.mainScreen().bounds.height/25, 25))
        x_label.backgroundColor = _background
        x_label.text = "X"
        window?.addSubview(x_label)
        
        _ycurrent = UITextField(frame: CGRectMake(UIScreen.mainScreen().bounds.width - UIScreen.mainScreen().bounds.width/7,
            UIScreen.mainScreen().bounds.height/2,
            UIScreen.mainScreen().bounds.height/4, 25))
        _ycurrent?.backgroundColor = _background
        window?.addSubview(_ycurrent!)
        
        _xcurrent = UITextField(frame: CGRectMake(UIScreen.mainScreen().bounds.width - UIScreen.mainScreen().bounds.width/7,
            (UIScreen.mainScreen().bounds.height/2 - 50),
            UIScreen.mainScreen().bounds.height/4, 25))
        _xcurrent?.backgroundColor = _background
        window?.addSubview(_xcurrent!)
        
        _multiply = UITextField(frame: CGRectMake(UIScreen.mainScreen().bounds.width/4,
            (UIScreen.mainScreen().bounds.height/2 + 100),
            UIScreen.mainScreen().bounds.height/4, 25))
        _multiply!.text = "X * Y = "
        window?.addSubview(_multiply!)
        
        _add = UITextField(frame: CGRectMake(UIScreen.mainScreen().bounds.width/4,
            (UIScreen.mainScreen().bounds.height/2 + 50),
            UIScreen.mainScreen().bounds.height/4, 25))
        _add!.text = "X + Y = "
        window?.addSubview(_add!)
        
        
        return true
    }
    
    func slider_changed_1()
    {
         _ynumber = _slider_1!.value
         _ycurrent!.text = String(format: "%.3f", _ynumber)

        var text = String(format: "%.3f", multiply())
        _multiply!.text = "X * Y = " + "\(text)"
         text = String(format: "%.3f", add())
        _add!.text = "X + Y = " + "\(text)"
    }
    func slider_changed_2()
    {
        _xnumber = _slider_2!.value
        _xcurrent!.text = String(format: "%.3f", _xnumber)
        
        var text = String(format: "%.3f", multiply())
        _multiply!.text = "X * Y = "  + "\(text)"
        text = String(format: "%.3f", add())
        _add!.text = "X + Y = " + "\(text)"
        
    }
    func multiply() -> Float
    {
        return _ynumber * _xnumber
    }
    func add() -> Float
    {
        return _ynumber + _xnumber
    }
}