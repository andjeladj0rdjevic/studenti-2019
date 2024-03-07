import mysql.connector

mydb = mysql.connector.connect(
	host = "147.91.27.232",
	user = "andjela",
	password = "Andjela.2023"
)

cursor = mydb.cursor()
 
cursor.execute("USE studenti;")

for x in cursor:
  print(x)