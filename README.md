# ☕️ 투썸하트 - iOS
> **35기 AND SOPT 합동세미나 모바일 앱 4팀 iOS - 투썸하트 👩‍❤️‍👨**

<br>

## ☕️ 시연영상
| 메뉴 뷰 | 메뉴 상세 뷰 | 주문 모달 뷰 |
| --- | --- | --- |
| <img src="https://github.com/user-attachments/assets/732ee010-18d4-4285-8c26-61966af66794" width="250"/> | <img src="https://github.com/user-attachments/assets/b0765ff9-3434-4e91-9668-f8f07d9bb401" width="250"/> | <img src="https://github.com/user-attachments/assets/1e2fc1b0-b49e-4552-8f5b-81c1b1527045" width="250"/> | <img src="https://github.com/user-attachments/assets/706f616a-edee-45f7-9778-56abd0b7a5ca" width="250"/> | 

| 옵션 뷰 | 마이투썸 뷰 |
| --- | --- |
| <img src="https://github.com/user-attachments/assets/92099891-fdae-42bc-b116-2cbbf00ea620" width="250"/> | <img src="https://github.com/user-attachments/assets/4b05bec4-9eab-46f5-b935-e43207a0c625" width="250"/> |
<br>

## ☕️ iOS Developers

| [이수민](https://github.com/cirtuare) | [심범수](https://github.com/rafa-e1) | [김예지](https://github.com/mnbvcxzyj) |
| --- | --- | --- |
| <img src="https://avatars.githubusercontent.com/u/86866423?v=4" width="250"/> | <img src="https://avatars.githubusercontent.com/u/118424182?v=4" width="250"/> | <img src="https://avatars.githubusercontent.com/u/101444425?v=4" width="250"/> | 
| <p align="center"> `프로젝트 및 네트워크 세팅` <br> `모달 뷰` <br/> `공용 컴포넌트` </p> | <p align="center"> `메뉴 옵션 뷰` <br> `커스텀 알림창` <br/> `메뉴 뷰` </p> | <p align="center"> `마이투썸 뷰` <br> `메뉴 상세정보 뷰` </p> | 

<br>

## ☕️ 사용 기술 및 라이브러리
| 라이브러리(Library) | 목적(Purpose)            | 버전(Version)                                                |
| ------------------- | ------------------------ | ------------------------------------------------------------ |
| Moya           | 간결한 네트워크 요청과 구조화된 관리 방식으로 코드 가독성과 유지보수성 향상        | ![Moya](https://img.shields.io/badge/Moya-15.0.3-orange) |
| SnapKit             | Auto Layout의 간결한 작성 및 가독성 향상| ![Kingfisher](https://img.shields.io/badge/SnapKit-5.7.1-black) |
| Then                | 간결한 코드 처리 및 가독성 향상        | ![Kingfisher](https://img.shields.io/badge/Then-3.0.0-white) |
| Kingfisher           | 효율적인 이미지 다운로드 및 캐싱을 통해 네트워크 이미지 로딩 성능 향상 | ![Kingfisher](https://img.shields.io/badge/Kingfisher-8.11.0-yellow) |
<br>

## ☕️ Notion
### 🫐[**노션**](https://www.notion.so/sopt-official/4-e8eec2053f9f477396ca278aca3945fe?pvs=4) <br>
### ❄️[**트러블슈팅**](https://www.notion.so/sopt-official/13b1e48dd96081b68e96cf6cd415d261?pvs=4)
<br>

## ☕️ Git Convention
### 📘[**Git Convention**](https://www.notion.so/sopt-official/Git-13b1e48dd96081c48babc0a64fa5d89d?pvs=4)

### 📍 Prefix
- [Feat]        : 기능 (새로운 기능)  
- [Fix]         : 버그 (버그 수정)  
- [Refactor]    : 리팩토링   
- [Docs]        : 문서 수정 (문서 추가, 수정, 삭제, README)   
- [Add]         : 초기 생성  
- [Del]         : 파일을 삭제하는 작업만 수행한 경우  
- [Chore]       : 기타 자잘한 변경사항 모두


### 📍 Branch Naming Rule
- `Prefix/<#이슈번호>`

### 📍 Commit Convention
- ` [Prefix] 작업 내용 (#이슈번호) `

### 📍 Issue & PR Convention
- ` [PREFIX] 작업 내용 (#이슈번호) `

### 📍 작업 프로세스
1. 작업 내용과 todo가 담긴 이슈를 생성한다.
2. `develop`에서 Branch Naming Rule을 따르는 브랜치를 생성하고, checkout한다.
3. 코드 구현, 기능 수정 등 작업을 진행하며, commit과 push를 반복한다.
4. PR을 자세하게 작성하고, 리뷰를 요청한다.
5. 팀원 2명에게 모두 Approve을 받고, 필요하다면 코드리뷰를 반영한 후 해당 브랜치를 develop에 머지한다.
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
│   ├── 🗂️ DTO
│   │   ├── 🗂️ Request
│   │   ├── 🗂️ Response
│   ├── 🗂️ APITarget
│   ├── 🗂️ Base
│   │   ├── NetworkService
│   │   ├── NetworkResult
│   │   ├── TSPlugin
│   │   ├── Config
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


