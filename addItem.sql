Create or Replace Procedure addItemOrder (orderId1 varchar, ItemId1 varchar, custId1 varchar, date_of_order1 DATE, no_of_items1 number, shipped_Date1 DATE) --, @custId1 varchar(10), @orderId1 varchar(8)

As 

	no_Cop number;
	custT char(10);

	cursor c1 is
		SELECT no_Copies
		FROM ComicBook
		WHERE ItemId = ItemId1;

	cursor c2 is
		SELECT custType
		FROM Customer1
		WHERE custId = custId1;


	shipping_F ItemOrder.shipping_Fee%type; 

BEGIN

	open c1;
	fetch c1 into no_Cop;
	close c1;

	open c2;
	fetch c2 into custT;
	close c2;


	IF no_Cop < no_of_items1 THEN

		RAISE_APPLICATION_ERROR(-20010,'Not enough stock for order');
	END IF;

	IF custT = 'regular' THEN
		shipping_F := '10.00';
	ELSE
		shipping_F := '00.00';
	END IF;


	INSERT INTO ItemOrder
	(orderId, ItemId, custId, no_of_items, shipped_Date, date_of_order, shipping_Fee, total_Cost)
	VALUES
	(orderId1, ItemId1, custId1, no_of_items1, NULL, date_of_order1, shipping_F, '00.00');

	
	update ComicBook
	set no_Copies = (no_Copies - no_of_items1) 
	where ItemId = ItemId1;


commit;
END;
/ 
Show errors; 
