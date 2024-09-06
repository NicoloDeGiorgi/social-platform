-Seleziona gli utenti che hanno postato almeno un video

select `users`.*
from `users`
inner join `medias`
on `users`.id = `medias`.user_id 
where `medias`.`type` = 'video'
group by `users`.id ;

Seleziona tutti i post senza Like (13)

select `posts`.*
FROM `posts`
left join `likes`
on `posts`.id = `likes`.post_id
where `likes`.post_id is null;

-Conta il numero di like per ogni post (solo select 175)

select `likes`.post_id , count(`likes`.post_id) AS 'likes_per_post'
from `likes`
group by `likes`.post_id

-" " " " (select + join 165)

select `posts`.id as `post_id`, count(`likes`.post_id) as `likes_number`
from `posts`
left join `likes`
on `posts`.id = `likes`.post_id 
group by `posts`.id ;

-Ordina gli utenti per il numero di media caricati (25) 

select `users`.*, count(*) as `uploaded_medias` 
from `users`
inner join `medias`
on `users`.id = `medias`.user_id 
group by `users`.id
order by `uploaded_medias` desc;

-Ordina gli utenti per totale di likes ricevuti nei loro posts (25) 

select `users`.*, count(*) as `total_likes` 
from `users`
inner join `likes`
on `users`.id = `likes`.user_id 
group by `users`.id
order by `total_likes` asc;