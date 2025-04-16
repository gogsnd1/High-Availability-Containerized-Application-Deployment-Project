/* table for keeping track of users who visit ecommerce site */
CREATE TABLE User {
    PRIMARY KEY userID = int;
    userName = varchar(50);
    userAddress = varchar(99);
}
/* table for orders that are made by the users */
CREATE TABLE Order {
    FOREIGN KEY orderID = int;
    orderQuantity = int;
    orderPrice = float;
    orderAddress = varchar(99);
}
/* table for payments made by the users for their order */
CREATE TABLE Payment {
    paymentID = int;
    paymentMethod = text(50);
    paymentStatus = boolean;
}