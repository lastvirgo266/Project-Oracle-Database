create or replace PACKAGE reservation_info AS
 procedure all_resv_info;
 procedure resv_room_info(r_name in VARCHAR2);
end reservation_info;
