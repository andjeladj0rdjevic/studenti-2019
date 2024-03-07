import mysql.connector

mydb = mysql.connector.connect(
	host = "147.91.27.232",
	user = "andjela",
	password = "Andjela.2023"
)


cursor = mydb.cursor()
 
cursor.execute("USE studenti;")

#f = open("output/query01.txt", "w")
#cursor.execute("select * from student_ispit_predmet_ispitni_rok where vremePismenog >='2019-12-01' order by vremepismenog asc limit 100;")

f = open("output/query02.txt", "w")
cursor.execute("select count(*), ye, mo from( select year(vremePismenog) as ye, month(vremePismenog)  as mo from student_ispit_predmet_ispitni_rok where vremePismenog >='2019-12-01' ) as tmpp group by ye, mo order by mo, ye;")


for x in cursor:
	f.write("%s\n" % str(x))
    #print(x)