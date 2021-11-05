//
//  nowLocationViewController.swift
//  Baemin_Dante
//
//  Created by 준수김 on 2021/10/30.
//

import UIKit
import CoreLocation

public let DEFAULT_POSITION = MTMapPointGeo(latitude: 36.22473, longitude: 128.31230)
class nowLocationViewController: UIViewController, MTMapViewDelegate, CLLocationManagerDelegate {

    var mapView: MTMapView?
    var currnetLocation: MTMapView?
    var mapPoint1: MTMapPoint?
    var poiItem1: MTMapPOIItem?
    var jibunCount = 0
    @IBOutlet var jibunBtn: UIButton!
    @IBOutlet var userLocationLabel: UILabel!
    var locationManger = CLLocationManager() //현재위치 설정
        override func viewDidLoad() {
            super.viewDidLoad()
            //MARK: - navigationbar back button hide
            self.navigationItem.setHidesBackButton(true, animated: true)
         //MARK: - 현재 위치
            // 델리게이트 설정
            locationManger.delegate = self
            // 거리 정확도 설정
            locationManger.desiredAccuracy = kCLLocationAccuracyBest
            // 사용자에게 허용 받기 alert 띄우기
            locationManger.requestWhenInUseAuthorization()
              
            // 아이폰 설정에서의 위치 서비스가 켜진 상태라면
            if CLLocationManager.locationServicesEnabled() {
                print("위치 서비스 On 상태")
            locationManger.startUpdatingLocation() //위치 정보 받아오기 시작
                print(locationManger.location?.coordinate)
            } else {
                print("위치 서비스 Off 상태")
            }
            
            //MARK: - 지번 버튼 둥글게
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
                mapView.currentLocationTrackingMode = .onWithoutHeading

                self.view.addSubview(mapView)
            }
            
            //MARK: - 현재위치로 돌아가는 버튼추가
            let button = UIButton(frame: CGRect(x: 322, y: 500, width: 60, height: 60))
            button.setImage(UIImage(named: "현재위치버튼"), for: .normal)
            button.addTarget(self, action: #selector(handleTap), for: .touchUpInside)
            
            //버튼 그림자
            button.layer.shadowColor = UIColor.black.cgColor // 색깔
            button.layer.masksToBounds = false  // 내부에 속한 요소들이 UIView 밖을 벗어날 때, 잘라낼 것인지. 그림자는 밖에 그려지는 것이므로 false 로 설정
            button.layer.shadowOffset = CGSize(width: 0, height: 4) // 위치조정
            button.layer.shadowRadius = 5 // 반경
            button.layer.shadowOpacity = 0.3 // alpha값
            self.view.addSubview(button)
            
            
            
//            //MARK: - 주소 입력(미구현)
//            Location.titleLocation = "경북 구미시 선산대로 1220"
//            userLocationLabel.text = Location.titleLocation
//            // 1. 현재 위치를 시스템상에서 알아내어 Location.titleLocation에 저장
//            // 2. userLocationLabel.text에 Location.titleLocation 저장
    
            

            
        }
    
    // 위치 정보 계속 업데이트 -> 위도 경도 받아옴
       func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
           print("didUpdateLocations")
           if let location = locations.first {
               print("위도: \(location.coordinate.latitude)")
               UserInfo.latitude = location.coordinate.latitude
               print("경도: \(location.coordinate.longitude)")
               UserInfo.longitude = location.coordinate.longitude
           }

           getAddressFromLatLon(pdblLatitude: String(UserInfo.latitude), withLongitude: String(UserInfo.longitude))
       }
       
       // 위도 경도 받아오기 에러
       func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
           print(error)
       }
    

    
    //현재 위치로 돌아가기
    @objc func handleTap(_ sender: UIButton) {
        print("currnt location")
        //현재 위치로 돌아가기
        mapView?.setMapCenter(MTMapPoint(geoCoord: DEFAULT_POSITION), zoomLevel: -2, animated: true)
        
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
            Location.titleLocation =  UserInfo.location
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
    //MARK: - 주소 풀네임
    func getAddressFromLatLon(pdblLatitude: String, withLongitude pdblLongitude: String) {
            var center : CLLocationCoordinate2D = CLLocationCoordinate2D()
            let lat: Double = Double("\(pdblLatitude)")!
            //21.228124
            let lon: Double = Double("\(pdblLongitude)")!
            //72.833770
            let ceo: CLGeocoder = CLGeocoder()
            center.latitude = lat
            center.longitude = lon

            let loc: CLLocation = CLLocation(latitude:center.latitude, longitude: center.longitude)


            ceo.reverseGeocodeLocation(loc, completionHandler:
                {(placemarks, error) in
                    if (error != nil)
                    {
                        print("reverse geodcode fail: \(error!.localizedDescription)")
                    }
                    let pm = placemarks! as [CLPlacemark]

                    if pm.count > 0 {
                        let pm = placemarks![0]
//                        print(pm.country)
                        print(pm.locality)
                        print(pm.subLocality)
//                        print(pm.thoroughfare)
//                        print(pm.postalCode)
                        print(pm.subThoroughfare)
                        var addressString : String = ""
                        if pm.locality != nil {
                            addressString = addressString + pm.locality! + " "
                        }
                        
                        if pm.subLocality != nil {
                            addressString = addressString + pm.subLocality! + " "
                        }
                        if pm.subThoroughfare != nil {
                            addressString = addressString + pm.subThoroughfare! + " "
                        }
                        
                        print(addressString)
                        UserInfo.location = addressString
                  }
            })

        }


}


