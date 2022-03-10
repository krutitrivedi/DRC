//
//  DataModel.swift
//  DemoDRC

import UIKit

protocol DataModelDelegate:AnyObject {
    func didRecieveDataUpdata(data:[String])
    func didFailUpdateWithError(error:Error)
}

class DataModel: NSObject {
    
    weak var delegate : DataModelDelegate?
    
    ///initialize array for append data from webservice
    var titleArray = [String]()
    var authorNameArray = [String]()
    var dateArray = [String]()
    var urlImage = [String]()
    var url = [String]()
    var descriptionArray = [String]()
    
    func requestData() {
        ///call webservice and add data to model
        Service.sharedInstance.getClassList { (response, error) in
            if error != nil {
                self.delegate?.didFailUpdateWithError(error: error!)
            } else if let response = response{
                self.setDataWithResponse(response: response as [Welcome])
            }
        }
    }

    private func setDataWithResponse(response:[Welcome]){
        ///get data from model and fill into array
        
        for i in response[0].articles{
            self.titleArray.append(i.title ?? "")
            self.authorNameArray.append(i.author ?? "")
            if let date = i.publishedAt {
                
                let dateFormatter = ISO8601DateFormatter()
                let date1 = dateFormatter.date(from:date)!
                
                let dateConverted = date1.convertDateFormate(date: date1) //date1.getFormattedDate(format: "E, dd MMM yyyy HH:mm:ss Z")
                self.dateArray.append(dateConverted)
                
            }
           // self.dateArray.append(i.publishedAt ?? "")
            self.urlImage.append(i.urlToImage ?? "")
            self.url.append(i.url ?? "")
            self.descriptionArray.append(i.description ?? "")

        }
        //notify to viewcontroller
    }
    
    
}
