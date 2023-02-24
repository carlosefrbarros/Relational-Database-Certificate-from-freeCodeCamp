--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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
-- Name: celestial_bodies; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.celestial_bodies (
    celestial_bodies_id integer NOT NULL,
    name character varying(30) NOT NULL,
    celestial_bodies_type text
);


ALTER TABLE public.celestial_bodies OWNER TO freecodecamp;

--
-- Name: celestial_bodies_celestial_bodies_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.celestial_bodies_celestial_bodies_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.celestial_bodies_celestial_bodies_id_seq OWNER TO freecodecamp;

--
-- Name: celestial_bodies_celestial_bodies_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.celestial_bodies_celestial_bodies_id_seq OWNED BY public.celestial_bodies.celestial_bodies_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    galaxy_type text,
    distance_from_earth_in_mpc numeric(4,3),
    diameter_in_ly integer
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
    name character varying(30) NOT NULL,
    numeral integer,
    sideral_period numeric(5,2),
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
    name character varying(30) NOT NULL,
    planet_type text,
    has_life boolean,
    has_ring boolean,
    number_of_moons integer,
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
    name character varying(30) NOT NULL,
    star_type text,
    solar_mass numeric(4,3),
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
-- Name: celestial_bodies celestial_bodies_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.celestial_bodies ALTER COLUMN celestial_bodies_id SET DEFAULT nextval('public.celestial_bodies_celestial_bodies_id_seq'::regclass);


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
-- Data for Name: celestial_bodies; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.celestial_bodies VALUES (1, 'Milky Way', 'Galaxy');
INSERT INTO public.celestial_bodies VALUES (2, 'Sagittarius Dwarf Sphr', 'Galaxy');
INSERT INTO public.celestial_bodies VALUES (3, 'Ursa Major II Dwarf', 'Galaxy');
INSERT INTO public.celestial_bodies VALUES (4, 'Segue 2', 'Galaxy');
INSERT INTO public.celestial_bodies VALUES (5, 'Large Magellanic Cloud', 'Galaxy');
INSERT INTO public.celestial_bodies VALUES (6, 'Small Magellanic Cloud', 'Galaxy');
INSERT INTO public.celestial_bodies VALUES (7, 'Sun', 'Star');
INSERT INTO public.celestial_bodies VALUES (8, 'Proxima Centauri', 'Star');
INSERT INTO public.celestial_bodies VALUES (9, 'Rigil Kentaurus', 'Star');
INSERT INTO public.celestial_bodies VALUES (10, 'Toliman', 'Star');
INSERT INTO public.celestial_bodies VALUES (11, 'Barnard Star', 'Star');
INSERT INTO public.celestial_bodies VALUES (12, 'Luhman 16 A', 'Star');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'SBbc', 0.008, 87400);
INSERT INTO public.galaxy VALUES (2, 'Sagittarius Dwarf Sphr', 'dSph', 0.024, 10000);
INSERT INTO public.galaxy VALUES (3, 'Ursa Major II Dwarf', 'dSph', 0.030, 1800);
INSERT INTO public.galaxy VALUES (4, 'Segue 2', 'dSph', 0.035, 200);
INSERT INTO public.galaxy VALUES (5, 'Large Magellanic Cloud', 'SB(s)m', 0.050, 32200);
INSERT INTO public.galaxy VALUES (6, 'Small Magellanic Cloud', 'SB(s)m pec', 0.063, 18900);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 1, 27.32, 1);
INSERT INTO public.moon VALUES (2, 'Phobos', 1, 0.32, 4);
INSERT INTO public.moon VALUES (3, 'Deimos', 2, 1.26, 4);
INSERT INTO public.moon VALUES (4, 'Io', 1, 1.77, 5);
INSERT INTO public.moon VALUES (5, 'Europa', 2, 3.55, 5);
INSERT INTO public.moon VALUES (6, 'Ganymede', 3, 7.15, 5);
INSERT INTO public.moon VALUES (7, 'Callisto', 4, 16.69, 5);
INSERT INTO public.moon VALUES (8, 'Amalthea', 5, 0.50, 5);
INSERT INTO public.moon VALUES (9, 'Himalia', 6, 250.56, 5);
INSERT INTO public.moon VALUES (10, 'Elara', 7, 259.64, 5);
INSERT INTO public.moon VALUES (11, 'Pasiphae', 8, 743.63, 5);
INSERT INTO public.moon VALUES (12, 'Sinope', 9, 758.90, 5);
INSERT INTO public.moon VALUES (13, 'Lysithea', 10, 259.20, 5);
INSERT INTO public.moon VALUES (14, 'Carme', 11, 734.17, 5);
INSERT INTO public.moon VALUES (15, 'Ananke', 12, 629.77, 5);
INSERT INTO public.moon VALUES (16, 'Leda', 13, 240.92, 5);
INSERT INTO public.moon VALUES (17, 'Thebe', 14, 0.67, 5);
INSERT INTO public.moon VALUES (18, 'Adrastea', 15, 0.30, 5);
INSERT INTO public.moon VALUES (19, 'Metis', 16, 0.29, 5);
INSERT INTO public.moon VALUES (20, 'Callirrhoe', 17, 758.77, 5);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 'Terrestrial Planet', true, false, 1, 1);
INSERT INTO public.planet VALUES (2, 'Mercury', 'Terrestrial Planet', false, false, 0, 1);
INSERT INTO public.planet VALUES (3, 'Venus', 'Terrestrial Planet', false, false, 0, 1);
INSERT INTO public.planet VALUES (4, 'Mars', 'Terrestrial Planet', false, false, 2, 1);
INSERT INTO public.planet VALUES (5, 'Jupiter', 'Gas Giant', false, true, 95, 1);
INSERT INTO public.planet VALUES (6, 'Saturn', 'Gas Giant', false, true, 83, 1);
INSERT INTO public.planet VALUES (7, 'Uranus', 'Ice Giant', false, true, 27, 1);
INSERT INTO public.planet VALUES (8, 'Neptune', 'Ice Giant', false, true, 14, 1);
INSERT INTO public.planet VALUES (9, 'Ceres', 'Dwarf Planet', false, false, 0, 1);
INSERT INTO public.planet VALUES (10, 'Pluto', 'Dwarf Planet', false, false, 5, 1);
INSERT INTO public.planet VALUES (11, 'Haumea', 'Dwarf Planet', false, true, 2, 1);
INSERT INTO public.planet VALUES (12, 'Makemake', 'Dwarf Planet', false, true, 1, 1);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 'Bright Star', 1.000, 1);
INSERT INTO public.star VALUES (2, 'Proxima Centauri', 'Red Dwarf', 0.122, 1);
INSERT INTO public.star VALUES (3, 'Rigil Kentaurus', 'Bright Star', 1.079, 1);
INSERT INTO public.star VALUES (4, 'Toliman', 'Bright Star', 0.909, 1);
INSERT INTO public.star VALUES (5, 'Barnard Star', 'Red Dwarf', 0.144, 1);
INSERT INTO public.star VALUES (6, 'Luhman 16 A', 'Brown Dwarf', 0.032, 1);


--
-- Name: celestial_bodies_celestial_bodies_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.celestial_bodies_celestial_bodies_id_seq', 1, false);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 1, false);


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
-- Name: celestial_bodies celestial_bodies_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.celestial_bodies
    ADD CONSTRAINT celestial_bodies_name_key UNIQUE (name);


--
-- Name: celestial_bodies celestial_bodies_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.celestial_bodies
    ADD CONSTRAINT celestial_bodies_pkey PRIMARY KEY (celestial_bodies_id);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


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

