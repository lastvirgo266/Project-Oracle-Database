create or replace FUNCTION calculate_charge
(r_phone IN VARCHAR2)
RETURN NUMBER
IS
adult reservation.resv_adult%TYPE;
minor reservation.resv_adult%TYPE;
infant reservation.resv_adult%TYPE;

BEGIN
SELECT resv_adult, resv_minor, resv_infant
INTO adult, minor, infant
FROM reservation
WHERE r_phone = resv_phonenumber;

RETURN adult*70000+minor*50000+infant*20000;
END calculate_charge;
