--
-- PostgreSQL database dump
--

-- Dumped from database version 15.2
-- Dumped by pg_dump version 15.2

-- Started on 2023-06-06 22:43:41 +03

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE "Hospital_MS";
--
-- TOC entry 3666 (class 1262 OID 24576)
-- Name: Hospital_MS; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE "Hospital_MS" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'C';


ALTER DATABASE "Hospital_MS" OWNER TO postgres;

\connect "Hospital_MS"

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 219 (class 1259 OID 24592)
-- Name: appointments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.appointments (
    appointment_id integer NOT NULL,
    patient_id integer,
    doctor_id integer,
    appointment_date date,
    appointment_time time without time zone,
    appointment_status character varying(20)
);


ALTER TABLE public.appointments OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 24591)
-- Name: appointments_appointment_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.appointments_appointment_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.appointments_appointment_id_seq OWNER TO postgres;

--
-- TOC entry 3667 (class 0 OID 0)
-- Dependencies: 218
-- Name: appointments_appointment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.appointments_appointment_id_seq OWNED BY public.appointments.appointment_id;


--
-- TOC entry 225 (class 1259 OID 24635)
-- Name: beds; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.beds (
    bed_id integer NOT NULL,
    department_id integer,
    bed_availability boolean
);


ALTER TABLE public.beds OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 24634)
-- Name: beds_bed_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.beds_bed_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.beds_bed_id_seq OWNER TO postgres;

--
-- TOC entry 3668 (class 0 OID 0)
-- Dependencies: 224
-- Name: beds_bed_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.beds_bed_id_seq OWNED BY public.beds.bed_id;


--
-- TOC entry 227 (class 1259 OID 24648)
-- Name: billing; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.billing (
    bill_id integer NOT NULL,
    patient_id integer,
    doctor_id integer,
    bill_date date,
    total_amount numeric(10,2),
    payment_status character varying(20)
);


ALTER TABLE public.billing OWNER TO postgres;

--
-- TOC entry 226 (class 1259 OID 24647)
-- Name: billing_bill_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.billing_bill_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.billing_bill_id_seq OWNER TO postgres;

--
-- TOC entry 3669 (class 0 OID 0)
-- Dependencies: 226
-- Name: billing_bill_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.billing_bill_id_seq OWNED BY public.billing.bill_id;


--
-- TOC entry 223 (class 1259 OID 24628)
-- Name: departments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.departments (
    department_id integer NOT NULL,
    department_name character varying(100)
);


ALTER TABLE public.departments OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 24627)
-- Name: departments_department_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.departments_department_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.departments_department_id_seq OWNER TO postgres;

--
-- TOC entry 3670 (class 0 OID 0)
-- Dependencies: 222
-- Name: departments_department_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.departments_department_id_seq OWNED BY public.departments.department_id;


--
-- TOC entry 217 (class 1259 OID 24585)
-- Name: doctors; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.doctors (
    doctor_id integer NOT NULL,
    doctor_name character varying(100),
    doctor_specialization character varying(100),
    doctor_contact_number character varying(20),
    doctor_email character varying(100)
);


ALTER TABLE public.doctors OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 24584)
-- Name: doctors_doctor_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.doctors_doctor_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.doctors_doctor_id_seq OWNER TO postgres;

--
-- TOC entry 3671 (class 0 OID 0)
-- Dependencies: 216
-- Name: doctors_doctor_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.doctors_doctor_id_seq OWNED BY public.doctors.doctor_id;


--
-- TOC entry 221 (class 1259 OID 24609)
-- Name: medicalrecords; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.medicalrecords (
    record_id integer NOT NULL,
    patient_id integer,
    doctor_id integer,
    record_date date,
    diagnosis text,
    medication text,
    lab_tests text,
    remarks text
);


ALTER TABLE public.medicalrecords OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 24608)
-- Name: medicalrecords_record_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.medicalrecords_record_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.medicalrecords_record_id_seq OWNER TO postgres;

--
-- TOC entry 3672 (class 0 OID 0)
-- Dependencies: 220
-- Name: medicalrecords_record_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.medicalrecords_record_id_seq OWNED BY public.medicalrecords.record_id;


--
-- TOC entry 229 (class 1259 OID 24665)
-- Name: medicines; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.medicines (
    medicine_id integer NOT NULL,
    medicine_name character varying(100),
    medicine_dosage character varying(50),
    medicine_stock_count integer,
    medicine_unit_price numeric(10,2)
);


ALTER TABLE public.medicines OWNER TO postgres;

--
-- TOC entry 228 (class 1259 OID 24664)
-- Name: medicines_medicine_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.medicines_medicine_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.medicines_medicine_id_seq OWNER TO postgres;

--
-- TOC entry 3673 (class 0 OID 0)
-- Dependencies: 228
-- Name: medicines_medicine_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.medicines_medicine_id_seq OWNED BY public.medicines.medicine_id;


--
-- TOC entry 215 (class 1259 OID 24578)
-- Name: patients; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.patients (
    patient_id integer NOT NULL,
    patient_name character varying(100),
    patient_age integer,
    patient_gender character varying(10),
    patient_address character varying(255),
    patient_contact_number character varying(20),
    patient_email character varying(100),
    patient_date_of_birth date
);


ALTER TABLE public.patients OWNER TO postgres;

--
-- TOC entry 214 (class 1259 OID 24577)
-- Name: patients_patient_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.patients_patient_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.patients_patient_id_seq OWNER TO postgres;

--
-- TOC entry 3674 (class 0 OID 0)
-- Dependencies: 214
-- Name: patients_patient_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.patients_patient_id_seq OWNED BY public.patients.patient_id;


--
-- TOC entry 3474 (class 2604 OID 24595)
-- Name: appointments appointment_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.appointments ALTER COLUMN appointment_id SET DEFAULT nextval('public.appointments_appointment_id_seq'::regclass);


--
-- TOC entry 3477 (class 2604 OID 24638)
-- Name: beds bed_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.beds ALTER COLUMN bed_id SET DEFAULT nextval('public.beds_bed_id_seq'::regclass);


--
-- TOC entry 3478 (class 2604 OID 24651)
-- Name: billing bill_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.billing ALTER COLUMN bill_id SET DEFAULT nextval('public.billing_bill_id_seq'::regclass);


--
-- TOC entry 3476 (class 2604 OID 24631)
-- Name: departments department_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.departments ALTER COLUMN department_id SET DEFAULT nextval('public.departments_department_id_seq'::regclass);


--
-- TOC entry 3475 (class 2604 OID 24612)
-- Name: medicalrecords record_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.medicalrecords ALTER COLUMN record_id SET DEFAULT nextval('public.medicalrecords_record_id_seq'::regclass);


--
-- TOC entry 3479 (class 2604 OID 24668)
-- Name: medicines medicine_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.medicines ALTER COLUMN medicine_id SET DEFAULT nextval('public.medicines_medicine_id_seq'::regclass);


--
-- TOC entry 3650 (class 0 OID 24592)
-- Dependencies: 219
-- Data for Name: appointments; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.appointments (appointment_id, patient_id, doctor_id, appointment_date, appointment_time, appointment_status) FROM stdin;
1	1	1	2023-05-30	10:00:00	Cancelled
2	2	1	2023-06-15	09:00:00	Confirmed
\.


--
-- TOC entry 3656 (class 0 OID 24635)
-- Dependencies: 225
-- Data for Name: beds; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.beds (bed_id, department_id, bed_availability) FROM stdin;
1	1	f
\.


--
-- TOC entry 3658 (class 0 OID 24648)
-- Dependencies: 227
-- Data for Name: billing; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.billing (bill_id, patient_id, doctor_id, bill_date, total_amount, payment_status) FROM stdin;
1	1	1	2023-05-19	2500.00	completed
\.


--
-- TOC entry 3654 (class 0 OID 24628)
-- Dependencies: 223
-- Data for Name: departments; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.departments (department_id, department_name) FROM stdin;
1	Cardiology
\.


--
-- TOC entry 3648 (class 0 OID 24585)
-- Dependencies: 217
-- Data for Name: doctors; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.doctors (doctor_id, doctor_name, doctor_specialization, doctor_contact_number, doctor_email) FROM stdin;
1	Dr. Nowzaradan	general surgeon	+1 123-456-7890	nowzaradan@gmail.com
\.


--
-- TOC entry 3652 (class 0 OID 24609)
-- Dependencies: 221
-- Data for Name: medicalrecords; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.medicalrecords (record_id, patient_id, doctor_id, record_date, diagnosis, medication, lab_tests, remarks) FROM stdin;
1	2	1	2023-05-20	leg pain	painkiller	testB	this patient should come again next week.
\.


--
-- TOC entry 3660 (class 0 OID 24665)
-- Dependencies: 229
-- Data for Name: medicines; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.medicines (medicine_id, medicine_name, medicine_dosage, medicine_stock_count, medicine_unit_price) FROM stdin;
\.


--
-- TOC entry 3646 (class 0 OID 24578)
-- Dependencies: 215
-- Data for Name: patients; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.patients (patient_id, patient_name, patient_age, patient_gender, patient_address, patient_contact_number, patient_email, patient_date_of_birth) FROM stdin;
1	John	35	Male	123 Main Street	+1 123-456-7890	john@example.com	1986-05-15
2	nilsu bozan	22	f	maslak1453 sitesi	+1 386-795-7188	bozannilsu@gmail.com	2001-05-14
123	John Doe	30	M	222 amsterdam st.	123-456-7890	john.doe@example.com	1990-01-01
245	Rihanna	28	F	5th Avenue 23123	145-467-9590	rihanna@gmail.com	1992-01-01
\.


--
-- TOC entry 3675 (class 0 OID 0)
-- Dependencies: 218
-- Name: appointments_appointment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.appointments_appointment_id_seq', 2, true);


--
-- TOC entry 3676 (class 0 OID 0)
-- Dependencies: 224
-- Name: beds_bed_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.beds_bed_id_seq', 1, true);


--
-- TOC entry 3677 (class 0 OID 0)
-- Dependencies: 226
-- Name: billing_bill_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.billing_bill_id_seq', 1, true);


--
-- TOC entry 3678 (class 0 OID 0)
-- Dependencies: 222
-- Name: departments_department_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.departments_department_id_seq', 1, true);


--
-- TOC entry 3679 (class 0 OID 0)
-- Dependencies: 216
-- Name: doctors_doctor_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.doctors_doctor_id_seq', 1, false);


--
-- TOC entry 3680 (class 0 OID 0)
-- Dependencies: 220
-- Name: medicalrecords_record_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.medicalrecords_record_id_seq', 1, false);


--
-- TOC entry 3681 (class 0 OID 0)
-- Dependencies: 228
-- Name: medicines_medicine_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.medicines_medicine_id_seq', 1, false);


--
-- TOC entry 3682 (class 0 OID 0)
-- Dependencies: 214
-- Name: patients_patient_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.patients_patient_id_seq', 1, false);


--
-- TOC entry 3485 (class 2606 OID 24597)
-- Name: appointments appointments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.appointments
    ADD CONSTRAINT appointments_pkey PRIMARY KEY (appointment_id);


--
-- TOC entry 3491 (class 2606 OID 24640)
-- Name: beds beds_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.beds
    ADD CONSTRAINT beds_pkey PRIMARY KEY (bed_id);


--
-- TOC entry 3493 (class 2606 OID 24653)
-- Name: billing billing_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.billing
    ADD CONSTRAINT billing_pkey PRIMARY KEY (bill_id);


--
-- TOC entry 3489 (class 2606 OID 24633)
-- Name: departments departments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.departments
    ADD CONSTRAINT departments_pkey PRIMARY KEY (department_id);


--
-- TOC entry 3483 (class 2606 OID 24590)
-- Name: doctors doctors_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.doctors
    ADD CONSTRAINT doctors_pkey PRIMARY KEY (doctor_id);


--
-- TOC entry 3487 (class 2606 OID 24616)
-- Name: medicalrecords medicalrecords_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.medicalrecords
    ADD CONSTRAINT medicalrecords_pkey PRIMARY KEY (record_id);


--
-- TOC entry 3495 (class 2606 OID 24670)
-- Name: medicines medicines_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.medicines
    ADD CONSTRAINT medicines_pkey PRIMARY KEY (medicine_id);


--
-- TOC entry 3481 (class 2606 OID 24583)
-- Name: patients patients_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.patients
    ADD CONSTRAINT patients_pkey PRIMARY KEY (patient_id);


--
-- TOC entry 3496 (class 2606 OID 24603)
-- Name: appointments appointments_doctor_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.appointments
    ADD CONSTRAINT appointments_doctor_id_fkey FOREIGN KEY (doctor_id) REFERENCES public.doctors(doctor_id);


--
-- TOC entry 3497 (class 2606 OID 24598)
-- Name: appointments appointments_patient_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.appointments
    ADD CONSTRAINT appointments_patient_id_fkey FOREIGN KEY (patient_id) REFERENCES public.patients(patient_id);


--
-- TOC entry 3500 (class 2606 OID 24641)
-- Name: beds beds_department_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.beds
    ADD CONSTRAINT beds_department_id_fkey FOREIGN KEY (department_id) REFERENCES public.departments(department_id);


--
-- TOC entry 3501 (class 2606 OID 24659)
-- Name: billing billing_doctor_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.billing
    ADD CONSTRAINT billing_doctor_id_fkey FOREIGN KEY (doctor_id) REFERENCES public.doctors(doctor_id);


--
-- TOC entry 3502 (class 2606 OID 24654)
-- Name: billing billing_patient_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.billing
    ADD CONSTRAINT billing_patient_id_fkey FOREIGN KEY (patient_id) REFERENCES public.patients(patient_id);


--
-- TOC entry 3498 (class 2606 OID 24622)
-- Name: medicalrecords medicalrecords_doctor_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.medicalrecords
    ADD CONSTRAINT medicalrecords_doctor_id_fkey FOREIGN KEY (doctor_id) REFERENCES public.doctors(doctor_id);


--
-- TOC entry 3499 (class 2606 OID 24617)
-- Name: medicalrecords medicalrecords_patient_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.medicalrecords
    ADD CONSTRAINT medicalrecords_patient_id_fkey FOREIGN KEY (patient_id) REFERENCES public.patients(patient_id);


-- Completed on 2023-06-06 22:43:41 +03

--
-- PostgreSQL database dump complete
--

