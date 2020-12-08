//
//  Network.swift
//  ImageLoadingApp
//
//  Created by Mohit Kumar Singh on 08/12/20.
//

import Foundation

class Network {

    public static let session = Network()
    
    public func requesData<T: Decodable>(path: String, type: T.Type = T.self, completionHandler: @escaping (Result<T?,Error>)->Void) {
        let session = URLSession.shared
        guard let url = URL(string: path) else {
            return completionHandler(.failure(NetworkError.notAUrl(url: path)))
        }
        let task = session.dataTask(with: url, completionHandler: { data, response, error in
            if let error = error {
                print("API Error ====>\(error.localizedDescription)")
                return completionHandler(.failure(error))
            } else if let data = data {
                do {
                    let result = try JSONDecoder().decode(NetworkResponse<T>.self, from: data)
                    completionHandler(.success(result.data))
                } catch {
                    print("API Error ====>\(error.localizedDescription)")
                    return completionHandler(.failure(error))
                }
            }
        })
        task.resume()
    }
}

enum NetworkError: Error {
    case notAUrl(url: String)
    
    func localizedDescription() -> String {
        switch self {
        case .notAUrl(let url):
            return "Not a valid url => \(url). Please provide a valid url."
        }
    }
}
