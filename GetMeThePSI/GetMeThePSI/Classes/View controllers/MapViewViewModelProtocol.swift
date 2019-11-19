//
//  MapViewModel.swift
//  GetMeThePSI
//
//  Created by Swathi on 16/11/19.
//

import Foundation

protocol MapViewViewModelProtocol {
    func getPSIRegions(date : Date, completion : @escaping ([PSIRegion]?, Error?) -> Swift.Void)
    func getReadings(of regionName : String) -> PSIReadings
}
