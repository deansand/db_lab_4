import os
from flask import Flask
from flask_mysqldb import MySQL
from route import api_bp

app = Flask(__name__)
mysql = MySQL(app)

app.config['MYSQL_USER'] = 'root'
app.config['MYSQL_PASSWORD'] = 'root'
app.config['MYSQL_DB'] = 'lab_1'
app.config['MYSQL_HOST'] = 'localhost'

app.mysql = mysql

def init_db_mysql():
    cursor = mysql.connection.cursor()
    sql_file_path = os.path.join(os.path.dirname(__file__), 'data.sql')
    
    with open(sql_file_path, 'r') as f:
        sql_commands = f.read().split(';')
        
        for command in sql_commands:
            if command.strip(): 
                cursor.execute(command)
    
    mysql.connection.commit()
    cursor.close()

app.register_blueprint(api_bp, url_prefix='/api')

if __name__ == '__main__':
    app.run(debug=True)
    init_db_mysql()


""" PUT
{
  "descriptions": "An updated thriller movie",
  "director_id": 1,
  "release_date": "2010-07-16",
  "title": "Inception Updated"
}
"""

""" POST
{
  "descriptions": "A new thriller movie",
  "director_id": 1,
  "release_date": "2023-10-20",
  "title": "New Thriller Movie"
}

"""