create table photo (photo_id string, business_id string, caption string, label string) using org.apache.spark.sql.json options (path '/tmp/yelp/yelp_academic_dataset_photo.json');



create table photo_2 using org.apache.spark.sql.json options (path '/tmp/yelp/yelp_academic_dataset_photo.json');

create table user_json using org.apache.spark.sql.json options (path '/tmp/yelp/yelp_academic_dataset_user.json');

 create table user_parquet
using parquet options (compression = 'uncompressed',path '/tmp/yelp/parquet/yelp_academic_dataset_photo')
 as select * from user_json where 1=0;

 insert into user_parquet select * from user_json;




create table tip_json using org.apache.spark.sql.json options (path '/tmp/yelp/yelp_academic_dataset_tip.json');

 create table tip_parquet
using parquet options (compression = 'gzip',path '/tmp/yelp/parquet/yelp_academic_dataset_tip')
 as select * from tip_json where 1=0;

 insert into tip_parquet select * from tip_json;


select u.user_id, count(t.user_id) as cnt_tips
 from user_parquet u
 left join tip_parquet t
   on t.user_id = u.user_id
 group by u.user_id
