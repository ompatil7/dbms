import mysql.connector

conn = mysql.connector.connect(
    host = 'localhost',
    user = 'root',
    password = 'OM50',
    database = 'dbms'
)

cursor = conn.cursor()

cursor.execute("CREATE TABLE IF NOT EXISTS employee (empid int primary key, name varchar(255), salary int)")

def insert_record():
    empid = int(input("Enter empid: "))
    name = input("Enter name: ")
    salary = int(input("Enter salary: "))

    cursor.execute("Insert into employee values (%s, %s, %s)", (empid, name, salary))
    conn.commit()
    print("Record successfully inserted")

def update_record():
    empid = int(input("Enter empid to update: "))
    new_sal = int(input("Enter new salary: "))

    cursor.execute("Update employee set salary = %s where empid = %s", (new_sal, empid))
    conn.commit()
    print("Record successfully updated")

def delete_record():
    empid = int(input("Enter empid to delete: "))
    cursor.execute("Delete from employee where empid = %s", (empid,))
    conn.commit()
    print("Record successfully deleted")

def display_all_records():
    cursor.execute('Select * from employee')
    records = cursor.fetchall()

    for record in records:
        print(record)

def display_by_empid():
    empid = int(input("Enter empid to search: "))
    cursor.execute('Select * from employee where empid = %s', (empid,))
    record = cursor.fetchone()

    if record:
        print(record)
    else:
        print("Employee not found")

def display_by_salary():
    max_sal = 50000
    cursor.execute("Select * from employee where salary > %s", (max_sal,))
    records = cursor.fetchall()

    for record in records:
        print(record)

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
        print("Exiting program")
        break
    else:
        print("Invalid choice, enter correct")
    