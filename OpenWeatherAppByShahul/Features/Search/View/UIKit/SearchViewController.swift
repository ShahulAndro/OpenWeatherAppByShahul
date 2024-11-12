//
//  SearchViewController.swift
//  OpenWeatherAppByShahul
//
//  Created by Shahul Hameed Shaik on 12/11/2024.
//

import UIKit
import SwiftUI
import CoreLocation

//TODO: If i get time, I will optimse this controller and update location implementation better than currently it has.
class SearchViewController: UIViewController {

    let locationManager = CLLocationManager()
    let searchViewModel = SearchViewModel(weatherAPIService: WeatherAPIService(apiRequest: APIRequest(), apiService: APIService()))
    
    override func viewDidLoad() {
        addSwiftUIComponents()
        requestLocationAccess()
    }
    
    func addSwiftUIComponents() {
        let uiHostingController = UIHostingController(rootView: SearchSwiftUIView(viewModel: self.searchViewModel))
        uiHostingController.view.frame = view.bounds
        addChild(uiHostingController)
        view.addSubview(uiHostingController.view)
        
        uiHostingController.view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            uiHostingController.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            uiHostingController.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            uiHostingController.view.topAnchor.constraint(equalTo: view.topAnchor),
            uiHostingController.view.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        uiHostingController.didMove(toParent: self)
    }
    
    func requestLocationAccess() {
        // Request location access
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
        
        // Start updating location if permission is granted
        checkLocationAuthorization()
    }
    
    func dismissKeyboard() {
        view.endEditing(true)
    }
}

extension SearchViewController: CLLocationManagerDelegate {
    
    // CLLocationManagerDelegate method to handle authorization status changes
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        switch status {
        case .authorizedWhenInUse, .authorizedAlways:
            // Location permission granted, start updating location
            locationManager.startUpdatingLocation()
        case .denied, .restricted:
            // Handle denial or restriction of location access
            let alert = UIAlertController(title: "Location Access Denied", message: "Please enable location access in settings to fetch weather data.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default))
            self.present(alert, animated: true, completion: nil)
        case .notDetermined:
            // Handle case where permission has not yet been determined
            locationManager.requestWhenInUseAuthorization()
        @unknown default:
            break
        }
    }
    
    // CLLocationManagerDelegate method to handle location updates
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let currentLocation = locations.first else { return }
        
        // Stop updating location once we have the user's current location
        locationManager.stopUpdatingLocation()
        
        // Fetch weather data using current latitude and longitude
        let latitude = currentLocation.coordinate.latitude
        let longitude = currentLocation.coordinate.longitude
        
        print("Latinude: \(latitude), Longitude: \(longitude)")
        
        searchViewModel.getWeatherDataWithLatLong(latitude: latitude, longtitude: longitude)
    }
    
    // CLLocationManagerDelegate method to handle errors
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Failed to find user's location: \(error.localizedDescription)")
    }
    
    private func checkLocationAuthorization() {
        // Check the current authorization status
        switch locationManager.authorizationStatus {
        case .notDetermined:
            // Request permission to use location services
            locationManager.requestWhenInUseAuthorization()
        case .restricted, .denied:
            // Location access is restricted or denied
            // Show an alert or guide the user to enable it in settings
            showLocationAccessAlert()
        case .authorizedWhenInUse, .authorizedAlways:
            // Location services are authorized, you can now start updating location
            locationManager.startUpdatingLocation()
        @unknown default:
            fatalError("Unexpected authorization status.")
        }
    }
    
    // Show alert to guide the user to settings when location is denied or restricted
    private func showLocationAccessAlert() {
        let alertController = UIAlertController(
            title: "Location Access Needed",
            message: "Location services are disabled for this app. Please enable access in Settings.",
            preferredStyle: .alert
        )
        
        // Action to guide the user to the app's settings
        let settingsAction = UIAlertAction(title: "Open Settings", style: .default) { _ in
            guard let settingsURL = URL(string: UIApplication.openSettingsURLString) else { return }
            if UIApplication.shared.canOpenURL(settingsURL) {
                UIApplication.shared.open(settingsURL) // Open the app settings
            }
        }
        
        // Cancel action to dismiss the alert
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        alertController.addAction(settingsAction)
        alertController.addAction(cancelAction)
        
        // Present the alert
        self.present(alertController, animated: true, completion: nil)
    }

}
