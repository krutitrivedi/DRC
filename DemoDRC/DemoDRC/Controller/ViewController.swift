//
//  ViewController.swift
//  DemoDRC


import UIKit

class ViewController: UIViewController {

    //create model object
    private let dataSource = DataModel()
    @IBOutlet var tblNewsList: UITableView!
    
       override func viewDidLoad() {
           super.viewDidLoad()
            dataSource.delegate = self
            
            tblNewsList.isHidden = true
            tblNewsList.delegate = self
            tblNewsList.dataSource = self
            
       }

       override func viewWillAppear(_ animated: Bool) {
        ///request data from webservice using data class
        dataSource.requestData()
      
       }

}
extension ViewController : DataModelDelegate{
    func didRecieveDataUpdata(data: [String]) {
        //print(data)
        DispatchQueue.main.async{
            self.tblNewsList.reloadData()
            self.tblNewsList.isHidden = false
        }
    }
    

    func didFailUpdateWithError(error: Error) {
        print("error:  \(error.localizedDescription)")
    }


}
//MARK:- UITableView delegate and datasource method
extension ViewController: UITableViewDataSource, UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       dataSource.titleArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tblNewsList.dequeueReusableCell(withIdentifier: "NewsListTableViewCell", for: indexPath) as? NewsListTableViewCell
        
        //set require data
        cell?.lblTitle.text = dataSource.titleArray[indexPath.row]
        cell?.lblNewsLink.text = dataSource.url[indexPath.row]
        cell?.lblPublishTime.text = dataSource.dateArray [indexPath.row]
        cell?.lblAuthorName.text = dataSource.authorNameArray [indexPath.row]
        cell?.imvNews.downloaded(from: dataSource.urlImage[indexPath.row])
        
        cell?.lblTitle.sizeToFit()
        cell?.lblPublishTime.sizeToFit()
       

        return cell!
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //redirect to newsDetails class on click of cell
        let detailsVC = self.storyboard?.instantiateViewController(withIdentifier: "NewsDetailsViewController") as! NewsDetailsViewController
        detailsVC.titleLabel = dataSource.titleArray[indexPath.row]
        detailsVC.authorLabel = dataSource.authorNameArray [indexPath.row]
      
        detailsVC.webLink = dataSource.url[indexPath.row]
        detailsVC.date = dataSource.dateArray [indexPath.row]
        detailsVC.imvURL = dataSource.urlImage[indexPath.row]
        detailsVC.descriptionLabel = dataSource.descriptionArray[indexPath.row]
     
        navigationController?.pushViewController(detailsVC, animated: true)
       }
    
    
}
