//
//  ProductViewModel.swift
//  ZigZag
//
//  Created by Navodya Weerasooriya on 2024-04-06.
//

import Foundation
import Alamofire

class ProductViewModel: ObservableObject {
    @Published var clothingItems = [ProductModel]()
    
    func fetchData() {
        AF.request("http://localhost:8090/api/v1/products").responseDecodable(of: [ProductModel].self) { response in
            switch response.result {
            case .success(let items):
                self.clothingItems = items
            case .failure(let error):
                print("Error fetching data: \(error)")
            }
        }
    }
}
