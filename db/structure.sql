--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: film_charts; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE film_charts (
    id integer NOT NULL,
    "position" integer,
    film_rental_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: film_charts_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE film_charts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: film_charts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE film_charts_id_seq OWNED BY film_charts.id;


--
-- Name: film_providers; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE film_providers (
    id integer NOT NULL,
    name character varying(255),
    uri character varying(255),
    trial_period character varying(255),
    image_uri character varying(255),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: film_providers_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE film_providers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: film_providers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE film_providers_id_seq OWNED BY film_providers.id;


--
-- Name: film_rentals; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE film_rentals (
    id integer NOT NULL,
    film_provider_id integer,
    film_id integer,
    film_uri character varying(255),
    reference_id character varying(255),
    dvd boolean,
    bluray boolean,
    online boolean,
    ppv boolean,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: film_rentals_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE film_rentals_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: film_rentals_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE film_rentals_id_seq OWNED BY film_rentals.id;


--
-- Name: films; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE films (
    id integer NOT NULL,
    title character varying(255),
    summary character varying(255),
    description text,
    image_uri character varying(255),
    release_date integer,
    certification character varying(255),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    director character varying(255),
    actors character varying(255)
);


--
-- Name: films_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE films_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: films_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE films_id_seq OWNED BY films.id;


--
-- Name: online_providers; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE online_providers (
    id integer NOT NULL,
    film_provider_id integer NOT NULL,
    price_type integer NOT NULL,
    devices character varying(255),
    price numeric(8,2) NOT NULL
);


--
-- Name: online_providers_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE online_providers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: online_providers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE online_providers_id_seq OWNED BY online_providers.id;


--
-- Name: post_providers; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE post_providers (
    id integer NOT NULL,
    film_provider_id integer NOT NULL,
    post_type integer NOT NULL,
    disc_one character varying(255) NOT NULL,
    disc_two character varying(255),
    disc_three character varying(255)
);


--
-- Name: post_providers_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE post_providers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: post_providers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE post_providers_id_seq OWNED BY post_providers.id;


--
-- Name: provider_by_post; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE provider_by_post (
    id integer NOT NULL,
    film_provider_id integer NOT NULL,
    discs integer NOT NULL,
    films_per_month integer,
    price numeric NOT NULL
);


--
-- Name: provider_by_post_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE provider_by_post_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: provider_by_post_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE provider_by_post_id_seq OWNED BY provider_by_post.id;


--
-- Name: providers_by_post; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE providers_by_post (
    id integer NOT NULL,
    film_provider_id integer NOT NULL,
    discs integer NOT NULL,
    films_per_month integer,
    price numeric NOT NULL
);


--
-- Name: providers_by_post_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE providers_by_post_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: providers_by_post_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE providers_by_post_id_seq OWNED BY providers_by_post.id;


--
-- Name: providers_online; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE providers_online (
    id integer NOT NULL,
    film_provider_id integer NOT NULL,
    price_type integer NOT NULL,
    devices character varying(255),
    price numeric NOT NULL
);


--
-- Name: providers_online_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE providers_online_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: providers_online_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE providers_online_id_seq OWNED BY providers_online.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE schema_migrations (
    version character varying(255) NOT NULL
);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY film_charts ALTER COLUMN id SET DEFAULT nextval('film_charts_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY film_providers ALTER COLUMN id SET DEFAULT nextval('film_providers_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY film_rentals ALTER COLUMN id SET DEFAULT nextval('film_rentals_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY films ALTER COLUMN id SET DEFAULT nextval('films_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY online_providers ALTER COLUMN id SET DEFAULT nextval('online_providers_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY post_providers ALTER COLUMN id SET DEFAULT nextval('post_providers_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY provider_by_post ALTER COLUMN id SET DEFAULT nextval('provider_by_post_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY providers_by_post ALTER COLUMN id SET DEFAULT nextval('providers_by_post_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY providers_online ALTER COLUMN id SET DEFAULT nextval('providers_online_id_seq'::regclass);


--
-- Name: film_charts_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY film_charts
    ADD CONSTRAINT film_charts_pkey PRIMARY KEY (id);


--
-- Name: film_providers_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY film_providers
    ADD CONSTRAINT film_providers_pkey PRIMARY KEY (id);


--
-- Name: film_rentals_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY film_rentals
    ADD CONSTRAINT film_rentals_pkey PRIMARY KEY (id);


--
-- Name: films_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY films
    ADD CONSTRAINT films_pkey PRIMARY KEY (id);


--
-- Name: online_providers_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY online_providers
    ADD CONSTRAINT online_providers_pkey PRIMARY KEY (id);


--
-- Name: post_providers_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY post_providers
    ADD CONSTRAINT post_providers_pkey PRIMARY KEY (id);


--
-- Name: provider_by_post_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY provider_by_post
    ADD CONSTRAINT provider_by_post_pkey PRIMARY KEY (id);


--
-- Name: providers_by_post_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY providers_by_post
    ADD CONSTRAINT providers_by_post_pkey PRIMARY KEY (id);


--
-- Name: providers_online_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY providers_online
    ADD CONSTRAINT providers_online_pkey PRIMARY KEY (id);


--
-- Name: index_film_charts_on_FilmRental_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX "index_film_charts_on_FilmRental_id" ON film_charts USING btree (film_rental_id);


--
-- Name: index_film_rentals_on_film_provider_id_and_film_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_film_rentals_on_film_provider_id_and_film_id ON film_rentals USING btree (film_provider_id, film_id);


--
-- Name: index_online_providers_on_film_provider_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_online_providers_on_film_provider_id ON online_providers USING btree (film_provider_id);


--
-- Name: index_post_providers_on_film_provider_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_post_providers_on_film_provider_id ON post_providers USING btree (film_provider_id);


--
-- Name: index_providers_by_post_on_film_provider_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_providers_by_post_on_film_provider_id ON providers_by_post USING btree (film_provider_id);


--
-- Name: index_providers_online_on_film_provider_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_providers_online_on_film_provider_id ON providers_online USING btree (film_provider_id);


--
-- Name: unique_schema_migrations; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX unique_schema_migrations ON schema_migrations USING btree (version);


--
-- PostgreSQL database dump complete
--

INSERT INTO schema_migrations (version) VALUES ('20120714113650');

INSERT INTO schema_migrations (version) VALUES ('20120714113810');

INSERT INTO schema_migrations (version) VALUES ('20120714114229');

INSERT INTO schema_migrations (version) VALUES ('20120717194142');

INSERT INTO schema_migrations (version) VALUES ('20120717194234');

INSERT INTO schema_migrations (version) VALUES ('20120717224215');

INSERT INTO schema_migrations (version) VALUES ('20120717224250');