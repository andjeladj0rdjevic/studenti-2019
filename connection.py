import mysql.connector

mydb = mysql.connector.connect(
	host = "147.91.27.232",
	user = "andjela",
	password = "Andjela.2023"
)


cursor = mydb.cursor()
 
cursor.execute("USE studenti;")

f = open("query01.txt", "w")
cursor.execute("select * from student_ispit_predmet_ispitni_rok where vremePismenog >='2019-12-01' order by vremepismenog asc limit 100;")


for x in cursor:
	f.write("%s\n" % str(x))