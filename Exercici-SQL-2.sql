/* 1. Quantitat de registres de la taula de vols */

SELECT count(*) as total FROM flights;

/* 2. Retard promig de sortida i arribada segons l'aeroport origen */

SELECT origin, AVG(ArrDelay) as prom_arribades, AVG(DepDelay) as prom_sortides
FROM flights GROUP BY Origin;

/* 3. Retard promig d’arribada dels vols, per mesos, anys i segons l’aeroport origen */

SELECT origin, colYear, colMonth, AVG(ArrDelay) as prom_arribades
FROM flights GROUP BY Origin, colYear, colMonth ORDER BY origin, colYear, colMonth;

/* 4. Retard promig d’arribada dels vols, per mesos, anys i segons l’aeroport origen pero en comptes del codi de l’aeroport es mostra el nom de la ciutat. */

SELECT city, colYear, colMonth, AVG(ArrDelay) as prom_arribades
FROM flights 
LEFT JOIN usairports ON usairports.IATA = flights.Origin
GROUP BY city, colYear, colMonth ORDER BY city, colYear, colMonth;

/* 5. Companyies amb més vols cancelats per mesos i any, on les companyies amb més cancel·lacions apareguin les primeres. */

SELECT UniqueCarrier, colYear, colMonth, AVG(ArrDelay) as avg_delay, SUM(Cancelled) AS total_cancelled
FROM flights WHERE Cancelled>0
GROUP BY Cancelled, UniqueCarrier, colMonth, colYear  
ORDER BY total_cancelled DESC;

/* 6. Identificador dels 10 avions que més distància han recorregut fent vols. */

SELECT TailNum, SUM(Distance) AS total_distance
FROM flights WHERE NOT TailNum = ''
GROUP BY TailNum
ORDER BY total_distance DESC LIMIT 10;

/* 7. Companyies amb retard promig només d’aquelles les quals els seus vols arriben al seu destí amb un retràs promig major de 10 minuts. */

SELECT UniqueCarrier, AVG(ArrDelay) AS avg_delay
FROM flights
GROUP BY UniqueCarrier HAVING avg_delay>10
ORDER BY avg_delay DESC;



