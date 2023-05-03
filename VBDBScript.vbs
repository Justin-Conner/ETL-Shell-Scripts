Sub ImportData()

    ' Define variables
    Dim ws As Worksheet
    Dim qt As QueryTable
    Dim conn As WorkbookConnection
    Dim strSQL As String
    
    ' Set the worksheet to import data into
    Set ws = ThisWorkbook.Worksheets("Sheet1")
    
    ' Set the SQL query to retrieve data
    strSQL = "SELECT * FROM [SalesData$]"
    
    ' Check if a workbook connection already exists
    For Each conn In ThisWorkbook.Connections
        If conn.Type = xlConnectionTypeODBC Or conn.Type = xlConnectionTypeOLEDB Then
            If conn.ODBCConnection.Connection = "Sales Database" Then
                conn.Delete
            End If
        End If
    Next conn
    
    ' Create a new workbook connection to the data source
    Set conn = ThisWorkbook.Connections.Add("Sales Database", "", "ODBC;DSN=SalesDB;UID=UserName;PWD=Password;")
    conn.CommandType = xlCmdSql
    conn.CommandText = strSQL
    
    ' Add the query table to the worksheet
    Set qt = ws.ListObjects.Add(SourceType:=xlSrcExternal, Source:=conn, Destination:=ws.Range("A1")).QueryTable
    
    ' Set the properties of the query table
    qt.RefreshStyle = xlInsertDeleteCells
    qt.Refresh
    
    ' Clean up
    Set qt = Nothing
    Set conn = Nothing
    Set ws = Nothing

End Sub
