CREATE TABLE User
(
  UserID INT NOT NULL,
  Password INT NOT NULL,
  Mail INT NOT NULL,
  Role INT NOT NULL,
  Phone INT NOT NULL,
  Age INT NOT NULL,
  PRIMARY KEY (UserID)
);

CREATE TABLE Restaurant
(
  Restaurant_ID INT NOT NULL,
  Restaurant_Name INT NOT NULL,
  Adress_Line INT NOT NULL,
  Phone_Number INT NOT NULL,
  Delivery_Service INT NOT NULL,
  Restaurant_Type INT NOT NULL,
  Restaurant_Ratings INT NOT NULL,
  Woner INT NOT NULL,
  PRIMARY KEY (Restaurant_ID),
  FOREIGN KEY (Woner) REFERENCES User(UserID)
);

CREATE TABLE Recipes_and_Blog
(
  Title INT NOT NULL,
  Time_Stamp INT NOT NULL,
  Details INT NOT NULL,
  Thumnail INT NOT NULL,
  Video_file INT NOT NULL,
  Blog_ID INT NOT NULL,
  UserID INT NOT NULL,
  PRIMARY KEY (Blog_ID),
  FOREIGN KEY (UserID) REFERENCES User(UserID)
);

CREATE TABLE Food
(
  Food_ID INT NOT NULL,
  Name INT NOT NULL,
  Category INT NOT NULL,
  Image-1 INT NOT NULL,
  Image-2 INT NOT NULL,
  Image-3 INT NOT NULL,
  Details INT NOT NULL,
  Fat INT NOT NULL,
  Protein INT NOT NULL,
  Sugar INT NOT NULL,
  BP INT NOT NULL,
  Colestorel INT NOT NULL,
  Carbohydret INT NOT NULL,
  Iron INT NOT NULL,
  Iodin INT NOT NULL,
  Blog_ID INT NOT NULL,
  PRIMARY KEY (Food_ID),
  FOREIGN KEY (Blog_ID) REFERENCES Recipes_and_Blog(Blog_ID)
);

CREATE TABLE FoodAvailability
(
  Price INT NOT NULL,
  Food_ID INT NOT NULL,
  Restaurant_ID INT NOT NULL,
  FOREIGN KEY (Food_ID) REFERENCES Food(Food_ID),
  FOREIGN KEY (Restaurant_ID) REFERENCES Restaurant(Restaurant_ID)
);

CREATE TABLE Reviews&Ratings
(
  Review_ID INT NOT NULL,
  Review INT,
  Rating(out_of_5) INT NOT NULL,
  UserID INT NOT NULL,
  Restaurant_ID INT,
  Food_ID INT,
  FOREIGN KEY (UserID) REFERENCES User(UserID),
  FOREIGN KEY (Restaurant_ID) REFERENCES Restaurant(Restaurant_ID),
  FOREIGN KEY (Food_ID) REFERENCES Food(Food_ID)
);

CREATE TABLE Suggestion
(
  Restaurant_ID INT,
  Sugg_provider INT NOT NULL,
  Food_ID INT,
  Sugg_Receiver INT NOT NULL,
  FOREIGN KEY (Restaurant_ID) REFERENCES Restaurant(Restaurant_ID),
  FOREIGN KEY (Sugg_provider) REFERENCES User(UserID),
  FOREIGN KEY (Food_ID) REFERENCES Food(Food_ID),
  FOREIGN KEY (Sugg_Receiver) REFERENCES User(UserID)
);

CREATE TABLE Advertise
(
  Ad_ID INT NOT NULL,
  Budget INT NOT NULL,
  Start_Date INT NOT NULL,
  End_Date INT NOT NULL,
  Target_Location INT NOT NULL,
  Target_User INT NOT NULL,
  UserID INT NOT NULL,
  Food_ID INT NOT NULL,
  Restaurant_ID INT NOT NULL,
  PRIMARY KEY (Ad_ID),
  FOREIGN KEY (UserID) REFERENCES User(UserID),
  FOREIGN KEY (Food_ID) REFERENCES Food(Food_ID),
  FOREIGN KEY (Restaurant_ID) REFERENCES Restaurant(Restaurant_ID)
);
