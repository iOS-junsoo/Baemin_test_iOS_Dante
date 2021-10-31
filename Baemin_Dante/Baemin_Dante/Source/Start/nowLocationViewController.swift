//
//  nowLocationViewController.swift
//  Baemin_Dante
//
//  Created by 준수김 on 2021/10/30.
//

import UIKit

public let DEFAULT_POSITION = MTMapPointGeo(latitude: 36.22473, longitude: 128.31230)
class nowLocationViewController: UIViewController, MTMapViewDelegate {

    var mapView: MTMapView?
    var mapPoint1: MTMapPoint?
    var poiItem1: MTMapPOIItem?
    @IBOutlet var userLocationLabel: UILabel!
    
        override func viewDidLoad() {
            super.viewDidLoad()
            
            mapView = MTMapView(frame: self.view.frame)
            
            if let mapView = mapView {
                mapView.frame = CGRect(x: 0, y: 70, width: 390, height: 570)
                        mapView.delegate = self
                        mapView.baseMapType = .standard
                        
                        //MARK: -  지도 중심점, 레벨
                        mapView.setMapCenter(MTMapPoint(geoCoord: DEFAULT_POSITION), zoomLevel: -2, animated: true)
                        
                        //MARK: -  현재 위치 트래킹
                        mapView.showCurrentLocationMarker = true
                        mapView.currentLocationTrackingMode = .onWithoutHeading
                        
                        //MARK: -  마커 추가
                        self.mapPoint1 = MTMapPoint(geoCoord: MTMapPointGeo(latitude:  36.22473, longitude: 128.31230))
                        poiItem1 = MTMapPOIItem()
                        poiItem1?.markerType = MTMapPOIItemMarkerType.redPin
                        poiItem1?.mapPoint = mapPoint1
                        poiItem1?.itemName = "움직여 위차를 설정하세요." //위치 마크 이름
                        mapView.add(poiItem1)
                        self.view.addSubview(mapView)
                    }
            //MARK: - 주소 입력(미구현)
            Location.titleLocation = "경북 구미시 선산대로 1220"
            userLocationLabel.text = Location.titleLocation
            // 1. 현재 위치를 시스템상에서 알아내어 Location.titleLocation에 저장
            // 2. userLocationLabel.text에 Location.titleLocation 저장
    
        }
    
    //MARK: - 현재 위치 트래킹 함수
    func mapView(_ mapView: MTMapView!, updateCurrentLocation location: MTMapPoint!, withAccuracy accuracy: MTMapLocationAccuracy) {
           let currentLocation = location?.mapPointGeo()
           if let latitude = currentLocation?.latitude, let longitude = currentLocation?.longitude{
               print("MTMapView updateCurrentLocation (\(latitude),\(longitude)) accuracy (\(accuracy))")
            
           }
       }
       
       func mapView(_ mapView: MTMapView?, updateDeviceHeading headingAngle: MTMapRotationAngle) {
           print("MTMapView updateDeviceHeading (\(headingAngle)) degrees")
       }
    
    @IBAction func back(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    

}

