create or replace PROCEDURE resv_room(
  phone in VARCHAR2,
  room in VARCHAR2,
  grade in VARCHAR2,
  grand in VARCHAR2,
  hotel in VARCHAR2--,
  --reservation_error EXCEPTION,
 -- branch_error EXCEPTION
)
IS
r_id  reservation.resv_no%TYPE;
b_id branch.b_no%TYPE;
room_phone VARCHAR2(5) := room + '4';
BEGIN

SELECT resv_no
into r_id
from reservation
where phone = resv_phonenumber;

SELECT b_no
into b_id
from branch
where hotel = b_name;

INSERT INTO ROOM
VALUES(room, room_phone, grade, grand, r_id, b_id);

END;
