INSERT INTO `jdbc`.`actordirector`
(`actor_id`,
`director_id`,
`timestamp`)
VALUES
(1,
1,
0);

select * from actordirector;

select actor_id,director_id from actordirector group by actor_id,director_id having count(*)>=3;
