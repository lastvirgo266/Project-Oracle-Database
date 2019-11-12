CREATE OR REPLACE PACKAGE BODY reservation_info AS
 procedure all_resv_info
 IS
 CURSOR resv_cursor is
 select * from reservation;
 
 BEGIN
 for cur in resv_cursor loop
 DBMS_OUTPUT.PUT_LINE('이름 : ' || cur.resv_name);
 DBMS_OUTPUT.PUT_LINE('어른 인원 : ' || cur.resv_adult);
 DBMS_OUTPUT.PUT_LINE('어린이 인원 : ' || cur.resv_minor);
 DBMS_OUTPUT.PUT_LINE('유아 인원 : ' || cur.resv_infant);
 DBMS_OUTPUT.PUT_LINE('체크인 : ' || cur.resv_checkin);
 DBMS_OUTPUT.PUT_LINE('체크아웃 : ' || cur.resv_checkout);
 END LOOP;
 END all_resv_info;
 
 
 procedure resv_room_info(r_name in VARCHAR2)
 IS
 resv_id VARCHAR2;
 branch_name VARCHAR2;
 CURSOR room_cursor IS
 SELECT * FROM room;
 BEGIN
 
 SELECT resv_no
 into resv_id
 from reservation
 where resv_name = r_name;


FOR cur IN cursor_customer LOOP
IF cur.r_resv_no = resv_id THEN
 SELECT b_name
 into branch_name
 from branch
 where roomBranch = b_no;
 
 DBMS_OUTPUT.PUT_LINE('번호 :' || cur.r_no);
 DBMS_OUTPUT.PUT_LINE('내전전화 :' || cur.r_phonenumber);
 DBMS_OUTPUT.PUT_LINE('방 등급 : ' || cur.r_grade);
 DBMS_OUTPUT.PUT_LINE('방 크기 : ' || cur.r_grande);
 DBMS_OUTPUT.PUT_LINE('호텔 이름 : ' || branch_name);
 END IF;
 END LOOP; 
 
end resv_room_info;
end reservation_info;
