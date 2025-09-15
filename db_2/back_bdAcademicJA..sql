--
-- PostgreSQL database dump
--

-- Dumped from database version 17.6 (Debian 17.6-1.pgdg13+1)
-- Dumped by pg_dump version 17.0

-- Started on 2025-09-11 11:40:20

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
-- TOC entry 3453 (class 1262 OID 41071)
-- Name: dbacademic_ja_dbeaver; Type: DATABASE; Schema: -; Owner: -
--

CREATE DATABASE dbacademic_ja_dbeaver WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.utf8';


\connect dbacademic_ja_dbeaver

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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 218 (class 1259 OID 41073)
-- Name: degrees_ja; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.degrees_ja (
    id integer NOT NULL,
    name character varying NOT NULL,
    number inet
);


--
-- TOC entry 217 (class 1259 OID 41072)
-- Name: degrees_ja_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.degrees_ja_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3454 (class 0 OID 0)
-- Dependencies: 217
-- Name: degrees_ja_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.degrees_ja_id_seq OWNED BY public.degrees_ja.id;


--
-- TOC entry 220 (class 1259 OID 41083)
-- Name: students_ja; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.students_ja (
    id integer NOT NULL,
    name character varying NOT NULL,
    state boolean DEFAULT true,
    degree integer NOT NULL,
    birthday date
);


--
-- TOC entry 219 (class 1259 OID 41082)
-- Name: students_ja_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.students_ja_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3455 (class 0 OID 0)
-- Dependencies: 219
-- Name: students_ja_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.students_ja_id_seq OWNED BY public.students_ja.id;


--
-- TOC entry 222 (class 1259 OID 41154)
-- Name: subjects_ja; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.subjects_ja (
    id integer NOT NULL,
    name character varying NOT NULL,
    state boolean DEFAULT true,
    degree integer NOT NULL
);


--
-- TOC entry 221 (class 1259 OID 41153)
-- Name: subjects_ja_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.subjects_ja_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3456 (class 0 OID 0)
-- Dependencies: 221
-- Name: subjects_ja_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.subjects_ja_id_seq OWNED BY public.subjects_ja.id;


--
-- TOC entry 3284 (class 2604 OID 41076)
-- Name: degrees_ja id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.degrees_ja ALTER COLUMN id SET DEFAULT nextval('public.degrees_ja_id_seq'::regclass);


--
-- TOC entry 3285 (class 2604 OID 41086)
-- Name: students_ja id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.students_ja ALTER COLUMN id SET DEFAULT nextval('public.students_ja_id_seq'::regclass);


--
-- TOC entry 3287 (class 2604 OID 41157)
-- Name: subjects_ja id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.subjects_ja ALTER COLUMN id SET DEFAULT nextval('public.subjects_ja_id_seq'::regclass);


--
-- TOC entry 3443 (class 0 OID 41073)
-- Dependencies: 218
-- Data for Name: degrees_ja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.degrees_ja (id, name, number) FROM stdin;
\.


--
-- TOC entry 3445 (class 0 OID 41083)
-- Dependencies: 220
-- Data for Name: students_ja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.students_ja (id, name, state, degree, birthday) FROM stdin;
\.


--
-- TOC entry 3447 (class 0 OID 41154)
-- Dependencies: 222
-- Data for Name: subjects_ja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.subjects_ja (id, name, state, degree) FROM stdin;
\.


--
-- TOC entry 3457 (class 0 OID 0)
-- Dependencies: 217
-- Name: degrees_ja_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.degrees_ja_id_seq', 1, false);


--
-- TOC entry 3458 (class 0 OID 0)
-- Dependencies: 219
-- Name: students_ja_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.students_ja_id_seq', 1, false);


--
-- TOC entry 3459 (class 0 OID 0)
-- Dependencies: 221
-- Name: subjects_ja_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.subjects_ja_id_seq', 1, false);


--
-- TOC entry 3290 (class 2606 OID 41081)
-- Name: degrees_ja degrees_ja_pk; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.degrees_ja
    ADD CONSTRAINT degrees_ja_pk PRIMARY KEY (id);


--
-- TOC entry 3292 (class 2606 OID 41091)
-- Name: students_ja students_ja_pk; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.students_ja
    ADD CONSTRAINT students_ja_pk PRIMARY KEY (id);


--
-- TOC entry 3294 (class 2606 OID 41162)
-- Name: subjects_ja subjects_ja_pk; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.subjects_ja
    ADD CONSTRAINT subjects_ja_pk PRIMARY KEY (id);


--
-- TOC entry 3295 (class 2606 OID 41092)
-- Name: students_ja students_ja_degrees_ja_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.students_ja
    ADD CONSTRAINT students_ja_degrees_ja_fk FOREIGN KEY (degree) REFERENCES public.degrees_ja(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 3296 (class 2606 OID 41163)
-- Name: subjects_ja subjects_ja_degrees_ja_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.subjects_ja
    ADD CONSTRAINT subjects_ja_degrees_ja_fk FOREIGN KEY (degree) REFERENCES public.degrees_ja(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


-- Completed on 2025-09-11 11:40:20

--
-- PostgreSQL database dump complete
--

