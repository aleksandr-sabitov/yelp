-- converting PHOTO json to parquet format
create table photo_json using org.apache.spark.sql.json options (path '/tmp/yelp/yelp_academic_dataset_photo.json');

create table photo_parquet
using parquet options (compression = 'gzip',path '/tmp/yelp/parquet/photo')
as select * from photo_json where 1=0;

insert into photo_parquet select * from photo_json;

-- converting checkin json to parquet format
create table checkin_json using org.apache.spark.sql.json options (path '/tmp/yelp/yelp_academic_dataset_checkin.json');

create table checkin_parquet
using parquet options (compression = 'gzip',path '/tmp/yelp/parquet/checkin')
as select * from checkin_json where 1=0;

insert into checkin_parquet select * from checkin_json;


-- converting USER json to parquet format
create table user_json using org.apache.spark.sql.json options (path '/tmp/yelp/yelp_academic_dataset_user.json');

create table user_parquet
using parquet options (compression = 'gzip',path '/tmp/yelp/parquet/user')
as select * from user_json where 1=0;

insert into user_parquet select * from user_json;

-- converting TIP json to parquet format
create table tip_json using org.apache.spark.sql.json options (path '/tmp/yelp/yelp_academic_dataset_tip.json');

create table tip_parquet
using parquet options (compression = 'gzip',path '/tmp/yelp/parquet/tip')
as select * from tip_json where 1=0;

insert into tip_parquet select * from tip_json;

-- converting BUSINESS json to parquet format
create table business_json using org.apache.spark.sql.json options (path '/tmp/yelp/yelp_academic_dataset_business.json');

create table business_parquet
using parquet options (compression = 'gzip',path '/tmp/yelp/parquet/business')
as select * from business_json where 1=0;

insert into business_parquet select * from business_json;


-- converting REVIEW json to parquet format
create table review_json using org.apache.spark.sql.json options (path '/tmp/yelp/yelp_academic_dataset_review.json');

create table review_parquet
using parquet options (compression = 'gzip',path '/tmp/yelp/parquet/review')
as select * from review_json where 1=0;

insert into review_parquet select * from review_json;

