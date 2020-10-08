//
//  ViewController.swift
//  imageViewer
//
//  Created by SM Arif Ahmed on 5/10/20.
//  Copyright © 2020 SM Arif Ahmed. All rights reserved.
//

import UIKit
import Photos

class ViewController: UIViewController , UICollectionViewDelegate, UICollectionViewDataSource {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var testImageView: UIImageView!
    private var userAlbums: PHFetchResult<PHAssetCollection>?
    var imageArray = [UIImage]()
    var collectionViewFlowLayout: UICollectionViewFlowLayout!

    override func viewDidLoad() {
        super.viewDidLoad()
        PHPhotoLibrary.requestAuthorization{(status) in
            
            DispatchQueue.main.async {
                 switch status{
                           case .authorized:
                                self.setupCollectionView()
                              self.fetchPhotos()
                              print(self.imageArray.count)
                              self.collectionView.reloadData()
                            //  self.testImageView.image = self.imageArray[2]
                           default:
                               self.showNoAccessAlert()
                           }
            }
           
            
        }
    }
    
  
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        setUpCollectionViewItemSize()
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       let itemImage = sender as! Int
        
        if segue.identifier == "viewImageSegueIdentifire" {
            if let vc = segue.destination as? ImageViewController {
                vc.viewingImage = imageArray[itemImage]
                //print(itemImage)
            }
        }
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
          imageArray.count
      }
      
      func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "photoCell", for: indexPath ) as! ImageCollectionViewCell
        cell.itemImageView.image = imageArray[indexPath.row]
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let imageItem = indexPath.row
        performSegue(withIdentifier: "viewImageSegueIdentifire", sender: imageItem)
       // print(indexPath.row)
    }
    
    
    func setupCollectionView(){
        collectionView.delegate = self
        collectionView.dataSource = self
        let nib = UINib(nibName: "ImageCollectionViewCell", bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: "photoCell")
    }
    
    private func setUpCollectionViewItemSize(){
        if collectionViewFlowLayout == nil{
            let numberOfItemPerRow:CGFloat = 2
            let lineSpacing: CGFloat = 5
            let interItemSpacing: CGFloat = 5
            
            let width = (collectionView.frame.width - (numberOfItemPerRow - 1) * interItemSpacing) / numberOfItemPerRow
            let height = width
            
            collectionViewFlowLayout = UICollectionViewFlowLayout()
            collectionViewFlowLayout.itemSize = CGSize(width: width, height: height)
            collectionViewFlowLayout.sectionInset = UIEdgeInsets.zero
            collectionViewFlowLayout.scrollDirection = .vertical
            collectionViewFlowLayout.minimumLineSpacing = lineSpacing
            collectionViewFlowLayout.minimumInteritemSpacing = interItemSpacing
            
            collectionView.setCollectionViewLayout(collectionViewFlowLayout, animated: true)
            
        }
    }
    
  /*  func grabPhotos(){
        if let albums = PHCollectionList.fetchTopLevelUserCollections(with: nil) as? PHFetchResult<PHAssetCollection>{
            userAlbums = albums
        }
    }*/
    
    
    
    func fetchPhotos(){
        let imageManager = PHImageManager.default()
        let requestOption = PHImageRequestOptions()
        requestOption.isSynchronous = true
        requestOption.deliveryMode = .highQualityFormat
        
        let fetchOption = PHFetchOptions()
        fetchOption.sortDescriptors = [NSSortDescriptor(key: "creationDate", ascending: false)]
        
        if let fetchResult: PHFetchResult = PHAsset.fetchAssets(with: .image, options: fetchOption) {
           if  fetchResult.count > 0 {
                for i in 0..<fetchResult.count{
                    imageManager.requestImage(for: fetchResult.object(at: i), targetSize: CGSize(width:200,height:200), contentMode: .aspectFill, options: requestOption, resultHandler: {
                        image, error in
                        self.imageArray.append(image!)
                    })
                }
            }
        }
        
        
    }
    
    func showNoAccessAlert(){
        let alert = UIAlertController(title: "No Photo Access", message: "Please grant PhotoViewer photo access in settings", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: {
            _ in
            exit(0)
        }))
        alert.addAction(UIAlertAction(title: "Settings", style: .default, handler: {
            _ in
            if let url = URL(string: UIApplication.openSettingsURLString){
                UIApplication.shared.open(url, options: [:])
            }
        }))
        
    }


}

