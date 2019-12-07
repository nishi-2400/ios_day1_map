//
//  ViewController.swift
//  MyMap
//
//  Created by Yusuke Nishi on 2019/11/21.
//  Copyright © 2019 Swift-beginners. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, UITextFieldDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        myLongitude.delegate = self
        myLatitude.delegate = self
    }

    @IBOutlet weak var inputText: UITextField!
    
    @IBOutlet weak var dispMap: MKMapView!
    
    @IBOutlet weak var myLatitude: UITextField!
    
    @IBOutlet weak var myLongitude: UITextField!
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        if let searchLatitude = myLatitude.text, let searchLontitude = myLongitude.text {
            print(type(of: searchLatitude))
            print(searchLontitude)
            
            let myLatitude = Double(searchLatitude)!
            let myLongitude = Double(searchLontitude)!
            
            
            let center: CLLocationCoordinate2D = CLLocationCoordinate2DMake(myLatitude, myLongitude)
            dispMap.setCenter(center, animated: true)

            let mySpan: MKCoordinateSpan = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
            let myRegion: MKCoordinateRegion = MKCoordinateRegion(center: center, span: mySpan)

            dispMap.region = myRegion

            self.view.addSubview(dispMap)
            
        
        }
        
        return true
    }
    
    @IBAction func changeMapButton(_ sender: Any) {
        if dispMap.mapType == .standard {
            dispMap.mapType = .satellite
        } else if dispMap.mapType == .satellite {
            dispMap.mapType = .hybrid
        } else if dispMap.mapType == .hybrid {
            dispMap.mapType = .satelliteFlyover
        } else if dispMap.mapType == .satelliteFlyover {
            dispMap.mapType = .hybridFlyover
        } else if dispMap.mapType == .hybridFlyover {
            dispMap.mapType = .mutedStandard
        } else {
            dispMap.mapType = .standard
        }
    }
}


//
// MapViewを生成.
//
//    var myMapView: MKMapView = MKMapView()
//
//    myMapView.frame = self.view.frame
//
//
//
//    // 経度、緯度.
//
//    let myLatitude: CLLocationDegrees = 37.331741
//
//    let myLongitude: CLLocationDegrees = -122.030333
//
//
//
//    // 中心点.
//    let center: CLLocationCoordinate2D = CLLocationCoordinate2DMake(myLatitude, myLongitude)
//
//
//
//    // MapViewに中心点を設定.
//
//    myMapView.setCenterCoordinate(center, animated: true)
//
//
//
//    // 縮尺.
//
//    // 表示領域.
//
//    let mySpan: MKCoordinateSpan = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
//
//    let myRegion: MKCoordinateRegion = MKCoordinateRegionMake(center, mySpan)
//
//
//
//    // MapViewにregionを追加.
//
//    myMapView.region = myRegion
//
//
//
//    // viewにMapViewを追加.
//
//    self.view.addSubview(myMapView)
//
//
//
//    // ピンを生成.
//
//    var myPin: MKPointAnnotation = MKPointAnnotation()
//
//
//
//    // 座標を設定.
//
//    myPin.coordinate = center
//
//
//
//    // タイトルを設定.
//
//    myPin.title = "タイトル"
//
//
//
//    // サブタイトルを設定.
//
//    myPin.subtitle = "サブタイトル"
//
//
//
//    // MapViewにピンを追加.
//
//    myMapView.addAnnotation(myPin)
//
//}
//
