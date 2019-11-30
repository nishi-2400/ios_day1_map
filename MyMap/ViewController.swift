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
        inputText.delegate = self
    }

    @IBOutlet weak var inputText: UITextField!
    
    @IBOutlet weak var dispMap: MKMapView!
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        if let searchKey = textField.text {
            print(searchKey)
            
            let geocoder = CLGeocoder()
            
            geocoder.geocodeAddressString(searchKey, completionHandler: {(placemarks, error) in
                if let unwrapPlacemarks = placemarks {
                    if let firstPlacemark = unwrapPlacemarks.first {
                        if let location = firstPlacemark.location {
                            let targetCoordinate = location.coordinate
                            
                            print(targetCoordinate)
                            
                            //ピン操作のためのクラスをインスタンス化
                            let pin = MKPointAnnotation()
                            
                            // CLGeocoderクラスのインスタンスを利用して取得した経度・緯度をピンをセットする位置情報として渡す
                            pin.coordinate = targetCoordinate
                            
                            //ピンの下部に表示される検索キーワードをセット
                            pin.title = searchKey
                            
                            //ピンをセットする処理
                            self.dispMap.addAnnotation(pin)
                            
                            //地図の表示範囲をセット
                            self.dispMap.region = MKCoordinateRegion(center: targetCoordinate, latitudinalMeters: 500.0, longitudinalMeters: 500.0)
                        }
                    }
                }
            })
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

