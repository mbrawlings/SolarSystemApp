//
//  PlanetDetailViewController.swift
//  planetsRetry
//
//  Created by Matthew Rawlings on 9/25/22.
//

import UIKit

class PlanetDetailViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    //MARK: - Outlets
    @IBOutlet var planetImage: UIImageView!
    @IBOutlet weak var planetOrderNumber: UILabel!
    @IBOutlet weak var ordinalSuffix: UILabel!
    @IBOutlet weak var planetName: UILabel!
    @IBOutlet weak var namesake: UILabel!
    @IBOutlet weak var detailCollectionView: UICollectionView!
    
    @IBOutlet weak var favoriteButton: UIBarButtonItem!
    
    
    var planet: Planet?

    //MARK: - Lifecycles
    override func viewDidLoad() {
        super.viewDidLoad()
        detailCollectionView.delegate = self
        detailCollectionView.dataSource = self
        favoriteButton.tintColor = .systemPurple
        updateViews()
        updatedFavoriteStatus()
    }
    
    //MARK: - Action
    @IBAction func favoriteButtonTapped(_ sender: Any) {
        guard let planet = planet else { return }
//        planet.favorite = !planet.favorite
        PlanetController.shared.updateFavorite(planet: planet)
        updatedFavoriteStatus()
    }
    
    //MARK: - Collection Views
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        8
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "planetDetailCell", for: indexPath) as? DetailCollectionViewCell else { return UICollectionViewCell() }
        
        cell.detailImage.alpha = 0.5
        cell.detailImage.image = UIImage(systemName: "globe")
        
        guard let planet = planet else { return UICollectionViewCell() }
        
        switch indexPath.item {
        case 0:
            cell.titleLabel.text = "Day length"
            cell.detailLabel.text = "\(planet.dayLengthInDays) days"
        case 1:
            cell.titleLabel.text = "Year length"
            cell.detailLabel.text = "\(planet.yearLengthInDays) days"
        case 2:
            cell.titleLabel.text = "Radius"
            cell.detailLabel.text = "\(planet.radiusInMiles) miles"
        case 3:
            cell.titleLabel.text = "Moon Count"
            cell.detailLabel.text = "\(planet.moonCount)"
        case 4:
            cell.titleLabel.text = "Ring Count"
            cell.detailLabel.text = "\(planet.ringCount)"
        case 5:
            cell.titleLabel.text = "Plant Type"
            cell.detailLabel.text = "\(planet.planetType)"
        case 6:
            cell.titleLabel.text = "Sun Distance"
            cell.detailLabel.text = "\(planet.distanceFromSun) AU"
        case 7:
            cell.titleLabel.text = "Galaxy"
            cell.detailLabel.text = "Milky Way"
        default:
            break
        }
        return cell
    }
    
    //MARK: - Helper Functions
    func updateViews() {
        let attributedString = NSMutableAttributedString(string: ordinalSuffix.text ?? "")

        attributedString.addAttribute(NSAttributedString.Key.kern, value: CGFloat(1.0), range: NSRange(location: 0, length: attributedString.length))
        
        guard let planet = planet else { return }
        
        planetImage.image = UIImage(named: planet.imageName)
        planetOrderNumber.text = "\(planet.orderNumber)"
        ordinalSuffix.text = ordinalSuffix(order: planet.orderNumber) + " planet"
        planetName.text = planet.name.uppercased()
        namesake.text = planet.planetDescription
        
    }
    
    func ordinalSuffix(order: Int) -> String {
        switch order {
        case 1:
            return "st"
        case 2:
            return "nd"
        case 3:
            return "rd"
        case 4, 5, 6, 7, 8:
            return "th"
        default:
            return ""
        }
    }
    func updatedFavoriteStatus() {
        guard let planet = planet else { return }
        if planet.favorite == false {
            favoriteButton.image = UIImage(systemName: "star.circle")
        } else if planet.favorite == true {
            favoriteButton.image = UIImage(systemName: "star.circle.fill")
            }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension PlanetDetailViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: (collectionView.frame.size.width - 16) / 2, height: (collectionView.frame.size.width - 16) / 5)
    }
}
