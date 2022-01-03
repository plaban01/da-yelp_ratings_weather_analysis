SELECT 
    b.NAME, 
    r.STARS, 
    t.DATE, 
    t.MIN, 
    t.MAX, 
    p.PRECIPITATION
FROM REVIEW r
INNER JOIN BUSINESS b
ON r.BUSINESS_ID = b.BUSINESS_ID
LEFT JOIN TEMPERATURE t
ON DATE(r.DATE) = t.DATE
LEFT OUTER JOIN PRECIPITATION p
ON DATE(r.DATE) = p.DATE;