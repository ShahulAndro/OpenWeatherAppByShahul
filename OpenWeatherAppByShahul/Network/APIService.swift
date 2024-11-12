//
//  APIService.swift
//  OpenWeatherAppByShahul
//
//  Created by Shahul Hameed Shaik on 11/11/2024.
//

import Foundation

//MARK: - APIError
enum APIError: Error {
    case GenericError(Error)
    case InvalidJson(Error)
    case EmptyResponseData(Error)
}

//MARK: - Result
enum Result<T> {
    case Success(T)
    case Failure(APIError, String)
}

//MARK: - APIServiceProtocol
protocol APIServiceProtocol {
    func dataRequest<T: Decodable>(request: URLRequest, type: T.Type, completion: @escaping (Result<T>) -> Void)
}

//MARK: - APIService
struct APIService: APIServiceProtocol {
    
    //MARK: - dataRequest
    func dataRequest<T: Decodable>(request: URLRequest, type: T.Type, completion: @escaping (Result<T>) -> Void) {
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard error == nil else {
                completion(Result.Failure(APIError.GenericError(error!), error?.localizedDescription ?? Utils.genericErrorMessage))
                return
            }
            
            guard let data = data else {
                completion(Result.Failure(APIError.EmptyResponseData(error!), error?.localizedDescription ?? Utils.genericErrorMessage))
                return
            }
            
            do {
                let decodedObject = try JSONDecoder().decode(type.self, from: data)
                completion(Result.Success(decodedObject))
            } catch let error {
                completion(Result.Failure(APIError.InvalidJson(error as! DecodingError), error.localizedDescription))
            }
        }
        task.resume()
    }
}
