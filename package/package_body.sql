--수정해야함

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
 
 
 procedure resv_room_inro(r_name in VARCHAR2)
 IS
 roomNum VARCHAR2;
 roomPhone VARCHAR2;
 roomGrade VARCHAR2;
 roomGrand VARCHAR2;
 roomBranch VARCHAR2;
 resv_id VARCHAR2;
 branch_name VARCHAR2;
 BEGIN
 
 SELECT resv_no
 into resv_id
 from reservation
 where resv_name = r_name;

 SELECT r_no, r_phonenumber, r_grade, r_grand, r_b_no
 into roomNum, roomPhone, roomGrade, roomGrand, roomBranch
 from room
 where r_resv_no = resv_id;
 
 SELECT b_name
 into branch_name
 from branch
 where roomBranch = b_no;
 
 DBMS_OUTPUT.PUT_LINE('방 번호 : ' 
 

 
 
 
end reservation_info;
