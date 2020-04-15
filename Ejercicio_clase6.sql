
#1
select first_name, last_name 
 from actor a  
  where EXISTS (select *
  				from actor a2
  				where a.last_name = a2.last_name
  				and a.actor_id <> a2.actor_id )
   order by last_name;
   
  
 #5
 


 