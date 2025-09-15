--
-- PostgreSQL database dump
--

\restrict KeGPLLyPM1KahLBEkfxDPY8nqbrMgbugh4znwSlyqJIpcxve0uYnb42ERQnBjcT

-- Dumped from database version 17.6 (Debian 17.6-1.pgdg13+1)
-- Dumped by pg_dump version 17.6

-- Started on 2025-09-02 17:10:16

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
-- TOC entry 226 (class 1259 OID 33155)
-- Name: almacen; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.almacen (
    id integer NOT NULL,
    nombre character varying(100) NOT NULL,
    sucursal_id integer
);


ALTER TABLE public.almacen OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 33154)
-- Name: almacen_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.almacen_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.almacen_id_seq OWNER TO postgres;

--
-- TOC entry 3547 (class 0 OID 0)
-- Dependencies: 225
-- Name: almacen_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.almacen_id_seq OWNED BY public.almacen.id;


--
-- TOC entry 218 (class 1259 OID 33111)
-- Name: categoria; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.categoria (
    id integer NOT NULL,
    nombre character varying(100) NOT NULL,
    descripcion text
);


ALTER TABLE public.categoria OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 33110)
-- Name: categoria_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.categoria_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.categoria_id_seq OWNER TO postgres;

--
-- TOC entry 3548 (class 0 OID 0)
-- Dependencies: 217
-- Name: categoria_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.categoria_id_seq OWNED BY public.categoria.id;


--
-- TOC entry 236 (class 1259 OID 33234)
-- Name: garantia; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.garantia (
    id integer NOT NULL,
    producto_id integer,
    tiempo_garantia integer,
    condiciones text
);


ALTER TABLE public.garantia OWNER TO postgres;

--
-- TOC entry 235 (class 1259 OID 33233)
-- Name: garantia_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.garantia_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.garantia_id_seq OWNER TO postgres;

--
-- TOC entry 3549 (class 0 OID 0)
-- Dependencies: 235
-- Name: garantia_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.garantia_id_seq OWNED BY public.garantia.id;


--
-- TOC entry 230 (class 1259 OID 33179)
-- Name: lote; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.lote (
    id integer NOT NULL,
    numero_lote character varying(50) NOT NULL,
    fecha_ingreso date,
    fecha_vencimiento date
);


ALTER TABLE public.lote OWNER TO postgres;

--
-- TOC entry 229 (class 1259 OID 33178)
-- Name: lote_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.lote_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.lote_id_seq OWNER TO postgres;

--
-- TOC entry 3550 (class 0 OID 0)
-- Dependencies: 229
-- Name: lote_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.lote_id_seq OWNED BY public.lote.id;


--
-- TOC entry 234 (class 1259 OID 33215)
-- Name: movimientoinventario; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.movimientoinventario (
    id integer NOT NULL,
    tipo_movimiento character varying(20),
    cantidad integer NOT NULL,
    fecha_movimiento timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    producto_id integer,
    sucursal_id integer,
    usuario_id integer,
    CONSTRAINT movimientoinventario_tipo_movimiento_check CHECK (((tipo_movimiento)::text = ANY ((ARRAY['ENTRADA'::character varying, 'SALIDA'::character varying, 'AJUSTE'::character varying])::text[])))
);


ALTER TABLE public.movimientoinventario OWNER TO postgres;

--
-- TOC entry 233 (class 1259 OID 33214)
-- Name: movimientoinventario_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.movimientoinventario_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.movimientoinventario_id_seq OWNER TO postgres;

--
-- TOC entry 3551 (class 0 OID 0)
-- Dependencies: 233
-- Name: movimientoinventario_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.movimientoinventario_id_seq OWNED BY public.movimientoinventario.id;


--
-- TOC entry 222 (class 1259 OID 33131)
-- Name: producto; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.producto (
    id integer NOT NULL,
    nombre character varying(200) NOT NULL,
    descripcion text,
    precio numeric(10,2),
    categoria_id integer,
    CONSTRAINT producto_precio_check CHECK ((precio >= (0)::numeric))
);


ALTER TABLE public.producto OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 33130)
-- Name: producto_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.producto_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.producto_id_seq OWNER TO postgres;

--
-- TOC entry 3552 (class 0 OID 0)
-- Dependencies: 221
-- Name: producto_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.producto_id_seq OWNED BY public.producto.id;


--
-- TOC entry 237 (class 1259 OID 33249)
-- Name: producto_proveedor; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.producto_proveedor (
    producto_id integer NOT NULL,
    proveedor_id integer NOT NULL
);


ALTER TABLE public.producto_proveedor OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 33122)
-- Name: proveedor; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.proveedor (
    id integer NOT NULL,
    nombre character varying(100) NOT NULL,
    contacto character varying(100),
    telefono character varying(20),
    direccion text
);


ALTER TABLE public.proveedor OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 33121)
-- Name: proveedor_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.proveedor_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.proveedor_id_seq OWNER TO postgres;

--
-- TOC entry 3553 (class 0 OID 0)
-- Dependencies: 219
-- Name: proveedor_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.proveedor_id_seq OWNED BY public.proveedor.id;


--
-- TOC entry 232 (class 1259 OID 33186)
-- Name: stocksucursal; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.stocksucursal (
    id integer NOT NULL,
    producto_id integer,
    sucursal_id integer,
    cantidad integer DEFAULT 0,
    ubicacion_id integer,
    lote_id integer,
    CONSTRAINT stocksucursal_cantidad_check CHECK ((cantidad >= 0))
);


ALTER TABLE public.stocksucursal OWNER TO postgres;

--
-- TOC entry 231 (class 1259 OID 33185)
-- Name: stocksucursal_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.stocksucursal_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.stocksucursal_id_seq OWNER TO postgres;

--
-- TOC entry 3554 (class 0 OID 0)
-- Dependencies: 231
-- Name: stocksucursal_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.stocksucursal_id_seq OWNED BY public.stocksucursal.id;


--
-- TOC entry 224 (class 1259 OID 33146)
-- Name: sucursal; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sucursal (
    id integer NOT NULL,
    nombre character varying(100) NOT NULL,
    direccion text,
    telefono character varying(20)
);


ALTER TABLE public.sucursal OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 33145)
-- Name: sucursal_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.sucursal_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.sucursal_id_seq OWNER TO postgres;

--
-- TOC entry 3555 (class 0 OID 0)
-- Dependencies: 223
-- Name: sucursal_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.sucursal_id_seq OWNED BY public.sucursal.id;


--
-- TOC entry 228 (class 1259 OID 33167)
-- Name: ubicacion; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ubicacion (
    id integer NOT NULL,
    pasillo character varying(10),
    estante character varying(10),
    nivel character varying(10),
    almacen_id integer
);


ALTER TABLE public.ubicacion OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 33166)
-- Name: ubicacion_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ubicacion_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.ubicacion_id_seq OWNER TO postgres;

--
-- TOC entry 3556 (class 0 OID 0)
-- Dependencies: 227
-- Name: ubicacion_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.ubicacion_id_seq OWNED BY public.ubicacion.id;


--
-- TOC entry 3327 (class 2604 OID 33158)
-- Name: almacen id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.almacen ALTER COLUMN id SET DEFAULT nextval('public.almacen_id_seq'::regclass);


--
-- TOC entry 3323 (class 2604 OID 33114)
-- Name: categoria id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categoria ALTER COLUMN id SET DEFAULT nextval('public.categoria_id_seq'::regclass);


--
-- TOC entry 3334 (class 2604 OID 33237)
-- Name: garantia id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.garantia ALTER COLUMN id SET DEFAULT nextval('public.garantia_id_seq'::regclass);


--
-- TOC entry 3329 (class 2604 OID 33182)
-- Name: lote id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lote ALTER COLUMN id SET DEFAULT nextval('public.lote_id_seq'::regclass);


--
-- TOC entry 3332 (class 2604 OID 33218)
-- Name: movimientoinventario id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movimientoinventario ALTER COLUMN id SET DEFAULT nextval('public.movimientoinventario_id_seq'::regclass);


--
-- TOC entry 3325 (class 2604 OID 33134)
-- Name: producto id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.producto ALTER COLUMN id SET DEFAULT nextval('public.producto_id_seq'::regclass);


--
-- TOC entry 3324 (class 2604 OID 33125)
-- Name: proveedor id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.proveedor ALTER COLUMN id SET DEFAULT nextval('public.proveedor_id_seq'::regclass);


--
-- TOC entry 3330 (class 2604 OID 33189)
-- Name: stocksucursal id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stocksucursal ALTER COLUMN id SET DEFAULT nextval('public.stocksucursal_id_seq'::regclass);


--
-- TOC entry 3326 (class 2604 OID 33149)
-- Name: sucursal id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sucursal ALTER COLUMN id SET DEFAULT nextval('public.sucursal_id_seq'::regclass);


--
-- TOC entry 3328 (class 2604 OID 33170)
-- Name: ubicacion id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ubicacion ALTER COLUMN id SET DEFAULT nextval('public.ubicacion_id_seq'::regclass);


--
-- TOC entry 3530 (class 0 OID 33155)
-- Dependencies: 226
-- Data for Name: almacen; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.almacen (id, nombre, sucursal_id) FROM stdin;
\.


--
-- TOC entry 3522 (class 0 OID 33111)
-- Dependencies: 218
-- Data for Name: categoria; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.categoria (id, nombre, descripcion) FROM stdin;
\.


--
-- TOC entry 3540 (class 0 OID 33234)
-- Dependencies: 236
-- Data for Name: garantia; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.garantia (id, producto_id, tiempo_garantia, condiciones) FROM stdin;
\.


--
-- TOC entry 3534 (class 0 OID 33179)
-- Dependencies: 230
-- Data for Name: lote; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.lote (id, numero_lote, fecha_ingreso, fecha_vencimiento) FROM stdin;
\.


--
-- TOC entry 3538 (class 0 OID 33215)
-- Dependencies: 234
-- Data for Name: movimientoinventario; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.movimientoinventario (id, tipo_movimiento, cantidad, fecha_movimiento, producto_id, sucursal_id, usuario_id) FROM stdin;
\.


--
-- TOC entry 3526 (class 0 OID 33131)
-- Dependencies: 222
-- Data for Name: producto; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.producto (id, nombre, descripcion, precio, categoria_id) FROM stdin;
\.


--
-- TOC entry 3541 (class 0 OID 33249)
-- Dependencies: 237
-- Data for Name: producto_proveedor; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.producto_proveedor (producto_id, proveedor_id) FROM stdin;
\.


--
-- TOC entry 3524 (class 0 OID 33122)
-- Dependencies: 220
-- Data for Name: proveedor; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.proveedor (id, nombre, contacto, telefono, direccion) FROM stdin;
\.


--
-- TOC entry 3536 (class 0 OID 33186)
-- Dependencies: 232
-- Data for Name: stocksucursal; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.stocksucursal (id, producto_id, sucursal_id, cantidad, ubicacion_id, lote_id) FROM stdin;
\.


--
-- TOC entry 3528 (class 0 OID 33146)
-- Dependencies: 224
-- Data for Name: sucursal; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sucursal (id, nombre, direccion, telefono) FROM stdin;
\.


--
-- TOC entry 3532 (class 0 OID 33167)
-- Dependencies: 228
-- Data for Name: ubicacion; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ubicacion (id, pasillo, estante, nivel, almacen_id) FROM stdin;
\.


--
-- TOC entry 3557 (class 0 OID 0)
-- Dependencies: 225
-- Name: almacen_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.almacen_id_seq', 1, false);


--
-- TOC entry 3558 (class 0 OID 0)
-- Dependencies: 217
-- Name: categoria_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.categoria_id_seq', 1, false);


--
-- TOC entry 3559 (class 0 OID 0)
-- Dependencies: 235
-- Name: garantia_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.garantia_id_seq', 1, false);


--
-- TOC entry 3560 (class 0 OID 0)
-- Dependencies: 229
-- Name: lote_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.lote_id_seq', 1, false);


--
-- TOC entry 3561 (class 0 OID 0)
-- Dependencies: 233
-- Name: movimientoinventario_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.movimientoinventario_id_seq', 1, false);


--
-- TOC entry 3562 (class 0 OID 0)
-- Dependencies: 221
-- Name: producto_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.producto_id_seq', 1, false);


--
-- TOC entry 3563 (class 0 OID 0)
-- Dependencies: 219
-- Name: proveedor_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.proveedor_id_seq', 1, false);


--
-- TOC entry 3564 (class 0 OID 0)
-- Dependencies: 231
-- Name: stocksucursal_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.stocksucursal_id_seq', 1, false);


--
-- TOC entry 3565 (class 0 OID 0)
-- Dependencies: 223
-- Name: sucursal_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.sucursal_id_seq', 1, false);


--
-- TOC entry 3566 (class 0 OID 0)
-- Dependencies: 227
-- Name: ubicacion_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.ubicacion_id_seq', 1, false);


--
-- TOC entry 3349 (class 2606 OID 33160)
-- Name: almacen almacen_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.almacen
    ADD CONSTRAINT almacen_pkey PRIMARY KEY (id);


--
-- TOC entry 3339 (class 2606 OID 33120)
-- Name: categoria categoria_nombre_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categoria
    ADD CONSTRAINT categoria_nombre_key UNIQUE (nombre);


--
-- TOC entry 3341 (class 2606 OID 33118)
-- Name: categoria categoria_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categoria
    ADD CONSTRAINT categoria_pkey PRIMARY KEY (id);


--
-- TOC entry 3359 (class 2606 OID 33241)
-- Name: garantia garantia_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.garantia
    ADD CONSTRAINT garantia_pkey PRIMARY KEY (id);


--
-- TOC entry 3361 (class 2606 OID 33243)
-- Name: garantia garantia_producto_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.garantia
    ADD CONSTRAINT garantia_producto_id_key UNIQUE (producto_id);


--
-- TOC entry 3353 (class 2606 OID 33184)
-- Name: lote lote_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lote
    ADD CONSTRAINT lote_pkey PRIMARY KEY (id);


--
-- TOC entry 3357 (class 2606 OID 33222)
-- Name: movimientoinventario movimientoinventario_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movimientoinventario
    ADD CONSTRAINT movimientoinventario_pkey PRIMARY KEY (id);


--
-- TOC entry 3345 (class 2606 OID 33139)
-- Name: producto producto_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.producto
    ADD CONSTRAINT producto_pkey PRIMARY KEY (id);


--
-- TOC entry 3363 (class 2606 OID 33253)
-- Name: producto_proveedor producto_proveedor_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.producto_proveedor
    ADD CONSTRAINT producto_proveedor_pkey PRIMARY KEY (producto_id, proveedor_id);


--
-- TOC entry 3343 (class 2606 OID 33129)
-- Name: proveedor proveedor_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.proveedor
    ADD CONSTRAINT proveedor_pkey PRIMARY KEY (id);


--
-- TOC entry 3355 (class 2606 OID 33193)
-- Name: stocksucursal stocksucursal_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stocksucursal
    ADD CONSTRAINT stocksucursal_pkey PRIMARY KEY (id);


--
-- TOC entry 3347 (class 2606 OID 33153)
-- Name: sucursal sucursal_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sucursal
    ADD CONSTRAINT sucursal_pkey PRIMARY KEY (id);


--
-- TOC entry 3351 (class 2606 OID 33172)
-- Name: ubicacion ubicacion_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ubicacion
    ADD CONSTRAINT ubicacion_pkey PRIMARY KEY (id);


--
-- TOC entry 3365 (class 2606 OID 33161)
-- Name: almacen almacen_sucursal_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.almacen
    ADD CONSTRAINT almacen_sucursal_id_fkey FOREIGN KEY (sucursal_id) REFERENCES public.sucursal(id);


--
-- TOC entry 3373 (class 2606 OID 33244)
-- Name: garantia garantia_producto_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.garantia
    ADD CONSTRAINT garantia_producto_id_fkey FOREIGN KEY (producto_id) REFERENCES public.producto(id);


--
-- TOC entry 3371 (class 2606 OID 33223)
-- Name: movimientoinventario movimientoinventario_producto_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movimientoinventario
    ADD CONSTRAINT movimientoinventario_producto_id_fkey FOREIGN KEY (producto_id) REFERENCES public.producto(id);


--
-- TOC entry 3372 (class 2606 OID 33228)
-- Name: movimientoinventario movimientoinventario_sucursal_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movimientoinventario
    ADD CONSTRAINT movimientoinventario_sucursal_id_fkey FOREIGN KEY (sucursal_id) REFERENCES public.sucursal(id);


--
-- TOC entry 3364 (class 2606 OID 33140)
-- Name: producto producto_categoria_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.producto
    ADD CONSTRAINT producto_categoria_id_fkey FOREIGN KEY (categoria_id) REFERENCES public.categoria(id);


--
-- TOC entry 3374 (class 2606 OID 33254)
-- Name: producto_proveedor producto_proveedor_producto_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.producto_proveedor
    ADD CONSTRAINT producto_proveedor_producto_id_fkey FOREIGN KEY (producto_id) REFERENCES public.producto(id);


--
-- TOC entry 3375 (class 2606 OID 33259)
-- Name: producto_proveedor producto_proveedor_proveedor_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.producto_proveedor
    ADD CONSTRAINT producto_proveedor_proveedor_id_fkey FOREIGN KEY (proveedor_id) REFERENCES public.proveedor(id);


--
-- TOC entry 3367 (class 2606 OID 33209)
-- Name: stocksucursal stocksucursal_lote_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stocksucursal
    ADD CONSTRAINT stocksucursal_lote_id_fkey FOREIGN KEY (lote_id) REFERENCES public.lote(id);


--
-- TOC entry 3368 (class 2606 OID 33194)
-- Name: stocksucursal stocksucursal_producto_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stocksucursal
    ADD CONSTRAINT stocksucursal_producto_id_fkey FOREIGN KEY (producto_id) REFERENCES public.producto(id);


--
-- TOC entry 3369 (class 2606 OID 33199)
-- Name: stocksucursal stocksucursal_sucursal_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stocksucursal
    ADD CONSTRAINT stocksucursal_sucursal_id_fkey FOREIGN KEY (sucursal_id) REFERENCES public.sucursal(id);


--
-- TOC entry 3370 (class 2606 OID 33204)
-- Name: stocksucursal stocksucursal_ubicacion_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stocksucursal
    ADD CONSTRAINT stocksucursal_ubicacion_id_fkey FOREIGN KEY (ubicacion_id) REFERENCES public.ubicacion(id);


--
-- TOC entry 3366 (class 2606 OID 33173)
-- Name: ubicacion ubicacion_almacen_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ubicacion
    ADD CONSTRAINT ubicacion_almacen_id_fkey FOREIGN KEY (almacen_id) REFERENCES public.almacen(id);


-- Completed on 2025-09-02 17:10:16

--
-- PostgreSQL database dump complete
--

\unrestrict KeGPLLyPM1KahLBEkfxDPY8nqbrMgbugh4znwSlyqJIpcxve0uYnb42ERQnBjcT

