

# HOSPITAL MANAGEMENT DATABASE PROJECT
  
This is a README file for Database Systems Term Project. This README file includes instructions of how to run the code properly and understanding the usage of each function.

  

## Files

*-Database schema file
-dd.py*

  

## Features

***Patient Management:*** Allows the creation, update, and access of patient records.

  
***Appointment Management:*** Enables scheduling and tracking of appointments between doctors and patients. Provides functionalities to view, create, update, and cancel appointments.

  

***Billing:*** Handles billing and payment tracking for patient visits and services rendered.

  

***Doctor Management:*** Keeps track of the doctors within the hospital. Supports the modification of doctor information such as contact number and email.

  

***Department Management:*** Keeps track of the bed availability within the departments.

  

***Medicine Inventory:*** Tracks medicine stock levels, prices, and dosage information. Enables the management of medicine records.

  

***Medical Records Management:*** Tracks medical records of patients and their doctors.

  

## HOW TO RUN?

***This part will emphasize how to run each function.***

Menu of hospital management system will be displayed on the system.    Then:

  

 - To add a new patient to the system, please edit the 'patient_info'
   dictionary. Replace the values in the dictionary with the desired new
   values.
   ***Function call:*** entrance(1, patient_info)

  

 - To update existing patient's personal information(contact number, address, email), call entrance function with parameter '2' instead of
   '1'. As a second argument, replace patient_info dictionary with
   existing patient's info. Because of argument '2' entrance function
   will call another function to update patient's information.
   ***Function call:*** entrance(2, patient_info)
 - To add a new doctor to the system, please modify 'doctor_data' dictionary. Replace the values in the dictionary with the desired new
   values.
   ***Function call:*** add_doctor(doctor_data)

  

 - To update doctor's information (contact number and/or email), call the function with doctor_id(assigns by the system).You can check
   doctor IDs in the tables.
   ***Function call:*** update_doctor(doctor_id)

  

 - To create a new appointment, please replace the values in the 'appointment_data' with the desired new values.
   ***Function call:*** create_appointment(appointment_data)

  

 - To change the appointment date or/and time please provide appointment_id, and the desired new time and/or new date.
   ***Function call:*** change_appointment_datetime(appointment_id, new_date=None, new_time=None)

  

 - To cancel the appointment please call the function with appointment_id.
   ***Function call:*** cancel_appointment(appointment_id)

  

 - To add medical record, call the function with no arguments.
   ***Function call:*** add_medical_record()

  

 - To access medical records, call the function with patient_id.
   ***Function call:*** access_medicalRecords(patient_id)

  

 - To add a medicine, call the function with no arguments.
   ***Function call:*** add_medicine()

  

 - To add new department, provide department_name as an argument.
   ***Function call:*** add_department(department_name)

  

 - To delete department, call the function with department_id as a parameter.
   ***Function call:*** delete_department(department_id)
   
 - To add a new bed to the department please provide department_id and bed_availability(boolean) as parameters.
   ***Function call:*** add_bed(department_id, bed_availability)

  

 - To update the bed availability, call the function with bed_id and   
   bed_availability(boolean).    
   ***Function call:*** update_bed_availability(bed_id, bed_availability)

  

 - To add billing, provide patient_id, doctor_id,
   bill_date,total_amount, payment_status parameters.
   ***Function call:*** add_billing(patient_id, doctor_id, bill_date, total_amount, payment_status)

  

 - To update payment status, provide bill_id and payment_status.
   ***Function call***: update_payment_status(bill_id, payment_status)

  

## IMPORTANT NOTES

1-In the implementation, there exists some example dictionaries provided. You can modify the database by replacing these dictionaries with desired values.
  
2-While using functions for updating the data, it is important to provide correct IDs. Please check the tables first and verify that the data you're trying to modify exists in the schema.
  
3-While passing parameters in functions, please consider their types by checking database schema file. Calling functions with undefined types will result in getting an error message.
