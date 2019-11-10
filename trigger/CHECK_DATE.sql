create or replace trigger check_date after
INSERT on reservation
FOR EACH ROW
DECLARE
 checkIn reservation.resv_checkin%TYPE;
 user_date_error EXCEPTION;
BEGIN
 checkIn := :new.resv_checkin;
 IF checkIn < SYSDATE THEN
  RAISE user_date_error;
 ELSE
 DBMS_OUTPUT.PUT_LINE('예약을 환영합니다');
 END IF;

EXCEPTION
 WHEN user_date_error THEN
 RAISE_APPLICATION_ERROR(-20001, '날짜오류');
END;
