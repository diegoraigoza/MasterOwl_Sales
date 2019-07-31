Create or Replace Function compute_Total(orderId1 ItemOrder.orderId%type) 
	RETURN number
IS 

	-- @ /home/draigoza/Desktop/MasterOwl_Sales/com_Tot.sql;
	-- select compute_Total('204') from Dual;

	ship_F ItemOrder.shipping_Fee%type;
	Iid StoreItems.ItemId%type;
	base_F StoreItems.price%type;

	cursor c1 is
		SELECT shipping_Fee
		FROM ItemOrder
		WHERE orderId = orderId1;

	cursor c2 is
		SELECT ItemId
		FROM ItemOrder
		WHERE orderId = orderId1;

	cursor c3 is
		SELECT price
		FROM StoreItems
		WHERE ItemId = Iid;


	pricetag number;--(10,2);

BEGIN

	open c1;
	fetch c1 into ship_F;
	close c1;

	open c2;
	fetch c2 into Iid;
	close c2;

	open c3;
	fetch c3 into base_F;
	close c3;
	
	pricetag := (ship_F + base_F);

	-- discount if gold member
	IF (pricetag >= 100 and ship_F = 0.00) THEN
		pricetag := .90*pricetag;
	END IF;

	-- 5% tax for everyone
	pricetag := 1.05*pricetag;
		


RETURN pricetag;


commit; 
END; 
/ 
Show errors; 
