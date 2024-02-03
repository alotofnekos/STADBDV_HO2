# Q1
SELECT
    p.ProductLine,
    MONTH(s.Date) AS Month,
    YEAR(s.Date) AS Year,
    AVG(s.Quantity) AS AvgMonthlySales
FROM
    godailysales s
JOIN
    goproducts p ON s.ProductNumber = p.ProductNumber
GROUP BY
    p.ProductLine, MONTH(s.Date), YEAR(s.Date)
ORDER BY
    p.ProductLine, YEAR(s.Date), MONTH(s.Date);
# Q1_A
SELECT
    p.ProductLine,
    p.ProductBrand,
    MONTH(s.Date) AS Month,
    YEAR(s.Date) AS Year,
    AVG(s.Quantity) AS AvgMonthlySales
FROM
    godailysales s
JOIN
    goproducts p ON s.ProductNumber = p.ProductNumber
GROUP BY
    p.ProductLine, p.ProductBrand, MONTH(s.Date), YEAR(s.Date)
ORDER BY
    p.ProductLine, p.ProductBrand, YEAR(s.Date), MONTH(s.Date);
#Q1_B
SELECT
    p.ProductLine,
    MONTH(s.Date) AS Month,
    YEAR(s.Date) AS Year,
    SUM((s.UnitSalePrice - p.UnitCost) * s.Quantity) AS TotalProfit
FROM
    godailysales s
JOIN
    goproducts p ON s.ProductNumber = p.ProductNumber
GROUP BY
    p.ProductLine, MONTH(s.Date), YEAR(s.Date)
ORDER BY
    p.ProductLine, YEAR(s.Date), MONTH(s.Date);
    
#Q4_A
SELECT
    distinct p.ProductNumber,
    p.ProductBrand,
    p.Product
FROM
    goproducts p
JOIN
    godailysales s ON p.ProductNumber = s.ProductNumber
WHERE
    p.ProductNumber NOT IN (
        SELECT distinct ProductNumber
        FROM godailysales
        WHERE Date BETWEEN '2015-01-01' AND '2015-12-31'
    );

#Q4_B
SELECT DISTINCT p.ProductBrand
FROM goproducts p
JOIN godailysales s ON p.ProductNumber = s.ProductNumber
WHERE p.ProductBrand NOT IN (
    SELECT DISTINCT p.ProductBrand
    FROM goproducts p
    JOIN godailysales s ON p.ProductNumber = s.ProductNumber
    WHERE s.Date BETWEEN '2015-01-01' AND '2015-12-31'
);

    
