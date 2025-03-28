USE msdb;
GO

DECLARE @html NVARCHAR(MAX);
DECLARE @subject NVARCHAR(100) = 'Send Index Metadata Report';
-- Format the results as an HTML table with proper styling.
SET @html = 
N'<html>
<body>
<h2>Index Metadata Report</h2>
<p>Generated on local PC</p>
<table border="1" cellpadding="5" cellspacing="0" width="100%">
<tr bgcolor="blue">
    <th><font color="white">Table Name</font></th>
    <th><font color="white">Index Name</font></th>
    <th><font color="white">Index Type</font></th>
    <th><font color="white">Column Type</font></th>
</tr>' +
-- Extract metadata related to indexes, including:
(SELECT 
    '<tr>' +
    '<td>' + t.name + '</td>' +
    '<td>' + i.name + '</td>' +
    '<td>' + i.type_desc + '</td>' +
    '<td>' + ty.name + '</td>' +
    '</tr>'
FROM 
    sys.indexes i
INNER JOIN 
    sys.tables t ON i.object_id = t.object_id
INNER JOIN 
    sys.schemas s ON t.schema_id = s.schema_id
INNER JOIN 
    sys.index_columns ic ON i.object_id = ic.object_id AND i.index_id = ic.index_id
INNER JOIN 
    sys.columns c ON ic.object_id = c.object_id AND ic.column_id = c.column_id
INNER JOIN 
    sys.types ty ON c.user_type_id = ty.user_type_id
ORDER BY 
    t.name, i.name
FOR XML PATH(''), TYPE).value('.', 'NVARCHAR(MAX)') +

N'</table>
</body>
</html>';
-- Send Email via Database Mail
EXEC sp_send_dbmail
    @profile_name = 'TursunovAG',
    @recipients = 'tursunolaziz7@gmail.com',
    @subject = @subject,
    @body = @html,
    @body_format = 'HTML';