
import UIKit
import MapKit

class ViewController: BaseViewController, MKMapViewDelegate{

    @IBOutlet weak var mapView: MKMapView!
    
    let regionRadius: CLLocationDistance = 1000
    lazy var artworks: [Artwork]? = {
        return self.loadInitialData()
    }()
    
    
    override func viewDidLoad() {
        
    super.viewDidLoad()
        let initialLocation = CLLocation(latitude: 21.282778, longitude: -157.829444)
        
        mapView.register(ArtworkView.self,
                         forAnnotationViewWithReuseIdentifier: MKMapViewDefaultAnnotationViewReuseIdentifier)
        
        self.centerMapOnLocation(location: initialLocation)
        if let artworks: [Artwork] = self.artworks
        {
            self.mapView.addAnnotations(artworks)
        }
        
//     let artwork = Artwork(title: "King  David Kalakaua",
//                              locationName: "Waikiki Gateway Park",
//                              discipline: "Sculpture",
//                              coordinate: CLLocationCoordinate2D(latitude: 21.283921, longitude: -157.831661))
//        mapView.addAnnotation(artwork)
//
  }
    
    func centerMapOnLocation(location: CLLocation) {
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate, regionRadius, regionRadius)
        self.mapView.setRegion(coordinateRegion, animated: true)
        mapView.delegate = self
    }
    
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
       
        guard let annotation = annotation as? Artwork else { return nil }
        let identifier = "marker"
        var view: ArtworkView
    
        if let dequeuedView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier)
            as? ArtworkView {
            dequeuedView.annotation = annotation
            view = dequeuedView
        } else {
    
            view = ArtworkView(annotation: annotation, reuseIdentifier: identifier)
            view.canShowCallout = true
            view.calloutOffset = CGPoint(x: -5, y: 5)
            view.rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
        }
        return view
    }
    
    
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView,
                 calloutAccessoryControlTapped control: UIControl) {
        let location = view.annotation as! Artwork
        let launchOptions = [MKLaunchOptionsDirectionsModeKey: MKLaunchOptionsDirectionsModeDriving]
        location.mapItem().openInMaps(launchOptions: launchOptions)
    }
    func loadInitialData() -> [Artwork]?
    {
        // 1
        guard let fileName = Bundle.main.path(forResource: "PublicArt", ofType: "json")
            else { return nil}
        let optionalData = try? Data(contentsOf: URL(fileURLWithPath: fileName))
        
        guard
            let data = optionalData,
            // 2
            let json = try? JSONSerialization.jsonObject(with: data),
            // 3
            let dictionary = json as? [String: Any],
            // 4
            let works = dictionary["data"] as? [[Any]]
            else { return nil}
        // 5
        let validWorks = works.flatMap { Artwork(json: $0) }
       return validWorks
    }
}

