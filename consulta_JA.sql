
select cm.name_model,cb.name_brand, cg.name_group, c.date_purchase, c.car_number_plate,c2.name_color, c.total_kms,i.insurer_company, c.policy_number 
from practica_julietaabbiendi.cars c inner join practica_julietaabbiendi.car_models cm 
on c.id_model = cm.id_model 
inner join practica_julietaabbiendi.car_brands cb
on cm.id_brand = cb.id_brand
inner join  practica_julietaabbiendi.car_group cg
on cg.id_group = cb.id_group
inner join practica_julietaabbiendi.colors c2
on c2.id_color = c.id_color 
inner join practica_julietaabbiendi.insurer i
on i.id_insurer = c.id_insurer