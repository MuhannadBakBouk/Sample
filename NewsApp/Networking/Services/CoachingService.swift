//
//  ArticleService.swift
//  NewsApp
//
//  Created by Mohannad on 2/5/22.
//

import RxSwift

protocol CoachingServiceProtocol {
    func searchCoaches(query : String , page : Int , pageSize : Int) -> Observable<SearchCoachingResponse>
}

class CoachingService : CoachingServiceProtocol {
    
    var api : APIManagerProtocol!
    
    init(api : APIManagerProtocol = APIManager()) {
        self.api = api
    }
    
    func searchCoaches(query: String, page: Int, pageSize : Int = 25) -> Observable<SearchCoachingResponse> {
        let params : [String : Any]  = ["q" : query ,"apiKey" : API.key.rawValue , "pageSize" : pageSize , "page" : page]
        return Observable.create { observable in
            
            /*self.api.request(endpoint: .serachArticles, method: .Get, params: params) { (response : Result<SearchCoachingResponse, ApiError>) in
                if  case .success(let data) = response , data.status == "ok"{
                    debugPrint(data.coaches.count)
                    debugPrint(data.coaches.count)
                    observable.onNext(data)
                }
                else if  case .success(let data) = response , data.status == "error" , data.code == String(describing: ApiError.maximumResultsReached) {
                    observable.onError(ApiError.maximumResultsReached)
                }
                else if case .failure(let ex) = response{
                    observable.onError(ex)
                }
            }*/
            if let info = CoachingService.loadFromJsonDirectly() {
              observable.onNext(info)
            }
            return Disposables.create()
        }
    }
    
    
}


extension CoachingService {
    
  class func loadFromJsonDirectly() -> SearchCoachingResponse?{
      
        guard let data = try? Data(contentsOf: Bundle.main.url(forResource: "MockedCoachesResponse", withExtension: "json")!) ,
        
        let response =  try? JSONDecoder().decode(SearchCoachingResponse.self, from: data)
        else { return  nil}
        
        return response
    }
}



