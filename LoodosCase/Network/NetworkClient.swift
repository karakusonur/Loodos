import Alamofire

class NetworkClient {
    
    static func search(searchText: String, completionHanler: @escaping ApiRouter.CompletionHandler<SearchModel>) {
        let request = RequestEnum.search(parameters: SearchRequest(search: searchText))
        ApiRouter.doRequest(request: request,
                            decodingType: SearchModel.self,
                            completionHandler: completionHanler)
    }
    
    static func detail(movieName: String, completionHanler: @escaping ApiRouter.CompletionHandler<DetailModel>) {
        let request = RequestEnum.detail(parameters: DetailRequest(detail: movieName))
        ApiRouter.doRequest(request: request,
                            decodingType: DetailModel.self,
                            completionHandler: completionHanler)
    }
    
}

