# Project-Oracle-Database

  
  
## RESERVATION
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
