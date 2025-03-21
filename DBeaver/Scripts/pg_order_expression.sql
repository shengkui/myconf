SELECT "ORDERNUMBER", "CUSTOMERNAME", "QUANTITYORDERED", "PRICEEACH", "QUANTITYORDERED"*"PRICEEACH" total1
  FROM public.car_sales_data ORDER BY "QUANTITYORDERED"*"PRICEEACH" DESC LIMIT 10;

SELECT "Order ID", "Total Revenue", "Units Sold"*"Unit Price" total_revenue
  FROM public.supermarket_sales_data ORDER BY total_revenue DESC LIMIT 10;