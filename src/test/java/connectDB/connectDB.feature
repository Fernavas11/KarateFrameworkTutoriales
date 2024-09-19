Feature: connect DB

  Background:
    * def config = {username: 'root' , password: '', url:'jdbc:mysQL://localhost:3306/registros' , driverClassName:'com.mysql.cj.jdbc.Driver' }
    * def DbUtils = Java.type('connectDB.DbUtils')
    * def db = new DbUtils(config)

  Scenario: lectura de valores de la DB
    * def usuario = db.readRows('SELECT * FROM usuarios')
    Then print 'usuario--' ,usuario