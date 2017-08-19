import Foundation
import UIKit

struct City {
    let name: String
}

// Протокол
protocol CitiesViewControllerDelegate {
    func selectCity(_ city: City)
}

// Делегат
class CitiesViewController: UITableViewController {
    
    var cities = [City(name: "Москва"), City(name: "Санкт-Петербург")]
    
    var delegate: CitiesViewControllerDelegate?
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        delegate?.selectCity(cities[indexPath.row])
        
    }
}

// Делегатор
class ProfileViewController: UIViewController, CitiesViewControllerDelegate {
    
    var selcetedCity: City?
    
    func showCitiesViewController() {
        let citiesViewController = CitiesViewController()
        citiesViewController.delegate = self
        present(citiesViewController, animated: true, completion: nil)
    }
    
    func selectCity(_ city: City) {
        self.selcetedCity = city
    }
}
