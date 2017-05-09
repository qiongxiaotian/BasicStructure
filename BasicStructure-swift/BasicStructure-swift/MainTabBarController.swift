//
//  MainTabBarController.swift
//  BasicStructure-swift
//
//  Created by mxy on 2017/5/9.
//  Copyright © 2017年 mxy. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController {

//    override convenience init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
//        self.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
//        
//        let attrs = [NSFontAttributeName : UIFont.systemFont(ofSize: 12), NSForegroundColorAttributeName : UIColor.gray]
//        
//        let selectAttrs = [NSFontAttributeName : UIFont.systemFont(ofSize: 12), NSForegroundColorAttributeName : UIColor.darkGray]
//        let tabbarItem = UITabBarItem.appearance()
//        tabbarItem.setTitleTextAttributes(attrs, for: .normal)
//        tabbarItem.setTitleTextAttributes(selectAttrs, for: .selected)
//    }
//    
//    
//    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //添加子控制器
        setupChileViewControlle(vc: HomeViewController(), title: "首页", image: "tabBar_essence_icon", selectImage: "tabBar_essence_click_icon")
        setupChileViewControlle(vc: TimeViewController(), title: "我的发布", image: "tabBar_new_icon", selectImage: "tabBar_new_click_icon")
        setupChileViewControlle(vc: DiscoverViewController(), title: "发现", image: "tabBar_friendTrends_icon", selectImage: "tabBar_friendTrends_click_icon")
        setupChileViewControlle(vc: InfoViewController(), title: "我的", image: "tabBar_me_icon", selectImage: "tabBar_me_click_icon")
        
    }

    func setupChileViewControlle(vc:UIViewController, title:String ,image:String ,selectImage:String){
        
        //设置属性
        vc.navigationItem.title = title
        vc.tabBarItem.title = title
        vc.tabBarItem.image = UIImage(named: image)
        vc.tabBarItem.selectedImage = UIImage(named: selectImage)

        //包装一个视图控制器
        let nav = MainNavigationController(rootViewController: vc)
        self.addChildViewController(nav)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
