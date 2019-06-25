//
//  ListGridViewController.swift
//  CompositionalLayoutExample
//
//  Created by Rahul Jain on 19/06/19.
//  Copyright © 2019 Rahul Jain. All rights reserved.
//

import UIKit

class ListGridViewController: UIViewController {
    
    var collectionView:UICollectionView! = nil

    override func viewDidLoad() {
        super.viewDidLoad()
        initializeCollection()
        // Do any additional setup after loading the view.
    }
    
    func initializeCollection() {
        collectionView = UICollectionView(frame: view.frame, collectionViewLayout: UICollectionViewFlowLayout())
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        collectionView.backgroundColor = .systemBackground
        collectionView.register(UINib(nibName: "ListCell", bundle: nil), forCellWithReuseIdentifier: "ListCell")
        collectionView.delegate = self
        collectionView.dataSource = self
        view.addSubview(collectionView)
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

extension ListGridViewController:UICollectionViewDelegate{
    
    
}


extension ListGridViewController:UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 7
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        return UICollectionViewCell()
    }
    
    
}

extension ListGridViewController:UICollectionViewDelegateFlowLayout{
    
    
}



