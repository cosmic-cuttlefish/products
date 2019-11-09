--
-- PostgreSQL database dump
--

-- Dumped from database version 11.5
-- Dumped by pg_dump version 12.0

-- Started on 2019-11-09 16:49:30 EST

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

--
-- TOC entry 199 (class 1259 OID 21991)
-- Name: features; Type: TABLE; Schema: public; Owner: moyseos
--

CREATE TABLE public.features (
    id integer NOT NULL,
    product_id integer,
    feature character varying(50) NOT NULL,
    value character varying(50)
);


ALTER TABLE public.features OWNER TO moyseos;

--
-- TOC entry 198 (class 1259 OID 21989)
-- Name: features_id_seq; Type: SEQUENCE; Schema: public; Owner: moyseos
--

CREATE SEQUENCE public.features_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.features_id_seq OWNER TO moyseos;

--
-- TOC entry 3216 (class 0 OID 0)
-- Dependencies: 198
-- Name: features_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: moyseos
--

ALTER SEQUENCE public.features_id_seq OWNED BY public.features.id;


--
-- TOC entry 203 (class 1259 OID 22017)
-- Name: photos; Type: TABLE; Schema: public; Owner: moyseos
--

CREATE TABLE public.photos (
    id integer NOT NULL,
    style_id integer,
    url text,
    thumbnail_url text
);


ALTER TABLE public.photos OWNER TO moyseos;

--
-- TOC entry 202 (class 1259 OID 22015)
-- Name: photos_id_seq; Type: SEQUENCE; Schema: public; Owner: moyseos
--

CREATE SEQUENCE public.photos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.photos_id_seq OWNER TO moyseos;

--
-- TOC entry 3217 (class 0 OID 0)
-- Dependencies: 202
-- Name: photos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: moyseos
--

ALTER SEQUENCE public.photos_id_seq OWNED BY public.photos.id;


--
-- TOC entry 197 (class 1259 OID 21980)
-- Name: products; Type: TABLE; Schema: public; Owner: moyseos
--

CREATE TABLE public.products (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    slogan character varying(1000),
    description character varying(1000),
    category character varying(50),
    default_price integer
);


ALTER TABLE public.products OWNER TO moyseos;

--
-- TOC entry 196 (class 1259 OID 21978)
-- Name: products_id_seq; Type: SEQUENCE; Schema: public; Owner: moyseos
--

CREATE SEQUENCE public.products_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.products_id_seq OWNER TO moyseos;

--
-- TOC entry 3218 (class 0 OID 0)
-- Dependencies: 196
-- Name: products_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: moyseos
--

ALTER SEQUENCE public.products_id_seq OWNED BY public.products.id;


--
-- TOC entry 207 (class 1259 OID 22041)
-- Name: related_products; Type: TABLE; Schema: public; Owner: moyseos
--

CREATE TABLE public.related_products (
    id integer NOT NULL,
    current_product_id integer,
    related_product_id integer
);


ALTER TABLE public.related_products OWNER TO moyseos;

--
-- TOC entry 206 (class 1259 OID 22039)
-- Name: related_products_id_seq; Type: SEQUENCE; Schema: public; Owner: moyseos
--

CREATE SEQUENCE public.related_products_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.related_products_id_seq OWNER TO moyseos;

--
-- TOC entry 3219 (class 0 OID 0)
-- Dependencies: 206
-- Name: related_products_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: moyseos
--

ALTER SEQUENCE public.related_products_id_seq OWNED BY public.related_products.id;


--
-- TOC entry 205 (class 1259 OID 22033)
-- Name: skus; Type: TABLE; Schema: public; Owner: moyseos
--

CREATE TABLE public.skus (
    id integer NOT NULL,
    style_id integer,
    size character varying(10),
    quantity integer
);


ALTER TABLE public.skus OWNER TO moyseos;

--
-- TOC entry 204 (class 1259 OID 22031)
-- Name: skus_id_seq; Type: SEQUENCE; Schema: public; Owner: moyseos
--

CREATE SEQUENCE public.skus_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.skus_id_seq OWNER TO moyseos;

--
-- TOC entry 3220 (class 0 OID 0)
-- Dependencies: 204
-- Name: skus_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: moyseos
--

ALTER SEQUENCE public.skus_id_seq OWNED BY public.skus.id;


--
-- TOC entry 201 (class 1259 OID 22004)
-- Name: styles; Type: TABLE; Schema: public; Owner: moyseos
--

CREATE TABLE public.styles (
    id integer NOT NULL,
    name character varying(50),
    sale_price integer,
    original_price integer,
    product_id integer,
    default_style integer
);


ALTER TABLE public.styles OWNER TO moyseos;

--
-- TOC entry 200 (class 1259 OID 22002)
-- Name: styles_id_seq; Type: SEQUENCE; Schema: public; Owner: moyseos
--

CREATE SEQUENCE public.styles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.styles_id_seq OWNER TO moyseos;

--
-- TOC entry 3221 (class 0 OID 0)
-- Dependencies: 200
-- Name: styles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: moyseos
--

ALTER SEQUENCE public.styles_id_seq OWNED BY public.styles.id;


--
-- TOC entry 3070 (class 2604 OID 21994)
-- Name: features id; Type: DEFAULT; Schema: public; Owner: moyseos
--

ALTER TABLE ONLY public.features ALTER COLUMN id SET DEFAULT nextval('public.features_id_seq'::regclass);


--
-- TOC entry 3072 (class 2604 OID 22020)
-- Name: photos id; Type: DEFAULT; Schema: public; Owner: moyseos
--

ALTER TABLE ONLY public.photos ALTER COLUMN id SET DEFAULT nextval('public.photos_id_seq'::regclass);


--
-- TOC entry 3069 (class 2604 OID 21983)
-- Name: products id; Type: DEFAULT; Schema: public; Owner: moyseos
--

ALTER TABLE ONLY public.products ALTER COLUMN id SET DEFAULT nextval('public.products_id_seq'::regclass);


--
-- TOC entry 3074 (class 2604 OID 22044)
-- Name: related_products id; Type: DEFAULT; Schema: public; Owner: moyseos
--

ALTER TABLE ONLY public.related_products ALTER COLUMN id SET DEFAULT nextval('public.related_products_id_seq'::regclass);


--
-- TOC entry 3073 (class 2604 OID 22036)
-- Name: skus id; Type: DEFAULT; Schema: public; Owner: moyseos
--

ALTER TABLE ONLY public.skus ALTER COLUMN id SET DEFAULT nextval('public.skus_id_seq'::regclass);


--
-- TOC entry 3071 (class 2604 OID 22007)
-- Name: styles id; Type: DEFAULT; Schema: public; Owner: moyseos
--

ALTER TABLE ONLY public.styles ALTER COLUMN id SET DEFAULT nextval('public.styles_id_seq'::regclass);


--
-- TOC entry 3078 (class 2606 OID 21996)
-- Name: features features_pkey; Type: CONSTRAINT; Schema: public; Owner: moyseos
--

ALTER TABLE ONLY public.features
    ADD CONSTRAINT features_pkey PRIMARY KEY (id);


--
-- TOC entry 3082 (class 2606 OID 22025)
-- Name: photos photos_pkey; Type: CONSTRAINT; Schema: public; Owner: moyseos
--

ALTER TABLE ONLY public.photos
    ADD CONSTRAINT photos_pkey PRIMARY KEY (id);


--
-- TOC entry 3076 (class 2606 OID 21988)
-- Name: products products_pkey; Type: CONSTRAINT; Schema: public; Owner: moyseos
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (id);


--
-- TOC entry 3086 (class 2606 OID 22046)
-- Name: related_products related_products_pkey; Type: CONSTRAINT; Schema: public; Owner: moyseos
--

ALTER TABLE ONLY public.related_products
    ADD CONSTRAINT related_products_pkey PRIMARY KEY (id);


--
-- TOC entry 3084 (class 2606 OID 22038)
-- Name: skus skus_pkey; Type: CONSTRAINT; Schema: public; Owner: moyseos
--

ALTER TABLE ONLY public.skus
    ADD CONSTRAINT skus_pkey PRIMARY KEY (id);


--
-- TOC entry 3080 (class 2606 OID 22009)
-- Name: styles styles_pkey; Type: CONSTRAINT; Schema: public; Owner: moyseos
--

ALTER TABLE ONLY public.styles
    ADD CONSTRAINT styles_pkey PRIMARY KEY (id);


--
-- TOC entry 3087 (class 2606 OID 21997)
-- Name: features features_product_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: moyseos
--

ALTER TABLE ONLY public.features
    ADD CONSTRAINT features_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.products(id);


--
-- TOC entry 3089 (class 2606 OID 22026)
-- Name: photos photos_style_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: moyseos
--

ALTER TABLE ONLY public.photos
    ADD CONSTRAINT photos_style_id_fkey FOREIGN KEY (style_id) REFERENCES public.styles(id);


--
-- TOC entry 3088 (class 2606 OID 22010)
-- Name: styles styles_product_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: moyseos
--

ALTER TABLE ONLY public.styles
    ADD CONSTRAINT styles_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.products(id);


-- Completed on 2019-11-09 16:49:31 EST

--
-- PostgreSQL database dump complete
--

