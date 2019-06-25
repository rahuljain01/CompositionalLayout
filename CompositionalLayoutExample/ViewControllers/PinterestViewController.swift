//
//  PinterestViewController.swift
//  CompositionalLayoutExample
//
//  Created by Rahul Jain on 20/06/19.
//  Copyright © 2019 Rahul Jain. All rights reserved.
//

import UIKit

class PinterestViewController: UIViewController {
    
    enum Section {
        case main
    }
    
    var dataSource: UICollectionViewDiffableDataSource<Section, Int>! = nil
    var collectionView: UICollectionView! = nil

    override func viewDidLoad() {
        super.viewDidLoad()
        initializeCollection()
        configureDataSource()
        // Do any additional setup after loading the view.
    }
    
    func initializeCollection() {
        collectionView = UICollectionView(frame: view.frame, collectionViewLayout: customizeLayout())
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        collectionView.backgroundColor = .systemBackground
        collectionView.register(UINib(nibName: "ListCell", bundle: nil), forCellWithReuseIdentifier: "ListCell")
        view.addSubview(collectionView)
    }
    
    func customizeLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewCompositionalLayout {
            (sectionIndex: Int, layoutEnvironment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection? in
            return self.getPinterestSection()
        }
        return layout
    }
    
    func getLinerSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                              heightDimension: .estimated(80))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        //item.contentInsets = NSDirectionalEdgeInsets(top: 4, leading: 4, bottom: 4, trailing: 4)
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                               heightDimension: .estimated(80))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize,
                                                       subitem: item, count: 1)
        
        //group.contentInsets = NSDirectionalEdgeInsets(top: 4, leading: 4, bottom: 4, trailing: 4)
        let firstContainerGroup = NSCollectionLayoutGroup.vertical(
            layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.49),
                                               heightDimension: .absolute(2000)),
            subitems: [group])
        
        let spacing = CGFloat(5)
        firstContainerGroup.interItemSpacing = .fixed(spacing)
        
        
        let secondItemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                              heightDimension: .estimated(80))
        let secondItem = NSCollectionLayoutItem(layoutSize: secondItemSize)
        
        //secondItem.contentInsets = NSDirectionalEdgeInsets(top: 4, leading: 4, bottom: 4, trailing: 4)
        let secondGroupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                               heightDimension: .estimated(80))
        let secondGroup = NSCollectionLayoutGroup.horizontal(layoutSize: secondGroupSize,
                                                             subitem: secondItem, count:1)
        secondGroup.contentInsets = NSDirectionalEdgeInsets(top: 4, leading: 4, bottom: 4, trailing: 4)
        let secondContainerGroup = NSCollectionLayoutGroup.vertical(
            layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.49),
                                               heightDimension: .absolute(2000)),
            subitems: [secondGroup])
        
        secondContainerGroup.interItemSpacing = .fixed(spacing)
        
        let containerGroup = NSCollectionLayoutGroup.horizontal(
            layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                               heightDimension: .estimated(1000)),
            subitems: [firstContainerGroup, secondContainerGroup])
        
        containerGroup.interItemSpacing = .fixed(spacing)
        let section = NSCollectionLayoutSection(group: containerGroup)
        //section.interGroupSpacing = 5
        return section
    }
    
    func getPinterestSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.5),
                                              heightDimension: .estimated(80))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5)
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                               heightDimension: .absolute(2000))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize,
                                                       subitems: [item])
        return NSCollectionLayoutSection(group: group)
    }
    
    private func configureDataSource() {
        dataSource = UICollectionViewDiffableDataSource<Section, Int>(collectionView: collectionView) {
            (collectionView: UICollectionView, indexPath: IndexPath, identifier: Int) -> UICollectionViewCell? in
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: "ListCell",
                for: indexPath) as? ListCell else { fatalError("Cannot create new cell") }
            cell.isCellHeightNeeded = true
            var cellHeight = Float((indexPath.item + 60))/Float((indexPath.item) + 1)
            if indexPath.item % 2 == 0{
                cellHeight = cellHeight + 50
            }else{
                cellHeight = cellHeight + 20
            }
            cell.cellHeightConstant = CGFloat(cellHeight)
            cell.titleLabelNumber.text = ""
            return cell
        }
        
        let snapshot = NSDiffableDataSourceSnapshot<Section, Int>()
        snapshot.appendSections([.main])
        snapshot.appendItems(Array(0..<94))
        dataSource.apply(snapshot, animatingDifferences: false)
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
