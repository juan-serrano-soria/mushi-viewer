//
//  DetailViewController.swift
//  MushiViewer
//
//  Created by Serrano Soria, Juan on 17/03/2025.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet var imageView: UIImageView!
    var selectedImage: String?
    var imageIndex: Int?
    var imageCount: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let index = imageIndex, let count = imageCount {
            title = "Image \(index) out of \(count)"
        }
        navigationItem.largeTitleDisplayMode = .never
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareTapped))
        
        if let imageToLoad = selectedImage {
            imageView.image  = UIImage(named: imageToLoad)
        }
    }
    
    @objc func shareTapped() {
        guard let image = imageView.image?.jpegData(compressionQuality: 1) else {
            print("No image found")
            return
        }
        
        let viewController = UIActivityViewController(activityItems: [image], applicationActivities: [])
        viewController.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        present(viewController, animated: true)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
