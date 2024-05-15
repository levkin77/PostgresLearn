--
-- PostgreSQL database dump
--

-- Dumped from database version 16.2
-- Dumped by pg_dump version 16.2

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
-- Name: productcodenames; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.productcodenames (
    id integer NOT NULL,
    kind integer NOT NULL,
    name text,
    memo text,
    code text NOT NULL
);


ALTER TABLE public.productcodenames OWNER TO postgres;

--
-- Name: TABLE productcodenames; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.productcodenames IS 'Наименования дополнительных свойств';


--
-- Name: COLUMN productcodenames.id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.productcodenames.id IS 'Идентификатор наименования дополниельного свойства';


--
-- Name: COLUMN productcodenames.kind; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.productcodenames.kind IS 'Тип дополнительного свойства';


--
-- Name: COLUMN productcodenames.name; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.productcodenames.name IS 'Наименование дополнительного свойства';


--
-- Name: COLUMN productcodenames.memo; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.productcodenames.memo IS 'Описание';


--
-- Name: COLUMN productcodenames.code; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.productcodenames.code IS 'Код';


--
-- Name: productcodenames_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.productcodenames ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.productcodenames_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: productcodes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.productcodes (
    id integer NOT NULL,
    produc_id integer NOT NULL,
    code_id integer NOT NULL,
    vint integer,
    vtext text,
    vdate date,
    vnum double precision,
    vmoney numeric(15,6),
    vjson jsonb,
    memo text
);


ALTER TABLE public.productcodes OWNER TO postgres;

--
-- Name: TABLE productcodes; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.productcodes IS 'Значения дополнительных кодов';


--
-- Name: COLUMN productcodes.id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.productcodes.id IS 'Идентификатор';


--
-- Name: COLUMN productcodes.produc_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.productcodes.produc_id IS 'Идентификатор товара';


--
-- Name: COLUMN productcodes.code_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.productcodes.code_id IS 'Идентификатор дополнительного свойства';


--
-- Name: COLUMN productcodes.vint; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.productcodes.vint IS 'Целое значение';


--
-- Name: COLUMN productcodes.vtext; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.productcodes.vtext IS 'Строка';


--
-- Name: COLUMN productcodes.vdate; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.productcodes.vdate IS 'Дата';


--
-- Name: COLUMN productcodes.vnum; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.productcodes.vnum IS 'Дробное';


--
-- Name: COLUMN productcodes.vmoney; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.productcodes.vmoney IS 'Денежное';


--
-- Name: COLUMN productcodes.vjson; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.productcodes.vjson IS 'Json';


--
-- Name: COLUMN productcodes.memo; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.productcodes.memo IS 'Описание';


--
-- Name: productcodes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.productcodes ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.productcodes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: products; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.products (
    id integer NOT NULL,
    name text NOT NULL,
    memo text
);


ALTER TABLE public.products OWNER TO postgres;

--
-- Name: TABLE products; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.products IS 'Товары';


--
-- Name: COLUMN products.id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.products.id IS 'Идентификатор';


--
-- Name: COLUMN products.name; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.products.name IS 'Наименование';


--
-- Name: COLUMN products.memo; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.products.memo IS 'Описание';


--
-- Name: products_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.products ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.products_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: productcodenames productcodenames_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.productcodenames
    ADD CONSTRAINT productcodenames_pkey PRIMARY KEY (id);


--
-- Name: productcodes productcodes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.productcodes
    ADD CONSTRAINT productcodes_pkey PRIMARY KEY (id);


--
-- Name: products products_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (id);


--
-- Name: ix_productcodes_guard; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX ix_productcodes_guard ON public.productcodes USING btree (produc_id, code_id);


--
-- Name: productcodenames_code_uix; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX productcodenames_code_uix ON public.productcodenames USING btree (code);


--
-- Name: productcodes fk_productcodes_productcodenames; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.productcodes
    ADD CONSTRAINT fk_productcodes_productcodenames FOREIGN KEY (code_id) REFERENCES public.productcodenames(id);


--
-- Name: productcodes fk_productcodes_products; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.productcodes
    ADD CONSTRAINT fk_productcodes_products FOREIGN KEY (produc_id) REFERENCES public.products(id);


--
-- PostgreSQL database dump complete
--

