# Project-Oracle-Database

  
  
## RESERVATION 테이블
 예시
~~~ sql
INSERT INTO reservation VALUES
('12235', '45224', '김길', 1,1,1, '2019-11-1', '2019-11-12');
~~~

   
   
   
 ## 프로시저
  예시
  ~~~ sql
  exec resv_room('010-1111-1111', '452', 'deluxe', 'single', '서울고구려');
  ~~~ 

 ## 함수
 예시
 ~~~ sql
 var result_cal number
 exec :result_cal := calculate_charge('010-1161-1111')
 print :result_cal
 ~~~


 ## 패키지
 예시
 ~~~ sql
 exec reservation_info.all_resv_info;
 exec reservation_info.resv_room_info('김김김');
 
 ~~~
