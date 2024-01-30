### Creating Tables, Inserting & Selecting
import mysql.connector
from datetime import datetime, date

db = mysql.connector.connect(
    host="localhost",
    user="root",
    password="abc123456abc",
    database="testdatabase"  
    )

mycursor = db.cursor()

## enum is is allows you to select between a few different values
# mycursor.execute("CREATE TABLE Test(name VARCHAR(50) NOT NULL, created datetime NOT NULL, gender ENUM('M','F','O') NOT NULL, id int PRIMARY KEY NOT NULL AUTO_INCREMENT)")
# mycursor.execute("INSERT INTO Test(name, created, gender) VALUES (%s,%s,%s)", ('Jessica', datetime.now(), 'F'))


### Selecting Data & Altering Tables
# mycursor.execute("SELECT name, id FROM Test WHERE gender = 'M' ORDER BY id DESC")
# mycursor.execute("ALTER TABLE Test ADD COLUMN food VARCHAR(50) NOT NULL")
# drop column
# mycursor.execute("ALTER TABLE Test DROP food")
# change column name
# mycursor.execute("ALTER TABLE Test CHANGE name first_name VARCHAR(50)")

# mycursor.execute("DESCRIBE Test")

### Foreign Keys & Relating Tables
users = [('Tim', 'abc123'),
         ('Josh', 'asd456'),
         ('Adward', 'asd789')]
user_scores = [(45,100),
               (30,200),
               (46,124)]

Q1 = "CREATE TABLE Users(id int PRIMARY KEY AUTO_INCREMENT, name VARCHAR(20), passwd VARCHAR(25))"
Q2 = "CREATE TABLE Scores(userid int PRIMARY KEY, FOREIGN KEY(userid) REFERENCES Users(id), game1 int DEFAULT 0, game2 int DEFAULT 0)"

# mycursor.execute(Q1)
# mycursor.execute(Q2)
# mycursor.execute("SHOW TABLES")

# mycursor.executemany("INSERT INTO Users(name, passwd) VALUES (%s,%s)", users)
Q3 = "INSERT INTO Users(name, passwd) VALUES (%s,%s)"
Q4 = "INSERT INTO Scores(userid, game1, game2) VALUES (%s,%s,%s)"

# for x, user in enumerate(users):
#     mycursor.execute(Q3, user)
#     last_id = mycursor.lastrowid
#     mycursor.execute(Q4, (last_id,) + user_scores[x])

# db.commit()

# mycursor.execute("SELECT * FROM users")
# for x in mycursor:
#     print(x)
# mycursor.execute("SELECT * FROM scores")
# for x in mycursor:
#     print(x)


### host a MySQL server remotely (on a linux server)



