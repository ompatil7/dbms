import mysql.connector

# Connect to the MySQL database
conn = mysql.connector.connect(
    host="localhost",
    user="root",
    password="OM50",
    database="dbms"
)

cursor = conn.cursor()

# Create the employee table if it doesn't exist
cursor.execute("CREATE TABLE IF NOT EXISTS employee (empid INT PRIMARY KEY, name VARCHAR(255), salary INT)")

def insert_record():
    empid = int(input("Enter employee ID: "))
    name = input("Enter employee name: ")
    salary = int(input("Enter employee salary: "))
    
    cursor.execute("INSERT INTO employee (empid, name, salary) VALUES (%s, %s, %s)", (empid, name, salary))
    conn.commit()
    print("Record inserted successfully.")

def update_record():
    empid = int(input("Enter employee ID to update: "))
    new_salary = int(input("Enter new salary: "))
    
    cursor.execute("UPDATE employee SET salary = %s WHERE empid = %s", (new_salary, empid))
    conn.commit()
    print("Record updated successfully.")

def delete_record():
    empid = int(input("Enter employee ID to delete: "))
    
    cursor.execute("DELETE FROM employee WHERE empid = %s", (empid,))
    conn.commit()
    print("Record deleted successfully.")


def display_all_records():
    cursor.execute("SELECT * FROM employee")
    records = cursor.fetchall()
    
    for record in records:
        print(record)

def display_by_salary():
    min_salary = 50000
    cursor.execute("SELECT * FROM employee WHERE salary > %s", (min_salary,))
    records = cursor.fetchall()
    
    for record in records:
        print(record)


def display_by_empid():
    empid = int(input("Enter employee ID: "))
    cursor.execute("SELECT * FROM employee WHERE empid = %s", (empid,))
    record = cursor.fetchone()
    
    if record:
        print(record)
    else:
        print("Employee not found.")

while True:
    print("\nMenu:")
    print("1. Insert Record")
    print("2. Update Record")
    print("3. Delete Record")
    print("4. Display All Records")
    print("5. Display Employees with Salary > 50000")
    print("6. Display Record for Particular Employee")
    print("7. Exit")
    
    choice = int(input("Enter your choice: "))
    
    if choice == 1:
        insert_record()
    elif choice == 2:
        update_record()
    elif choice == 3:
        delete_record()
    elif choice == 4:
        display_all_records()
    elif choice == 5:
        display_by_salary()
    elif choice == 6:
        display_by_empid()
    elif choice == 7:
        conn.close()
        print("Exiting the program.")
        break
    else:
        print("Invalid choice. Please select a valid option.")