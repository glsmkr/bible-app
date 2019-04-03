//
//  BibleController.swift
//  Bible!
//
//  Created by Julian A. Fordyce on 2/27/19.
//  Copyright © 2019 Glas Labs. All rights reserved.
//

import Foundation


class BibleController {
    
    let baseURL = URL(string: "https://api.esv.org/v3/passage/search/")!
    
    var results: [Result] = []
    
    func search(term: String, completion: @escaping (Error?) -> Void) {
        
        var urlComponents = URLComponents(url: baseURL, resolvingAgainstBaseURL: true)
        
        let queryItem = URLQueryItem(name: "q", value: term)
        
        urlComponents?.queryItems = [queryItem]
        
        guard let requestURL =  urlComponents?.url else {
            NSLog("Error constructing search URL for \(term)")
            completion(NSError())
            return
        }
        
        var request = URLRequest(url: requestURL)
        request.setValue("Token 6b23530c316d924d003ea5d40c6b3060f20de35d", forHTTPHeaderField: "Authorization")
        request.httpMethod = "GET"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                NSLog("Error getting data: \(error)")
                completion(NSError())
            }
            
            if let response = response {
                NSLog("\(response)")
                completion(NSError())
            }
            
            guard let data = data else {
                NSLog("No data returned from task")
                completion(NSError())
                return
            }
            
            do {
                let results = try JSONDecoder().decode(Bible.self, from: data)
               self.results = results.results
                completion(nil)
            } catch {
                NSLog("Unable to decode JSON: \(error)")
                completion(error)
            }
        }.resume()
        
    }
    
    
    
    
}
