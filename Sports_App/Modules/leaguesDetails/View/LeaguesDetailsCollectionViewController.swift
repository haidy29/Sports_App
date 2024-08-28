//
//  LeaguesDetailsCollectionViewController.swift
//  Sports_App
//
//  Created by Sohila Ahmed on 26/08/2024.
//

import UIKit


class LeaguesDetailsCollectionViewController: UICollectionViewController {
    
    
    
    var detailsViewModel :DetailsViewModelProtocol!
    var leaduesId : Int = 0
    var sportIndex : Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        detailsViewModel = DetailsViewModel()
        detailsViewModel.bindResultToCollectionController = { [weak self] in
            self?.renderCollectionView()

               }
        let  layout = UICollectionViewCompositionalLayout(){
            indexPath , enviroment in
            switch indexPath {
            case 1:
                return self.drawTopSection()
            case 0, 2:
                return self.drawTitleSection()
            
                //            case 2 :
                //    return self.drawTopSection3()
                //
                //
            default:
                return self.drawTopSection()
            }
            //return self.drawTopSection()
            
        }
        
        self.detailsViewModel.getEventata(sportindex: self.sportIndex, leagueId: self.leaduesId)
        
        collectionView.setCollectionViewLayout(layout, animated: true)
        // Do any additional setup after loading the view.
    }
    
    func drawTitleSection()-> NSCollectionLayoutSection{
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(50))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        group.contentInsets = NSDirectionalEdgeInsets(top: 8, leading: 8, bottom: 8, trailing: 8)
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .none
        section.contentInsets = NSDirectionalEdgeInsets(top: 8, leading: 8, bottom: 0, trailing: 8)
//        section.visibleItemsInvalidationHandler = { (items, offset, environment) in
//                     items.forEach { item in
//                     let distanceFromCenter = abs((item.frame.midX - offset.x) - environment.container.contentSize.width / 2.0)
//                     let minScale: CGFloat = 0.8
//                     let maxScale: CGFloat = 1.2
//                     let scale = max(maxScale - (distanceFromCenter / environment.container.contentSize.width), minScale)
//                     item.transform = CGAffineTransform(scaleX: scale, y: scale)
//                     }
//                }
        return section
    }
    
    func drawTopSection()-> NSCollectionLayoutSection{
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(230))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        group.contentInsets = NSDirectionalEdgeInsets(top: 8, leading: 8, bottom: 8, trailing: 8)
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .groupPagingCentered
        section.contentInsets = NSDirectionalEdgeInsets(top: 8, leading: 0, bottom: 0, trailing: 0)
//        section.visibleItemsInvalidationHandler = { (items, offset, environment) in
//                     items.forEach { item in
//                     let distanceFromCenter = abs((item.frame.midX - offset.x) - environment.container.contentSize.width / 2.0)
//                     let minScale: CGFloat = 0.8
//                     let maxScale: CGFloat = 1.2
//                     let scale = max(maxScale - (distanceFromCenter / environment.container.contentSize.width), minScale)
//                     item.transform = CGAffineTransform(scaleX: scale, y: scale)
//                     }
//                }
        return section
    }
    func drawTopSection2()-> NSCollectionLayoutSection {
            let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1)
            , heightDimension: .fractionalHeight(1))
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            
            let groupSize = NSCollectionLayoutSize(widthDimension: .absolute(130)
            , heightDimension: .absolute(150))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize
            , subitems: [item])
            group.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0
            , bottom: 0, trailing: 15)
            
            let section = NSCollectionLayoutSection(group: group)
            section.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 15
            , bottom: 10, trailing: 0)
            section.orthogonalScrollingBehavior = .continuous
            
            return section
        }
    
    
//    func drawTopSection3()-> NSCollectionLayoutSection{
//        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
//
//        let item = NSCollectionLayoutItem(layoutSize: itemSize)
//        let groupSize = NSCollectionLayoutSize(widthDimension:.fractionalWidth(1), heightDimension:.absolute(500
//                                                                                                            ))
//        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
//        group.contentInsets = NSDirectionalEdgeInsets(top: 8, leading: 8, bottom: 8, trailing: 8)
//        let section = NSCollectionLayoutSection(group: group)
//        section.orthogonalScrollingBehavior = .continuous
//        section.contentInsets = NSDirectionalEdgeInsets(top: 8, leading: 16, bottom: 0, trailing: 8)
//
//
//        return section
//    }
    func drawTopSection3()-> NSCollectionLayoutSection {
            
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1)
        , heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1)
        , heightDimension: .absolute(180))
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize
        , subitems: [item])
        group.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0
        , bottom: 8, trailing: 0)
        
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 15
        , bottom: 10, trailing: 15)
        
        return section
        }
   
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 3
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        switch section {
        case 0, 2:
            return 1
        case 1:
            return detailsViewModel.getSportdetailsCount()
            
        default:
            return 0
        }
        
        
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let titleCell = collectionView.dequeueReusableCell(withReuseIdentifier: "titleCell", for: indexPath) as! TitleCollectionViewCell
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "eventscell", for: indexPath)
      // let cell2 = collectionView.dequeueReusableCell(withReuseIdentifier: "cell2", for: indexPath)
       // let cell3 = collectionView.dequeueReusableCell(withReuseIdentifier: "cell3", for: indexPath)
    
        // Configure the cell
        switch (indexPath.section){
        case 0:
            titleCell.cellSetup(titleLbl: "Up")
            return titleCell
        case 1:
            return cell

        case 2:
            titleCell.cellSetup(titleLbl: "Leatest")
            return titleCell

        default:
            return UICollectionViewCell()
//
//
        }
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
   func  renderCollectionView(){
       collectionView.reloadData()
    }
    
        
    }

    


