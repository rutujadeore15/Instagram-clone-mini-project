
use ig_clone;

/* 1) How many times does the average user post?*/
select count(*) from photos;
select count(*) from users;

select round((select count(*)from photos)/(select count(*)from users),2) as avg_users_post; 


/* 2) Find the top 5 most used hashtags.*/
select * from tags;
select * from photo_tags;

select tag_name, count(tag_name) as total
from tags t
inner join photo_tags pt
on t.id = pt.tag_id
group by t.id
order by total desc
limit 5;


/* 3) Find users who have liked every single photo on the site.*/

select * from users;
select * from  likes;

select  user_id,username,count(*) as total_likes
from users  us
inner join likes li
on us.id =li.user_id
group by user_id
having  total_likes = (select count(*) from photos);

			
/* 4) Retrieve a list of users along with their usernames 
and the rank of their account creation, ordered by the creation date in ascending order.*/

select id,username,rank()over(order by created_at) as rank_creation
from  users ;


/* 5) List the comments made on photos with their comment texts, photo URLs,
 and usernames of users who posted the comments. Include the comment count for each photo*/
 select * from users;
 select * from photos;
 select * from comments;
 
 
select ct.comment_text,pt.id as photo_id,
pt.image_url as photo_urls,us.username,
count(ct.id)over(partition by pt.id order by image_url)as count_comment
from users us
inner join photos pt
on pt.user_id = us.id 
inner join comments ct
on ct.photo_id = pt.id; 


/* 6) For each tag, show the tag name and the number of photos associated with that tag.
 Rank the tags by the number of photos in descending order.*/
select * from tags;
select * from photo_tags;


select tag_name,count(photo_id) as total,
rank()over(order by count(photo_id) desc) as number_photo_rank
from tags ta
inner join photo_tags pt
on ta.id = pt.tag_id
group by tag_id,tag_name;


/* 7) List the usernames of users who have posted photos along with the count of photos they have posted.
 Rank them by the number of photos in descending order.*/
select * from users;
select * from photos;


select username,count(pt.id),rank()over(order by count(pt.id) desc)
from users us
inner join photos pt
on us.id = pt.user_id
group by username;

/* 8) Display the username of each user along with the creation date of their first posted photo
 and the creation date of their next posted photo.*/
select * from users;
select * from photos;


select distinct us.username,pt.created_at,
first_value(pt.created_at)over(partition by us.id order by pt.created_at ) as creation_date_first_photo,
lead(pt.created_at)over(partition by us.id order by pt.created_at) as creation_date_next_posted_photo
from users us
inner join photos pt
on us.id = pt.user_id
order by us.username;


/* 9) For each comment, show the comment text, the username of the commenter,
 and the comment text of the previous comment made on the same photo.*/
select * from comments;
select * from users;


select comment_text,username,lag(comment_text)over(partition by photo_id)
from comments co
inner join users us 
on co.user_id=us.id;


/* 10) Show the username of each user along with the number of photos they have posted and
 the number of photos posted by the user before them and after them, based on the creation date.*/
select * from users;
select * from photos; 

select username,
lag(count(pt.id)) over(order by username)as photos_before,
lead(count(pt.id))over(order by username) as photos_after
from users us
inner join photos pt
on us.id = pt.user_id
group by pt.created_at,us.username;
 
 
 