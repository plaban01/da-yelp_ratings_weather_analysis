-- Populate BUSINESS table
INSERT INTO BUSINESS
SELECT 
    data:business_id::string business_id,
    data:name::string name,
    data:address::string address,
    data:state::string state,
    data:city::string city,
    data:postal_code::string postal_code,
    data:review_count::int review_count,
    data:stars::int stars,
    data:is_open::int is_open
FROM UDACITYPROJECT.STAGING.BUSINESS;

-- Populate Covid features table
INSERT INTO COVID_FEATURES
SELECT 
    data:business_id::string business_id,
    data:"Call To Action enabled"::string call_to_action_enabled,
    data:"Covid Banner"::string covid_banner,
    data:"Grubhub enabled"::string grubhub_enabled,
    data:"Request a Quote Enabled"::string request_quote_enabled,
    data:"Temporarily Closed Unitl"::string temporarily_closed_until,
    data:"Virtual Services Offered"::string virtual_services_offered,
    data:"delivery or takeout"::string delivery_or_takeout,
    data:"highlights"::string highlights
FROM UDACITYPROJECT.STAGING.COVID_FEATURES;

-- Populate Checkin table
INSERT INTO CHECKIN (BUSINESS_ID, DATE)
SELECT 
    data:business_id::string business_ID, 
    y.value::timestamp DATE
FROM UDACITYPROJECT.STAGING.CHECKIN, LATERAL FLATTEN(INPUT=>SPLIT(data:date,',')) y;

-- Populate User table
INSERT INTO USER
SELECT 
    data:user_id::string user_id,
    data:name::string name,
    data:average_stars::float average_stars,
    data:yelping_since::timestamp yelping_since,
    data:review_count::int review_count
FROM UDACITYPROJECT.STAGING.USER;

-- Populate Temperature table
INSERT INTO TEMPERATURE
SELECT 
    TO_DATE(DATE, 'YYYYMMDD') as DATE,
    CAST(MIN AS FLOAT) AS MIN,
    CAST(MAX AS FLOAT) AS MAX,
    CAST(NORMAL_MIN AS FLOAT) AS NORMAL_MIN,
    CAST(NORMAL_MAX AS FLOAT) AS NORMAL_MAX
FROM UDACITYPROJECT.STAGING.TEMPERATURE
ORDER BY DATE DESC;

-- Populate Precipitation table
INSERT INTO PRECIPITATION
SELECT 
    TO_DATE(DATE, 'YYYYMMDD') AS DATE,
    TRY_CAST(PRECIPITATION AS FLOAT) AS PRECIPITATION,
    CAST(PRECIPITATION_NORMAL AS FLOAT) AS PRECIPITATION_NORMAL
FROM UDACITYPROJECT.STAGING.PRECIPITATION;


-- Populate Review table
INSERT INTO REVIEW
SELECT
    data:review_id::string review_id,
    data:business_id::string business_id,
    data:user_id::string user_id,
    data:date::timestamp date,
    data:stars::int stars,
    data:cool::int cool,
    data:funny::int funny,
    data:useful::int useful,
    data:text::string review_txt
FROM UDACITYPROJECT.STAGING.REVIEW;

-- Populate Tip table
INSERT INTO TIP
SELECT
    data:business_id::string business_id,
    data:user_id::string user_id,
    data:compliment_count::int compliment_count,
    data:text::string tip_txt,
    data:date::timestamp date
FROM UDACITYPROJECT.STAGING.TIP;