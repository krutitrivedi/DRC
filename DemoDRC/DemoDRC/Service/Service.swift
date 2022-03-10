//
//  Service.swift
//  DemoDRC


import Foundation

class Service : NSObject{
    static let sharedInstance = Service()
    
    func getClassList(completion: (([Welcome]?, NSError?) -> Void)?) {
        if(Reachability.Is_Internet_Available()) //Checking if Internet is available or not.
        {
            guard let gitUrl = URL(string: "https://newsapi.org/v2/top-headlines?sources=google-news&apiKey=7721d3c7ebcd4954a504a18ebfd52a88") else { return }
            URLSession.shared.dataTask(with: gitUrl) { (data, response
                                                        , error) in
                
                guard let data = data else { return }
                do {
                    let decoder = JSONDecoder()
                    let gitData = try decoder.decode(Welcome.self, from: data)
                    completion!([gitData],nil)
                    
                } catch let err {
                    print("Err", err)
                    completion!(nil,err as NSError)
                }
            }.resume()
        }
    }
}
