//
//  ViewController.swift
//  demo
//
//  Created by KPC on 2018/5/16.
//  Copyright © 2018年 KPC. All rights reserved.
//

import UIKit
import Moya
import RxSwift

class ViewController: UIViewController {
    private let dispose = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let provider = MoyaProvider<netTool>()
        
        provider.rx.request(.zen, callbackQueue: DispatchQueue.main)
            .asObservable()
            .mapString()
            .subscribe(onNext: { (s) in
                print(s)
            }, onError: { (e) in
                print(e)
            })
            .disposed(by: dispose)
        
        
        provider.rx.request(.userProfile("ashfurrow"))
            .asObservable()
            .myMapJSON()
            .mapObject(to: GitHubModel.self)
            .subscribe(onNext: { (model) in
                print(model.avatar_url ?? "")
                print(model.company ?? "")
            }, onError: { (e) in
                print(e)
            })
            .disposed(by: dispose)
        
        

        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}






