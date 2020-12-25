import Alamofire

enum RequestEnum: UrlRequest {
    
    private static let baseUrl = Global.Network.baseUrl
    
    case search(parameters: SearchRequest)
    case detail(parameters: DetailRequest)
    
    
    var url: URL {
        var relativeUrl = RequestEnum.baseUrl
        switch self {
        case .search:
            relativeUrl += "/"
        case .detail:
            relativeUrl += "/"
            
            
        }
        
        return URL(string: relativeUrl)!
    }
    
    var method: HTTPMethod {
        switch self {
        case .search:
            return .get
        case .detail:
            return .get
        }
    }
    
    var parameters: Parameters? {
        switch self {
        case let .search(parameters):
            return parameters.convertToJson
        case let .detail(parameters):
            return parameters.convertToJson
        }
    }
    
    var encoding: ParameterEncoding {
        switch self {
        case .search:
            return URLEncoding.default
        case .detail:
            return URLEncoding.default
        }
    }
    
    var headers: HTTPHeaders? {
        return nil
    }
}

