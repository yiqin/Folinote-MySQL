/*Find all pairs of users that followered by at least one user in common*/
SELECT DISTINCT F_1.username_leader AS user1, 
F_2.username_leader AS user2
FROM Follow F_1 JOIN Follow F_2
USING (username_follower)
WHERE F_1.username_leader != F_2.username_leader;

/**/