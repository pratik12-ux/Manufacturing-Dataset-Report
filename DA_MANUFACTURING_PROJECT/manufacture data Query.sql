                                    /*MANUFACTURING ANALYSIS QUERY*/
                       ----------------------------------------------------------
-- 1)Total Manufacture Qty

SELECT sum(Manufactured_Qty) as total_Manufacure_Qty FROM da.manufacture;
--------------------------------------------------------------------------------------------------------------------------------
-- 2)Total Rejected  Qty

SELECT sum(Rejected_Qty) as total_Rejected_Qty FROM da.manufacture;
--------------------------------------------------------------------------------------------------------------------------------
-- 3)Total Processed  Qty

SELECT sum(Processed_Qty) as total_Processed_Qty FROM da.manufacture;
---------------------------------------------------------------------------------------------------------------------------------
-- 4)Wastage %

SELECT Emp_Name,Processed_Qty, Rejected_Qty,
(Rejected_Qty*100.0/Processed_Qty) as Wastage_Percentage 
 FROM da.manufacture;
 -------------------------------------------------------------------------------------------------------------------------------
 -- 5) Top10 Employe wise Rejected Qty
 
 SELECT Emp_Name,sum(Rejected_Qty) FROM da.manufacture
 group by Emp_Name
 order by sum(Rejected_Qty) desc
 limit 10;
 ------------------------------------------------------------------------------------------------------------------------------
 -- 6)Department wise manufacture and rejected Qty
 
 SELECT Department_Name,sum(manufactured_Qty), sum(rejected_Qty) FROM da.manufacture
 group by Department_Name;
 
 -- 7) Production camparison trend
 
 SELECT Doc_Date,SUM(Processed_Qty), sum(Produced_Qty) from da.manufacture
 group by Doc_Date;
 
 -- 8) Top 10 Machine wise Rejected Qty
 
 SELECT Machine_Code,sum(Rejected_Qty) FROM da.manufacture
 group by Machine_Code
 order by sum(Rejected_Qty) desc
 limit 10;
 
 -- 9) Employe wise ontime delivery period manufactured Qty
 
 SELECT Emp_Name,Delivery_Period,sum(Manufactured_Qty) FROM da.manufacture
 Where Delivery_Period="On time" 
 group by Emp_Name;
 



