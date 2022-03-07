//
//  ArticleDetailsViewController+BindingModel.swift
//  NewsApp
//
//  Created by Mohannad on 2/6/22.
//
import RxSwift
import RxDataSources

typealias DetailsTableDataSource = RxTableViewSectionedReloadDataSource<SectionViewData>

extension CoachingDetailsViewController {
    
    
    func bindingCollectionViewDataSource(){
        viewModel.outputs.tabs.bind(to: tabCollection.rx.items){ (collection , index , item) in
            let index = IndexPath(row: index, section: 0)
            let cell = collection.dequeueReusableCell(withReuseIdentifier: Cells.tabCell.rawValue, for: index) as! TabCell
            cell.setup(with: item)
            return cell
        }.disposed(by: disposeBag)
    }
    
    func bindingSelectCollectionViewItem(){
        tabCollection.rx.modelSelected(TabViewData.self)
        .subscribe(onNext : { [weak self] item in
            guard let self = self else {return}
            print("\(item.name)")
        }).disposed(by: disposeBag)
    }
    
    func bindingTableViewDataSource() {
        
        let dataSource = DetailsTableDataSource(configureCell: { [weak self] (datasource, tableview, indexPath, _) in
            guard let self = self , let source =  datasource as? DetailsTableDataSource else {return UITableViewCell()}
             return  self.getTableCell(tableview , with: source , at: indexPath)
         })
        
        /*let sections =  Observable.just([SectionViewData(original: .OverViewSec(items: [.OverView]), items: []),
            SectionViewData(original: .InstructorSec(items: [.Instructor]), items: []) ,
            SectionViewData(original: .StatisticsSec(items: [.Statistics]), items: []),
            SectionViewData(original: .ClassesSec(items: [.Classes , .Classes , .Classes]), items: [])])*/
        viewModel.outputs.sections
        .bind(to: detailsTableView.rx.items(dataSource: dataSource))
        .disposed(by: disposeBag)
       }
    
    func getTableCell(_ table : UITableView , with datasource : DetailsTableDataSource , at indexPath : IndexPath) -> UITableViewCell{
        switch datasource[indexPath] {
            case .OverView:
                let cell = table.dequeueReusableCell(withIdentifier: Cells.overViewCell.rawValue, for: indexPath)  as! OverViewCell
                return cell
            case .Instructor:
                let cell = table.dequeueReusableCell(withIdentifier: Cells.instructorCell.rawValue, for: indexPath)  as! InstructorCell
                return cell
             case .Statistics:
                let cell = table.dequeueReusableCell(withIdentifier: Cells.statisticsCell.rawValue, for: indexPath)  as! StatisticsCell
                return cell
            case .Classes:
                let cell = table.dequeueReusableCell(withIdentifier: Cells.classCell.rawValue, for: indexPath)  as! ClassCell
                return cell
            }
    }
}
