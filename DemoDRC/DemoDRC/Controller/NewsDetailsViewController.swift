//
//  NewsDetailsViewController.swift
//  DemoDRC


import UIKit

class NewsDetailsViewController: UIViewController {

   
     
    @IBOutlet var lblDate: UILabel!
    @IBOutlet var lblLink: UILabel!
    @IBOutlet var imvNews: UIImageView!
    @IBOutlet var lblDescription: UILabel!
    @IBOutlet var lblTitle: UILabel!
    
    var titleLabel:String? = ""
    var authorLabel:String? = ""
    var webLink:String? = ""
    var date:String? = ""
    var descriptionLabel:String? = ""
    var imvURL:String? = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        lblTitle.text = titleLabel
        lblDate.text = date
        lblDescription.text = descriptionLabel
        lblLink.text = webLink
        imvNews.downloaded(from: imvURL ?? "")
        
        lblTitle.sizeToFit()
        lblDescription.sizeToFit()
        lblLink.sizeToFit()
        
        //add gesture to redirect webview
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.handleTap(_:)))
        lblLink.isUserInteractionEnabled = true
        lblLink.addGestureRecognizer(tap)
        
        //add gesture to achive zoom functionality
        let tapImage = UITapGestureRecognizer(target: self, action: #selector(self.handleTapImage(_:)))
        imvNews.isUserInteractionEnabled = true
        imvNews.addGestureRecognizer(tapImage)
       
        // Do any additional setup after loading the view.
    }
    @objc func handleTap(_ sender: UITapGestureRecognizer? = nil) {
        // handling code
        let detailsVC = self.storyboard?.instantiateViewController(withIdentifier: "WebLinkViewController") as! WebLinkViewController
        detailsVC.newsURL = webLink
     
        navigationController?.pushViewController(detailsVC, animated: true)
    }
    
    @objc func handleTapImage(_ sender: UITapGestureRecognizer? = nil) {
        // handling code
        let detailsVC = self.storyboard?.instantiateViewController(withIdentifier: "PhotoDetailViewController") as! PhotoDetailViewController
        detailsVC.imageUrl = imvURL
     
        navigationController?.pushViewController(detailsVC, animated: true)
    }

    
}
