SET PAGESIZE 30
SET LINESIZE 300

set termout off

	-- @ /home/draigoza/Desktop/MasterOwl_Sales/make_Report.sql;

spool sales_Report.txt

ttitle center "Master Owl Store"
btitle center "DIEGO RAIGOZA" 

COLUMN custId heading "Customer ID"
COLUMN orderId heading "Orders ID"
COLUMN ItemId heading "Item ID"
COLUMN name heading "Name"
COLUMN phone_email heading "Phone/Email"
COLUMN address heading "Address"
COLUMN title heading "Title"
COLUMN price format $99.99 heading "Price"
column no_of_items format 99 heading "NoItems"
COLUMN date_of_order heading "Ordered"
COLUMN shipped_Date heading "Shipped"
COLUMN ItemOrder.total_Cost*0.05 heading "Tax"
COLUMN shipping_Fee format $99.99 heading "Shipping Fee"
COLUMN total_Cost heading "GRAND TOTAL"

SELECT Customer1.custId, ItemOrder.orderId, StoreItems.ItemId, Customer1.name, Customer1.phone_email, Customer1.address, ComicBook.title, StoreItems.price, ItemOrder.no_of_items, ItemOrder.date_of_order, ItemOrder.shipped_Date, ItemOrder.total_Cost*0.05, ItemOrder.shipping_Fee, ItemOrder.total_Cost
FROM Customer1, ItemOrder, StoreItems, ComicBook
WHERE Customer1.custId = '401' AND ItemOrder.custId = '401' AND StoreItems.ItemId = ItemOrder.ItemId AND ComicBook.ItemId = ItemOrder.ItemId;

spool off;

CLEAR COLUMNS
CLEAR BREAK
TTITLE OFF 
BTITLE OFF
SET VERIFY OFF 
SET FEEDBACK OFF
SET RECSEP OFF
SET ECHO OFF
