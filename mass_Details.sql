Create or Replace Procedure mass_Details(custId11 Customer1.custId%type, start1 DATE)
As 

CURSOR c1 IS SELECT custId, name, phone_email, address from Customer1 where custId = custId11;

CURSOR c2 IS SELECT ItemId from ItemOrder where custId = custId11;

CURSOR c3 IS SELECT orderId, shipped_Date, date_of_order, shipping_Fee from ItemOrder where start1 < date_of_order AND custId = custId11;



	-- @ /home/draigoza/Desktop/MasterOwl_Sales/mass_Details.sql;
	-- exec mass_Details('401','21-DEC-10');

	l_custId Customer1.custId%type;               --  	      ItemOrder
	l_name Customer1.name%type;               --                Customer1
	l_phone_email Customer1.phone_email%type;      --           Customer1
	l_address Customer1.address%type;--             --          Customer1
	l_orderId ItemOrder.orderId%type;            --        	  ItemOrder
	l_ItemId ItemOrder.ItemId%type; 			--                StoreItems
	l_title ComicBook.title%type; --                            ComicBook
	l_price StoreItems.price%type; --                           StoreItems
	l_date_of_order ItemOrder.date_of_order%type; --  	      ItemOrder
	l_shipped_Date ItemOrder.shipped_Date%type; --              ItemOrder
	l_total_Cost ItemOrder.total_Cost%type; --                  ItemOrder
	l_taxD StoreItems.price%type;
	l_shipping_Fee ItemOrder.shipping_Fee%type; --              ItemOrder
	l_discount StoreItems.price%type;

BEGIN

	open c1;
	--open c2;
	open c3;

	FETCH c1 INTO l_custId, l_name, l_phone_email, l_address;

	DBMS_OUTPUT.PUT_LINE('Customer Details: ' || l_custId || ' ' || l_name || ' ' || l_phone_email || ' ' || l_address);

	FOR ItemId IN c2
	LOOP
		FETCH c3 into l_orderId, l_shipped_Date, l_date_of_order, l_shipping_Fee;
		SELECT title into l_title from ComicBook where ComicBook.ItemId = ItemId.itemId;
		SELECT price into l_price from StoreItems where StoreItems.ItemId = ItemId.itemId;
		SELECT total_Cost into l_total_Cost from ItemOrder where ItemOrder.ItemId = ItemId.itemId;
		

		DBMS_OUTPUT.PUT_LINE('--------------------------------------------------');
		DBMS_OUTPUT.PUT_LINE('Order ID : ' || l_orderId);
		DBMS_OUTPUT.PUT_LINE('Item ID : ' || ItemId.itemId);
		DBMS_OUTPUT.PUT_LINE('Item name : ' || l_title);
		DBMS_OUTPUT.PUT_LINE('Price : ' || l_price);
		DBMS_OUTPUT.PUT_LINE('Date ordered : ' || l_date_of_order);
		DBMS_OUTPUT.PUT_LINE('Shipped date : ' || l_shipped_Date);
		DBMS_OUTPUT.PUT_LINE('Tax : ' || 0.05 * l_total_Cost);
		DBMS_OUTPUT.PUT_LINE('Shipping fee : ' || l_shipping_Fee);
		DBMS_OUTPUT.PUT_LINE('Total cost : ' || l_total_Cost);
		DBMS_OUTPUT.PUT_LINE('--------------------------------------------------');
	
	END LOOP;

	close c1;
	--close c2;
	close c3;
	
commit; 
END; 
/ 
Show errors; 
