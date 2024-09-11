//
//  LeaguesDetailsCollectionViewController.swift
//  Sports_App
//
//  Created by Sohila Ahmed on 26/08/2024.
//

import UIKit


class LeaguesDetailsCollectionViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    
    
    var detailsViewModel :DetailsViewModelProtocol!
    @IBOutlet weak var collectionView: UICollectionView!{
        didSet{
            collectionView.dataSource = self
            collectionView.delegate = self
        }
    }
    
    //    @IBOutlet weak var favbtn: UIBarButtonItem!
    var leaduesId : Int = 0
    var sportIndex : Int = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        detailsViewModel = DetailsViewModel()
      // detailsViewModel.setSportIndex(sportIndex: sportIndex)
        detailsViewModel.setupNetworkMonitoring()
        detailsViewModel.bindAlertNWToViewController = { [weak self] in
            self?.showNoInternetAlert()
            self?.collectionView.isHidden = true
            self?.navigationItem.rightBarButtonItem?.isHidden = true

        }

        detailsViewModel.bindResultToCollectionController = { [weak self] in
            
            self?.renderCollectionView()
        }
        
        
        //        detailsViewModel.bindImgForFavBtn = { [weak self] isFavorite in
        //                    guard let self = self else { return }
        //                    let imageName = isFavorite ? "star.fill" : "star"
        //                    self.setImageBtn (imgName : imageName)
        //                }
        
        updateFavoriteButton()
        
        
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
    func setImageBtn (imgName : String ){
        let starImage = UIImage(systemName: imgName)
        
        let favButton = UIBarButtonItem(image: starImage, style: .plain, target: self, action: #selector(favaction))
        favButton.tintColor = UIColor.red
        self.navigationItem.rightBarButtonItem = favButton
    }
    func   updateFavoriteButton(){
        let imageName = detailsViewModel.setFavbtnimg(Id: leaduesId) ? "star.fill" : "star"
        let starImage = UIImage(systemName: imageName)
        
        let favButton = UIBarButtonItem(image: starImage, style: .plain, target: self, action: #selector(favaction))
        favButton.tintColor = UIColor(red: 105/255.0, green: 106/255.0, blue: 78/255.0, alpha: 1.0)
        self.navigationItem.rightBarButtonItem = favButton
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
    
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 6
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
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
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
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
            Teamscell.layer.cornerRadius = Teamscell.bounds.size.height / 4
            Teamscell.layer.masksToBounds=true
            return Teamscell
        default:
            return UICollectionViewCell()
            
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if (indexPath.section == 5){
            
            let teamDetails = self.storyboard?.instantiateViewController(withIdentifier: "TeamDetailsTableViewController") as! TeamDetailsTableViewController
            teamDetails.sportIndex = sportIndex
            teamDetails.teamKey = detailsViewModel.getTeamKey(index: indexPath.row)
            self.navigationController?.present(teamDetails, animated: true)
        }
       
    }
    func  renderCollectionView(){
        collectionView.reloadData()
    }
    @objc func favaction(_ sender: Any) {
        if detailsViewModel.getDataAppearState() {
            detailsViewModel.taponfavbtn()
            updateFavoriteButton()
            
        }else{
            print("Not responce")
        }
    }
    
    
    func showNoInternetAlert() {
        let alert = UIAlertController(title: "No Internet Connection!!",
                                      message: "Please check your internet connection and try again.",
                                      preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(okAction)
        
        self.present(alert, animated: true, completion: nil)
    }
   
}
extension UIColor {
    convenience init(hex: String) {
        let hex = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        var rgb: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&rgb)
        let red = CGFloat((rgb >> 16) & 0xFF) / 255.0
        let green = CGFloat((rgb >> 8) & 0xFF) / 255.0
        let blue = CGFloat(rgb & 0xFF) / 255.0
        self.init(red: red, green: green, blue: blue, alpha: 1.0)
    }
    
}



