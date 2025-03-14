//
//  ViewController.swift
//  ISpy
//
//  Created by Samuel Bradshaw  on 3/13/25.
//

import UIKit

class ViewController: UIViewController,UIScrollViewDelegate {

    @IBOutlet var spyScrollView: UIScrollView!
    @IBOutlet var spyImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        spyScrollView.delegate = self
        updateZoomForSize(size: view.bounds.size)
        // Do any additional setup after loading the view.
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return spyImage
    }
    
    func updateZoomForSize(size: CGSize) {
        let widthScale = size.width / spyImage.bounds.width
        let heightScale = size.height / spyImage.bounds.height
        let scale = min(widthScale, heightScale)
        spyScrollView.minimumZoomScale = scale
        spyScrollView.zoomScale = scale
    }
}

