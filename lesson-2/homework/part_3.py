import pyodbc

connection_str = "DRIVER={SQL SERVER};SERVER=DESKTOP-DVQK3B8\SQLEXPRESS;DATABASE=Second_lesson;Trusted_Connection=yes;"
con = pyodbc.connect(connection_str)
cursor = con.cursor()

cursor.execute(
    """
    SELECT * FROM photos;
    """
)

row = cursor.fetchone()
id, data = row

with open(f'{id}_from_py_file.png', 'wb') as f:
    f.write(data)