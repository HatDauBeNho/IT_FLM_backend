--
-- PostgreSQL database dump
--

-- Dumped from database version 17.2
-- Dumped by pg_dump version 17.2

-- Started on 2024-12-14 18:40:48

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 2 (class 3079 OID 16699)
-- Name: unaccent; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS unaccent WITH SCHEMA public;


--
-- TOC entry 4947 (class 0 OID 0)
-- Dependencies: 2
-- Name: EXTENSION unaccent; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION unaccent IS 'text search dictionary that removes accents';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 219 (class 1259 OID 16640)
-- Name: tb_account; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tb_account (
    account_id integer NOT NULL,
    create_time timestamp without time zone,
    password character varying(255),
    role character varying(255),
    status integer,
    update_time timestamp without time zone,
    user_name character varying(255)
);


ALTER TABLE public.tb_account OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 16639)
-- Name: tb_account_account_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tb_account_account_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.tb_account_account_id_seq OWNER TO postgres;

--
-- TOC entry 4948 (class 0 OID 0)
-- Dependencies: 218
-- Name: tb_account_account_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tb_account_account_id_seq OWNED BY public.tb_account.account_id;


--
-- TOC entry 233 (class 1259 OID 16707)
-- Name: tb_classroom; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tb_classroom (
    class_id integer NOT NULL,
    course_id integer,
    current_student integer,
    maximum_student integer,
    semester_id integer,
    lecture_id integer,
    create_time timestamp without time zone,
    update_time timestamp without time zone,
    status integer
);


ALTER TABLE public.tb_classroom OWNER TO postgres;

--
-- TOC entry 232 (class 1259 OID 16706)
-- Name: tb_classroom_class_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tb_classroom_class_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.tb_classroom_class_id_seq OWNER TO postgres;

--
-- TOC entry 4949 (class 0 OID 0)
-- Dependencies: 232
-- Name: tb_classroom_class_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tb_classroom_class_id_seq OWNED BY public.tb_classroom.class_id;


--
-- TOC entry 221 (class 1259 OID 16649)
-- Name: tb_course; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tb_course (
    course_id integer NOT NULL,
    condition integer,
    course_name character varying(255),
    create_time timestamp without time zone,
    credit integer,
    update_time timestamp without time zone
);


ALTER TABLE public.tb_course OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 16648)
-- Name: tb_course_course_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tb_course_course_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.tb_course_course_id_seq OWNER TO postgres;

--
-- TOC entry 4950 (class 0 OID 0)
-- Dependencies: 220
-- Name: tb_course_course_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tb_course_course_id_seq OWNED BY public.tb_course.course_id;


--
-- TOC entry 223 (class 1259 OID 16656)
-- Name: tb_course_registration; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tb_course_registration (
    course_registration_id integer NOT NULL,
    create_time timestamp without time zone,
    point double precision,
    student_id integer,
    update_time timestamp without time zone,
    class_id integer
);


ALTER TABLE public.tb_course_registration OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 16655)
-- Name: tb_course_registration_course_registration_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tb_course_registration_course_registration_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.tb_course_registration_course_registration_id_seq OWNER TO postgres;

--
-- TOC entry 4951 (class 0 OID 0)
-- Dependencies: 222
-- Name: tb_course_registration_course_registration_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tb_course_registration_course_registration_id_seq OWNED BY public.tb_course_registration.course_registration_id;


--
-- TOC entry 225 (class 1259 OID 16663)
-- Name: tb_evaluate; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tb_evaluate (
    evaluate_id integer NOT NULL,
    content character varying(255),
    create_time timestamp without time zone,
    rating double precision,
    student_id integer,
    teacher_id integer,
    update_time timestamp without time zone,
    class_id integer
);


ALTER TABLE public.tb_evaluate OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 16662)
-- Name: tb_evaluate_evaluate_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tb_evaluate_evaluate_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.tb_evaluate_evaluate_id_seq OWNER TO postgres;

--
-- TOC entry 4952 (class 0 OID 0)
-- Dependencies: 224
-- Name: tb_evaluate_evaluate_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tb_evaluate_evaluate_id_seq OWNED BY public.tb_evaluate.evaluate_id;


--
-- TOC entry 227 (class 1259 OID 16670)
-- Name: tb_info; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tb_info (
    info_id integer NOT NULL,
    address character varying(255),
    avatar character varying(255),
    create_time timestamp without time zone,
    date_of_birth date,
    email character varying(255),
    full_name character varying(255),
    gender integer,
    phone_number character varying(255),
    update_time timestamp without time zone
);


ALTER TABLE public.tb_info OWNER TO postgres;

--
-- TOC entry 226 (class 1259 OID 16669)
-- Name: tb_info_info_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tb_info_info_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.tb_info_info_id_seq OWNER TO postgres;

--
-- TOC entry 4953 (class 0 OID 0)
-- Dependencies: 226
-- Name: tb_info_info_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tb_info_info_id_seq OWNED BY public.tb_info.info_id;


--
-- TOC entry 231 (class 1259 OID 16693)
-- Name: tb_lecture; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tb_lecture (
    lecture_id integer NOT NULL,
    account_id integer,
    info_id integer,
    average_rating double precision,
    create_time timestamp without time zone,
    update_time timestamp without time zone
);


ALTER TABLE public.tb_lecture OWNER TO postgres;

--
-- TOC entry 237 (class 1259 OID 16728)
-- Name: tb_question; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tb_question (
    question_id integer NOT NULL,
    content character varying(255)
);


ALTER TABLE public.tb_question OWNER TO postgres;

--
-- TOC entry 236 (class 1259 OID 16727)
-- Name: tb_question_question_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tb_question_question_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.tb_question_question_id_seq OWNER TO postgres;

--
-- TOC entry 4954 (class 0 OID 0)
-- Dependencies: 236
-- Name: tb_question_question_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tb_question_question_id_seq OWNED BY public.tb_question.question_id;


--
-- TOC entry 235 (class 1259 OID 16714)
-- Name: tb_semester; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tb_semester (
    semester_id integer NOT NULL,
    end_time date,
    name character varying(255),
    start_time date
);


ALTER TABLE public.tb_semester OWNER TO postgres;

--
-- TOC entry 234 (class 1259 OID 16713)
-- Name: tb_semester_semester_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tb_semester_semester_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.tb_semester_semester_id_seq OWNER TO postgres;

--
-- TOC entry 4955 (class 0 OID 0)
-- Dependencies: 234
-- Name: tb_semester_semester_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tb_semester_semester_id_seq OWNED BY public.tb_semester.semester_id;


--
-- TOC entry 229 (class 1259 OID 16686)
-- Name: tb_student; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tb_student (
    student_id integer NOT NULL,
    account_id integer,
    create_time timestamp without time zone,
    gpa double precision,
    info_id integer,
    status integer,
    update_time timestamp without time zone
);


ALTER TABLE public.tb_student OWNER TO postgres;

--
-- TOC entry 228 (class 1259 OID 16685)
-- Name: tb_student_student_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tb_student_student_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.tb_student_student_id_seq OWNER TO postgres;

--
-- TOC entry 4956 (class 0 OID 0)
-- Dependencies: 228
-- Name: tb_student_student_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tb_student_student_id_seq OWNED BY public.tb_student.student_id;


--
-- TOC entry 230 (class 1259 OID 16692)
-- Name: tb_teacher_teacher_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tb_teacher_teacher_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.tb_teacher_teacher_id_seq OWNER TO postgres;

--
-- TOC entry 4957 (class 0 OID 0)
-- Dependencies: 230
-- Name: tb_teacher_teacher_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tb_teacher_teacher_id_seq OWNED BY public.tb_lecture.lecture_id;


--
-- TOC entry 4747 (class 2604 OID 16643)
-- Name: tb_account account_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_account ALTER COLUMN account_id SET DEFAULT nextval('public.tb_account_account_id_seq'::regclass);


--
-- TOC entry 4754 (class 2604 OID 16710)
-- Name: tb_classroom class_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_classroom ALTER COLUMN class_id SET DEFAULT nextval('public.tb_classroom_class_id_seq'::regclass);


--
-- TOC entry 4748 (class 2604 OID 16652)
-- Name: tb_course course_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_course ALTER COLUMN course_id SET DEFAULT nextval('public.tb_course_course_id_seq'::regclass);


--
-- TOC entry 4749 (class 2604 OID 16659)
-- Name: tb_course_registration course_registration_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_course_registration ALTER COLUMN course_registration_id SET DEFAULT nextval('public.tb_course_registration_course_registration_id_seq'::regclass);


--
-- TOC entry 4750 (class 2604 OID 16666)
-- Name: tb_evaluate evaluate_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_evaluate ALTER COLUMN evaluate_id SET DEFAULT nextval('public.tb_evaluate_evaluate_id_seq'::regclass);


--
-- TOC entry 4751 (class 2604 OID 16673)
-- Name: tb_info info_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_info ALTER COLUMN info_id SET DEFAULT nextval('public.tb_info_info_id_seq'::regclass);


--
-- TOC entry 4753 (class 2604 OID 16696)
-- Name: tb_lecture lecture_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_lecture ALTER COLUMN lecture_id SET DEFAULT nextval('public.tb_teacher_teacher_id_seq'::regclass);


--
-- TOC entry 4756 (class 2604 OID 16731)
-- Name: tb_question question_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_question ALTER COLUMN question_id SET DEFAULT nextval('public.tb_question_question_id_seq'::regclass);


--
-- TOC entry 4755 (class 2604 OID 16717)
-- Name: tb_semester semester_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_semester ALTER COLUMN semester_id SET DEFAULT nextval('public.tb_semester_semester_id_seq'::regclass);


--
-- TOC entry 4752 (class 2604 OID 16689)
-- Name: tb_student student_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_student ALTER COLUMN student_id SET DEFAULT nextval('public.tb_student_student_id_seq'::regclass);


--
-- TOC entry 4923 (class 0 OID 16640)
-- Dependencies: 219
-- Data for Name: tb_account; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.tb_account (account_id, create_time, password, role, status, update_time, user_name) VALUES (5, '2023-09-04 06:28:52', '$2a$10$k0GD6khRK0naL1tTxHNu6eG.WYBXPATL5c.p4dEBLPYYaf8rHM0o6', '2', 1, '2023-09-04 06:28:52', 'sontx@sv.edu.vn');
INSERT INTO public.tb_account (account_id, create_time, password, role, status, update_time, user_name) VALUES (6, '2023-09-04 06:28:52', '$2a$10$k0GD6khRK0naL1tTxHNu6eG.WYBXPATL5c.p4dEBLPYYaf8rHM0o6', '2', 1, '2023-09-04 06:28:52', 'an@sv.edu.vn');
INSERT INTO public.tb_account (account_id, create_time, password, role, status, update_time, user_name) VALUES (7, '2023-09-04 06:28:52', '$2a$10$k0GD6khRK0naL1tTxHNu6eG.WYBXPATL5c.p4dEBLPYYaf8rHM0o6', '2', 1, '2023-09-04 06:28:52', 'antt@sv.edu.vn');
INSERT INTO public.tb_account (account_id, create_time, password, role, status, update_time, user_name) VALUES (2, '2023-09-04 06:28:52', '$2a$10$k0GD6khRK0naL1tTxHNu6eG.WYBXPATL5c.p4dEBLPYYaf8rHM0o6', '2', 1, '2023-09-04 06:28:52', 'nguyenthongtien@gmail.com');
INSERT INTO public.tb_account (account_id, create_time, password, role, status, update_time, user_name) VALUES (8, '2023-09-04 06:28:52', '$2a$10$k0GD6khRK0naL1tTxHNu6eG.WYBXPATL5c.p4dEBLPYYaf8rHM0o6', '2', 1, '2023-09-04 06:28:52', 'lehongphong@gmail.com');
INSERT INTO public.tb_account (account_id, create_time, password, role, status, update_time, user_name) VALUES (1, '2023-09-04 06:28:52', '$2a$10$k0GD6khRK0naL1tTxHNu6eG.WYBXPATL5c.p4dEBLPYYaf8rHM0o6', '1', 1, '2023-09-04 06:28:52', 'admin');
INSERT INTO public.tb_account (account_id, create_time, password, role, status, update_time, user_name) VALUES (9, '2023-09-04 06:28:52', '$2a$10$k0GD6khRK0naL1tTxHNu6eG.WYBXPATL5c.p4dEBLPYYaf8rHM0o6', '2', 1, '2023-09-04 06:28:52', 'nguyenmanhtan@gmail.com');
INSERT INTO public.tb_account (account_id, create_time, password, role, status, update_time, user_name) VALUES (10, '2023-09-04 06:28:52', '$2a$10$k0GD6khRK0naL1tTxHNu6eG.WYBXPATL5c.p4dEBLPYYaf8rHM0o6', '2', 1, '2023-09-04 06:28:52', 'quanganhho99@gmail.com');
INSERT INTO public.tb_account (account_id, create_time, password, role, status, update_time, user_name) VALUES (11, '2023-09-03 12:13:14', '$2a$10$kOG6khRK0naL1ttXhNu6eG.WYXBXPATL5c.p4dEBLPYYaf8rHM06', '3', 1, '2023-09-03 12:13:14', 'anh218120@gmail.com');
INSERT INTO public.tb_account (account_id, create_time, password, role, status, update_time, user_name) VALUES (12, '2023-09-03 12:13:14', '$2a$10$kOG6khRK0naL1ttXhNu6eG.WYXBXPATL5c.p4dEBLPYYaf8rHM06', '3', 1, '2023-09-04 05:45:17', 'anhskt2k1@gmail.com');
INSERT INTO public.tb_account (account_id, create_time, password, role, status, update_time, user_name) VALUES (13, '2023-09-03 12:13:15', '$2a$10$kOG6khRK0naL1ttXhNu6eG.WYXBXPATL5c.p4dEBLPYYaf8rHM06', '3', 1, '2023-09-04 05:45:14', 'qa123.bn@gmail.com');
INSERT INTO public.tb_account (account_id, create_time, password, role, status, update_time, user_name) VALUES (14, '2023-09-03 12:13:15', '$2a$10$kOG6khRK0naL1ttXhNu6eG.WYXBXPATL5c.p4dEBLPYYaf8rHM06', '3', 1, '2023-09-03 12:13:15', 'bangrickkid@gmail.com');
INSERT INTO public.tb_account (account_id, create_time, password, role, status, update_time, user_name) VALUES (4, '2023-09-04 06:28:52', '$2a$10$k0GD6khRK0naL1tTxHNu6eG.WYBXPATL5c.p4dEBLPYYaf8rHM0o6', '2', 1, '2023-09-04 06:28:52', 'phamthanhdao@gmail.com');
INSERT INTO public.tb_account (account_id, create_time, password, role, status, update_time, user_name) VALUES (15, '2023-09-03 12:13:15', '$2a$10$kOG6khRK0naL1ttXhNu6eG.WYXBXPATL5c.p4dEBLPYYaf8rHM06', '3', 1, '2023-09-04 05:45:10', 'baodo200002@gmail.com');
INSERT INTO public.tb_account (account_id, create_time, password, role, status, update_time, user_name) VALUES (16, '2023-09-03 12:13:15', '$2a$10$kOG6khRK0naL1ttXhNu6eG.WYXBXPATL5c.p4dEBLPYYaf8rHM06', '3', 1, '2023-09-03 12:13:15', 'thanhdat26221@gmail.com');
INSERT INTO public.tb_account (account_id, create_time, password, role, status, update_time, user_name) VALUES (17, '2023-09-03 12:13:15', '$2a$10$kOG6khRK0naL1ttXhNu6eG.WYXBXPATL5c.p4dEBLPYYaf8rHM06', '3', 1, '2023-09-03 12:13:15', 'ngocchung1882002@gmail.com');
INSERT INTO public.tb_account (account_id, create_time, password, role, status, update_time, user_name) VALUES (18, '2023-09-03 12:13:15', '$2a$10$kOG6khRK0naL1ttXhNu6eG.WYXBXPATL5c.p4dEBLPYYaf8rHM06', '3', 1, '2023-09-03 12:13:15', 'duccong25tq@gmail.com');
INSERT INTO public.tb_account (account_id, create_time, password, role, status, update_time, user_name) VALUES (19, '2023-09-03 12:13:15', '$2a$10$kOG6khRK0naL1ttXhNu6eG.WYXBXPATL5c.p4dEBLPYYaf8rHM06', '3', 1, '2023-09-04 05:45:07', 'phamduccong02@gmail.com');
INSERT INTO public.tb_account (account_id, create_time, password, role, status, update_time, user_name) VALUES (20, '2023-09-03 12:13:15', '$2a$10$kOG6khRK0naL1ttXhNu6eG.WYXBXPATL5c.p4dEBLPYYaf8rHM06', '3', 1, '2023-09-03 12:13:15', 'hoangtuoxich@gmail.com');
INSERT INTO public.tb_account (account_id, create_time, password, role, status, update_time, user_name) VALUES (3, '2023-09-04 06:28:52', '$2a$10$k0GD6khRK0naL1tTxHNu6eG.WYBXPATL5c.p4dEBLPYYaf8rHM0o6', '2', 1, '2023-09-04 06:28:52', 'levantung@gmail.com');
INSERT INTO public.tb_account (account_id, create_time, password, role, status, update_time, user_name) VALUES (21, '2023-09-03 12:13:15', '$2a$10$kOG6khRK0naL1ttXhNu6eG.WYXBXPATL5c.p4dEBLPYYaf8rHM06', '3', 1, '2023-09-03 12:13:15', 'ttc24102002@gmail.com');
INSERT INTO public.tb_account (account_id, create_time, password, role, status, update_time, user_name) VALUES (22, '2023-09-03 12:13:15', '$2a$10$kOG6khRK0naL1ttXhNu6eG.WYXBXPATL5c.p4dEBLPYYaf8rHM06', '3', 1, '2023-09-03 12:13:15', 'boysubin999@gmail.com');
INSERT INTO public.tb_account (account_id, create_time, password, role, status, update_time, user_name) VALUES (23, '2023-09-03 12:13:15', '$2a$10$kOG6khRK0naL1ttXhNu6eG.WYXBXPATL5c.p4dEBLPYYaf8rHM06', '3', 1, '2023-09-03 12:13:15', 'aeslehc19102002@gmail.com');
INSERT INTO public.tb_account (account_id, create_time, password, role, status, update_time, user_name) VALUES (24, '2023-09-03 12:13:15', '$2a$10$kOG6khRK0naL1ttXhNu6eG.WYXBXPATL5c.p4dEBLPYYaf8rHM06', '3', 1, '2023-09-03 12:13:15', 'daocongdoan02@gmail.com');
INSERT INTO public.tb_account (account_id, create_time, password, role, status, update_time, user_name) VALUES (25, '2023-09-03 12:13:15', '$2a$10$kOG6khRK0naL1ttXhNu6eG.WYXBXPATL5c.p4dEBLPYYaf8rHM06', '3', 1, '2023-09-03 12:13:15', 'phamthanhdoanhp0402@gmail.com');
INSERT INTO public.tb_account (account_id, create_time, password, role, status, update_time, user_name) VALUES (26, '2023-09-03 12:13:15', '$2a$10$kOG6khRK0naL1ttXhNu6eG.WYXBXPATL5c.p4dEBLPYYaf8rHM06', '3', 1, '2023-09-03 12:13:15', 'phamdong9139@gmail.com');
INSERT INTO public.tb_account (account_id, create_time, password, role, status, update_time, user_name) VALUES (27, '2023-09-03 12:13:15', '$2a$10$kOG6khRK0naL1ttXhNu6eG.WYXBXPATL5c.p4dEBLPYYaf8rHM06', '3', 1, '2023-09-03 12:13:15', 'ngdung27112002@gmail.com');
INSERT INTO public.tb_account (account_id, create_time, password, role, status, update_time, user_name) VALUES (28, '2023-09-03 12:13:15', '$2a$10$kOG6khRK0naL1ttXhNu6eG.WYXBXPATL5c.p4dEBLPYYaf8rHM06', '3', 1, '2023-09-03 12:13:15', 'duongcso6720@gmail.com');
INSERT INTO public.tb_account (account_id, create_time, password, role, status, update_time, user_name) VALUES (29, '2023-09-03 12:13:15', '$2a$10$kOG6khRK0naL1ttXhNu6eG.WYXBXPATL5c.p4dEBLPYYaf8rHM06', '3', 1, '2023-09-03 12:13:15', 'doanduy121002@gmail.com');
INSERT INTO public.tb_account (account_id, create_time, password, role, status, update_time, user_name) VALUES (30, '2023-09-03 12:13:16', '$2a$10$kOG6khRK0naL1ttXhNu6eG.WYXBXPATL5c.p4dEBLPYYaf8rHM06', '3', 1, '2023-09-03 12:13:16', 'giang24062002@gmail.com');
INSERT INTO public.tb_account (account_id, create_time, password, role, status, update_time, user_name) VALUES (31, '2023-09-03 12:13:16', '$2a$10$kOG6khRK0naL1ttXhNu6eG.WYXBXPATL5c.p4dEBLPYYaf8rHM06', '3', 1, '2023-09-03 12:13:16', 'huynguyen02@gmail.com');
INSERT INTO public.tb_account (account_id, create_time, password, role, status, update_time, user_name) VALUES (32, '2023-09-03 12:13:16', '$2a$10$kOG6khRK0naL1ttXhNu6eG.WYXBXPATL5c.p4dEBLPYYaf8rHM06', '3', 1, '2023-09-03 12:13:16', 'hung02@gmail.com');
INSERT INTO public.tb_account (account_id, create_time, password, role, status, update_time, user_name) VALUES (33, '2023-09-03 12:13:16', '$2a$10$kOG6khRK0naL1ttXhNu6eG.WYXBXPATL5c.p4dEBLPYYaf8rHM06', '3', 1, '2023-09-03 12:13:16', 'khanh02@gmail.com');
INSERT INTO public.tb_account (account_id, create_time, password, role, status, update_time, user_name) VALUES (34, '2023-09-03 12:13:16', '$2a$10$kOG6khRK0naL1ttXhNu6eG.WYXBXPATL5c.p4dEBLPYYaf8rHM06', '3', 1, '2023-09-03 12:13:16', 'linhmanh02@gmail.com');
INSERT INTO public.tb_account (account_id, create_time, password, role, status, update_time, user_name) VALUES (35, '2023-09-03 12:13:16', '$2a$10$kOG6khRK0naL1ttXhNu6eG.WYXBXPATL5c.p4dEBLPYYaf8rHM06', '3', 1, '2023-09-03 12:13:16', 'hoangminh02@gmail.com');
INSERT INTO public.tb_account (account_id, create_time, password, role, status, update_time, user_name) VALUES (36, '2023-09-03 12:13:16', '$2a$10$kOG6khRK0naL1ttXhNu6eG.WYXBXPATL5c.p4dEBLPYYaf8rHM06', '3', 1, '2023-09-03 12:13:16', 'namnguyen02@gmail.com');
INSERT INTO public.tb_account (account_id, create_time, password, role, status, update_time, user_name) VALUES (37, '2023-09-03 12:13:16', '$2a$10$kOG6khRK0naL1ttXhNu6eG.WYXBXPATL5c.p4dEBLPYYaf8rHM06', '3', 1, '2023-09-03 12:13:16', 'ngocpham02@gmail.com');
INSERT INTO public.tb_account (account_id, create_time, password, role, status, update_time, user_name) VALUES (38, '2023-09-03 12:13:16', '$2a$10$kOG6khRK0naL1ttXhNu6eG.WYXBXPATL5c.p4dEBLPYYaf8rHM06', '3', 1, '2023-09-03 12:13:16', 'phucnguyen02@gmail.com');
INSERT INTO public.tb_account (account_id, create_time, password, role, status, update_time, user_name) VALUES (39, '2023-09-03 12:13:16', '$2a$10$kOG6khRK0naL1ttXhNu6eG.WYXBXPATL5c.p4dEBLPYYaf8rHM06', '3', 1, '2023-09-03 12:13:16', 'phuongdang02@gmail.com');
INSERT INTO public.tb_account (account_id, create_time, password, role, status, update_time, user_name) VALUES (40, '2023-09-03 12:13:16', '$2a$10$kOG6khRK0naL1ttXhNu6eG.WYXBXPATL5c.p4dEBLPYYaf8rHM06', '3', 1, '2023-09-03 12:13:16', 'quynhngo02@gmail.com');
INSERT INTO public.tb_account (account_id, create_time, password, role, status, update_time, user_name) VALUES (41, '2023-09-03 12:13:16', '$2a$10$kOG6khRK0naL1ttXhNu6eG.WYXBXPATL5c.p4dEBLPYYaf8rHM06', '3', 1, '2023-09-03 12:13:16', 'sonbui02@gmail.com');
INSERT INTO public.tb_account (account_id, create_time, password, role, status, update_time, user_name) VALUES (42, '2023-09-03 12:13:16', '$2a$10$kOG6khRK0naL1ttXhNu6eG.WYXBXPATL5c.p4dEBLPYYaf8rHM06', '3', 1, '2023-09-03 12:13:16', 'tungle02@gmail.com');
INSERT INTO public.tb_account (account_id, create_time, password, role, status, update_time, user_name) VALUES (43, '2023-09-03 12:13:16', '$2a$10$kOG6khRK0naL1ttXhNu6eG.WYXBXPATL5c.p4dEBLPYYaf8rHM06', '3', 1, '2023-09-03 12:13:16', 'vanvu02@gmail.com');
INSERT INTO public.tb_account (account_id, create_time, password, role, status, update_time, user_name) VALUES (44, '2023-09-03 12:13:16', '$2a$10$kOG6khRK0naL1ttXhNu6eG.WYXBXPATL5c.p4dEBLPYYaf8rHM06', '3', 1, '2023-09-03 12:13:16', 'xuannguyen02@gmail.com');
INSERT INTO public.tb_account (account_id, create_time, password, role, status, update_time, user_name) VALUES (45, '2023-09-03 12:13:16', '$2a$10$kOG6khRK0naL1ttXhNu6eG.WYXBXPATL5c.p4dEBLPYYaf8rHM06', '3', 1, '2023-09-03 12:13:16', 'yendinh02@gmail.com');
INSERT INTO public.tb_account (account_id, create_time, password, role, status, update_time, user_name) VALUES (46, '2023-09-03 12:13:16', '$2a$10$kOG6khRK0naL1ttXhNu6eG.WYXBXPATL5c.p4dEBLPYYaf8rHM06', '3', 1, '2023-09-03 12:13:16', 'thanhhoang02@gmail.com');
INSERT INTO public.tb_account (account_id, create_time, password, role, status, update_time, user_name) VALUES (47, '2023-09-03 12:13:16', '$2a$10$kOG6khRK0naL1ttXhNu6eG.WYXBXPATL5c.p4dEBLPYYaf8rHM06', '3', 1, '2023-09-03 12:13:16', 'haily02@gmail.com');
INSERT INTO public.tb_account (account_id, create_time, password, role, status, update_time, user_name) VALUES (48, '2023-09-03 12:13:16', '$2a$10$kOG6khRK0naL1ttXhNu6eG.WYXBXPATL5c.p4dEBLPYYaf8rHM06', '3', 1, '2023-09-03 12:13:16', 'longnguyen02@gmail.com');
INSERT INTO public.tb_account (account_id, create_time, password, role, status, update_time, user_name) VALUES (49, '2023-09-03 12:13:16', '$2a$10$kOG6khRK0naL1ttXhNu6eG.WYXBXPATL5c.p4dEBLPYYaf8rHM06', '3', 1, '2023-09-03 12:13:16', 'daitran02@gmail.com');
INSERT INTO public.tb_account (account_id, create_time, password, role, status, update_time, user_name) VALUES (50, '2023-09-03 12:13:16', '$2a$10$kOG6khRK0naL1ttXhNu6eG.WYXBXPATL5c.p4dEBLPYYaf8rHM06', '3', 1, '2023-09-03 12:13:16', 'datnguyen02@gmail.com');
INSERT INTO public.tb_account (account_id, create_time, password, role, status, update_time, user_name) VALUES (51, '2023-09-03 12:13:16', '$2a$10$kOG6khRK0naL1ttXhNu6eG.WYXBXPATL5c.p4dEBLPYYaf8rHM06', '3', 1, '2023-09-03 12:13:16', 'baoanh.le02@gmail.com');
INSERT INTO public.tb_account (account_id, create_time, password, role, status, update_time, user_name) VALUES (52, '2023-09-03 12:13:16', '$2a$10$kOG6khRK0naL1ttXhNu6eG.WYXBXPATL5c.p4dEBLPYYaf8rHM06', '3', 1, '2023-09-03 12:13:16', 'ngocbich.tran02@gmail.com');
INSERT INTO public.tb_account (account_id, create_time, password, role, status, update_time, user_name) VALUES (53, '2023-09-03 12:13:16', '$2a$10$kOG6khRK0naL1ttXhNu6eG.WYXBXPATL5c.p4dEBLPYYaf8rHM06', '3', 1, '2023-09-03 12:13:16', 'cuongnguyen02@gmail.com');
INSERT INTO public.tb_account (account_id, create_time, password, role, status, update_time, user_name) VALUES (54, '2023-09-03 12:13:16', '$2a$10$kOG6khRK0naL1ttXhNu6eG.WYXBXPATL5c.p4dEBLPYYaf8rHM06', '3', 1, '2023-09-03 12:13:16', 'dieuhoang02@gmail.com');
INSERT INTO public.tb_account (account_id, create_time, password, role, status, update_time, user_name) VALUES (55, '2023-09-03 12:13:16', '$2a$10$kOG6khRK0naL1ttXhNu6eG.WYXBXPATL5c.p4dEBLPYYaf8rHM06', '3', 1, '2023-09-03 12:13:16', 'dongpham02@gmail.com');
INSERT INTO public.tb_account (account_id, create_time, password, role, status, update_time, user_name) VALUES (56, '2023-09-03 12:13:16', '$2a$10$kOG6khRK0naL1ttXhNu6eG.WYXBXPATL5c.p4dEBLPYYaf8rHM06', '3', 1, '2023-09-03 12:13:16', 'ngochaly02@gmail.com');
INSERT INTO public.tb_account (account_id, create_time, password, role, status, update_time, user_name) VALUES (57, '2023-09-03 12:13:16', '$2a$10$kOG6khRK0naL1ttXhNu6eG.WYXBXPATL5c.p4dEBLPYYaf8rHM06', '3', 1, '2023-09-03 12:13:16', 'hoavo02@gmail.com');
INSERT INTO public.tb_account (account_id, create_time, password, role, status, update_time, user_name) VALUES (58, '2023-09-03 12:13:16', '$2a$10$kOG6khRK0naL1ttXhNu6eG.WYXBXPATL5c.p4dEBLPYYaf8rHM06', '3', 1, '2023-09-03 12:13:16', 'kimhuong02@gmail.com');
INSERT INTO public.tb_account (account_id, create_time, password, role, status, update_time, user_name) VALUES (59, '2023-09-03 12:13:16', '$2a$10$kOG6khRK0naL1ttXhNu6eG.WYXBXPATL5c.p4dEBLPYYaf8rHM06', '3', 1, '2023-09-03 12:13:16', 'huytran02@gmail.com');
INSERT INTO public.tb_account (account_id, create_time, password, role, status, update_time, user_name) VALUES (60, '2023-09-03 12:13:16', '$2a$10$kOG6khRK0naL1ttXhNu6eG.WYXBXPATL5c.p4dEBLPYYaf8rHM06', '3', 1, '2023-09-03 12:13:16', 'khanhnguyen02@gmail.com');
INSERT INTO public.tb_account (account_id, create_time, password, role, status, update_time, user_name) VALUES (61, '2023-09-03 12:13:16', '$2a$10$kOG6khRK0naL1ttXhNu6eG.WYXBXPATL5c.p4dEBLPYYaf8rHM06', '3', 1, '2023-09-03 12:13:16', 'lanpham02@gmail.com');
INSERT INTO public.tb_account (account_id, create_time, password, role, status, update_time, user_name) VALUES (62, '2023-09-03 12:13:16', '$2a$10$kOG6khRK0naL1ttXhNu6eG.WYXBXPATL5c.p4dEBLPYYaf8rHM06', '3', 1, '2023-09-03 12:13:16', 'locnguyen02@gmail.com');
INSERT INTO public.tb_account (account_id, create_time, password, role, status, update_time, user_name) VALUES (63, '2023-09-03 12:13:16', '$2a$10$kOG6khRK0naL1ttXhNu6eG.WYXBXPATL5c.p4dEBLPYYaf8rHM06', '3', 1, '2023-09-03 12:13:16', 'dangminh02@gmail.com');
INSERT INTO public.tb_account (account_id, create_time, password, role, status, update_time, user_name) VALUES (64, '2023-09-03 12:13:16', '$2a$10$kOG6khRK0naL1ttXhNu6eG.WYXBXPATL5c.p4dEBLPYYaf8rHM06', '3', 1, '2023-09-03 12:13:16', 'my.le02@gmail.com');
INSERT INTO public.tb_account (account_id, create_time, password, role, status, update_time, user_name) VALUES (65, '2023-09-03 12:13:16', '$2a$10$kOG6khRK0naL1ttXhNu6eG.WYXBXPATL5c.p4dEBLPYYaf8rHM06', '3', 1, '2023-09-03 12:13:16', 'nhannguyen02@gmail.com');
INSERT INTO public.tb_account (account_id, create_time, password, role, status, update_time, user_name) VALUES (66, '2023-09-03 12:13:16', '$2a$10$kOG6khRK0naL1ttXhNu6eG.WYXBXPATL5c.p4dEBLPYYaf8rHM06', '3', 1, '2023-09-03 12:13:16', 'nhattran02@gmail.com');
INSERT INTO public.tb_account (account_id, create_time, password, role, status, update_time, user_name) VALUES (67, '2023-09-03 12:13:16', '$2a$10$kOG6khRK0naL1ttXhNu6eG.WYXBXPATL5c.p4dEBLPYYaf8rHM06', '3', 1, '2023-09-03 12:13:16', 'phonghoang02@gmail.com');
INSERT INTO public.tb_account (account_id, create_time, password, role, status, update_time, user_name) VALUES (68, '2023-09-03 12:13:16', '$2a$10$kOG6khRK0naL1ttXhNu6eG.WYXBXPATL5c.p4dEBLPYYaf8rHM06', '3', 1, '2023-09-03 12:13:16', 'phuongvo02@gmail.com');
INSERT INTO public.tb_account (account_id, create_time, password, role, status, update_time, user_name) VALUES (69, '2023-09-03 12:13:16', '$2a$10$kOG6khRK0naL1ttXhNu6eG.WYXBXPATL5c.p4dEBLPYYaf8rHM06', '3', 1, '2023-09-03 12:13:16', 'quannguyen02@gmail.com');
INSERT INTO public.tb_account (account_id, create_time, password, role, status, update_time, user_name) VALUES (70, '2023-09-03 12:13:16', '$2a$10$kOG6khRK0naL1ttXhNu6eG.WYXBXPATL5c.p4dEBLPYYaf8rHM06', '3', 1, '2023-09-03 12:13:16', 'thuypham02@gmail.com');


--
-- TOC entry 4937 (class 0 OID 16707)
-- Dependencies: 233
-- Data for Name: tb_classroom; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.tb_classroom (class_id, course_id, current_student, maximum_student, semester_id, lecture_id, create_time, update_time, status) VALUES (3, 1, 0, 60, 4, 1, '2024-12-06 22:03:17.331002', '2024-12-06 22:03:17.331002', 1);
INSERT INTO public.tb_classroom (class_id, course_id, current_student, maximum_student, semester_id, lecture_id, create_time, update_time, status) VALUES (6, 16, 0, 60, 3, 2, '2024-12-03 22:43:46.582381', '2024-12-03 22:43:46.582381', 1);
INSERT INTO public.tb_classroom (class_id, course_id, current_student, maximum_student, semester_id, lecture_id, create_time, update_time, status) VALUES (7, 17, 0, 70, 5, 2, '2024-12-03 22:43:46.582381', NULL, 1);
INSERT INTO public.tb_classroom (class_id, course_id, current_student, maximum_student, semester_id, lecture_id, create_time, update_time, status) VALUES (8, 18, 0, 70, 5, 3, '2024-12-03 22:43:46.582381', NULL, 1);
INSERT INTO public.tb_classroom (class_id, course_id, current_student, maximum_student, semester_id, lecture_id, create_time, update_time, status) VALUES (10, 20, 0, 70, 4, 4, '2024-12-03 22:43:46.582381', NULL, 1);
INSERT INTO public.tb_classroom (class_id, course_id, current_student, maximum_student, semester_id, lecture_id, create_time, update_time, status) VALUES (11, 21, 0, 70, 4, 2, '2024-12-03 22:43:46.582381', NULL, 1);
INSERT INTO public.tb_classroom (class_id, course_id, current_student, maximum_student, semester_id, lecture_id, create_time, update_time, status) VALUES (12, 22, 0, 70, 4, 6, '2024-12-03 22:43:46.582381', NULL, 1);
INSERT INTO public.tb_classroom (class_id, course_id, current_student, maximum_student, semester_id, lecture_id, create_time, update_time, status) VALUES (13, 23, 0, 70, 4, 5, '2024-12-03 22:43:46.582381', NULL, 1);
INSERT INTO public.tb_classroom (class_id, course_id, current_student, maximum_student, semester_id, lecture_id, create_time, update_time, status) VALUES (14, 24, 0, 70, 3, 5, '2024-12-03 22:43:46.582381', NULL, 1);
INSERT INTO public.tb_classroom (class_id, course_id, current_student, maximum_student, semester_id, lecture_id, create_time, update_time, status) VALUES (15, 25, 0, 70, 3, 4, '2024-12-03 22:43:46.582381', NULL, 1);
INSERT INTO public.tb_classroom (class_id, course_id, current_student, maximum_student, semester_id, lecture_id, create_time, update_time, status) VALUES (16, 26, 0, 70, 3, 3, '2024-12-03 22:43:46.582381', NULL, 1);
INSERT INTO public.tb_classroom (class_id, course_id, current_student, maximum_student, semester_id, lecture_id, create_time, update_time, status) VALUES (17, 27, 0, 70, 3, 2, '2024-12-03 22:43:46.582381', NULL, 1);
INSERT INTO public.tb_classroom (class_id, course_id, current_student, maximum_student, semester_id, lecture_id, create_time, update_time, status) VALUES (18, 28, 0, 70, 3, 2, '2024-12-03 22:43:46.582381', NULL, 1);
INSERT INTO public.tb_classroom (class_id, course_id, current_student, maximum_student, semester_id, lecture_id, create_time, update_time, status) VALUES (9, 19, 0, 70, 5, 5, '2024-12-03 22:43:46.582381', NULL, 1);
INSERT INTO public.tb_classroom (class_id, course_id, current_student, maximum_student, semester_id, lecture_id, create_time, update_time, status) VALUES (5, 1, 1, 60, 1, 1, '2024-12-03 22:43:46.582381', '2024-12-03 22:43:46.582381', 1);
INSERT INTO public.tb_classroom (class_id, course_id, current_student, maximum_student, semester_id, lecture_id, create_time, update_time, status) VALUES (1, 2, 4, 60, 1, 1, '2024-12-03 22:43:46.582381', '2024-12-04 00:40:06.41238', 1);
INSERT INTO public.tb_classroom (class_id, course_id, current_student, maximum_student, semester_id, lecture_id, create_time, update_time, status) VALUES (2, 5, 5, 60, 1, 1, '2024-12-06 22:03:10.198618', '2024-12-06 22:19:10.883161', 1);
INSERT INTO public.tb_classroom (class_id, course_id, current_student, maximum_student, semester_id, lecture_id, create_time, update_time, status) VALUES (4, 3, 2, 60, 1, 1, '2024-12-06 22:03:22.776731', '2024-12-06 22:18:57.562361', 1);
INSERT INTO public.tb_classroom (class_id, course_id, current_student, maximum_student, semester_id, lecture_id, create_time, update_time, status) VALUES (19, 2, 1, 60, 3, 1, NULL, NULL, 1);
INSERT INTO public.tb_classroom (class_id, course_id, current_student, maximum_student, semester_id, lecture_id, create_time, update_time, status) VALUES (20, 3, 1, 60, 3, 1, NULL, NULL, 1);


--
-- TOC entry 4925 (class 0 OID 16649)
-- Dependencies: 221
-- Data for Name: tb_course; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.tb_course (course_id, condition, course_name, create_time, credit, update_time) VALUES (3, 0, 'Cơ sở dữ liệu', '2024-11-24 20:06:36.194058', 3, '2024-11-24 20:06:36.194058');
INSERT INTO public.tb_course (course_id, condition, course_name, create_time, credit, update_time) VALUES (4, 3, 'Hệ quản trị cơ sở dữ liệu', '2024-11-24 20:07:17.68722', 3, '2024-11-24 20:07:17.68722');
INSERT INTO public.tb_course (course_id, condition, course_name, create_time, credit, update_time) VALUES (5, 0, 'Nguyên lý hệ điều hành', '2024-11-24 20:07:42.314725', 3, '2024-11-24 20:07:42.314725');
INSERT INTO public.tb_course (course_id, condition, course_name, create_time, credit, update_time) VALUES (6, 5, 'Lập trình hướng đối tượng', '2024-11-24 20:15:06.701923', 3, '2024-11-24 20:15:06.701923');
INSERT INTO public.tb_course (course_id, condition, course_name, create_time, credit, update_time) VALUES (1, 2, 'Tiếng anh công nghệ thông tin 2', '2024-11-24 20:02:47.688238', 5, '2024-12-01 00:56:11.251375');
INSERT INTO public.tb_course (course_id, condition, course_name, create_time, credit, update_time) VALUES (2, 0, 'Tiếng anh công nghệ thông tin 1', '2024-11-24 20:04:27.035014', 5, '2024-12-02 18:56:22.261082');
INSERT INTO public.tb_course (course_id, condition, course_name, create_time, credit, update_time) VALUES (8, 5, 'Lập trình .net', '2024-12-03 21:38:52.884872', 3, '2024-12-03 21:38:52.884872');
INSERT INTO public.tb_course (course_id, condition, course_name, create_time, credit, update_time) VALUES (7, 6, 'Lập trình java', '2024-11-24 20:15:23.733631', 4, '2024-12-03 21:57:09.385382');
INSERT INTO public.tb_course (course_id, condition, course_name, create_time, credit, update_time) VALUES (9, 0, 'Triết học Marx-Lenin', '2024-12-06 22:52:33.723215', 3, '2024-12-06 22:52:33.723215');
INSERT INTO public.tb_course (course_id, condition, course_name, create_time, credit, update_time) VALUES (10, 6, 'Lập trình Python', '2024-12-07 10:00:00', 3, '2024-12-07 10:00:00');
INSERT INTO public.tb_course (course_id, condition, course_name, create_time, credit, update_time) VALUES (11, 4, 'Hệ quản trị cơ sở dữ liệu nâng cao', '2024-12-07 11:00:00', 4, '2024-12-07 11:00:00');
INSERT INTO public.tb_course (course_id, condition, course_name, create_time, credit, update_time) VALUES (12, 0, 'Chủ nghĩa xã hội khoa học', '2024-12-07 12:00:00', 4, '2024-12-07 12:00:00');
INSERT INTO public.tb_course (course_id, condition, course_name, create_time, credit, update_time) VALUES (13, 0, 'Lập trình C++', '2024-12-08 13:00:00', 3, '2024-12-08 13:00:00');
INSERT INTO public.tb_course (course_id, condition, course_name, create_time, credit, update_time) VALUES (14, 7, 'Lập trình Java nâng cao', '2024-12-08 14:00:00', 4, '2024-12-08 14:00:00');
INSERT INTO public.tb_course (course_id, condition, course_name, create_time, credit, update_time) VALUES (15, 8, 'Lập trình ASP.NET', '2024-12-08 15:00:00', 4, '2024-12-08 15:00:00');
INSERT INTO public.tb_course (course_id, condition, course_name, create_time, credit, update_time) VALUES (16, 0, 'Tư tưởng Hồ Chí Minh', '2024-12-09 16:00:00', 2, '2024-12-09 16:00:00');
INSERT INTO public.tb_course (course_id, condition, course_name, create_time, credit, update_time) VALUES (17, 0, 'Phân tích dữ liệu với Python', '2024-12-10 17:00:00', 3, '2024-12-10 17:00:00');
INSERT INTO public.tb_course (course_id, condition, course_name, create_time, credit, update_time) VALUES (18, 0, 'Big Data và NoSQL', '2024-12-10 18:00:00', 4, '2024-12-10 18:00:00');
INSERT INTO public.tb_course (course_id, condition, course_name, create_time, credit, update_time) VALUES (19, 0, 'Quản lý dự án công nghệ thông tin ', '2024-12-11 19:00:00', 5, '2024-12-11 19:00:00');
INSERT INTO public.tb_course (course_id, condition, course_name, create_time, credit, update_time) VALUES (20, 0, 'Nhập môn lập trình', '2024-12-12 08:00:00', 3, '2024-12-12 08:00:00');
INSERT INTO public.tb_course (course_id, condition, course_name, create_time, credit, update_time) VALUES (21, 0, 'Toán rời rạc', '2024-12-12 09:00:00', 4, '2024-12-12 09:00:00');
INSERT INTO public.tb_course (course_id, condition, course_name, create_time, credit, update_time) VALUES (22, 0, 'Xác suất thống kê', '2024-12-12 10:00:00', 3, '2024-12-12 10:00:00');
INSERT INTO public.tb_course (course_id, condition, course_name, create_time, credit, update_time) VALUES (23, 0, 'Kỹ thuật lập trình', '2024-12-12 11:00:00', 3, '2024-12-12 11:00:00');
INSERT INTO public.tb_course (course_id, condition, course_name, create_time, credit, update_time) VALUES (24, 0, 'Nhập môn trí tuệ nhân tạo', '2024-12-12 12:00:00', 3, '2024-12-12 12:00:00');
INSERT INTO public.tb_course (course_id, condition, course_name, create_time, credit, update_time) VALUES (25, 0, 'Lịch sử Đảng Cộng sản Việt Nam', '2024-12-13 08:00:00', 2, '2024-12-13 08:00:00');
INSERT INTO public.tb_course (course_id, condition, course_name, create_time, credit, update_time) VALUES (26, 0, 'Tư duy thuật toán', '2024-12-13 09:00:00', 3, '2024-12-13 09:00:00');
INSERT INTO public.tb_course (course_id, condition, course_name, create_time, credit, update_time) VALUES (27, 0, 'Hệ thống số và logic', '2024-12-13 10:00:00', 4, '2024-12-13 10:00:00');
INSERT INTO public.tb_course (course_id, condition, course_name, create_time, credit, update_time) VALUES (28, 0, 'Cấu trúc dữ liệu và giải thuật', '2024-12-13 11:00:00', 4, '2024-12-13 11:00:00');
INSERT INTO public.tb_course (course_id, condition, course_name, create_time, credit, update_time) VALUES (29, 0, 'Kỹ năng mềm và giao tiếp', '2024-12-13 12:00:00', 2, '2024-12-13 12:00:00');


--
-- TOC entry 4927 (class 0 OID 16656)
-- Dependencies: 223
-- Data for Name: tb_course_registration; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.tb_course_registration (course_registration_id, create_time, point, student_id, update_time, class_id) VALUES (19, '2024-12-06 22:18:57.594812', 3.5, 11, '2024-12-06 22:18:57.594812', 4);
INSERT INTO public.tb_course_registration (course_registration_id, create_time, point, student_id, update_time, class_id) VALUES (20, '2024-12-06 22:19:10.885686', 6, 11, '2024-12-06 22:19:10.885686', 2);
INSERT INTO public.tb_course_registration (course_registration_id, create_time, point, student_id, update_time, class_id) VALUES (18, '2024-12-04 00:40:06.442819', 3, 11, '2024-12-04 00:58:08.743169', 1);
INSERT INTO public.tb_course_registration (course_registration_id, create_time, point, student_id, update_time, class_id) VALUES (1, NULL, 3, 21, NULL, 2);
INSERT INTO public.tb_course_registration (course_registration_id, create_time, point, student_id, update_time, class_id) VALUES (2, NULL, 10, 20, NULL, 2);
INSERT INTO public.tb_course_registration (course_registration_id, create_time, point, student_id, update_time, class_id) VALUES (3, NULL, 8, 19, NULL, 4);
INSERT INTO public.tb_course_registration (course_registration_id, create_time, point, student_id, update_time, class_id) VALUES (4, NULL, 7, 18, NULL, 2);
INSERT INTO public.tb_course_registration (course_registration_id, create_time, point, student_id, update_time, class_id) VALUES (5, NULL, 9, 17, NULL, 2);
INSERT INTO public.tb_course_registration (course_registration_id, create_time, point, student_id, update_time, class_id) VALUES (6, NULL, 6, 16, NULL, 1);
INSERT INTO public.tb_course_registration (course_registration_id, create_time, point, student_id, update_time, class_id) VALUES (7, NULL, 7, 15, NULL, 1);
INSERT INTO public.tb_course_registration (course_registration_id, create_time, point, student_id, update_time, class_id) VALUES (8, NULL, 4, 14, NULL, 1);
INSERT INTO public.tb_course_registration (course_registration_id, create_time, point, student_id, update_time, class_id) VALUES (9, NULL, 8, 11, NULL, 20);
INSERT INTO public.tb_course_registration (course_registration_id, create_time, point, student_id, update_time, class_id) VALUES (10, NULL, 9, 11, NULL, 19);
INSERT INTO public.tb_course_registration (course_registration_id, create_time, point, student_id, update_time, class_id) VALUES (11, NULL, -1, 12, NULL, 10);
INSERT INTO public.tb_course_registration (course_registration_id, create_time, point, student_id, update_time, class_id) VALUES (12, NULL, -1, 13, NULL, 10);
INSERT INTO public.tb_course_registration (course_registration_id, create_time, point, student_id, update_time, class_id) VALUES (13, NULL, -1, 14, NULL, 10);
INSERT INTO public.tb_course_registration (course_registration_id, create_time, point, student_id, update_time, class_id) VALUES (14, NULL, -1, 15, NULL, 10);
INSERT INTO public.tb_course_registration (course_registration_id, create_time, point, student_id, update_time, class_id) VALUES (15, NULL, -1, 16, NULL, 10);
INSERT INTO public.tb_course_registration (course_registration_id, create_time, point, student_id, update_time, class_id) VALUES (16, NULL, -1, 17, NULL, 10);
INSERT INTO public.tb_course_registration (course_registration_id, create_time, point, student_id, update_time, class_id) VALUES (17, NULL, -1, 18, NULL, 10);


--
-- TOC entry 4929 (class 0 OID 16663)
-- Dependencies: 225
-- Data for Name: tb_evaluate; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 4931 (class 0 OID 16670)
-- Dependencies: 227
-- Data for Name: tb_info; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.tb_info (info_id, address, avatar, create_time, date_of_birth, email, full_name, gender, phone_number, update_time) VALUES (1, 'Số 19, ngõ 132, phường Minh Khai, thành phố Hà Nội', NULL, '2023-09-04 06:28:52', '2002-09-04', 'phamhongnguyen@gmail.com', 'Phạm Hồng Nguyên', 1, '0982800770', '2023-09-04 06:28:52');
INSERT INTO public.tb_info (info_id, address, avatar, create_time, date_of_birth, email, full_name, gender, phone_number, update_time) VALUES (2, 'Số 19, ngõ 132, phường Minh Khai, thành phố Hà Nội', NULL, '2023-09-04 06:28:52', '2002-09-04', 'nguyenthongtien@gmail.com', 'Nguyễn Thông Tiến', 1, '0982518972', '2023-09-04 06:28:52');
INSERT INTO public.tb_info (info_id, address, avatar, create_time, date_of_birth, email, full_name, gender, phone_number, update_time) VALUES (3, 'Số 19, ngõ 132, phường Minh Khai, thành phố Hà Nội', NULL, '2023-09-04 06:28:52', '2002-09-04', 'levantung@gmail.com
', 'Lê Văn Tùng', 1, '0973175891', '2023-09-04 06:28:52');
INSERT INTO public.tb_info (info_id, address, avatar, create_time, date_of_birth, email, full_name, gender, phone_number, update_time) VALUES (4, 'Số 11, ngõ 178, phố Quan Nhân, quận Thanh Xuân, thành phố  Hà Nội', NULL, '2023-09-04 06:28:52', '2002-09-04', 'phamthanhdao@gmail.com', 'Phạm Thành Đạo', 1, '0973148566', '2023-09-04 06:28:52');
INSERT INTO public.tb_info (info_id, address, avatar, create_time, date_of_birth, email, full_name, gender, phone_number, update_time) VALUES (5, 'Hà nội', NULL, '2023-09-03 05:23:59', '2002-07-01', 'sontx@sv.edu.vn', 'Trịnh Xuân Sơn', 1, '0372238783', '2023-09-05 02:06:55');
INSERT INTO public.tb_info (info_id, address, avatar, create_time, date_of_birth, email, full_name, gender, phone_number, update_time) VALUES (6, 'Hà nội', NULL, '2023-09-03 05:23:59', '2002-07-07', 'an@sv.edu.vn', 'Lê Văn An', 1, '0372238783', '2023-09-03 11:36:05');
INSERT INTO public.tb_info (info_id, address, avatar, create_time, date_of_birth, email, full_name, gender, phone_number, update_time) VALUES (7, 'Hà nội', NULL, '2023-09-03 05:23:59', '2000-01-07', 'antt@sv.edu.vn', 'Hoang Tran An', 0, '0356938783', '2023-09-03 09:08:23');
INSERT INTO public.tb_info (info_id, address, avatar, create_time, date_of_birth, email, full_name, gender, phone_number, update_time) VALUES (11, '', NULL, '2023-09-03 12:13:14', '2002-11-20', 'anh218120@gmail.com', 'Nguyễn Tuấn Anh', 0, '09147362851
', '2023-09-03 12:13:14');
INSERT INTO public.tb_info (info_id, address, avatar, create_time, date_of_birth, email, full_name, gender, phone_number, update_time) VALUES (12, 'xóm Trung Tâm Nghĩa Phúc Tân kỳ Nghệ An', NULL, '2023-09-03 12:13:14', '2001-01-24', 'anhskt2k1@gmail.com', 'Nguyễn Thiện Đức Anh', 0, '09361852740', '2023-09-04 05:45:17');
INSERT INTO public.tb_info (info_id, address, avatar, create_time, date_of_birth, email, full_name, gender, phone_number, update_time) VALUES (8, NULL, NULL, '2023-09-03 08:32:16', NULL, 'lehongphong@gmail.com', 'Lê Hồng Phong', 1, '08675821347', '2023-09-03 08:32:16');
INSERT INTO public.tb_info (info_id, address, avatar, create_time, date_of_birth, email, full_name, gender, phone_number, update_time) VALUES (16, '', NULL, '2023-09-03 12:13:15', '2002-06-29', 'thanhdat26221@gmail.com', 'Nguyễn Văn Biên', 1, '09235718462', '2023-09-03 12:13:15');
INSERT INTO public.tb_info (info_id, address, avatar, create_time, date_of_birth, email, full_name, gender, phone_number, update_time) VALUES (9, NULL, NULL, '2023-09-03 09:00:30', NULL, 'nguyenmanhtan@gmail.com', 'Nguyễn Mạnh Tân ', 1, '08947318526
', '2023-09-06 00:13:21');
INSERT INTO public.tb_info (info_id, address, avatar, create_time, date_of_birth, email, full_name, gender, phone_number, update_time) VALUES (10, 'Phù Vân, Phủ Lý, Hà Nam', NULL, '2023-09-03 12:13:14', '2002-09-09', 'quanganhho99@gmail.com', 'Hồ Quang Anh', 0, '08829467352', '2023-09-03 12:13:14');
INSERT INTO public.tb_info (info_id, address, avatar, create_time, date_of_birth, email, full_name, gender, phone_number, update_time) VALUES (13, 'Số 12- ngõ 25- đường 24/8- Lê Hồng Phong-Phủ Lý- Hà Nam', NULL, '2023-09-03 12:13:15', '2002-01-16', 'qa123.bn@gmail.com', 'Trịnh Đắc Quang Anh', 0, '09873165284', '2023-09-04 05:45:14');
INSERT INTO public.tb_info (info_id, address, avatar, create_time, date_of_birth, email, full_name, gender, phone_number, update_time) VALUES (17, '', NULL, '2023-09-03 12:13:15', '2002-08-18', 'ngocchung1882002@gmail.com', 'Trần Ngọc Chung', 0, '09748365210', '2023-09-03 12:13:15');
INSERT INTO public.tb_info (info_id, address, avatar, create_time, date_of_birth, email, full_name, gender, phone_number, update_time) VALUES (18, ' Phù Vân, Lê Hồng Phong, Phủ Lí, Hà Nam', NULL, '2023-09-03 12:13:15', '2002-05-25', 'duccong25tq@gmail.com', 'Nguyễn Đức Công', 0, '09356748291', '2023-09-03 12:13:15');
INSERT INTO public.tb_info (info_id, address, avatar, create_time, date_of_birth, email, full_name, gender, phone_number, update_time) VALUES (19, 'Xóm 5 - Trực Đại - Trực Ninh - Nam Định', NULL, '2023-09-03 12:13:15', '2002-03-22', 'phamduccong02@gmail.com', 'Phạm Đức Công', 0, '09437628541', '2023-09-04 05:45:07');
INSERT INTO public.tb_info (info_id, address, avatar, create_time, date_of_birth, email, full_name, gender, phone_number, update_time) VALUES (20, 'Tổ 8 Lê Hồng Phong Phủ Lý Hà Nam', NULL, '2023-09-03 12:13:15', '2002-05-05', 'hoangtuoxich@gmail.com', 'Đỗ Mạnh Cường', 0, '09182365470', '2023-09-03 12:13:15');
INSERT INTO public.tb_info (info_id, address, avatar, create_time, date_of_birth, email, full_name, gender, phone_number, update_time) VALUES (21, 'Xóm4- Kim Thái- Vụ Bản- Nam Định', NULL, '2023-09-03 12:13:15', '2002-10-24', 'ttc24102002@gmail.com', 'Trần Tiến Cường', 0, '09845673281
', '2023-09-03 12:13:15');
INSERT INTO public.tb_info (info_id, address, avatar, create_time, date_of_birth, email, full_name, gender, phone_number, update_time) VALUES (22, 'SÔ NHA 209 BAC DƯƠNG VĂN THUY THÔN 1 PHU VÂN ĐƯƠNG LY THƯƠNG KIÊT THANH PHÔ PHU LY TINH HA NAM', NULL, '2023-09-03 12:13:15', '2002-02-19', 'boysubin999@gmail.com', 'Vũ Xuân Đào', 0, '08629347512', '2023-09-03 12:13:15');
INSERT INTO public.tb_info (info_id, address, avatar, create_time, date_of_birth, email, full_name, gender, phone_number, update_time) VALUES (23, 'Tổ 16 Lê Hồng Phong- Phủ Lý - Hà Nam', NULL, '2023-09-03 12:13:15', '2002-10-19', 'aeslehc19102002@gmail.com', 'Vũ Phát Đạt', 0, '09285713642', '2023-09-03 12:13:15');
INSERT INTO public.tb_info (info_id, address, avatar, create_time, date_of_birth, email, full_name, gender, phone_number, update_time) VALUES (24, 'Lê Hồng Phong , Phủ Lý , Hà Nam', NULL, '2023-09-03 12:13:15', '2002-05-01', 'daocongdoan02@gmail.com', 'Đào Công Đoàn', 0, '08941265378', '2023-09-03 12:13:15');
INSERT INTO public.tb_info (info_id, address, avatar, create_time, date_of_birth, email, full_name, gender, phone_number, update_time) VALUES (25, 'Thôn Hang Lương, Lưu Kỳ, Thuỷ Nguyên, Hải Phòng', NULL, '2023-09-03 12:13:15', '2002-02-04', 'phamthanhdoanhp0402@gmail.com', 'Phạm Thành Đoàn', 0, '09658743210', '2023-09-03 12:13:15');
INSERT INTO public.tb_info (info_id, address, avatar, create_time, date_of_birth, email, full_name, gender, phone_number, update_time) VALUES (26, 'Tổ 1, Xuân Trường, Xuân Trường, Nam Định', NULL, '2023-09-03 12:13:15', '2002-11-16', 'phamdong9139@gmail.com', 'Phạm Văn Đồng', 0, '09437651289', '2023-09-03 12:13:15');
INSERT INTO public.tb_info (info_id, address, avatar, create_time, date_of_birth, email, full_name, gender, phone_number, update_time) VALUES (27, 'Hưng Đạo - Tứ Kỳ - Hải Dương', NULL, '2023-09-03 12:13:15', '2002-11-27', 'ngdung27112002@gmail.com', 'Nguyễn Mạnh Dũng', 0, '09378125460', '2023-09-03 12:13:15');
INSERT INTO public.tb_info (info_id, address, avatar, create_time, date_of_birth, email, full_name, gender, phone_number, update_time) VALUES (28, '', NULL, '2023-09-03 12:13:15', '2000-07-06', 'duongcso6720@gmail.com', 'Vương Tùng Dương', 0, '09165382749', '2023-09-03 12:13:15');
INSERT INTO public.tb_info (info_id, address, avatar, create_time, date_of_birth, email, full_name, gender, phone_number, update_time) VALUES (29, 'Khu 12 Thịnh Long Hải Hậu Nam Định', NULL, '2023-09-03 12:13:15', '2002-10-12', 'doanduy121002@gmail.com', 'Đoàn Đức Duy', 0, '08842936571', '2023-09-03 12:13:15');
INSERT INTO public.tb_info (info_id, address, avatar, create_time, date_of_birth, email, full_name, gender, phone_number, update_time) VALUES (30, '', NULL, '2023-09-03 12:13:16', '2002-06-24', 'giang24062002@gmail.com', 'Nguyễn Trường Giang', 0, '08657842310', '2023-09-03 12:13:16');
INSERT INTO public.tb_info (info_id, address, avatar, create_time, date_of_birth, email, full_name, gender, phone_number, update_time) VALUES (31, 'Phường Hưng Dũng - Thành phố Vinh - Nghệ An', NULL, '2023-09-03 12:13:16', '2002-07-25', 'huynguyen02@gmail.com', 'Nguyễn Đức Huy', 0, '09842356178', '2023-09-03 12:13:16');
INSERT INTO public.tb_info (info_id, address, avatar, create_time, date_of_birth, email, full_name, gender, phone_number, update_time) VALUES (32, 'Thôn Vân Đình - Ứng Hoà - Hà Nội', NULL, '2023-09-03 12:13:16', '2002-02-10', 'hung02@gmail.com', 'Trần Mạnh Hùng', 0, '09482763542', '2023-09-03 12:13:16');
INSERT INTO public.tb_info (info_id, address, avatar, create_time, date_of_birth, email, full_name, gender, phone_number, update_time) VALUES (33, 'Lê Lợi - Đông Hà - Quảng Trị', NULL, '2023-09-03 12:13:16', '2002-12-01', 'khanh02@gmail.com', 'Lê Văn Khánh', 0, '09281735469', '2023-09-03 12:13:16');
INSERT INTO public.tb_info (info_id, address, avatar, create_time, date_of_birth, email, full_name, gender, phone_number, update_time) VALUES (34, 'Đức Thọ - Hà Tĩnh', NULL, '2023-09-03 12:13:16', '2002-08-13', 'linhmanh02@gmail.com', 'Nguyễn Mạnh Linh', 0, '09368425713', '2023-09-03 12:13:16');
INSERT INTO public.tb_info (info_id, address, avatar, create_time, date_of_birth, email, full_name, gender, phone_number, update_time) VALUES (35, 'Sơn Tây - Hà Nội', NULL, '2023-09-03 12:13:16', '2002-05-30', 'hoangminh02@gmail.com', 'Hoàng Văn Minh', 0, '09673452819', '2023-09-03 12:13:16');
INSERT INTO public.tb_info (info_id, address, avatar, create_time, date_of_birth, email, full_name, gender, phone_number, update_time) VALUES (36, 'Tân Lạc - Hoà Bình', NULL, '2023-09-03 12:13:16', '2002-11-15', 'namnguyen02@gmail.com', 'Nguyễn Đình Nam', 0, '09162735482', '2023-09-03 12:13:16');
INSERT INTO public.tb_info (info_id, address, avatar, create_time, date_of_birth, email, full_name, gender, phone_number, update_time) VALUES (37, 'Hạ Long - Quảng Ninh', NULL, '2023-09-03 12:13:16', '2002-07-01', 'ngocpham02@gmail.com', 'Phạm Thị Ngọc', 0, '08653729481', '2023-09-03 12:13:16');
INSERT INTO public.tb_info (info_id, address, avatar, create_time, date_of_birth, email, full_name, gender, phone_number, update_time) VALUES (38, 'Phủ Lý - Hà Nam', NULL, '2023-09-03 12:13:16', '2002-09-09', 'phucnguyen02@gmail.com', 'Nguyễn Văn Phúc', 0, '09874215360', '2023-09-03 12:13:16');
INSERT INTO public.tb_info (info_id, address, avatar, create_time, date_of_birth, email, full_name, gender, phone_number, update_time) VALUES (39, 'Ninh Bình', NULL, '2023-09-03 12:13:16', '2002-01-24', 'phuongdang02@gmail.com', 'Đặng Thanh Phương', 0, '09473562841', '2023-09-03 12:13:16');
INSERT INTO public.tb_info (info_id, address, avatar, create_time, date_of_birth, email, full_name, gender, phone_number, update_time) VALUES (40, 'Yên Bái', NULL, '2023-09-03 12:13:16', '2002-03-15', 'quynhngo02@gmail.com', 'Ngô Thị Quỳnh', 0, '09362875419', '2023-09-03 12:13:16');
INSERT INTO public.tb_info (info_id, address, avatar, create_time, date_of_birth, email, full_name, gender, phone_number, update_time) VALUES (41, 'Bắc Giang', NULL, '2023-09-03 12:13:16', '2002-06-10', 'sonbui02@gmail.com', 'Bùi Văn Sơn', 0, '09274865312', '2023-09-03 12:13:16');
INSERT INTO public.tb_info (info_id, address, avatar, create_time, date_of_birth, email, full_name, gender, phone_number, update_time) VALUES (42, 'Hải Dương', NULL, '2023-09-03 12:13:16', '2002-04-27', 'tungle02@gmail.com', 'Lê Văn Tùng', 0, '08953746281', '2023-09-03 12:13:16');
INSERT INTO public.tb_info (info_id, address, avatar, create_time, date_of_birth, email, full_name, gender, phone_number, update_time) VALUES (43, 'Nam Định', NULL, '2023-09-03 12:13:16', '2002-08-22', 'vanvu02@gmail.com', 'Vũ Thị Vân', 0, '09628475391', '2023-09-03 12:13:16');
INSERT INTO public.tb_info (info_id, address, avatar, create_time, date_of_birth, email, full_name, gender, phone_number, update_time) VALUES (44, 'Thái Bình', NULL, '2023-09-03 12:13:16', '2002-10-05', 'xuannguyen02@gmail.com', 'Nguyễn Văn Xuân', 0, '09358274160', '2023-09-03 12:13:16');
INSERT INTO public.tb_info (info_id, address, avatar, create_time, date_of_birth, email, full_name, gender, phone_number, update_time) VALUES (45, 'Thanh Hoá', NULL, '2023-09-03 12:13:16', '2002-12-18', 'yendinh02@gmail.com', 'Đinh Thị Yến', 0, '09164735280', '2023-09-03 12:13:16');
INSERT INTO public.tb_info (info_id, address, avatar, create_time, date_of_birth, email, full_name, gender, phone_number, update_time) VALUES (46, 'Vĩnh Phúc', NULL, '2023-09-03 12:13:16', '2002-02-02', 'thanhhoang02@gmail.com', 'Hoàng Văn Thành', 0, '09487265319', '2023-09-03 12:13:16');
INSERT INTO public.tb_info (info_id, address, avatar, create_time, date_of_birth, email, full_name, gender, phone_number, update_time) VALUES (47, 'Cao Bằng', NULL, '2023-09-03 12:13:16', '2002-05-12', 'haily02@gmail.com', 'Lý Văn Hải', 0, '08836524179', '2023-09-03 12:13:16');
INSERT INTO public.tb_info (info_id, address, avatar, create_time, date_of_birth, email, full_name, gender, phone_number, update_time) VALUES (48, 'Thái Nguyên', NULL, '2023-09-03 12:13:16', '2002-09-23', 'longnguyen02@gmail.com', 'Nguyễn Đình Long', 0, '08971426538', '2023-09-03 12:13:16');
INSERT INTO public.tb_info (info_id, address, avatar, create_time, date_of_birth, email, full_name, gender, phone_number, update_time) VALUES (49, 'Hải Phòng', NULL, '2023-09-03 12:13:16', '2002-06-14', 'daitran02@gmail.com', 'Trần Văn Đại', 0, '09264731852', '2023-09-03 12:13:16');
INSERT INTO public.tb_info (info_id, address, avatar, create_time, date_of_birth, email, full_name, gender, phone_number, update_time) VALUES (50, 'Nghệ An', NULL, '2023-09-03 12:13:16', '2002-07-08', 'datnguyen02@gmail.com', 'Nguyễn Văn Đạt', 0, '09357421689', '2023-09-03 12:13:16');
INSERT INTO public.tb_info (info_id, address, avatar, create_time, date_of_birth, email, full_name, gender, phone_number, update_time) VALUES (51, 'Quận 1 - TP.HCM', NULL, '2023-09-03 12:13:16', '2002-04-03', 'baoanh.le02@gmail.com', 'Lê Thị Bảo Anh', 0, '09482356174', '2023-09-03 12:13:16');
INSERT INTO public.tb_info (info_id, address, avatar, create_time, date_of_birth, email, full_name, gender, phone_number, update_time) VALUES (52, 'Quận 3 - TP.HCM', NULL, '2023-09-03 12:13:16', '2002-10-09', 'ngocbich.tran02@gmail.com', 'Trần Ngọc Bích', 0, '09173628540', '2023-09-03 12:13:16');
INSERT INTO public.tb_info (info_id, address, avatar, create_time, date_of_birth, email, full_name, gender, phone_number, update_time) VALUES (57, 'Thủ Đức - TP.HCM', NULL, '2023-09-03 12:13:16', '2002-02-28', 'hoavo02@gmail.com', 'Võ Văn Hòa', 0, '09458732614', '2023-09-03 12:13:16');
INSERT INTO public.tb_info (info_id, address, avatar, create_time, date_of_birth, email, full_name, gender, phone_number, update_time) VALUES (62, 'Cần Thơ', NULL, '2023-09-03 12:13:16', '2002-04-15', 'locnguyen02@gmail.com', 'Nguyễn Hữu Lộc', 0, '09648275391', '2023-09-03 12:13:16');
INSERT INTO public.tb_info (info_id, address, avatar, create_time, date_of_birth, email, full_name, gender, phone_number, update_time) VALUES (14, 'Phủ Lý ,Hà Nam', NULL, '2023-09-03 12:13:15', '2002-02-06', 'bangrickkid@gmail.com', 'Đào Anh Bằng', 1, '09645281763', '2023-09-03 12:13:15');
INSERT INTO public.tb_info (info_id, address, avatar, create_time, date_of_birth, email, full_name, gender, phone_number, update_time) VALUES (15, 'Lê Hông Phong Phủ Lí Hà Nam', NULL, '2023-09-03 12:13:15', '2002-10-12', 'baodo200002@gmail.com', 'Đỗ Duy Bảo', 1, '09481273659', '2023-09-04 05:45:10');
INSERT INTO public.tb_info (info_id, address, avatar, create_time, date_of_birth, email, full_name, gender, phone_number, update_time) VALUES (53, 'Thủ Dầu Một - Bình Dương', NULL, '2023-09-03 12:13:16', '2002-06-05', 'cuongnguyen02@gmail.com', 'Nguyễn Đức Cường', 0, '09835471628', '2023-09-03 12:13:16');
INSERT INTO public.tb_info (info_id, address, avatar, create_time, date_of_birth, email, full_name, gender, phone_number, update_time) VALUES (54, 'Quận 7 - TP.HCM', NULL, '2023-09-03 12:13:16', '2002-03-12', 'dieuhoang02@gmail.com', 'Hoàng Thị Diệu', 0, '08647253918', '2023-09-03 12:13:16');
INSERT INTO public.tb_info (info_id, address, avatar, create_time, date_of_birth, email, full_name, gender, phone_number, update_time) VALUES (55, 'Bến Cát - Bình Dương', NULL, '2023-09-03 12:13:16', '2002-01-21', 'dongpham02@gmail.com', 'Phạm Văn Đông', 0, '08856342710', '2023-09-03 12:13:16');
INSERT INTO public.tb_info (info_id, address, avatar, create_time, date_of_birth, email, full_name, gender, phone_number, update_time) VALUES (56, 'Quận Gò Vấp - TP.HCM', NULL, '2023-09-03 12:13:16', '2002-11-17', 'ngochaly02@gmail.com', 'Lý Ngọc Hà', 0, '09273465891', '2023-09-03 12:13:16');
INSERT INTO public.tb_info (info_id, address, avatar, create_time, date_of_birth, email, full_name, gender, phone_number, update_time) VALUES (58, 'Đồng Nai', NULL, '2023-09-03 12:13:16', '2002-12-02', 'kimhuong02@gmail.com', 'Nguyễn Thị Kim Hương', 0, '09364728150', '2023-09-03 12:13:16');
INSERT INTO public.tb_info (info_id, address, avatar, create_time, date_of_birth, email, full_name, gender, phone_number, update_time) VALUES (59, 'Biên Hòa - Đồng Nai', NULL, '2023-09-03 12:13:16', '2002-07-06', 'huytran02@gmail.com', 'Trần Thanh Huy', 0, '09364728150', '2023-09-03 12:13:16');
INSERT INTO public.tb_info (info_id, address, avatar, create_time, date_of_birth, email, full_name, gender, phone_number, update_time) VALUES (60, 'Quận Bình Tân - TP.HCM', NULL, '2023-09-03 12:13:16', '2002-05-19', 'khanhnguyen02@gmail.com', 'Nguyễn Văn Khánh', 0, '09841265379', '2023-09-03 12:13:16');
INSERT INTO public.tb_info (info_id, address, avatar, create_time, date_of_birth, email, full_name, gender, phone_number, update_time) VALUES (61, 'Quận 9 - TP.HCM', NULL, '2023-09-03 12:13:16', '2002-03-27', 'lanpham02@gmail.com', 'Phạm Thị Lan', 0, '09158246371', '2023-09-03 12:13:16');
INSERT INTO public.tb_info (info_id, address, avatar, create_time, date_of_birth, email, full_name, gender, phone_number, update_time) VALUES (63, 'Long An', NULL, '2023-09-03 12:13:16', '2002-08-29', 'dangminh02@gmail.com', 'Đặng Văn Minh', 0, '08943271658', '2023-09-03 12:13:16');
INSERT INTO public.tb_info (info_id, address, avatar, create_time, date_of_birth, email, full_name, gender, phone_number, update_time) VALUES (64, 'Quận Phú Nhuận - TP.HCM', NULL, '2023-09-03 12:13:16', '2002-02-16', 'my.le02@gmail.com', 'Lê Thị Mỹ', 0, '09274618352', '2023-09-03 12:13:16');
INSERT INTO public.tb_info (info_id, address, avatar, create_time, date_of_birth, email, full_name, gender, phone_number, update_time) VALUES (65, 'Bình Phước', NULL, '2023-09-03 12:13:16', '2002-10-11', 'nhannguyen02@gmail.com', 'Nguyễn Văn Nhân', 0, '09384752601', '2023-09-03 12:13:16');
INSERT INTO public.tb_info (info_id, address, avatar, create_time, date_of_birth, email, full_name, gender, phone_number, update_time) VALUES (66, 'Tân An - Long An', NULL, '2023-09-03 12:13:16', '2002-09-04', 'nhattran02@gmail.com', 'Trần Quang Nhật', 0, '09461825379', '2023-09-03 12:13:16');
INSERT INTO public.tb_info (info_id, address, avatar, create_time, date_of_birth, email, full_name, gender, phone_number, update_time) VALUES (67, 'Vĩnh Long', NULL, '2023-09-03 12:13:16', '2002-12-21', 'phonghoang02@gmail.com', 'Hoàng Hải Phong', 0, '09875263140', '2023-09-03 12:13:16');
INSERT INTO public.tb_info (info_id, address, avatar, create_time, date_of_birth, email, full_name, gender, phone_number, update_time) VALUES (68, 'Sóc Trăng', NULL, '2023-09-03 12:13:16', '2002-11-14', 'phuongvo02@gmail.com', 'Võ Thị Phương', 0, '08856347129', '2023-09-03 12:13:16');
INSERT INTO public.tb_info (info_id, address, avatar, create_time, date_of_birth, email, full_name, gender, phone_number, update_time) VALUES (69, 'Bến Tre', NULL, '2023-09-03 12:13:16', '2002-06-18', 'quannguyen02@gmail.com', 'Nguyễn Hoàng Quân', 0, '09234718659', '2023-09-03 12:13:16');
INSERT INTO public.tb_info (info_id, address, avatar, create_time, date_of_birth, email, full_name, gender, phone_number, update_time) VALUES (70, 'Hậu Giang', NULL, '2023-09-03 12:13:16', '2002-01-30', 'thuypham02@gmail.com', 'Phạm Thị Thuỷ', 0, '09682375140', '2023-09-03 12:13:16');


--
-- TOC entry 4935 (class 0 OID 16693)
-- Dependencies: 231
-- Data for Name: tb_lecture; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.tb_lecture (lecture_id, account_id, info_id, average_rating, create_time, update_time) VALUES (1, 1, 1, 0, '2024-12-13 00:12:25.175476', '2024-12-13 00:12:25.175476');
INSERT INTO public.tb_lecture (lecture_id, account_id, info_id, average_rating, create_time, update_time) VALUES (2, 2, 2, 0, '2024-12-13 00:12:25.175476', '2024-12-13 00:12:25.175476');
INSERT INTO public.tb_lecture (lecture_id, account_id, info_id, average_rating, create_time, update_time) VALUES (3, 3, 3, 0, '2024-12-13 00:12:25.175476', '2024-12-13 00:12:25.175476');
INSERT INTO public.tb_lecture (lecture_id, account_id, info_id, average_rating, create_time, update_time) VALUES (4, 4, 4, 0, '2024-12-13 00:12:25.175476', '2024-12-13 00:12:25.175476');
INSERT INTO public.tb_lecture (lecture_id, account_id, info_id, average_rating, create_time, update_time) VALUES (5, 5, 5, 0, '2024-12-13 00:12:25.175476', '2024-12-13 00:12:25.175476');
INSERT INTO public.tb_lecture (lecture_id, account_id, info_id, average_rating, create_time, update_time) VALUES (6, 6, 6, 0, '2024-12-13 00:12:25.175476', '2024-12-13 00:12:25.175476');
INSERT INTO public.tb_lecture (lecture_id, account_id, info_id, average_rating, create_time, update_time) VALUES (7, 7, 7, 0, '2024-12-13 00:12:25.175476', '2024-12-13 00:12:25.175476');
INSERT INTO public.tb_lecture (lecture_id, account_id, info_id, average_rating, create_time, update_time) VALUES (8, 8, 8, 0, '2024-12-13 00:12:25.175476', '2024-12-13 00:12:25.175476');
INSERT INTO public.tb_lecture (lecture_id, account_id, info_id, average_rating, create_time, update_time) VALUES (9, 9, 9, 0, '2024-12-13 00:12:25.175476', '2024-12-13 00:12:25.175476');
INSERT INTO public.tb_lecture (lecture_id, account_id, info_id, average_rating, create_time, update_time) VALUES (10, 10, 10, 0, '2024-12-13 00:12:25.175476', '2024-12-13 00:12:25.175476');


--
-- TOC entry 4941 (class 0 OID 16728)
-- Dependencies: 237
-- Data for Name: tb_question; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 4939 (class 0 OID 16714)
-- Dependencies: 235
-- Data for Name: tb_semester; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.tb_semester (semester_id, end_time, name, start_time) VALUES (1, '2023-06-01', 'Học kì 1 / 2023', '2023-02-01');
INSERT INTO public.tb_semester (semester_id, end_time, name, start_time) VALUES (2, '2024-01-01', 'Học kì 2 / 2023', '2023-09-01');
INSERT INTO public.tb_semester (semester_id, end_time, name, start_time) VALUES (3, '2024-06-01', 'Học kì 1 / 2024', '2024-02-01');
INSERT INTO public.tb_semester (semester_id, end_time, name, start_time) VALUES (5, '2025-06-01', 'Học kì 1 / 2025', '2025-02-01');
INSERT INTO public.tb_semester (semester_id, end_time, name, start_time) VALUES (6, '2026-01-01', 'Học kì 2 / 2025', '2025-02-01');
INSERT INTO public.tb_semester (semester_id, end_time, name, start_time) VALUES (4, '2025-01-01', 'Học kì 2 / 2024', '2024-12-30');


--
-- TOC entry 4933 (class 0 OID 16686)
-- Dependencies: 229
-- Data for Name: tb_student; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.tb_student (student_id, account_id, create_time, gpa, info_id, status, update_time) VALUES (11, 11, '2024-12-13 00:10:09.309055', 0, 11, 1, '2024-12-13 00:10:09.309055');
INSERT INTO public.tb_student (student_id, account_id, create_time, gpa, info_id, status, update_time) VALUES (12, 12, '2024-12-13 00:10:09.309055', 0, 12, 1, '2024-12-13 00:10:09.309055');
INSERT INTO public.tb_student (student_id, account_id, create_time, gpa, info_id, status, update_time) VALUES (13, 13, '2024-12-13 00:10:09.309055', 0, 13, 1, '2024-12-13 00:10:09.309055');
INSERT INTO public.tb_student (student_id, account_id, create_time, gpa, info_id, status, update_time) VALUES (14, 14, '2024-12-13 00:10:09.309055', 0, 14, 1, '2024-12-13 00:10:09.309055');
INSERT INTO public.tb_student (student_id, account_id, create_time, gpa, info_id, status, update_time) VALUES (15, 15, '2024-12-13 00:10:09.309055', 0, 15, 1, '2024-12-13 00:10:09.309055');
INSERT INTO public.tb_student (student_id, account_id, create_time, gpa, info_id, status, update_time) VALUES (16, 16, '2024-12-13 00:10:09.309055', 0, 16, 1, '2024-12-13 00:10:09.309055');
INSERT INTO public.tb_student (student_id, account_id, create_time, gpa, info_id, status, update_time) VALUES (17, 17, '2024-12-13 00:10:09.309055', 0, 17, 1, '2024-12-13 00:10:09.309055');
INSERT INTO public.tb_student (student_id, account_id, create_time, gpa, info_id, status, update_time) VALUES (18, 18, '2024-12-13 00:10:09.309055', 0, 18, 1, '2024-12-13 00:10:09.309055');
INSERT INTO public.tb_student (student_id, account_id, create_time, gpa, info_id, status, update_time) VALUES (19, 19, '2024-12-13 00:10:09.309055', 0, 19, 1, '2024-12-13 00:10:09.309055');
INSERT INTO public.tb_student (student_id, account_id, create_time, gpa, info_id, status, update_time) VALUES (20, 20, '2024-12-13 00:10:09.309055', 0, 20, 1, '2024-12-13 00:10:09.309055');
INSERT INTO public.tb_student (student_id, account_id, create_time, gpa, info_id, status, update_time) VALUES (21, 21, '2024-12-13 00:10:20.595051', 0, 21, 1, '2024-12-13 00:10:20.595051');
INSERT INTO public.tb_student (student_id, account_id, create_time, gpa, info_id, status, update_time) VALUES (22, 22, '2024-12-13 00:10:20.595051', 0, 22, 1, '2024-12-13 00:10:20.595051');
INSERT INTO public.tb_student (student_id, account_id, create_time, gpa, info_id, status, update_time) VALUES (23, 23, '2024-12-13 00:10:20.595051', 0, 23, 1, '2024-12-13 00:10:20.595051');
INSERT INTO public.tb_student (student_id, account_id, create_time, gpa, info_id, status, update_time) VALUES (24, 24, '2024-12-13 00:10:20.595051', 0, 24, 1, '2024-12-13 00:10:20.595051');
INSERT INTO public.tb_student (student_id, account_id, create_time, gpa, info_id, status, update_time) VALUES (25, 25, '2024-12-13 00:10:20.595051', 0, 25, 1, '2024-12-13 00:10:20.595051');
INSERT INTO public.tb_student (student_id, account_id, create_time, gpa, info_id, status, update_time) VALUES (26, 26, '2024-12-13 00:10:20.595051', 0, 26, 1, '2024-12-13 00:10:20.595051');
INSERT INTO public.tb_student (student_id, account_id, create_time, gpa, info_id, status, update_time) VALUES (27, 27, '2024-12-13 00:10:20.595051', 0, 27, 1, '2024-12-13 00:10:20.595051');
INSERT INTO public.tb_student (student_id, account_id, create_time, gpa, info_id, status, update_time) VALUES (28, 28, '2024-12-13 00:10:20.595051', 0, 28, 1, '2024-12-13 00:10:20.595051');
INSERT INTO public.tb_student (student_id, account_id, create_time, gpa, info_id, status, update_time) VALUES (29, 29, '2024-12-13 00:10:20.595051', 0, 29, 1, '2024-12-13 00:10:20.595051');
INSERT INTO public.tb_student (student_id, account_id, create_time, gpa, info_id, status, update_time) VALUES (30, 30, '2024-12-13 00:10:20.595051', 0, 30, 1, '2024-12-13 00:10:20.595051');
INSERT INTO public.tb_student (student_id, account_id, create_time, gpa, info_id, status, update_time) VALUES (31, 31, '2024-12-13 00:10:30.700175', 0, 31, 1, '2024-12-13 00:10:30.700175');
INSERT INTO public.tb_student (student_id, account_id, create_time, gpa, info_id, status, update_time) VALUES (32, 32, '2024-12-13 00:10:30.700175', 0, 32, 1, '2024-12-13 00:10:30.700175');
INSERT INTO public.tb_student (student_id, account_id, create_time, gpa, info_id, status, update_time) VALUES (33, 33, '2024-12-13 00:10:30.700175', 0, 33, 1, '2024-12-13 00:10:30.700175');
INSERT INTO public.tb_student (student_id, account_id, create_time, gpa, info_id, status, update_time) VALUES (34, 34, '2024-12-13 00:10:30.700175', 0, 34, 1, '2024-12-13 00:10:30.700175');
INSERT INTO public.tb_student (student_id, account_id, create_time, gpa, info_id, status, update_time) VALUES (35, 35, '2024-12-13 00:10:30.700175', 0, 35, 1, '2024-12-13 00:10:30.700175');
INSERT INTO public.tb_student (student_id, account_id, create_time, gpa, info_id, status, update_time) VALUES (36, 36, '2024-12-13 00:10:30.700175', 0, 36, 1, '2024-12-13 00:10:30.700175');
INSERT INTO public.tb_student (student_id, account_id, create_time, gpa, info_id, status, update_time) VALUES (37, 37, '2024-12-13 00:10:30.700175', 0, 37, 1, '2024-12-13 00:10:30.700175');
INSERT INTO public.tb_student (student_id, account_id, create_time, gpa, info_id, status, update_time) VALUES (38, 38, '2024-12-13 00:10:30.700175', 0, 38, 1, '2024-12-13 00:10:30.700175');
INSERT INTO public.tb_student (student_id, account_id, create_time, gpa, info_id, status, update_time) VALUES (39, 39, '2024-12-13 00:10:30.700175', 0, 39, 1, '2024-12-13 00:10:30.700175');
INSERT INTO public.tb_student (student_id, account_id, create_time, gpa, info_id, status, update_time) VALUES (40, 40, '2024-12-13 00:10:30.700175', 0, 40, 1, '2024-12-13 00:10:30.700175');
INSERT INTO public.tb_student (student_id, account_id, create_time, gpa, info_id, status, update_time) VALUES (41, 41, '2024-12-13 00:10:30.700175', 0, 41, 1, '2024-12-13 00:10:30.700175');
INSERT INTO public.tb_student (student_id, account_id, create_time, gpa, info_id, status, update_time) VALUES (42, 42, '2024-12-13 00:10:30.700175', 0, 42, 1, '2024-12-13 00:10:30.700175');
INSERT INTO public.tb_student (student_id, account_id, create_time, gpa, info_id, status, update_time) VALUES (43, 43, '2024-12-13 00:10:30.700175', 0, 43, 1, '2024-12-13 00:10:30.700175');
INSERT INTO public.tb_student (student_id, account_id, create_time, gpa, info_id, status, update_time) VALUES (44, 44, '2024-12-13 00:10:30.700175', 0, 44, 1, '2024-12-13 00:10:30.700175');
INSERT INTO public.tb_student (student_id, account_id, create_time, gpa, info_id, status, update_time) VALUES (45, 45, '2024-12-13 00:10:30.700175', 0, 45, 1, '2024-12-13 00:10:30.700175');
INSERT INTO public.tb_student (student_id, account_id, create_time, gpa, info_id, status, update_time) VALUES (46, 46, '2024-12-13 00:10:30.700175', 0, 46, 1, '2024-12-13 00:10:30.700175');
INSERT INTO public.tb_student (student_id, account_id, create_time, gpa, info_id, status, update_time) VALUES (47, 47, '2024-12-13 00:10:30.700175', 0, 47, 1, '2024-12-13 00:10:30.700175');
INSERT INTO public.tb_student (student_id, account_id, create_time, gpa, info_id, status, update_time) VALUES (48, 48, '2024-12-13 00:10:30.700175', 0, 48, 1, '2024-12-13 00:10:30.700175');
INSERT INTO public.tb_student (student_id, account_id, create_time, gpa, info_id, status, update_time) VALUES (49, 49, '2024-12-13 00:10:30.700175', 0, 49, 1, '2024-12-13 00:10:30.700175');
INSERT INTO public.tb_student (student_id, account_id, create_time, gpa, info_id, status, update_time) VALUES (50, 50, '2024-12-13 00:10:30.700175', 0, 50, 1, '2024-12-13 00:10:30.700175');
INSERT INTO public.tb_student (student_id, account_id, create_time, gpa, info_id, status, update_time) VALUES (51, 51, '2024-12-13 00:10:30.700175', 0, 51, 1, '2024-12-13 00:10:30.700175');
INSERT INTO public.tb_student (student_id, account_id, create_time, gpa, info_id, status, update_time) VALUES (52, 52, '2024-12-13 00:10:30.700175', 0, 52, 1, '2024-12-13 00:10:30.700175');
INSERT INTO public.tb_student (student_id, account_id, create_time, gpa, info_id, status, update_time) VALUES (53, 53, '2024-12-13 00:10:30.700175', 0, 53, 1, '2024-12-13 00:10:30.700175');
INSERT INTO public.tb_student (student_id, account_id, create_time, gpa, info_id, status, update_time) VALUES (54, 54, '2024-12-13 00:10:30.700175', 0, 54, 1, '2024-12-13 00:10:30.700175');
INSERT INTO public.tb_student (student_id, account_id, create_time, gpa, info_id, status, update_time) VALUES (55, 55, '2024-12-13 00:10:30.700175', 0, 55, 1, '2024-12-13 00:10:30.700175');
INSERT INTO public.tb_student (student_id, account_id, create_time, gpa, info_id, status, update_time) VALUES (56, 56, '2024-12-13 00:10:30.700175', 0, 56, 1, '2024-12-13 00:10:30.700175');
INSERT INTO public.tb_student (student_id, account_id, create_time, gpa, info_id, status, update_time) VALUES (57, 57, '2024-12-13 00:10:30.700175', 0, 57, 1, '2024-12-13 00:10:30.700175');
INSERT INTO public.tb_student (student_id, account_id, create_time, gpa, info_id, status, update_time) VALUES (58, 58, '2024-12-13 00:10:30.700175', 0, 58, 1, '2024-12-13 00:10:30.700175');
INSERT INTO public.tb_student (student_id, account_id, create_time, gpa, info_id, status, update_time) VALUES (59, 59, '2024-12-13 00:10:30.700175', 0, 59, 1, '2024-12-13 00:10:30.700175');
INSERT INTO public.tb_student (student_id, account_id, create_time, gpa, info_id, status, update_time) VALUES (60, 60, '2024-12-13 00:10:30.700175', 0, 60, 1, '2024-12-13 00:10:30.700175');
INSERT INTO public.tb_student (student_id, account_id, create_time, gpa, info_id, status, update_time) VALUES (61, 61, '2024-12-13 00:10:30.700175', 0, 61, 1, '2024-12-13 00:10:30.700175');
INSERT INTO public.tb_student (student_id, account_id, create_time, gpa, info_id, status, update_time) VALUES (62, 62, '2024-12-13 00:10:30.700175', 0, 62, 1, '2024-12-13 00:10:30.700175');
INSERT INTO public.tb_student (student_id, account_id, create_time, gpa, info_id, status, update_time) VALUES (63, 63, '2024-12-13 00:10:30.700175', 0, 63, 1, '2024-12-13 00:10:30.700175');
INSERT INTO public.tb_student (student_id, account_id, create_time, gpa, info_id, status, update_time) VALUES (64, 64, '2024-12-13 00:10:30.700175', 0, 64, 1, '2024-12-13 00:10:30.700175');
INSERT INTO public.tb_student (student_id, account_id, create_time, gpa, info_id, status, update_time) VALUES (65, 65, '2024-12-13 00:10:30.700175', 0, 65, 1, '2024-12-13 00:10:30.700175');
INSERT INTO public.tb_student (student_id, account_id, create_time, gpa, info_id, status, update_time) VALUES (66, 66, '2024-12-13 00:10:30.700175', 0, 66, 1, '2024-12-13 00:10:30.700175');
INSERT INTO public.tb_student (student_id, account_id, create_time, gpa, info_id, status, update_time) VALUES (67, 67, '2024-12-13 00:10:30.700175', 0, 67, 1, '2024-12-13 00:10:30.700175');
INSERT INTO public.tb_student (student_id, account_id, create_time, gpa, info_id, status, update_time) VALUES (68, 68, '2024-12-13 00:10:30.700175', 0, 68, 1, '2024-12-13 00:10:30.700175');
INSERT INTO public.tb_student (student_id, account_id, create_time, gpa, info_id, status, update_time) VALUES (69, 69, '2024-12-13 00:10:30.700175', 0, 69, 1, '2024-12-13 00:10:30.700175');
INSERT INTO public.tb_student (student_id, account_id, create_time, gpa, info_id, status, update_time) VALUES (70, 70, '2024-12-13 00:10:30.700175', 0, 70, 1, '2024-12-13 00:10:30.700175');


--
-- TOC entry 4958 (class 0 OID 0)
-- Dependencies: 218
-- Name: tb_account_account_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tb_account_account_id_seq', 3, true);


--
-- TOC entry 4959 (class 0 OID 0)
-- Dependencies: 232
-- Name: tb_classroom_class_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tb_classroom_class_id_seq', 4, true);


--
-- TOC entry 4960 (class 0 OID 0)
-- Dependencies: 220
-- Name: tb_course_course_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tb_course_course_id_seq', 9, true);


--
-- TOC entry 4961 (class 0 OID 0)
-- Dependencies: 222
-- Name: tb_course_registration_course_registration_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tb_course_registration_course_registration_id_seq', 20, true);


--
-- TOC entry 4962 (class 0 OID 0)
-- Dependencies: 224
-- Name: tb_evaluate_evaluate_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tb_evaluate_evaluate_id_seq', 1, false);


--
-- TOC entry 4963 (class 0 OID 0)
-- Dependencies: 226
-- Name: tb_info_info_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tb_info_info_id_seq', 1, false);


--
-- TOC entry 4964 (class 0 OID 0)
-- Dependencies: 236
-- Name: tb_question_question_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tb_question_question_id_seq', 1, false);


--
-- TOC entry 4965 (class 0 OID 0)
-- Dependencies: 234
-- Name: tb_semester_semester_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tb_semester_semester_id_seq', 1, true);


--
-- TOC entry 4966 (class 0 OID 0)
-- Dependencies: 228
-- Name: tb_student_student_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tb_student_student_id_seq', 1, false);


--
-- TOC entry 4967 (class 0 OID 0)
-- Dependencies: 230
-- Name: tb_teacher_teacher_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tb_teacher_teacher_id_seq', 1, false);


--
-- TOC entry 4758 (class 2606 OID 16647)
-- Name: tb_account tb_account_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_account
    ADD CONSTRAINT tb_account_pkey PRIMARY KEY (account_id);


--
-- TOC entry 4772 (class 2606 OID 16712)
-- Name: tb_classroom tb_classroom_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_classroom
    ADD CONSTRAINT tb_classroom_pkey PRIMARY KEY (class_id);


--
-- TOC entry 4760 (class 2606 OID 16654)
-- Name: tb_course tb_course_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_course
    ADD CONSTRAINT tb_course_pkey PRIMARY KEY (course_id);


--
-- TOC entry 4762 (class 2606 OID 16661)
-- Name: tb_course_registration tb_course_registration_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_course_registration
    ADD CONSTRAINT tb_course_registration_pkey PRIMARY KEY (course_registration_id);


--
-- TOC entry 4764 (class 2606 OID 16668)
-- Name: tb_evaluate tb_evaluate_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_evaluate
    ADD CONSTRAINT tb_evaluate_pkey PRIMARY KEY (evaluate_id);


--
-- TOC entry 4766 (class 2606 OID 16677)
-- Name: tb_info tb_info_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_info
    ADD CONSTRAINT tb_info_pkey PRIMARY KEY (info_id);


--
-- TOC entry 4776 (class 2606 OID 16733)
-- Name: tb_question tb_question_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_question
    ADD CONSTRAINT tb_question_pkey PRIMARY KEY (question_id);


--
-- TOC entry 4774 (class 2606 OID 16719)
-- Name: tb_semester tb_semester_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_semester
    ADD CONSTRAINT tb_semester_pkey PRIMARY KEY (semester_id);


--
-- TOC entry 4768 (class 2606 OID 16691)
-- Name: tb_student tb_student_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_student
    ADD CONSTRAINT tb_student_pkey PRIMARY KEY (student_id);


--
-- TOC entry 4770 (class 2606 OID 16698)
-- Name: tb_lecture tb_teacher_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_lecture
    ADD CONSTRAINT tb_teacher_pkey PRIMARY KEY (lecture_id);


-- Completed on 2024-12-14 18:40:48

--
-- PostgreSQL database dump complete
--

