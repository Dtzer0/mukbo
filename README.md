# mukbo
제작 과정은 Notion에 적어두었던 기록을 바탕으로 작성해두었습니다.

### 3/21
제작 시작 및 신청뷰 UI 구성완료

### 3/22
메인페이지 UI 구성완료

### 3/23
팝업뷰(신청뷰) 구성과 로직 구상 ( 전체적인 UI 구현 완료 )

### 3/24
CoreData 작성을 위한 자료수집 및 기초 구성

### 4/25
디버깅을 통한 CoreData 설계

Thread 1: "+entityForName: nil is not a legal NSManagedObjectContext parameter searching for entity name 'Dessert'” 오류 발생

-> entity 문제인줄 알고 해당 부분을 중점으로 탐색했으나 별다른 문제가 없어 Simulator에 있는 프로젝트를 삭제하고 다시 돌리니 해결되었음

### 4/26 
tableview에 로드되지 않는 문제 이유 탐색 + CoreData 코드를 DataManager.swift 파일에 따로 배치
1. CoreData 코드 작성문제인줄 알고 해당 부분을 중점으로 디버깅 -> 순서면에서는 따로 문제가없음
2. textfield의 IBOutlet 설정을 하지 않은 것을 확인 -> 수정완료
3. 전체적인 코드 재탐색 중...

### 5/3
전체적으로 합쳐져 있던 파일 정리 및 수정 + 신처 리스트 스와이프하여 삭제하는 코드 추가
1. 아직 데이터가 즉각 테이블에 뜨지 않음! 코드르 다시보며 살펴보는중..
