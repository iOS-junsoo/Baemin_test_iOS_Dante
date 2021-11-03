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
    var currnetLocation: MTMapView?
    var mapPoint1: MTMapPoint?
    var poiItem1: MTMapPOIItem?
    var jibunCount = 0
    @IBOutlet var jibunBtn: UIButton!
    @IBOutlet var userLocationLabel: UILabel!
    
        override func viewDidLoad() {
            super.viewDidLoad()
         
            
            //MARK: 지번 버튼 둥글게
            jibunBtn.layer.cornerRadius = 20
            
            mapView = MTMapView(frame: self.view.frame)
            
            if let mapView = mapView {
                mapView.frame = CGRect(x: 0, y: 70, width: 390, height: 570)
                mapView.delegate = self
                mapView.baseMapType = .standard
                
                //MARK: -  지도 중심점, 레벨
                mapView.setMapCenter(MTMapPoint(geoCoord: DEFAULT_POSITION), zoomLevel: -2, animated: true)
                
                //MARK: -  현재 위치 트래킹
                mapView.showCurrentLocationMarker = true
                mapView.currentLocationTrackingMode = .onWithHeading
//                mapView(, updateCurrentLocation: mapPoint1, withAccuracy: 5.0)
               
                //MARK: -  마커 추가
                self.mapPoint1 = MTMapPoint(geoCoord: MTMapPointGeo(latitude:  36.22473, longitude: 128.31230))
                poiItem1 = MTMapPOIItem()
                poiItem1?.markerType = MTMapPOIItemMarkerType.redPin
                poiItem1?.mapPoint = mapPoint1
                poiItem1?.itemName = "움직여 위치를 설정하세요." //위치 마크 이름
                mapView.add(poiItem1)
                self.view.addSubview(mapView)
            }
            
            //MARK: - 현재위치로 돌아가는 버튼추가
            let button = UIButton(frame: CGRect(x: 322, y: 500, width: 60, height: 60))
            button.setImage(UIImage(named: "현재위치버튼"), for: .normal)
//            button.setTitle("Button", for: .normal)
//            button.setTitleColor(.red, for: .normal)
            button.addTarget(self, action: #selector(handleTap), for: .touchUpInside)
            
            //버튼 그림자
            button.layer.shadowColor = UIColor.black.cgColor // 색깔
            button.layer.masksToBounds = false  // 내부에 속한 요소들이 UIView 밖을 벗어날 때, 잘라낼 것인지. 그림자는 밖에 그려지는 것이므로 false 로 설정
            button.layer.shadowOffset = CGSize(width: 0, height: 4) // 위치조정
            button.layer.shadowRadius = 5 // 반경
            button.layer.shadowOpacity = 0.3 // alpha값
            self.view.addSubview(button)
            
            
            
            //MARK: - 주소 입력(미구현)
            Location.titleLocation = "경북 구미시 선산대로 1220"
            userLocationLabel.text = Location.titleLocation
            // 1. 현재 위치를 시스템상에서 알아내어 Location.titleLocation에 저장
            // 2. userLocationLabel.text에 Location.titleLocation 저장
    
        }
    
    //현재 위치로 돌아가기
    @objc func handleTap(_ sender: UIButton) {
        print("currnt location")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
   
    @IBAction func backBtn(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func jibunBtnTap(_ sender: UIButton) {
        jibunCount += 1
        if jibunCount % 2 == 1 {
            jibunBtn.setTitle(" 지번으로 보기", for: .normal)
            Location.titleLocation = "경북 구미시 선산대로 1220"
            userLocationLabel.text = Location.titleLocation
        } else {
            jibunBtn.setTitle(" 도로명으로 보기", for: .normal)
            Location.titleLocation = "경북 구미시 오로리 460-1"
            userLocationLabel.text = Location.titleLocation
        }
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
    


}

