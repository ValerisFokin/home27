//
//  MapViewController.swift
//  homeWork27
//
//  Created by Валерий Вергейчик on 28.06.22.
//

import UIKit
import GoogleMaps

class MapViewController: UIViewController {

    @IBOutlet weak var mapView: UIView!
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var feelsLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var weatherImage: UIImageView!
    
    private var apiProviderForMap: RestAPIProviderProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.layoutSubviews()
        
        apiProviderForMap = AlamofireProvider()
        
        tempLabel.text = ""
        feelsLabel.text = ""
        descriptionLabel.text = ""
        
        
        let camera = GMSCameraPosition.camera(withLatitude: 54.029, longitude: 27.597, zoom: 9.0)
        let weatherMapView = GMSMapView.map(withFrame: mapView.frame, camera: camera)
        mapView.addSubview(weatherMapView)
        weatherMapView.delegate = self
        
    }

}

extension MapViewController: GMSMapViewDelegate {
    func mapView(_ mapView: GMSMapView, didTapAt coordinate: CLLocationCoordinate2D) {
        print(coordinate.latitude)
        apiProviderForMap.getWeatherForCityCoordinates(lat: coordinate.latitude, lon: coordinate.longitude) { result in
            switch result {
            case .success(let value):
                guard let weatherIconId = value.current?.weather?.first?.icon else {return}
                DispatchQueue.main.async {
                    guard let temp = value.current?.temp else {return}
                    self.tempLabel.text = "+\(Int(temp))"
                    
                    guard let feelsLikeTemp = value.current?.feelsLike else {return}
                    self.feelsLabel.text = "ощущается как +\(Int(feelsLikeTemp))"
                    
                    guard let descriptionWeather = value.current?.weather?.first?.description else {return}
                    self.descriptionLabel.text = "\(descriptionWeather)"
                    
                    guard let imageUrl = URL(string: "\(Constants.imageURL)\(weatherIconId)@2x.png") else {return}
                    if let data = try? Data(contentsOf: imageUrl) {
                        self.weatherImage.image = UIImage(data: data)
                    }
                print(value)
                }
            case .failure(let error):
                print(error)
            }
        }
        
    }
}
