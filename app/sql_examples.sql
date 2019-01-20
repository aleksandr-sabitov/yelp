create table photo
using parquet options (compression = 'gzip',path '/tmp/yelp/parquet/photo');

create table checkin
using parquet options (compression = 'gzip',path '/tmp/yelp/parquet/checkin');

create table users
using parquet options (compression = 'gzip',path '/tmp/yelp/parquet/user');

create table tip
using parquet options (compression = 'gzip',path '/tmp/yelp/parquet/tip');

create table business
using parquet options (compression = 'gzip',path '/tmp/yelp/parquet/business');

create table review
using parquet options (compression = 'gzip',path '/tmp/yelp/parquet/review');


-- example queries

select count(*) from photo_parquet;
select count(*) from checkin_parquet;
select count(*) from user_parquet;
select count(*) from tip_parquet;
select count(*) from business_parquet;
select count(*) from review_parquet;


select u.user_id, count(t.user_id) as cnt_tips
 from users u
 left join tip t
   on t.user_id = u.user_id
 group by u.user_id
 having count(t.user_id) >0
 order by cnt_tips desc
 limit 50;

select b.business_id, sum(r.cool) as sum_cool,  avg(r.stars) as avg_stars
 from business b
 left join review r
   on b.business_id = r.business_id
 where b.attributes.WiFi = 'free'
 group by b.business_id
 having sum(r.cool) > 0
 limit 5;
