//
//  ArticleDetailsViewModelProtocol.swift
//  NewsApp
//
//  Created by Mohannad on 2/6/22.
//
import RxSwift

typealias CoachingDetailsViewModelEvents = CoachingDetailsViewModelInput & CoachingDetailsViewModelOutput

protocol CoachingDetailsViewModelInput {

}

protocol CoachingDetailsViewModelOutput {
    var tabs : BehaviorSubject<[TabViewData]> {get}
    var sections : BehaviorSubject<[SectionViewData]> {get}
}

protocol CoachingDetailsViewModelProtocol {
    var inputs : CoachingDetailsViewModelInput {get}
    var outputs : CoachingDetailsViewModelOutput {get}

}
