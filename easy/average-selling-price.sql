INSERT INTO `jdbc`.`prices`
(`product_id`,
`start_date`,
`end_date`,
`price`)
VALUES
(1, '2019-02-17', '2019-02-28', 5), (1, '2019-03-01', '2019-03-22', 20),
(2, '2019-02-01', '2019-02-20', 15), (2, '2019-02-21', '2019-03-31', 30);

INSERT INTO `jdbc`.`unitssold`
(`product_id`,
`purchase_date`,
`units`)
VALUES
(1, '2019-02-25', 100), (1, '2019-03-01', 15),
(2, '2019-02-10', 200), (2, '2019-03-22', 30);

select * from prices, unitssold;

select p.product_id, round((sum(u.units*p.price)+0.0)/(sum(units)+0.0), 2) avg_price from prices p inner join unitssold u where u.purchase_date between p.start_date and p.end_date group by p.product_id;

-- If we use natural join no need to specify on p.product_id=u.product_id it is implicitly assumed.
-- An alias is necessary for subquery eg d below

Select d.product_id, round(sum(price*units)/sum(units),2) as average_price
from(
Select *
from prices p
natural join 
unitssold u
where u.purchase_date between p.start_date and p.end_date) d
group by d.product_id ;

select product_id,round(sum(a)/sum(units),2) as average_price from(
    select 
        p.product_id,
        price,units,
        price*units as a
    from Prices p 
    left join UnitsSold u
    on p.product_id=u.product_id and (purchase_date<=end_date and purchase_date>=start_date))t
group by product_id;

select t.product_id, round(sum(s)/sum(units), 2) as average_price from (
  select p.product_id,units,p.price*units s from prices p inner join unitssold u on p.product_id=u.product_id  where u.purchase_date between p.start_date and p.end_date) t group by t.product_id;
