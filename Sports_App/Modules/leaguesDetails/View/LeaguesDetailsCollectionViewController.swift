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
                return self.drawSectionforEvents()
            case 0, 2 ,4:
                return self.drawTitleSection()
            
            case 3 :
                return self.drawSectionforLatest()
                
            case 5:
                return self.drawTeamsSection()
            default:
                return self.drawTeamsSection()
            }
            //return self.drawTopSection()
            
        }
        
       self.detailsViewModel.getEventdata(sportindex: self.sportIndex, leagueId: self.leaduesId)
        self.detailsViewModel.getLatestdata(sportindex: self.sportIndex, leagueId: self.leaduesId)
//        self.teamViewModel.getEventdata(sportindex: self.sportIndex, leagueId: self.leaduesId)
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
    
    func drawSectionforEvents()-> NSCollectionLayoutSection{
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
    func drawSectionforLatest()-> NSCollectionLayoutSection {
            
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1)
        , heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1)
        , heightDimension: .absolute(100))
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize
        , subitems: [item])
        group.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0
        , bottom: 8, trailing: 0)
        
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 10
        , bottom:30, trailing: 10)
        
        return section
        }
    func drawTeamsSection()-> NSCollectionLayoutSection {
            let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1)
            , heightDimension: .fractionalHeight(1))
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            
            let groupSize = NSCollectionLayoutSize(widthDimension: .absolute(130)
            , heightDimension: .absolute(150))
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize
            , subitems: [item])
            group.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0
            , bottom: 0, trailing: 15)
            
            let section = NSCollectionLayoutSection(group: group)
            section.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 15
            , bottom: 10, trailing: 15)
            section.orthogonalScrollingBehavior = .continuous
            
            return section
        }
    
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 6
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        switch section {
        case 0, 2 ,4:
            return 1
        case 1:
           
           return detailsViewModel.getSportdetailsCount()
        case 3:
            
            return detailsViewModel.getLatestaResultCount()
           
        case 5:

            return detailsViewModel.getSportdetailsCount()
          
        default:
            return 0
        }
        
        
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let titleCell = collectionView.dequeueReusableCell(withReuseIdentifier: "titleCell", for: indexPath) as! TitleCollectionViewCell
        let eventcell = collectionView.dequeueReusableCell(withReuseIdentifier: "eventscell", for: indexPath) as! UpComingCollectionViewCell
       let lastestcell = collectionView.dequeueReusableCell(withReuseIdentifier: "lastestcell", for: indexPath) as! LatestCollectionViewCell
        let Teamscell = collectionView.dequeueReusableCell(withReuseIdentifier: "teamscell", for: indexPath) as! TeamsCollectionViewCell
        
        switch (indexPath.section){
        case 0:
            titleCell.cellSetup(titleLbl: "Up Coming Events")
            return titleCell
        case 1:
            eventcell.cellSetup(data: detailsViewModel.getEventsById(index: indexPath.row) )

            eventcell.layer.cornerRadius = eventcell.bounds.size.height / 4
            eventcell.layer.masksToBounds=true
            return eventcell

        case 2:
            titleCell.cellSetup(titleLbl: "Latest Events")
            return titleCell
        case 3:
          
             lastestcell.cellSetup(data: detailsViewModel.getLatestaResultById(index: indexPath.row))
          lastestcell.layer.cornerRadius = lastestcell.bounds.size.height / 4
            lastestcell.layer.masksToBounds=true
            return lastestcell
            
        case 4:
            titleCell.cellSetup(titleLbl: "Teams")
            return titleCell
        case 5:
            Teamscell.cellSetup(data: detailsViewModel.getEventsById(index: indexPath.row))
            Teamscell.layer.cornerRadius = eventcell.bounds.size.height / 4
            Teamscell.layer.masksToBounds=true
            return Teamscell
        default:
            return UICollectionViewCell()

        }
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
   func  renderCollectionView(){
       collectionView.reloadData()
    }
    
        
    }

    


