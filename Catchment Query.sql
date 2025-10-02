-- All transactions since 2024

SELECT C.CentreName, C.Lat AS CentreLat, C.Long AS CentreLong, PT.latitude AS CustomerLat, PT.longitude AS CustomerLong, COUNT(Ticket) AS TotalTickets, SUM(Total) AS TotalValue
FROM [dbo].[vw_PlayTransactions] PT
LEFT JOIN [dbo].[GLLcentres] C
    ON PT.Centre = C.[Flow CentreName]
WHERE ActivityType NOT IN ('Socks', 'Birthday Party')
    AND CentreName IS NOT NULL
    AND C.Lat IS NOT NULL
    AND C.Long IS NOT NULL
    AND PT.latitude IS NOT NULL
    AND PT.longitude IS NOT NULL
GROUP BY C.CentreName, C.Lat, C.Long, PT.latitude, PT.longitude