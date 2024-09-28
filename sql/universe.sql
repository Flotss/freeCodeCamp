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
-- Name: a; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.a (
    a_id integer NOT NULL,
    description text NOT NULL,
    name character varying
);


ALTER TABLE public.a OWNER TO freecodecamp;

--
-- Name: b; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.b (
    b_id integer NOT NULL,
    description text NOT NULL,
    name character varying
);


ALTER TABLE public.b OWNER TO freecodecamp;

--
-- Name: c; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.c (
    c_id integer NOT NULL,
    description text NOT NULL,
    name character varying
);


ALTER TABLE public.c OWNER TO freecodecamp;

--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(50) NOT NULL,
    unint integer,
    deuxint integer,
    description text,
    has_life boolean,
    distance_from_earth numeric
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(50) NOT NULL,
    unint integer,
    deuxint integer,
    description text,
    has_life boolean,
    planet_id integer NOT NULL
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
    unint integer,
    deuxint integer,
    description text,
    has_life boolean,
    star_id integer NOT NULL
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
    unint integer,
    deuxint integer,
    description text,
    has_life boolean,
    galaxy_id integer NOT NULL
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
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_id_seq'::regclass);


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
-- Data for Name: a; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.a VALUES (1, 'Description A1', 'Name A1');
INSERT INTO public.a VALUES (2, 'Description A2', 'Name A2');
INSERT INTO public.a VALUES (3, 'Description A3', 'Name A3');


--
-- Data for Name: b; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.b VALUES (1, 'Description B1', 'Name B1');
INSERT INTO public.b VALUES (2, 'Description B2', 'Name B2');
INSERT INTO public.b VALUES (3, 'Description B3', 'Name B3');


--
-- Data for Name: c; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.c VALUES (1, 'Description C1', 'Name C1');
INSERT INTO public.c VALUES (2, 'Description C2', 'Name C2');
INSERT INTO public.c VALUES (3, 'Description C3', 'Name C3');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 1, 2, 'Our galaxy', true, 0);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 3, 4, 'Nearest galaxy', false, 2537000);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 5, 6, 'Third largest galaxy', false, 3000000);
INSERT INTO public.galaxy VALUES (4, 'Whirlpool', 7, 8, 'Spiral galaxy', false, 23000000);
INSERT INTO public.galaxy VALUES (5, 'Sombrero', 9, 10, 'Unusual galaxy', false, 29000000);
INSERT INTO public.galaxy VALUES (6, 'Pinwheel', 11, 12, 'Face-on spiral galaxy', false, 21000000);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 1, 2, 'Earth''s moon', false, 3);
INSERT INTO public.moon VALUES (2, 'Phobos', 3, 4, 'Mars'' moon', false, 4);
INSERT INTO public.moon VALUES (3, 'Deimos', 5, 6, 'Mars'' moon', false, 4);
INSERT INTO public.moon VALUES (4, 'Io', 7, 8, 'Jupiter''s moon', false, 5);
INSERT INTO public.moon VALUES (5, 'Europa', 9, 10, 'Jupiter''s moon', false, 5);
INSERT INTO public.moon VALUES (6, 'Ganymede', 11, 12, 'Jupiter''s moon', false, 5);
INSERT INTO public.moon VALUES (7, 'Callisto', 13, 14, 'Jupiter''s moon', false, 5);
INSERT INTO public.moon VALUES (8, 'Titan', 15, 16, 'Saturn''s moon', false, 6);
INSERT INTO public.moon VALUES (9, 'Rhea', 17, 18, 'Saturn''s moon', false, 6);
INSERT INTO public.moon VALUES (10, 'Iapetus', 19, 20, 'Saturn''s moon', false, 6);
INSERT INTO public.moon VALUES (11, 'Dione', 21, 22, 'Saturn''s moon', false, 6);
INSERT INTO public.moon VALUES (12, 'Tethys', 23, 24, 'Saturn''s moon', false, 6);
INSERT INTO public.moon VALUES (13, 'Enceladus', 25, 26, 'Saturn''s moon', false, 6);
INSERT INTO public.moon VALUES (14, 'Miranda', 27, 28, 'Uranus'' moon', false, 7);
INSERT INTO public.moon VALUES (15, 'Ariel', 29, 30, 'Uranus'' moon', false, 7);
INSERT INTO public.moon VALUES (16, 'Umbriel', 31, 32, 'Uranus'' moon', false, 7);
INSERT INTO public.moon VALUES (17, 'Titania', 33, 34, 'Uranus'' moon', false, 7);
INSERT INTO public.moon VALUES (18, 'Oberon', 35, 36, 'Uranus'' moon', false, 7);
INSERT INTO public.moon VALUES (19, 'Triton', 37, 38, 'Neptune''s moon', false, 8);
INSERT INTO public.moon VALUES (20, 'Nereid', 39, 40, 'Neptune''s moon', false, 8);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 1, 2, 'Closest planet to the Sun', false, 1);
INSERT INTO public.planet VALUES (2, 'Venus', 3, 4, 'Second planet from the Sun', false, 1);
INSERT INTO public.planet VALUES (3, 'Earth', 5, 6, 'Our planet', true, 1);
INSERT INTO public.planet VALUES (4, 'Mars', 7, 8, 'Red planet', false, 1);
INSERT INTO public.planet VALUES (5, 'Jupiter', 9, 10, 'Largest planet', false, 1);
INSERT INTO public.planet VALUES (6, 'Saturn', 11, 12, 'Planet with rings', false, 1);
INSERT INTO public.planet VALUES (7, 'Uranus', 13, 14, 'Ice giant', false, 1);
INSERT INTO public.planet VALUES (8, 'Neptune', 15, 16, 'Farthest planet', false, 1);
INSERT INTO public.planet VALUES (9, 'Proxima b', 17, 18, 'Exoplanet', false, 2);
INSERT INTO public.planet VALUES (10, 'Sirius b', 19, 20, 'White dwarf', false, 3);
INSERT INTO public.planet VALUES (11, 'Betelgeuse b', 21, 22, 'Exoplanet', false, 4);
INSERT INTO public.planet VALUES (12, 'Rigel b', 23, 24, 'Exoplanet', false, 5);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 2, 'Our star', true, 1);
INSERT INTO public.star VALUES (2, 'Proxima Centauri', 3, 4, 'Nearest star', false, 1);
INSERT INTO public.star VALUES (3, 'Sirius', 5, 6, 'Brightest star', false, 1);
INSERT INTO public.star VALUES (4, 'Betelgeuse', 7, 8, 'Red supergiant', false, 2);
INSERT INTO public.star VALUES (5, 'Rigel', 9, 10, 'Blue supergiant', false, 2);
INSERT INTO public.star VALUES (6, 'Vega', 11, 12, 'Bright star', false, 3);


--
-- Name: galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_id_seq', 1, false);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 1, false);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 1, false);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 1, false);


--
-- Name: a a_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.a
    ADD CONSTRAINT a_id_key UNIQUE (a_id);


--
-- Name: a a_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.a
    ADD CONSTRAINT a_pkey PRIMARY KEY (a_id);


--
-- Name: b b_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.b
    ADD CONSTRAINT b_id_key UNIQUE (b_id);


--
-- Name: b b_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.b
    ADD CONSTRAINT b_pkey PRIMARY KEY (b_id);


--
-- Name: c c_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.c
    ADD CONSTRAINT c_id_key UNIQUE (c_id);


--
-- Name: c c_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.c
    ADD CONSTRAINT c_pkey PRIMARY KEY (c_id);


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
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: galaxy unique_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT unique_name UNIQUE (name);


--
-- Name: moon fk_moon_planet; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT fk_moon_planet FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet fk_planet_star; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT fk_planet_star FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star fk_star_galaxy; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT fk_star_galaxy FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

