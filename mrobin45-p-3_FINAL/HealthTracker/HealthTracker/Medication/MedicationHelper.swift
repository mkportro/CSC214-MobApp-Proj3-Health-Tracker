////
////  MedicationHelper.swift
////  HealthTracker
////
////  Created by MaKayla Ortega Robinson on 8/4/23.
////
//
//import Foundation
//
//class MedicationHelper: ObservableObject {
//    let baseURL = "https://api.fda.gov/drug/label.json"
//
//    private func buildAPIURL(searchQuery:String, fields:[String]? = nil, limit:Int? = nil) -> URL? {
//
//        var queryItems = [URLQueryItem]()
//        queryItems.append(URLQueryItem(name:"search", value:"drug_name:\(searchQuery)"))
//
//        //optional fields parameter
//        if let fields = fields {
//            let selectedFields = fields.joined(separator: ",")
//            queryItems.append(URLQueryItem(name:"fields", value:selectedFields))
//        }
//
//        //optional limit parameter
//        if let limit = limit {
//            queryItems.append(URLQueryItem(name:"limit", value:String(limit)))
//        }
//
//        guard var components = URLComponents(string:baseURL) else { return nil }
//        components.queryItems = queryItems
//        return components.url
//    }
//
//    func fetchMedication(for searchQuery:String, selectedFields:[String]?=nil, limit:Int?=nil) async throws -> [MedicationInfo] {
//
//        if let url = buildAPIURL(searchQuery:searchQuery, fields:selectedFields, limit:limit) {
//            let request = URLRequest(url:url)
//            let (data, response) = try await URLSession.shared.data(for: request)
//            guard (response as? HTTPURLResponse)?.statusCode == 200 else { throw URLError.BadURL }
//
//            let decoder = JSONDecoder()
//            let medicationInfo = try decoder.decode([MedicationInfo].self, from: data)
//            return medicationInfo
//        }
//        return [MedicationInfo]()
//    }
//}
