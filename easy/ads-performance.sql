--1322 
 
 INSERT INTO `jdbc`.`ads`
(`ad_id`,
`user_id`,
`action`)
VALUES
(1,
1,
'Clicked');

select * from ads;

select ad_id, ifnull(round(avg(
case 
	when action='Clicked' then 1
    when action='Viewed' then 0
    else null
end
)*100, 
2),
0) as ctr from ads group by ad_id order by ctr desc, ad_id asc;

