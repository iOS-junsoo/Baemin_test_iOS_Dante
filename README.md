# Baemin_test_iOS_Dante

# [1차 스크럼 회의내용]
## [클라이언트 → 서버 (보내야할 데이터]

<시작화면 - 선택동의(1) 값 POST 요구>

- 시작화면 - 약관동의 화면에서 선택동의의 사용자 대답의 값은 Bool로 상태를 앱내에 저장했다가 회원가입 화면에서 완료버튼을 클릭할 때 POST로 서버에게 전송

<회원가입 화면 - 선택동의(3) 값, 이메일, 닉네임, 비밀번호 POST 요구>

- 휴대전화를 작성하고 앱내에 데이터를 저장후 인증번호 받기 버튼을 누르면 POST로 서버에게 전송
- 이메일은 중복확인 버튼을 누르면 POST로 서버에 보내서 중복확인을 진행
- 회원가입 화면에서  닉네임, 비밀번호또한 앱내부에 저장했다가 회원가입 화면에서 완료버튼을 클릭할 때 POST로 서버에게 전송

<장바구니 화면 -  장바구니 담기를 눌렀을 떄 년월일시분초 + UserId POST>

- 치킨 가게에서 장바구니를 담을 때 후라이드 치킨(메인 음식)을 누르고 케찹, 무 , 소스(옵션 음식)을 중복으로 클릭하게 되는데 여기서 장바구니 담기 버튼을 누르면 버튼을 눌렀을 때의 년월일시분초 + UserId (형식: 20211102093821Dante)를 Sting으로 만들어서 POST

![](https://images.velog.io/images/rlawnstn01023/post/754fab50-2ff6-44f1-a4a5-b2b286bd0536/1.png)
- 구매하기 버튼을 눌렀을 때도 년월일시분초 + UserId (형식: 20211102093821Dante)를 Sting으로 만들어서 POST

![](https://images.velog.io/images/rlawnstn01023/post/81f15c82-e307-4672-82eb-b998b693d948/2.png)

## [클라이언트가 앱내에 저장해야할 데이터]

1. 시작화면 - 주소설정 화면에서 주소의 값을  앱내에 저장하여 홈화면으로 진입하면 위에 주소를 띄워줘야함.
2. 회원가입 화면 - 약관동의 화면에서 선택동의의 사용자 대답의 값은 Bool로 상태를 앱내에 저장.
3. 장바구니 - 몇개의 제품이 담겼는지 앱내에 저장해서 장바구니 버튼 이미지 변경

## [서버와 통신]

- 휴대전화 인증: 번호를 입력하고 인증받기 버튼을 누르면 POST로 인해서 서버에 번호가 보내지고 서버에서는 랜덤한 값을 문자 형태로 앱에 보내게 되고 해당 값이랑 사용자가 입력한 인증번호랑 일치하는지 확인하여 휴대전화를 인증
- 이메일: 이메일을 입력하고 중복확인 버튼을 누르면 POST로 인해서 서버에 번호가 보내지고 서버에서는 해당 이메일이 있는지 확인하여 결과를 다시 클라이언트에게 전송
---

# [2차 스크럼 회의내용]
## [클라이언트 → 서버 (보내야할 데이터]
<음식 담기 - 옵션화면>
- 예를 들어 치킨 가게에서 후라이드 치킨을 클릭하고 케찹, 무, 소금 같은 옵션 메뉴 3개를 선택한다면 post 3개를 보낸다. 그 후 서버에서 커스텀된 ID 값을 Response 하면 그 ID 값을 포함한 Post 한번더 보내주면 좋겠다. 

<회원가입 화면 - 인증번호>
- 서버측 질문 : 인증번호를 우리가 구현하지 않고 클라이언트에서 구현하면 안되나요?
- 클라이언트측 답변 : 인증번호를 앱자체에서 하게 되면(그냥 알람 오는 것만하도록) 인증번호를 사용하는 의미가 없어지기 때문에 서버에서 구현해주셨으면 좋겠다. 



# [1차 피드백 내용]
## [멘토님의 피드백]

1. 로그인 기능 - 서버와 협업해서 우선적으로 구현해야함.
2. 지도에서 위치확인 화면 
    1. 지도 현재위치 설정
        - 오류 : 맵 API를 이용해서 내 위치를 가져오기를 실행하면 바다로 위치가 뜨게된다.
        - 원인 : 시뮬레이터의 위치가 바다로 뜨기 때문에 발생
        - 해결 : 맥북의 시뮬레이터가 아닌 자신의 핸드폰에 빌드를 해보자.
    2. map View 커스텀 
        - 카카오 map API를 쓰기보단 어노테이션 뷰를 활용해서 커스텀된 지도를 만들어보자. (시간이 난다면 실행해보자.)
    3. 지번 위치로 보기
        - 버튼에 이미지를 추가해서 배달의 민족 앱의 버튼과 최대한 비슷하게 구현해보자
    4. 내 위치로 가기 버튼 추가
        - 다른 지역으로 지도를 넘겼다가 해당 버튼을 클릭하면 다시 내 위치로 오도록 ( 시간이 오래걸리면 넘어가자)
3. 상세정보 입력 화면 
    1. TextField
        - 오류1 : TextField의 테두리가 왜 이렇게 두껍나 ?
        - 원인1 : TextField의 height의 높이를 변경하기 위해서 주어진 TextField를 사용하다 보니
        - 해결1 : 기본 TextFiled 말고 커스텀을 해보자.
        - 오류 2 : TextField를 클릭하면 얇은 border에서 굵은 border로 변경되는데 이 부분은 구현하지 못했나?
        - 원인 2: 발견하지 못했음.
        - 해결 2: TextField를 커스텀하고 addTarget을 사용해서 TextField가 터치가 되었을 때 border를 변경해보자.
        - 오류 3: TextField**를 클릭하면 키보드가 올라오고 다른 곳을 터치하면 내려가지 않는다.**
        - 원인 3: x
        - 해결 3: 핸드폰으로 빌드를 시켜서 이런 세세한 부분도 확인해보자 - 템플릿에 이 기능이 있으니깐 다시 잘 참고 해보자 또는 구글링
4. 홈 화면 
    1. Navigation bar
        - 오류 : 알람 버튼의 위치가 이상하다
        - 원인 : 누끼를 딸 때 잘 못딴거 같다.
        - 해결 : 누끼를 다시 딴다  /  **EdgeInsets을 사용한다.**
    2. pull to refresh 
        - 오류 :  pull to refresh를 할 때 흰 공간이 생기는 것
        - 해결 : pull to refresh와 관련된 커스텀 자료를 찾아본다.
5. 로그인 화면 
    1. 카카오로그인 버튼 
        - 오류 : 카카오로그인 버튼을 사진으로 해서 사진이 깨진다.
        - 원인 : 이미지로 버튼을 구현했기 때문
        - 해결 : 이미지로 하지말고 커스텀 버튼을 구현해보자 .
    2. 회원가입 화면 
        - 오류 : 인증번호 다시 받기 버튼 사이즈 오류
        - 원인 : 미흡한 오토레이아웃
        - 해결 : 크기를 다시 만들어보자.
        - 오류2: 자동 하이픈 기능 오류
        - 원인 : 자동 하이픈 라이브러리에 add target과 비슷한 기능이 있을 수 있다.
        - 해결 : 메서드 찾아보기 / 라이브러리 찾기

## [자체 피드백]

1. 상세정보 입력 화면 
    
- 지도에서 위치확인 버튼 누르면 navigation pop 하기
    
2. 지도에서 위치확인 화면 
- 이 위치로 주소 설정 버튼을 누르면 navigation push

## [장바구니 버튼 추가 방법의 방향성]
![](https://images.velog.io/images/rlawnstn01023/post/23386702-f252-4938-9cd3-a91be9b74287/image.png)
---
# [2차 피드백 내용]
## [멘토님의 피드백]
1. API 연결
- API 연결을 최소 10개는 해보자. 현재 너무 부족하다.

2. 화면 생산성
- 현재 화면생산성이 부족한 편인데 화면를 더 만들어보자. 

3. 시작화면 
- 상세정보 입력 화면 - TextField 입력 커서가 너무 붙어 있다. 

4. 회원가입 화면 
- 이메일 중복확인 버튼 - TextField에 입력이 시작되면 비활성화 상태에서 활성화상태로 변경되도록 해보자.

- 닉네임 TextField - 오류 문구 조건문 수정 

- 토스트 메세지 - 폰트 크기 수정

- 인증번호

5. 장바구니 화면 
- 장바구니 추가 되도록 전연변수 활용해서 해보기 



# [개발일지]
## 10/30

### 시작 화면 구현 70% 
- 동의화면 구현완료
- 배달 주소 화면 구현 완료
- 주소 검색 구현 미완료 - 서버
- 현재 위치로 설정 구현 미완료 - 카카오톡 API 사용
---
## 10/31

### 시작 화면 구현 95% 
- 지도 화면 구현 완료
- 현재위치 구현 미완료

### 회원가입 화면 구현 40% 
- 로그인화면 구현 완료
- 소셜 로그인 구현 미완료
- 동의화면 구현완료
- 나머지 화면 미완료

### 홈 화면 구현 15% 
- NavigationController 구현완료
- 카테코리 화면 미완료
---
## 11/01
### 현재 시작화면(95% - 현재위치 미완료)와 회원가입 화면(99% - 자동 하이픈 미완료) 달성

### 홈 화면 15% 
-  구현 예정

### 생긴 이슈 1 
- 발생한 이슈 : addTarget이 작동안됨
- 발생한 이슈 원인 : delegate로 인한 충돌로 예상
- 해결 시도: 자동하이픈을 포기 
- 해결 여부: 미해결 

### 생긴 이슈 2
- 발생한 이슈 : 네비게이션 Back 버튼 커스텀 안됨
- 발생한 이슈 원인 : x
- 해결 시도: 네비게이션 바를 없애고 따로 버튼을 만들어 dismiss 작성
- 해결 여부: 해결 
---
## 11/02
### 현재 시작화면(95% - 현재위치 미완료)와 회원가입 화면(99% - 자동 하이픈 미완료) 달성

### 홈 화면 95% 
- 홈화면 UI구성완료
- 홈화면 버튼 화면전환 미구현

### 생긴 이슈 1 
- 발생한 이슈 : tableView와 navigtion bar 사이의 빈공간
- 발생한 이슈 원인 : 미흡한 오토레이아웃
- 해결 시도: 오토레이아웃 조정
- 해결 여부: 해결 

### 생긴 이슈 2 
- 발생한 이슈 : pulltorefresh시 빈공간이 늘어남. 
- 발생한 이슈 원인 : 원인 불명
- 해결 시도: 내일 해볼예정 - cell의 height 조정시도 해볼 예정
- 해결 여부: 미해결 
---
## 11/03 
### 1차 피드백을 바탕으로 앱을 수정
- 지번 위치로 보기 버튼 이미지 추가
- 내 위치로 가기 버튼 map 위에 추가
- 화면 레이아웃구성 다시 (show가 아니라 push인 것들 수정)
- 상세정보 입력화면 TextField화면 커스텀
- 홈화면 네비게이션바 버튼 아이템 위치 수정
- 사용자가 리턴키를 눌렀을 때 또는 다른 화면을 눌렀을 때 키보드가 내려가도록 만들기 
- 카카오 로그인 버튼 자체 구현
- 인증번호 다시 받기 크기 수정

### 생긴 이슈 1 
- 발생한 이슈 : pulltorefresh시 빈공간이 늘어남. 
- 발생한 이슈 원인 : 원인 불명
- 해결 시도: cell의 height 조정
- 해결 여부: 미해결 

### 생긴 이슈 2 
- 발생한 이슈 : 카카오 map API 현재위치 함수 작동안됨
- 발생한 이슈 원인 : 원인 불명
- 해결 시도: 카카오 API를 뒤져봤지만 사용법은 나오지 않음
- 해결 여부: 미해결 
---
## 11/04 
### 1차 피드백 보충 
- 현재위치 버튼 기능 구현
- 회원가입 POST
- 회원가입 UI 퀄리티 증가
- 홈화면 버튼 
- pulltorefresh 

### 생긴 이슈 1 
- 발생한 이슈 : pulltorefresh시 빈공간이 늘어남. 
- 발생한 이슈 원인 : 무한 pulltorefresh 때문에 
- 해결 시도: pulltorefresh하자마자 바로 닫는 코드 작성
- 해결 여부: 해결

### 생긴 이슈 2 
- 발생한 이슈 : POST
- 발생한 이슈 원인 : 원인 불명
- 해결 시도: 6시간동안 구글링 / 멘토님께 질문
- 해결 여부: 해결

### 생긴 이슈 3 
- 발생한 이슈 : cell button push VC 안됨
- 발생한 이슈 원인 : cell은 push가 불가능하기 때문이다.
- 해결 시도: delegate 패턴을 이용했다. - 추후 공부가 필요함.
- 해결 여부: 해결
---
## 11/05 
### 배달화면 구현
- 상단탭바 80% 구현
- 로그인 POST
- 이메일 중복 POST

### 생긴 이슈 1 
- 발생한 이슈 : PagingKit FocusView Label 변하지 않음
- 발생한 이슈 원인 : x
- 해결 시도: FocusView로 페이지이를 넘기지 않고 버튼 자체의 BackGorundColor를 주어 만듬
- 해결 여부: 해결

### 생긴 이슈 2 
- 발생한 이슈 : 이슈1의 해결로 생긴 Page를 넘겨도 상단 탭바 상태는 바뀌지 않음
- 발생한 이슈 원인 : focusView를 없애서 그런거 같음
- 해결 시도: 
- 해결 여부: 미해결
---
## 11/06
### 배달화면 구현
- 배달화면 UI 100%
- 배달 화면에서 한식을 누르면 한식화면으로 넘어가도록 만듬
---
## 11/07
### 한식화면 구현
- 한식화면 - 기본순 구현
- 한식화면 - 배달빠른 순 구현
- 장바구니 버튼 구현
- 장바구니 화면 구현
- 주문하기 레이아웃 구현 

### 생긴 이슈 1 
- 발생한 이슈 : TableView를 사용할 떄 각각 Header를 주는 어떻게 주는건지 모르겠다.
- 발생한 이슈 원인 : x
- 해결 시도: TableView 관련 메서드 활용
- 해결 여부: 미해결
---
## 11/08
### 식당 상세화면 구현
- 식당 상세화면 구현 70%
- TableViewCell 마다 구분선 구현 
 

### 생긴 이슈 1 
- 발생한 이슈 : TableVIewCell 내부에 PagingKit 사용안됨.
- 발생한 이슈 원인 : xib파일로는 ContainerView를 사용할 수 없기 때문이다. 
- 해결 시도: Tapman 라이브러리 활용 시도
- 해결 여부: 미해결

### 생긴 이슈 2
- 발생한 이슈 : TableVIewCell 내부에 Tapman 라이브러리 활용 시도시 uitableviewcell has no member 'dataSource'라는 오류가 뜸
- 발생한 이슈 원인 : xib파일로는 ContainerView를 사용할 수 없기 때문이다. 
- 해결 시도: dataSource 선언 위치 변경
- 해결 여부: 미해결
---
## 11/09
### 마이배민 화면 구현
- 마이배민 화면 UI 100% 
- 마이배민 화면 기능 구현 50%
- 식당 상세화면 - 메뉴 탭 구현 
- 식당 상세화면 - 리뷰 탭 구현 
- 로그인 / 회원가입 시 마이배민 화면 변경 구현
- 로그아웃 시 마이배민 화면 변경 구현 
---
## 11/10
### 마이배민 화면 구현
- 마이배민 화면 cell or cell 내부 버튼 기능구현 
- 포인트 / 쿠폰함 / 선물함 / 짬 / 리뷰관리 기능 구현 
- 배민 1 화면 구현
- 포장 화면 구현
- 쇼핑라이브 화면 구현
- 선물하기 화면 구현
- 전체 카테고리 화면 구현
- 알람 화면 구현 
- 상단 주소 버튼 누르면 바텀시트 나오도록 설정 완료 
---
## 11/11
### API 연결 
- 메뉴 상세화면 구현 
- 한식 화면 API 연결 
- 가게 상세화면 API 연결
- 주문하기 화면 정보 조회 API 연결
- 주문내역 리스트 조회 API 연결 
- 주문내역 상세화면 UI 구현


### 생긴 이슈 1 
- 발생한 이슈 : Response Type 오류 
- 발생한 이슈 원인 : Response Type에 대한 오류 발생 (명세서랑 다른 Type이 있어서)
- 해결 시도: Type 수정 
- 해결 여부: 해결

### 생긴 이슈 2 
- 발생한 이슈 : Index range 관려 오류
- 발생한 이슈 원인 : tableView Cell을 구성하고 데이터를 받아왔기 때문에 없는 데이터로 구성하려고 해서 발생
- 해결 시도: 데이터를 받아오고 나서 Cell 구성 함수의 시간을 0.3초 뒤에 실행함 
- 해결 여부: 해결
---
## 11/12
### API 연결 
- 가게 검색
- 인증번호 API 
