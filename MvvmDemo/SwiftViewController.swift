//
//  SwiftViewController.swift
//  MvvmDemo
//
//  Created by fan on 17/1/12.
//  Copyright © 2017年 changhog. All rights reserved.
//

import Foundation
class SwiftViewController: UIViewController {
    // MARK:- 懒加载属性
    var favoriteColor: String?
    
//    var tableView = UITableView()
    lazy var tableView : UITableView = {
        let fooTable = UITableView.init(frame: CGRect.init(x: 0, y: 0, width: 100, height: 100), style: .plain)
        
        return fooTable
    }()
    
    override func viewDidLoad() {
        
        let label:UILabel = UILabel()
        label.frame = CGRect(x: 100, y: 100, width: 100, height: 30)
        label.font = UIFont .systemFont(ofSize: 12)
        label.numberOfLines = 0
        label.text = "我我的地方地方大幅度发wepkeopkepoei文摩恩佛恩佛恩发饿哦房内欧发呢哦范呢欧尼发饿哦发呢欧尼佛诶奶粉哦"
        self.view .addSubview(label)
        
        
        
        let imageview : UIImageView = UIImageView();
        imageview.frame = CGRect(x: 0, y: 64, width: 50, height: 50)
        imageview.image = UIImage(named: "morentongxiang")
        self.view .addSubview(imageview)
        
//        self.favoriteColor = "rorroro"
//        print(self.name)
//        
//        let foo = 2
//        guard  foo > 0 else {
//           return
//        }
        
        let lh = foo(s: "luhao", e: 8)
        print(lh)
        

        
        let btn = UIButton.init(frame: CGRect.init(x: 200, y: 200, width: 100, height: 100))
        btn.addTarget(self, action: #selector(buttonClick), for: .touchUpInside)
        btn .setTitle(self.favoriteColor, for: .normal)
        btn.backgroundColor = UIColor.red
        self.view.addSubview(btn)
    }
    
    func foo(s:String, e:Int) -> (ss1 : String , foo1 : Int) {
        
        return ("luhao" , 7)
    }
    func buttonClick(){
    
        print("11111111")
        
    }
   
    
}
