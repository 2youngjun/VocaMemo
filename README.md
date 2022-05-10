# 📝 VocaMemo

## 🎉 프로젝트 개요

자신이 스스로 만드는 영단어 암기장 App으로, 매일 이전에 암기한 영단어 리마인드 및 영단어 리스트 추가, 삭제, 북마크 기능 등을 제공합니다.

## 🔥 프로젝트 목표
+ 기획, 디자인, 개발 프로세스 직접 구현
+ JSON Data 연동
+ NSMutableAttributeString


## 🗓 프로젝트 기간

**2022.04.25 ~ 2022.05.06** 


## 구현view

![DailyView](https://user-images.githubusercontent.com/86882798/167528631-d5112446-dbcf-40f8-b646-97389069a61f.gif)
![WordLIstView](https://user-images.githubusercontent.com/86882798/167529537-e632b454-4b3e-43f0-b80d-c01ea7651c82.gif)
![Bookmark](https://user-images.githubusercontent.com/86882798/167529195-96ac3787-c47d-4029-9593-f16efeb93299.gif)


### Today's Word



## Language & Tools
### 기술 스택
+ Swift
+ SwiftUi

### 디자인툴
+ Sketch

### 협업툴
+ Ryver

## 기능 구현

+ Today's Word
  - Daily View 에서는 사용자가 이전에 직접 만든 JSON Data로 구현한 Word List에서 **랜덤**으로 2개의 Word를 가져와 뜻과 예문을 사용자에게 리마인드 시켜줍니다.
  - 두 단어 중 기억이 나지 않는 단어가 있는 경우, 사용자는 Bookmark 버튼을 클릭하여 해당 단어를 Bookmark View 에 추가할 수 있습니다.

<p align="center"><img width=600 height=440 alt="Daily View" src="https://user-images.githubusercontent.com/86882798/167527747-ff36b7d7-d3b9-4c1a-a485-696fc031acc4.png"></p>


+ Word List
  - 단어 우측의 화살표 버튼을 클릭하여 단어의 뜻과 예문을 확인할 수 있습니다. 
  - 단어 앞의 Bookmark 버튼을 통해 해당 단어를 Bookmark View 에 추가할 수 있습니다.
  - Word List 의 단어를 삭제할 수 있습니다.

+ Add Word
  - 사용자가 “+ 버튼”을 클릭하여 단어, 뜻, 예문, 동의어를 입력하여 Word List에 단어를 추가할 수 있습니다.

<p align="center"><img width=400 height=440 alt="WordList View" src="https://user-images.githubusercontent.com/86882798/167527360-b99cb6d4-a3c6-4011-a1bf-ed339b62cf33.png"></p>

+ Bookmark
  - Daily View 또는 WordList View 에서 Bookmark 설정한 단어를 List 로 확인할 수 있는 View 입니다.
  - Bookmark 설정된 단어들은 WordList View 의 List 처럼 해당 단어의 뜻과 예문을 확인할 수 있습니다.

<p align="center"><img width=220 height=440 alt="Bookmark View" src="https://user-images.githubusercontent.com/86882798/167528258-0a3daa94-4e8e-4905-a126-ff4612574252.png"></p>



## 🐞 Bug Report

버그를 발견한다면, Issues에 등록해주세요.

## 📝 License

This project is MIT licensed.
