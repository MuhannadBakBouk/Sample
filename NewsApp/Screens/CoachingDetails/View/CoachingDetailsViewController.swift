//
//  ArticleDetailsViewController.swift
//  NewsApp
//
//  Created by Mohannad on 2/6/22.
//
import UIKit
import RxSwift

class CoachingDetailsViewController: SuperViewController {
    
    @IBOutlet weak var headerImageView: UIImageView!
    
    @IBOutlet weak var tabCollection: UICollectionView!
    
    @IBOutlet weak var detailsTableView: UITableView!
    var  collectionLayout : UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 10
        return layout
    }()
    var  detailscollectionLayout : UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        return layout
    }()
    
    var viewModel : CoachingDetailsViewModelProtocol!
    
    convenience init(model : CoachingDetailsViewModelProtocol ){
        self.init()
        viewModel = model  
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        configureUIBinding()
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = true
        indicatorAlert = nil
        infoAlert = nil
    }
    
   
    
    func configureUI(){
        headerImageView.contentMode = .scaleAspectFill
        headerImageView.setImage(Images.training.rawValue)
        configureCollectionView()
        registerCollectionCell()
        confirgureCollectionCellsSize()
        
        configureDetialsTableView()
        registerTableViewCells()
        
    }
    
    func configureUIBinding(){
        bindingCollectionViewDataSource()
        bindingSelectCollectionViewItem()
        
        bindingTableViewDataSource()
        /*bindingArticleInfoToUI()
        subscribingToRateButton()
        subscribingToRateTextField()
        subscribingToRateResult()
        subscribingToProcessingRate()*/
    }
    
    func configureCollectionView(){
        tabCollection.backgroundColor = .white
        tabCollection.showsVerticalScrollIndicator = false
        tabCollection.collectionViewLayout = collectionLayout
    }
    
    func confirgureCollectionCellsSize(){
        let width  =  (UIScreen.main.bounds.width / 3 ) - 10
        let cellSize = CGSize(width: (CGFloat(width)) , height: 40)
        collectionLayout.itemSize = cellSize
    }
    
    func registerCollectionCell()  {
        tabCollection.register(TabCell.self, forCellWithReuseIdentifier: Cells.tabCell.rawValue)
    }
    
    func configureDetialsTableView(){
        detailsTableView.estimatedRowHeight = UITableView.automaticDimension
        detailsTableView.allowsSelection = false
    }
    
    func registerTableViewCells(){
        detailsTableView.register(OverViewCell.self, forCellReuseIdentifier: Cells.overViewCell.rawValue)
        
        detailsTableView.register(InstructorCell.self, forCellReuseIdentifier: Cells.instructorCell.rawValue)
        
        detailsTableView.register(StatisticsCell.self, forCellReuseIdentifier: Cells.statisticsCell.rawValue)
        
        detailsTableView.register(ClassCell.self, forCellReuseIdentifier: Cells.classCell.rawValue)
    }
    
   
    
}

