/* table for keeping track of users who visit ecommerce site */
CREATE TABLE User {
    userID PRIMARY KEY NOT NULL;
    userName VARCHAR NOT NULL;
    userAddress VARCHAR NOT NULL;
}
/* table for orders that are made by the users */
CREATE TABLE Order {
    orderID INT FOREIGN KEY NOT NULL;
    orderQuantity INT NOT NULL;
    orderPrice FLOAT(10, 2) NOT NULL;
    orderAddress VARCHAR NOT NULL;
}
/* table for payments made by the users for their order */
CREATE TABLE Payment {
    paymentID INT FOREIGN KEY;
    paymentMethod TEXT;
    paymentStatus BOOLEAN;
}
