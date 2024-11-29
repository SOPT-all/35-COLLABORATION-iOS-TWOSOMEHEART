# ☕️ 투썸하트
| 35기 AND SOPT 합동세미나 모바일 앱 4팀 iOS - 투썸하트 👩‍❤️‍👨

## ☕️ Developers

| [이수민](https://github.com/cirtuare) | [심범수](https://github.com/rafa-e1) | [김예지](https://github.com/mnbvcxzyj) |
| --- | --- | --- |
| <img src="https://avatars.githubusercontent.com/u/86866423?v=4" width="250"/> | <img src="https://avatars.githubusercontent.com/u/118424182?v=4" width="250"/> | <img src="https://avatars.githubusercontent.com/u/101444425?v=4" width="250"/> | 
| <p align="center"> `프로젝트 및 네트워크 세팅` <br> `모달 뷰` <br/> `공용 컴포넌트` </p> | <p align="center"> `메뉴 옵션 뷰` <br> `커스텀 알림창` <br/> `메뉴 뷰` </p> | <p align="center"> `마이투썸 뷰` <br> `메뉴 상세정보 뷰` </p> | 


## ☕️ 사용 기술 및 라이브러리
| 라이브러리(Library) | 목적(Purpose)            | 버전(Version)                                                |
| ------------------- | ------------------------ | ------------------------------------------------------------ |
| Moya           | 간결한 네트워크 요청과 구조화된 관리 방식으로 코드 가독성과 유지보수성 향상        | ![Moya](https://img.shields.io/badge/Moya-15.0.3-orange) |
| SnapKit             | Auto Layout의 간결한 작성 및 가독성 향상| ![Kingfisher](https://img.shields.io/badge/SnapKit-5.7.1-black) |
| Then                | 간결한 코드 처리 및 가독성 향상        | ![Kingfisher](https://img.shields.io/badge/Then-3.0.0-white) |
| Kingfisher           | 효율적인 이미지 다운로드 및 캐싱을 통해 네트워크 이미지 로딩 성능 향상 | ![Kingfisher](https://img.shields.io/badge/Kingfisher-8.11.0-yellow) |
<br>

## ☕️ 브랜치 전략
### 📍 Prefix
- [Feat]        : 기능 (새로운 기능)  
- [Fix]         : 버그 (버그 수정)  
- [Refactor]    : 리팩토링   
- [Docs]        : 문서 수정 (문서 추가, 수정, 삭제, README)   
- [Add]         : 초기 생성  
- [Del]         : 파일을 삭제하는 작업만 수행한 경우  
- [Chore]       : 기타 자잘한 변경사항 모두


### 📍 Branch Naming Rule
- `Prefix/<#issuenumber>`

### 📍 Git Covention
1. 작업 내용과 todo가 담긴 이슈를 생성합니다.
2. `develop`에서 Branch Naming Rule을 따르는 브랜치를 생성하고, checkout합니다.
3. 코드 구현, 기능 수정 등 작업을 진행하며, commit과 push를 반복합니다.
4. 간략하게 PR을 작성한다. (이때 부족한 설명은 구두로 보충한다.)
5. 1명 이상에게 Approve을 받고, 필요하다면 코드리뷰를 반영한 후 해당 브랜치를 main에 머지한다.
<br>

## ☕️ 폴더링 구조
```
├── 📁 Application
│   ├── AppDelegate
│   ├── SceneDelegate
│   ├── LaunchScreen
│   ├── Info.plist
├── 📁 Global
│   ├── 🗂️ Utils
│   │   ├── 🗂️ Enums
│   │   ├── ScreenUtils
│   │   ├── StringLiterals
│   ├── 🗂️ Extensions
│   │   ├── Font+ // enum 처리
│   │   ├── UIView+
│   ├── 🗂️ UIComponents // 공용 컴포넌트
│   ├── 🗂️ Resources
│   │   ├── Font // 파일
│   │   ├── Assets
│   │   │   ├── Colors
├── 📁 Network
│   ├── 🗂️ View1
│   │   ├── 🗂️ DTO
│   │   ├── View1TargetType
│   │   ├── View1Service
│   ├── 🗂️ Base
├── 📁 Presentation
│   ├── 🗂️ View1
│   │   ├── 🗂️ Model
│   │   ├── 🗂️ View
│   │   │   ├── 🗂️ Cell
│   │   │   ├── 🗂️ Type // 네이밍도 -Type
│   │   ├── 🗂️ Controller
│   ├── 🗂️ Base
│   │   ├── BaseNavViewController
│   │   ├── BaseViewController

```


## 시연영상


