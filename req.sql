
Afficher le nombre de commande totales supérieur à 50e que l’on a dans le catalogue et la
moyenne des prix des commandes

SELECT AVG(prix_total) AS moyenne
FROM commande AS c 
WHERE c.prix_total > 50;

Insérer 3 nouvelles promotion pour les produits de chez zangiefco ou tagué “slip’ (en SQL)

INSERT INTO product_promotions (product_id, promotion_id)
VALUES (1,3), (1,4), (1,5)

INSERT INTO product_promotions (product_id, promotion_id)
VALUES (3,3), (3,4), (3,5)

Gérer les marques pour les produits (1 produit a 1 seul marque) avec title et
localisation(ville)

Afficher le nombre de marques par produits qui sont de Lyon

SELECT COUNT(e.marque) AS comptage
FROM extra AS e 
INNER JOIN villes_france_free AS v
ON v.ville_id = e.ville
WHERE v.ville_nom = 'Lyon';

Supprimer tous les avis à 0 ou dont le contenu est inférieur à 3 mots


DELETE FROM comment AS c 
WHERE c.content REGEXP ' {0,1}'
OR c.note = 0;

Afficher le nom des cartes de fidélité sur les 3 dernières commandes des utilisateurs

SELECT f.id 
FROM fidelity AS f 
INNER JOIN user AS u 
ON u.id = f.user_id
INNER JOIN
	(SELECT c.id  
     FROM commande AS c
     ORDER BY c.date ASC
     LIMIT 3  ) AS lastcommandes
ON lastcommandes.id = u.id;