select * from friend_request;

select * from request_accepted;

INSERT INTO `jdbc`.`request_accepted`
(`request_id`,
`accepter_id`,
`accept_date`)
VALUES
(1, 3, '2016-06-08'), (2, 3, '2016-06-08'), (3, 4, '2016-06-09'), (3, 4, '2016-06-10');


select
  case when round(accepted.count / requested.count, 2) is null 
       then 0.0 
       else round(accepted.count / requested.count, 2) 
  end  accept_rate 
from
  (select count(1) count 
   from (select distinct 
           request_id, 
           accepter_id 
         from request_accepted) a) accepted,
  (select count(1) count 
   from (select distinct 
           sender_id, 
           send_to_id from friend_request) b) requested
where 1 = 1;

SELECT IFNULL(
    ROUND(
        (SELECT COUNT(DISTINCT request_id, accepter_id) FROM request_accepted)
        /
        (SELECT COUNT(DISTINCT sender_id, send_to_id) FROM friend_request)
        , 2
    )
    , 0.00
) AS accept_rate;

SELECT *,COUNT(DISTINCT request_id, accepter_id) FROM request_accepted;

-- | sender_id | send_to_id |request_date|
-- |-----------|------------|------------|
-- | 1         | 2          | 2016_06-01 |
-- | 1         | 3          | 2016_06-01 |
-- | 1         | 4          | 2016_06-01 |
-- | 2         | 3          | 2016_06-02 |
-- | 3         | 4          | 2016-06-09 |

-- Here (1,2) , (1,3), (1,4), (2,3), (3,4) are distinct values so count is 5.

-- | requester_id | accepter_id |accept_date |
-- |--------------|-------------|------------|
-- | 1            | 2           | 2016_06-03 |
-- | 1            | 3           | 2016-06-08 |
-- | 2            | 3           | 2016-06-08 |
-- | 3            | 4           | 2016-06-09 |
-- | 3            | 4           | 2016-06-10 |

-- Here (1,2), (1,3), (2,3), (3,4) are distinct values so count is 4.
-- Notice here that (3,4) and (3,4) are repeating so we count it as 1.

-- select round(ifnull(
--   (select count(*) from (select distinct requester_id, accepter_id from request_accepted) as a)
--   /
--   (select count(*) from (select distinct sender_id, send_to_id from friend_request) as b)    
--   ,0),2) as accept_rate;

SELECT *,COUNT(DISTINCT sender_id, send_to_id) FROM friend_request;

