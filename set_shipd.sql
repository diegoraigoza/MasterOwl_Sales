Create or Replace Procedure set_shippingDate(orderId1 varchar, set_sD DATE) 


As 

BEGIN

	update ItemOrder
	set shipped_Date = set_sD
	where orderId = orderId1;



commit; 
END; 
/ 
Show errors; 
