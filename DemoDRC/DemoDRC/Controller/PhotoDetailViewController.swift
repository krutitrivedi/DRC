//
//  PhotoDetailViewController.swift
//  DemoDRC


import UIKit

class PhotoDetailViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet var imgPhoto: UIImageView!
    @IBOutlet var scrollView: UIScrollView!
    
    var imageUrl:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //download photo from url and load into imageview
        imgPhoto.downloaded(from: imageUrl ?? "")
        imgPhoto.contentMode = .scaleToFill
        
        scrollView.minimumZoomScale = 1.0
        scrollView.maximumZoomScale = 6.0
        
       
        // Do any additional setup after loading the view.
    }
    //MARK:- UIScrollViewDelegate delegate
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
           
            return imgPhoto
    }

}
