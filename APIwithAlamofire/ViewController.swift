//
//  ViewController.swift
//  APIwithAlamofire
//
//  Created by sandesh sardar on 03/06/17.
//  Copyright © 2017 sandesh sardar. All rights reserved.
//

import UIKit
import Alamofire


class ViewController: UIViewController {

    
    //---- variable --(start)--
    var articleList : NSArray?
    
    override func viewDidLoad() {
        super.viewDidLoad()

    self.newFeedGETrequest()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    
    //---- api call for newsFeed --
    func newFeedGETrequest(){
        
        //---- GET request ---------
        
        let url: String = "https://newsapi.org/v1/articles?source=cnn&sortBy=top&apiKey=f94a0d53cd3647c985944689b055025d"
        
        Alamofire.request(url, method: .get, parameters: nil, encoding: JSONEncoding.default)
            .responseJSON { response in
                switch response.result{
                case .success( _):
                    let json = response.result.value as! NSDictionary
                    print("serviceForNewsFeed response \(json)")
                    
                case .failure(let error):
                    print("error \(error)")
                }
        }
    }

    
    func newFeedPOSTrequest(){
        
        //---- POST request ---------
        
        let parameter =  ["timezone": "Asia/Kolkata", "username": "xyz@gmail.com", "password": "abcd1234"]
        
        let url: String = "your post api url"
        
        Alamofire.request(url, method: .post, parameters: parameter, encoding: JSONEncoding.default)
            .responseJSON { response in
                switch response.result{
                case .success( _):
                    let json = response.result.value as! NSDictionary
                    print("json \(json)")
                    
                case .failure(let error):
                    print("error \(error)")
                }
        }
    }

    
}

