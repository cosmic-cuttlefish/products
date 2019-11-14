--
-- PostgreSQL database dump
--

-- Dumped from database version 11.5
-- Dumped by pg_dump version 12.0

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
-- Name: features_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: moyseos
--

ALTER SEQUENCE public.features_id_seq OWNED BY public.features.id;


--
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
-- Name: photos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: moyseos
--

ALTER SEQUENCE public.photos_id_seq OWNED BY public.photos.id;


--
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
-- Name: products_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: moyseos
--

ALTER SEQUENCE public.products_id_seq OWNED BY public.products.id;


--
-- Name: related_products; Type: TABLE; Schema: public; Owner: moyseos
--

CREATE TABLE public.related_products (
    id integer NOT NULL,
    current_product_id integer,
    related_product_id integer
);


ALTER TABLE public.related_products OWNER TO moyseos;

--
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
-- Name: related_products_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: moyseos
--

ALTER SEQUENCE public.related_products_id_seq OWNED BY public.related_products.id;


--
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
-- Name: skus_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: moyseos
--

ALTER SEQUENCE public.skus_id_seq OWNED BY public.skus.id;


--
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
-- Name: styles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: moyseos
--

ALTER SEQUENCE public.styles_id_seq OWNED BY public.styles.id;


--
-- Name: features id; Type: DEFAULT; Schema: public; Owner: moyseos
--

ALTER TABLE ONLY public.features ALTER COLUMN id SET DEFAULT nextval('public.features_id_seq'::regclass);


--
-- Name: photos id; Type: DEFAULT; Schema: public; Owner: moyseos
--

ALTER TABLE ONLY public.photos ALTER COLUMN id SET DEFAULT nextval('public.photos_id_seq'::regclass);


--
-- Name: products id; Type: DEFAULT; Schema: public; Owner: moyseos
--

ALTER TABLE ONLY public.products ALTER COLUMN id SET DEFAULT nextval('public.products_id_seq'::regclass);


--
-- Name: related_products id; Type: DEFAULT; Schema: public; Owner: moyseos
--

ALTER TABLE ONLY public.related_products ALTER COLUMN id SET DEFAULT nextval('public.related_products_id_seq'::regclass);


--
-- Name: skus id; Type: DEFAULT; Schema: public; Owner: moyseos
--

ALTER TABLE ONLY public.skus ALTER COLUMN id SET DEFAULT nextval('public.skus_id_seq'::regclass);


--
-- Name: styles id; Type: DEFAULT; Schema: public; Owner: moyseos
--

ALTER TABLE ONLY public.styles ALTER COLUMN id SET DEFAULT nextval('public.styles_id_seq'::regclass);


--
-- Name: features features_pkey; Type: CONSTRAINT; Schema: public; Owner: moyseos
--

ALTER TABLE ONLY public.features
    ADD CONSTRAINT features_pkey PRIMARY KEY (id);


--
-- Name: photos photos_pkey; Type: CONSTRAINT; Schema: public; Owner: moyseos
--

ALTER TABLE ONLY public.photos
    ADD CONSTRAINT photos_pkey PRIMARY KEY (id);


--
-- Name: products products_pkey; Type: CONSTRAINT; Schema: public; Owner: moyseos
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (id);


--
-- Name: related_products related_products_pkey; Type: CONSTRAINT; Schema: public; Owner: moyseos
--

ALTER TABLE ONLY public.related_products
    ADD CONSTRAINT related_products_pkey PRIMARY KEY (id);


--
-- Name: skus skus_pkey; Type: CONSTRAINT; Schema: public; Owner: moyseos
--

ALTER TABLE ONLY public.skus
    ADD CONSTRAINT skus_pkey PRIMARY KEY (id);


--
-- Name: styles styles_pkey; Type: CONSTRAINT; Schema: public; Owner: moyseos
--

ALTER TABLE ONLY public.styles
    ADD CONSTRAINT styles_pkey PRIMARY KEY (id);


--
-- Name: index_current_id; Type: INDEX; Schema: public; Owner: moyseos
--

CREATE INDEX index_current_id ON public.related_products USING btree (current_product_id) INCLUDE (current_product_id);


--
-- Name: index_id; Type: INDEX; Schema: public; Owner: moyseos
--

CREATE INDEX index_id ON public.related_products USING btree (related_product_id) INCLUDE (related_product_id);


--
-- Name: index_photos; Type: INDEX; Schema: public; Owner: moyseos
--

CREATE INDEX index_photos ON public.photos USING btree (id) INCLUDE (id);


--
-- Name: index_product; Type: INDEX; Schema: public; Owner: moyseos
--

CREATE INDEX index_product ON public.products USING btree (name) INCLUDE (id);


--
-- Name: index_product_id; Type: INDEX; Schema: public; Owner: moyseos
--

CREATE INDEX index_product_id ON public.styles USING btree (product_id) INCLUDE (product_id);


--
-- Name: index_products; Type: INDEX; Schema: public; Owner: moyseos
--

CREATE INDEX index_products ON public.products USING btree (id) INCLUDE (id);


--
-- Name: index_skus; Type: INDEX; Schema: public; Owner: moyseos
--

CREATE INDEX index_skus ON public.skus USING btree (id) INCLUDE (id);


--
-- Name: index_style_id; Type: INDEX; Schema: public; Owner: moyseos
--

CREATE INDEX index_style_id ON public.photos USING btree (style_id) INCLUDE (style_id);


--
-- Name: index_style_id_in_skus; Type: INDEX; Schema: public; Owner: moyseos
--

CREATE INDEX index_style_id_in_skus ON public.skus USING btree (style_id) INCLUDE (style_id);


--
-- Name: index_styles; Type: INDEX; Schema: public; Owner: moyseos
--

CREATE INDEX index_styles ON public.styles USING btree (id) INCLUDE (id);


--
-- Name: index_table_id; Type: INDEX; Schema: public; Owner: moyseos
--

CREATE INDEX index_table_id ON public.related_products USING btree (id) INCLUDE (id);


--
-- Name: features features_product_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: moyseos
--

ALTER TABLE ONLY public.features
    ADD CONSTRAINT features_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.products(id);


--
-- Name: photos photos_style_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: moyseos
--

ALTER TABLE ONLY public.photos
    ADD CONSTRAINT photos_style_id_fkey FOREIGN KEY (style_id) REFERENCES public.styles(id);


--
-- Name: styles styles_product_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: moyseos
--

ALTER TABLE ONLY public.styles
    ADD CONSTRAINT styles_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.products(id);


--
-- PostgreSQL database dump complete
--

