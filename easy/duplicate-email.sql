INSERT INTO `jdbc`.`email`
(`id`,
`email`)
VALUES
(1, 'a@b.com'), (2, 'c@d.com'), (3, 'a@b.com');

select email from (select email from email group by email having count(email)>1)e;
