import psycopg2
from psycopg2 import sql, extensions

try:
    connection = psycopg2.connect(
        user = "postgres",
        password = "1403",
        host = "localhost",
        port = "5432",
        database = "Hospital_MS")
    print("Database connection established successfully!")
    cursor = connection.cursor()

    autocommit = extensions.ISOLATION_LEVEL_AUTOCOMMIT

    connection.set_isolation_level(autocommit)
    
except (Exception, psycopg2.Error) as error:
    print("Error while connecting to the database:", error)


def entrance(num, patient_info):
    account = input("\nDoes this patient visit our hospital before? Yes(Y)/No(N): ")
    if account == "y" or account == "Y":
        patient_id = patient_info['patient_id']
        patient_name = patient_info['patient_name']
        patient_email = patient_info['patient_email']

        query = "SELECT * FROM Patients WHERE patient_id = '{}' AND patient_name = '{}' AND patient_email = '{}' ".format(patient_id, patient_name, patient_email)
        cursor.execute(query)
        result = cursor.fetchall()

        for row in result:
            if row == None:
                print(" \n Please check patient's information, record could not be found.")
            else:
                print("\nPatient record is found.")

        if num == 2:
            update_patient(patient_id)
            # patient wants to update their information (contact number, address, email)

    elif account == "n" or account == "N":
        print("Please create a new account for this patient.")
        print("Please enter patient's information carefully.")

        patient_id = patient_info['patient_id']
        patient_name = patient_info['patient_name']
        patient_age = patient_info['patient_age']
        patient_gender = patient_info['patient_gender']
        patient_address = patient_info['patient_address']
        patient_contact_number = patient_info['patient_contact_number']
        patient_email = patient_info['patient_email']
        patient_date_of_birth = patient_info['patient_date_of_birth']

        query2 = """INSERT INTO Patients(patient_id, patient_name, patient_age, patient_gender, patient_address, patient_contact_number, patient_email, patient_date_of_birth)
                    VALUES('{}', '{}', '{}', '{}', '{}', '{}', '{}', '{}')""".format(
            patient_id, patient_name, patient_age, patient_gender, patient_address, patient_contact_number,
            patient_email, patient_date_of_birth)

        cursor.execute(query2)
        connection.commit()

        print("\nPatient's data successfully recorded in our system.")

    else:
        print("Attempt Failed.")

#Patient may require to change his/her phone number, address, email
def update_patient(patient_id):
    change=input("\nPlease indicate what information patient would like to change? Contact number(C), address(A) or Email(E): ")
    try:
        cursor = connection.cursor()

        if change=='C' or change=='c':
            new_contact_number = input("Enter new contact number: ")
            cursor.execute("""
                UPDATE Patients
                SET patient_contact_number = %s
                WHERE patient_id = %s
            """, (new_contact_number, patient_id))
            print("Contact number updated successfully!")
        elif change=='a' or change=='A':
            new_address = input("Enter new address: ")
            cursor.execute("""
                UPDATE Patients
                SET patient_address = %s
                WHERE patient_id = %s
            """, (new_address, patient_id))
            print("Address updated successfully!")

        elif change=='E' or change=='e':
            new_email = input("Enter new email: ")
            cursor.execute("""
                UPDATE Patients
                SET patient_email = %s
                WHERE patient_id = %s
            """, (new_email, patient_id))
            print("Email updated successfully!")

        connection.commit()
        cursor.close()
        #connection.close()    
    except (Exception, psycopg2.Error) as error:
        print("Error while updating patient information:", error)

def update_doctor(doctor_id):
    try:
        cursor = connection.cursor()

        change = input("\nPlease indicate what information the doctor would like to change? Contact number (C) or Email (E): ")

        if change == 'C' or change == 'c':
            new_contact_number = input("Enter new contact number: ")
            cursor.execute("""
                UPDATE Doctors
                SET doctor_contact_number = %s
                WHERE doctor_id = %s
            """, (new_contact_number, doctor_id))
            print("Contact number updated successfully!")

        elif change == 'E' or change == 'e':
            new_email = input("Enter new email: ")
            cursor.execute("""
                UPDATE Doctors
                SET doctor_email = %s
                WHERE doctor_id = %s
            """, (new_email, doctor_id))
            print("Email updated successfully!")

        connection.commit()
        cursor.close()
        #connection.close()

    except (Exception, psycopg2.Error) as error:
        print("Error while updating doctor information:", error)

def add_doctor(doctor_data):
    try:
        cursor = connection.cursor()

        doctor_id=doctor_data['doctor_id']
        doctor_name = doctor_data['name']
        doctor_specialization = doctor_data['specialization']
        doctor_contact_number = doctor_data['contact_number']
        doctor_email = doctor_data['email']

        cursor.execute("""
            INSERT INTO Doctors (doctor_id, doctor_name, doctor_specialization, doctor_contact_number, doctor_email)
            VALUES ( %s, %s, %s, %s, %s)
        """, (doctor_id,doctor_name, doctor_specialization, doctor_contact_number, doctor_email))

        connection.commit()
        cursor.close()
        #connection.close()

        print("Doctor added successfully!")

    except (Exception, psycopg2.Error) as error:
        print("Error while adding doctor:", error)


def create_appointment(appointment_data):
    try:
        cursor = connection.cursor()
        patient_id = appointment_data['patient_id']
        doctor_id = appointment_data['doctor_id']
        appointment_date = appointment_data['appointment_date']
        appointment_time = appointment_data['appointment_time']
        appointment_status = appointment_data['status']
        
        cursor.execute("""
            INSERT INTO Appointments ( patient_id, doctor_id, appointment_date, appointment_time, appointment_status)
            VALUES ( %s, %s, %s, %s, %s)
        """, (patient_id, doctor_id, appointment_date, appointment_time, appointment_status))
        
        connection.commit()
        cursor.close()
        
        print("Appointment created successfully!")
        
    except (Exception, psycopg2.Error) as error:
        connection.rollback()
        print("Error while creating appointment:", error)

def add_medical_record():
    try:
        cursor = connection.cursor()

        print("Add Medical Record")
        record_id = input("Enter record ID: ")
        patient_id = input("Enter patient ID: ")
        doctor_id = input("Enter doctor ID: ")
        record_date = input("Enter record date: ")
        diagnosis = input("Enter diagnosis: ")
        medication = input("Enter medication: ")
        lab_tests = input("Enter lab tests: ")
        remarks = input("Enter remarks: ")

     
        query = "INSERT INTO MedicalRecords (record_id,patient_id, doctor_id, record_date, diagnosis, medication, lab_tests, remarks) VALUES (%s, %s, %s, %s, %s, %s, %s, %s)"
        values = (record_id,patient_id, doctor_id, record_date, diagnosis, medication, lab_tests, remarks)
        cursor.execute(query, values)
        connection.commit()
        cursor.close()
        #connection.close()

        print("Medical records added successfully.")
    except (Exception, psycopg2.Error) as error:
        print("An error occurred while adding medical records", error)

def access_medicalRecords(patient_id):
    try: 
        cursor = connection.cursor()

        query = "SELECT * FROM MedicalRecords WHERE patient_id = %s"
        cursor.execute(query, (patient_id,))
        records = cursor.fetchall()

        if len(records) > 0:
            print("Medical Records for Patient ID:", patient_id)
            print("---------------------------------------")
            for record in records:
                record_id = record[0]
                doctor_id = record[2]
                record_date = record[3]
                diagnosis = record[4]
                medication = record[5]
                lab_tests = record[6]
                remarks = record[7]

                print("Record ID:", record_id)
                print("Doctor ID:", doctor_id)
                print("Record Date:", record_date)
                print("Diagnosis:", diagnosis)
                print("Medication:", medication)
                print("Lab Tests:", lab_tests)
                print("Remarks:", remarks)
                print("---------------------------------------")
        else:
            print("No medical records found for Patient ID:", patient_id)

        connection.commit()
        cursor.close()
        #connection.close()

    except (Exception, psycopg2.Error) as error:
        print("An error occurred while accessing medical records:", error)

def cancel_appointment(appointment_id):
    try:
        cursor = connection.cursor()
        cursor.execute("""
            UPDATE Appointments
            SET appointment_status = 'Cancelled'
            WHERE appointment_id = %s
        """, (appointment_id,))

        connection.commit()
        cursor.close()

        print("Appointment cancelled successfully!")

    except (Exception, psycopg2.Error) as error:
        connection.rollback()
        print("Error while cancelling appointment:", error)

def change_appointment_datetime(appointment_id, new_date=None, new_time=None):
    try:
        cursor = connection.cursor()
     
        if new_date is not None and new_time is not None:
            #Update both date and time
            cursor.execute("""
                UPDATE Appointments
                SET appointment_date = %s, appointment_time = %s
                WHERE appointment_id = %s
            """, (new_date, new_time, appointment_id))
        elif new_date is not None:
            #Update date 
            cursor.execute("""
                UPDATE Appointments
                SET appointment_date = %s
                WHERE appointment_id = %s
            """, (new_date, appointment_id))
        elif new_time is not None:
            #Update time 
            cursor.execute("""
                UPDATE Appointments
                SET appointment_time = %s
                WHERE appointment_id = %s
            """, (new_time, appointment_id))
        else:
            #No change
            print("No changes provided. Appointment datetime remains unchanged.")

        connection.commit()
        cursor.close()

        print("Appointment datetime changed successfully!")

    except (Exception, psycopg2.Error) as error:
        connection.rollback()
        print("Error while changing appointment datetime:", error)

def add_medicine():
    try:
        print("Add Medicine")
        medicine_id = input("Enter medicine ID: ")
        medicine_name = input("Enter medicine name: ")
        medicine_dosage = input("Enter dosage: ")
        medicine_stock_count = input("Enter stock count: ")
        medicine_unit_price = input("Enter unit price: ")

        query = "INSERT INTO Medicines (medicine_id, medicine_name, medicine_dosage, medicine_stock_count, medicine_unit_price) VALUES (%s, %s, %s, %s, %s) ON CONFLICT (medicine_id) DO UPDATE SET medicine_name = %s, medicine_dosage = %s, medicine_stock_count = %s, medicine_unit_price = %s"
        values = (medicine_id, medicine_name, medicine_dosage, medicine_stock_count, medicine_unit_price, medicine_name, medicine_dosage, medicine_stock_count, medicine_unit_price)
        cursor.execute(query, values)
        connection.commit()

        print("Medicine details managed successfully.")

    except (Exception, psycopg2.Error) as error:
        print("An error occurred while managing medicine details", error)

def add_department(department_name):
    try:
        cursor = connection.cursor()

        cursor.execute("""
            INSERT INTO public.departments (department_name)
            VALUES (%s)
        """, (department_name,))

        connection.commit()
        cursor.close()

        print("Department added successfully!")

    except (Exception, psycopg2.Error) as error:
        connection.rollback()
        print("Error while adding department:", error)

def delete_department(department_id):
    try:
        cursor = connection.cursor()

        # Delete the beds associated with the department
        cursor.execute("""
            DELETE FROM public.beds
            WHERE department_id = %s
        """, (department_id,))

        # Delete the department
        cursor.execute("""
            DELETE FROM public.departments
            WHERE department_id = %s
        """, (department_id,))

        connection.commit()
        cursor.close()

        print("Department and associated beds deleted successfully!")

    except (Exception, psycopg2.Error) as error:
        connection.rollback()
        print("Error while deleting department:", error)


def add_bed(department_id, bed_availability):
    try:
        cursor = connection.cursor()
        cursor.execute("""
            INSERT INTO public.beds (department_id, bed_availability)
            VALUES (%s, %s)
        """, (department_id, bed_availability))

        connection.commit()
        cursor.close()

        print("Bed added successfully!")

    except (Exception, psycopg2.Error) as error:
        connection.rollback()
        print("Error while adding bed:", error)

def update_bed_availability(bed_id, bed_availability):
    try:
        cursor = connection.cursor()

        cursor.execute("""
            UPDATE public.beds
            SET bed_availability = %s
            WHERE bed_id = %s
        """, (bed_availability, bed_id))

        connection.commit()
        cursor.close()

        print("Bed availability updated successfully!")

    except (Exception, psycopg2.Error) as error:
        connection.rollback()
        print("Error while updating bed availability:", error)

def add_billing(patient_id, doctor_id, bill_date, total_amount, payment_status):
    try:
        cursor = connection.cursor()
        cursor.execute("""
            INSERT INTO public.billing (patient_id, doctor_id, bill_date, total_amount, payment_status)
            VALUES (%s, %s, %s, %s, %s)
        """, (patient_id, doctor_id, bill_date, total_amount, payment_status))

        connection.commit()
        cursor.close()

        print("Billing record added successfully!")

    except (Exception, psycopg2.Error) as error:
        connection.rollback()
        print("Error while adding billing record:", error)

def update_payment_status(bill_id, payment_status):
    try:
        cursor = connection.cursor()
        #Updating the payment status of the billing record
        cursor.execute("""
            UPDATE public.billing
            SET payment_status = %s
            WHERE bill_id = %s
        """, (payment_status, bill_id))

        connection.commit()
        cursor.close()

        print("Payment status updated successfully!")

    except (Exception, psycopg2.Error) as error:
        connection.rollback()
        print("Error while updating payment status:", error)


def display_menu():
    print("---- Hospital Management System Menu ----")
    print("1. Patient Enterance")
    print("2. Update Patient Information")
    print("3. Doctor Enterance")
    print("4. Update Doctor Information")
    print("5. Create Appointment")
    print("6. Change Appointment Date/Time")
    print("7. Cancel Appointments")
    print("8. Add Medical Record")
    print("9. Access Medical Records")
    print("10. Medicine Enterance")
    print("11. Department Enterance")
    print("12. Delete Department")
    print("13. Bed Enterance")
    print("14. Update Bed Availability")
    print("15. Add Billing")
    print("16. Update Payment Status")
    print("17. Exit")
    


#Example Patient Data
#NOTE:Please try to add new user or update existing patient's information by modifying this dictionary.
patient_info = {
    'patient_id': '99',
    'patient_name': 'Ali Yilmaz',
    'patient_age': 24,
    'patient_gender': 'M',
    'patient_address': 'Buyukcekmece Istanbul',
    'patient_contact_number': '148-487-9460',
    'patient_email': 'aliyilmaz@gmail.com',
    'patient_date_of_birth': '1998-01-01'
}

#Example Appointment Data
#NOTE: Please try to create a new appointment by modifying this dictionary.
appointment_data = {
    'patient_id': 2,
    'doctor_id': 1,
    'appointment_date': '2024-03-20',
    'appointment_time': '09:00 AM',
    'status': 'Confirmed'
}

#Example Doctor Data
#NOTE: Please try to add new doctor by modifying this dictionary.
doctor_data = {
    'doctor_id': 3,
    'name': 'Dr. Phill',
    'specialization': 'general surgeon',
    'contact_number': '+1 124-786-4789',
    'email': 'phillD@hotmail.com'
}



while True:
    display_menu()
    choice = input("Enter your choice (1-17): ")
    if choice == "1":
        #Adding new user to the system
        entrance(1, patient_info)
    elif choice == "2":
        #Updating existing patient's information
        entrance(2, patient_info)
    elif choice == "3":
        add_doctor(doctor_data)
    elif choice == "4":
        update_doctor(3)
    elif choice=="5":
        create_appointment(appointment_data)
    elif choice=="6":
        #change_appointment_datetime(2, new_date=None, new_time=None)
        change_appointment_datetime(3,"2024-04-26")
    elif choice=="7":
        cancel_appointment(2)
    elif choice=="8":
        add_medical_record()
    elif choice=="9":
        access_medicalRecords(2)
    elif choice=="10":
        add_medicine()
    elif choice=="11":
        add_department("Example Department")
    elif choice=="12":
        delete_department(1)
    elif choice=="13":
        add_bed(2, True)
    elif choice=="14":
        update_bed_availability(2, False)
    elif choice=="15":
        add_billing(2, 1, "2022-08-19", 3200, "completed")
    elif choice=="16":
        update_payment_status(2, "failed")
    elif choice=="17":
        print("Exiting the program. Goodbye!")
        break
    else:
        print("Invalid choice. Please try again.\n")

# Closing the connection
connection.close()