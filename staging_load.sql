-- Create snowflake temporary staging area to upload the files
create or replace stage my_csv_stage file_format = mycsvformat;
create or replace stage my_json_stage file_format = myjsonformat;

-- Upload files in Snowflake temporary stage 
put file:///shared/data/USW00023169-temperature-degreeF.csv @my_csv_stage auto_compress=true parallel=4;

put file:///shared/data/USW00023169-LAS_VEGAS_MCCARRAN_INTL_AP-precipitation-inch.csv @my_csv_stage auto_compress=true parallel=4;

put file:///shared/data/extracted/yelp_academic_dataset_covid_features.json @my_json_stage auto_compress=true parallel=4;

put file:///shared/data/extracted/yelp_academic_dataset_business.json @my_json_stage auto_compress=true parallel=4;

put file:///shared/data/extracted/yelp_academic_dataset_checkin.json @my_json_stage auto_compress=true parallel=8;

put file:///shared/data/extracted/yelp_academic_dataset_review.json @my_json_stage auto_compress=true parallel=30;

put file:///shared/data/extracted/yelp_academic_dataset_tip.json @my_json_stage auto_compress=true parallel=8;

put file:///shared/data/extracted/yelp_academic_dataset_user.json @my_json_stage auto_compress=true parallel=20;


-- Load the staging tables
copy into TEMPERATURE from @my_csv_stage/USW00023169-temperature-degreeF.csv.gz file_format=mycsvformat on_error='skip_file';

copy into PRECIPITATION from @my_csv_stage/USW00023169-LAS_VEGAS_MCCARRAN_INTL_AP-precipitation-inch.csv.gz file_format=mycsvformat on_error='skip_file';

copy into COVID_FEATURES from @my_json_stage/yelp_academic_dataset_covid_features.json.gz file_format=myjsonformat on_error='skip_file';

copy into BUSINESS from @my_json_stage/yelp_academic_dataset_business.json.gz file_format=myjsonformat on_error='skip_file';

copy into CHECKIN from @my_json_stage/yelp_academic_dataset_checkin.json.gz file_format=myjsonformat on_error='skip_file';

copy into REVIEW from @my_json_stage/yelp_academic_dataset_review.json.gz file_format=myjsonformat on_error='skip_file';

copy into TIP from @my_json_stage/yelp_academic_dataset_tip.json.gz file_format=myjsonformat on_error='skip_file';

copy into USER from @my_json_stage/yelp_academic_dataset_user.json.gz file_format=myjsonformat on_error='skip_file';

