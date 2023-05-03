' Open the database connection
Dim db As DAO.Database
Set db = OpenDatabase("C:\MyDatabase.accdb")

' Sort records by last name
Dim rs As DAO.Recordset
Set rs = db.OpenRecordset("SELECT * FROM Customers ORDER BY LastName")

' Loop through the records and display them
Do While Not rs.EOF
    Debug.Print rs("LastName") & ", " & rs("FirstName")
    rs.MoveNext
Loop

' Filter records by state
rs.Filter = "State = 'CA'"

' Loop through the filtered records and display them
Do While Not rs.EOF
    Debug.Print rs("LastName") & ", " & rs("FirstName")
    rs.MoveNext
Loop

' Update a record
db.Execute "UPDATE Customers SET Phone = '555-1234' WHERE LastName = 'Smith'"

' Close the recordset and database connection
rs.Close
db.Close
