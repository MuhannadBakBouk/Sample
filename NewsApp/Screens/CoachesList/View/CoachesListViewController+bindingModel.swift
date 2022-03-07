//
//  CoachesListViewController+Binding.swift
//  NewsApp
//
//  Created by Mohannad on 2/5/22.
//
import RxSwift
import RxCocoa

extension CoachesListViewController {
    
    func bindingCollectionViewDataSource(){
        viewModel.outputs.coaches.bind(to: collectionView.rx.items){ (collection , index , item) in
            let index = IndexPath(row: index, section: 0)
            let cell = collection.dequeueReusableCell(withReuseIdentifier: Cells.coachItemCell.rawValue, for: index) as! CoachItemCell
            cell.setup(with: item)
            return cell
        }.disposed(by: disposeBag)
    }
    
    func bindingSelectCollectionViewItem(){
        collectionView.rx.modelSelected(CoacheViewData.self)
        .subscribe(onNext : { [weak self] item in
            guard let self = self else {return}
            self.coordinator?.showCoachingDetails()
        }).disposed(by: disposeBag)
    }
    
    func bindingCollectionViewScrolling(){
        collectionView.rx.reachedBottom.asObservable()
            .bind(to: viewModel.inputs.reachedBottomTrigger)
        .disposed(by: disposeBag)
    }
    
    func bindindCollectionViewLoadingIndicator()  {
        collectionView.setupLoadingIndicator()
        guard  let indicator = collectionView.backgroundView as? UIActivityIndicatorView else {
            return
        }
        viewModel.outputs.isLoading
        .bind(to: indicator.rx.isAnimating)
        .disposed(by: disposeBag)
    }
    
    func bindingLoadingError(){
        viewModel.outputs.onError
        .observe(on: MainScheduler.asyncInstance)
        .subscribe(onNext : { [weak self] error in
            self?.collectionView.setMessage(error)
        }).disposed(by: disposeBag)
    }
    
    func bindingMaximumResultsReachedError(){
        viewModel.outputs.onMaximumResultsReachedError
        .observe(on: MainScheduler.asyncInstance)
        .subscribe(onNext : { [weak self] error in
            self?.configureInfoAlert()
            self?.infoAlert?.show(message: error)
        }).disposed(by: disposeBag)
    }
}
