//
//  ViewController.swift
//  JsonAPI
//
//  Created by Duc Dang on 6/12/20.
//  Copyright © 2020 Duc Dang. All rights reserved.
//

import UIKit


struct Course {
    let id: Int
    let name: String
    let imageUrl: String
    let number_of_lessons: Int
    
    
    
}

class ViewController: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchCoursesJSON { (courses, err) in
            if let err = err {
                print(.failure(err))
                return
            }
            courses?.forEach({(course) in
                print(course.name)
            })
        }
    }
    //        let jsonUrlString = "https://api.letsbuildthatapp.com/jsondecodable/course"
    
    fileprivate func fetchCoursesJSON(completion: @escaping ( Result<[Course], Error>) -> ()){
        let urlString = "https://api.letsbuildthatapp.com/jsondecodable/courses"
        guard let url = URL(string: urlString) else {return}
        
        URLSession.shared.dataTask(with: url) { (data, resp, err) in
            if let err = err {
                completion(nil, err)
                return
            }
            // successful
            do {
                let courses = try JSONDecoder().decode([Course].self, from: data!)
                completion(.success(courses))
                completion(courses, nil)
            } catch let jsonError {
                completion(nil, jsonError)
            }
        }.resume()
        
        
    }
    
}

