CREATE OR REPLACE TRIGGER gold_trig1
AFTER UPDATE 
	ON Customer1
	FOR EACH ROW

DECLARE

BEGIN
	

	IF (:NEW.custType = 'gold' AND :OLD.custType = 'regular') THEN

		update ItemOrder
		set shipping_Fee = '0'
		where custId = :NEW.custId AND SYSDATE() <= shipped_Date;

		update ItemOrder
		set shipping_Fee = '0'
		where custId = :NEW.custId AND shipped_Date is NULL;


	END IF;
			
END;
/
Show errors;
