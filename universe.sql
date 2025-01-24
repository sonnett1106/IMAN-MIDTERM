--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: cat; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.cat (
    name character varying(50) NOT NULL,
    age integer,
    cat_id integer NOT NULL
);


ALTER TABLE public.cat OWNER TO freecodecamp;

--
-- Name: cat_cat_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.cat_cat_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cat_cat_id_seq OWNER TO freecodecamp;

--
-- Name: cat_cat_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.cat_cat_id_seq OWNED BY public.cat.cat_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(50) NOT NULL,
    age integer,
    distance integer,
    mass numeric,
    description text,
    near_earth boolean
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(50) NOT NULL,
    age integer,
    distance integer,
    mass numeric,
    description text,
    near_earth boolean,
    planet_id integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(50) NOT NULL,
    age integer,
    distance integer,
    mass numeric,
    description text,
    near_earth boolean,
    star_id integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(50) NOT NULL,
    distance integer,
    age integer,
    mass numeric,
    description text,
    near_earth boolean,
    galaxy_id integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: cat cat_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.cat ALTER COLUMN cat_id SET DEFAULT nextval('public.cat_cat_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: cat; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.cat VALUES ('Ming', 12, 1);
INSERT INTO public.cat VALUES ('Yagit', 1, 2);
INSERT INTO public.cat VALUES ('Flush', 0, 3);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 12, 15, 50, 'A Galaxy', true);
INSERT INTO public.galaxy VALUES (2, 'Northern', 100, 32, 1000, 'Northern Galaxy', false);
INSERT INTO public.galaxy VALUES (3, 'Southern', 50, 176, 1000, 'Southern Galaxy', false);
INSERT INTO public.galaxy VALUES (4, 'Milk', 12, 15, 50, 'A Galaxy', true);
INSERT INTO public.galaxy VALUES (5, 'Stardew', 100, 32, 1000, 'Northern Galaxy', false);
INSERT INTO public.galaxy VALUES (6, 'The Swag', 50, 176, 1000, 'Southern Galaxy', false);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'A', 47213, 1922, 12, 'A', true, 1);
INSERT INTO public.moon VALUES (2, 'B', 372, 12, 44, 'B', false, 1);
INSERT INTO public.moon VALUES (3, 'C', 22, 1, 3, 'C', false, 1);
INSERT INTO public.moon VALUES (4, 'D', 47213, 1922, 12, 'A', true, 2);
INSERT INTO public.moon VALUES (5, 'E', 372, 12, 44, 'B', false, 1);
INSERT INTO public.moon VALUES (6, 'F', 22, 1, 3, 'F', false, 1);
INSERT INTO public.moon VALUES (7, 'G', 47213, 1922, 12, 'G', true, 2);
INSERT INTO public.moon VALUES (8, 'H', 372, 12, 44, 'H', false, 3);
INSERT INTO public.moon VALUES (9, 'I', 22, 1, 3, 'I', false, 4);
INSERT INTO public.moon VALUES (10, 'J', 47213, 1922, 12, 'J', true, 4);
INSERT INTO public.moon VALUES (11, 'K', 372, 12, 44, 'K', false, 5);
INSERT INTO public.moon VALUES (12, 'L', 22, 1, 3, 'L', false, 5);
INSERT INTO public.moon VALUES (13, 'M', 47213, 1922, 12, 'M', true, 6);
INSERT INTO public.moon VALUES (14, 'N', 372, 12, 44, 'N', false, 7);
INSERT INTO public.moon VALUES (15, 'O', 22, 1, 3, 'O', false, 8);
INSERT INTO public.moon VALUES (16, 'P', 47213, 1922, 12, 'P', true, 9);
INSERT INTO public.moon VALUES (17, 'Q', 372, 12, 44, 'Q', false, 10);
INSERT INTO public.moon VALUES (18, 'R', 47213, 1922, 12, 'R', true, 11);
INSERT INTO public.moon VALUES (19, 'S', 372, 12, 44, 'S', false, 12);
INSERT INTO public.moon VALUES (20, 'T', 22, 1, 3, 'T', false, 13);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 11113, 46, 474, 'Solar System', true, 1);
INSERT INTO public.planet VALUES (2, 'Venus', 465, 2364, 136, 'Solar System', true, 2);
INSERT INTO public.planet VALUES (3, 'Neptune', 475, 1630, 123, 'Not Solar System', false, 3);
INSERT INTO public.planet VALUES (4, 'Mercury', 11113, 46, 474, 'Solar System', true, 4);
INSERT INTO public.planet VALUES (5, 'Venus', 465, 2364, 136, 'Solar System', true, 5);
INSERT INTO public.planet VALUES (6, 'Neptune', 475, 1630, 123, 'Not Solar System', false, 5);
INSERT INTO public.planet VALUES (7, 'A', 11113, 46, 474, 'Solar System', true, 4);
INSERT INTO public.planet VALUES (8, 'B', 465, 2364, 136, 'Solar System', true, 3);
INSERT INTO public.planet VALUES (9, 'C', 475, 1630, 123, 'Not Solar System', false, 2);
INSERT INTO public.planet VALUES (10, 'D', 11113, 46, 474, 'Solar System', true, 1);
INSERT INTO public.planet VALUES (11, 'E', 465, 2364, 136, 'Solar System', true, 2);
INSERT INTO public.planet VALUES (12, 'F', 475, 1630, 123, 'Not Solar System', false, 3);
INSERT INTO public.planet VALUES (13, 'G', 11113, 46, 474, 'Solar System', true, 4);
INSERT INTO public.planet VALUES (14, 'H', 465, 2364, 136, 'Solar System', true, 5);
INSERT INTO public.planet VALUES (15, 'I', 475, 1630, 123, 'Not Solar System', false, 6);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1500, 204, 50000, 'Solar System Sun', true, 1);
INSERT INTO public.star VALUES (2, 'Aurora', 50000, 12, 33, 'Not a Solar System Sun', false, 2);
INSERT INTO public.star VALUES (3, 'The Ego', 12344, 164, 384, 'A star', false, 3);
INSERT INTO public.star VALUES (4, 'Meow', 1500, 204, 50000, 'Solar System Sun', true, 4);
INSERT INTO public.star VALUES (5, 'Frozen', 50000, 12, 33, 'Not a Solar System Sun', false, 5);
INSERT INTO public.star VALUES (6, 'Kitty', 12344, 164, 384, 'A star', false, 6);


--
-- Name: cat_cat_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.cat_cat_id_seq', 3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 15, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: cat cat_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.cat
    ADD CONSTRAINT cat_name_key UNIQUE (name);


--
-- Name: cat cat_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.cat
    ADD CONSTRAINT cat_pkey PRIMARY KEY (cat_id);


--
-- Name: galaxy galaxy_galaxy_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_galaxy_id_key UNIQUE (galaxy_id);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: planet planet_planet_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_planet_id_key UNIQUE (planet_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star star_star_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_star_id_key UNIQUE (star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

