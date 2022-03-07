INSERT INTO `jdbc`.`email`
(`id`,
`email`)
VALUES
(1, 'john@example.com'), (2, 'bob@example.com'), (3, 'john@example.com');

select * from email;

select e1.* from email e1, email e2 where e1.email=e2.email and e1.id>e2.id;

-- delete
delete e1.* from email e1, email e2 where e1.email=e2.email and e1.id>e2.id;

SELECT p.* FROM email p INNER JOIN email p2 ON  p.Email = p2.Email AND  p.Id > p2.Id;