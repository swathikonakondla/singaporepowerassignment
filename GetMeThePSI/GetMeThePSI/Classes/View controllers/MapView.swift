//
//  MapView.swift
//  GetMeThePSI
//
//  Created by Swathi on 16/11/19.
//

import Foundation

protocol MapView {
    func annotateRegions(regions : [PSIRegion]?)
    func showRegionPSI(readings : PSIReadings?)
    func showRegionPSIDetailts(region : PSIRegion)
    func loadContent()
    func showLoading(show : Bool)
    func showError(message : String)
}
