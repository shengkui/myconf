SELECT `OrderNumber`,`DueDate`,`Quantity`,`ReadyQuantity`,`WorkInProgressQuantity`,`ScrapQuantity`,
    `Name`,`OrderStatus`,`DateStarted`,`DateCompleted`,`BatchNumber`
FROM productionorder
WHERE (
    CASE WHEN CAST(`OrderStatus` AS CHAR) = '0' THEN false
         WHEN CAST(`OrderStatus` AS CHAR) = '1' THEN false
         WHEN CAST(`OrderStatus` AS CHAR) = '2' THEN false
         WHEN CAST(`OrderStatus` AS CHAR) = '3' THEN false
         WHEN CAST(`OrderStatus` AS CHAR) = '4' THEN true
         ELSE CAST(`OrderStatus` AS CHAR) = '紧急' END)