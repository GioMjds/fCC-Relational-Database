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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(255) NOT NULL,
    size integer NOT NULL,
    distance_from_earth numeric,
    has_black_hole boolean DEFAULT false,
    age integer,
    type character varying(100)
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
    name character varying(255) NOT NULL,
    planet_id integer NOT NULL,
    diameter integer NOT NULL,
    has_water boolean DEFAULT false,
    type character varying(100),
    has_atmosphere boolean DEFAULT false
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
    name character varying(255) NOT NULL,
    star_id integer NOT NULL,
    orbit_period integer NOT NULL,
    has_rings boolean DEFAULT false,
    atmosphere text,
    type character varying(100),
    has_life boolean DEFAULT false
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
    name character varying(255) NOT NULL,
    galaxy_id integer,
    temperature integer NOT NULL,
    luminosity numeric NOT NULL,
    is_supernova boolean DEFAULT false,
    age integer,
    type character varying(100)
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
-- Name: students; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.students (
    id integer NOT NULL,
    firstname character varying(255) NOT NULL,
    lastname character varying(255) NOT NULL,
    age integer NOT NULL
);


ALTER TABLE public.students OWNER TO freecodecamp;

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
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 100000, 0, false, NULL, NULL);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 220000, 2537000, true, NULL, NULL);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 60000, 3000000, false, NULL, NULL);
INSERT INTO public.galaxy VALUES (4, 'Whirlpool', 100000, 23000000, false, NULL, NULL);
INSERT INTO public.galaxy VALUES (5, 'Sombrero', 50000, 28000000, false, NULL, NULL);
INSERT INTO public.galaxy VALUES (6, 'Pinwheel', 100000, 21000000, true, NULL, NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 1, 3474, true, NULL, false);
INSERT INTO public.moon VALUES (2, 'Phobos', 2, 22, false, NULL, false);
INSERT INTO public.moon VALUES (3, 'Deimos', 2, 12, false, NULL, false);
INSERT INTO public.moon VALUES (4, 'Io', 3, 3642, false, NULL, false);
INSERT INTO public.moon VALUES (5, 'Europa', 3, 3121, true, NULL, false);
INSERT INTO public.moon VALUES (6, 'Ganymede', 3, 5262, true, NULL, false);
INSERT INTO public.moon VALUES (7, 'Callisto', 3, 4821, false, NULL, false);
INSERT INTO public.moon VALUES (8, 'Titan', 4, 5150, true, NULL, false);
INSERT INTO public.moon VALUES (9, ' Rhea', 4, 1528, false, NULL, false);
INSERT INTO public.moon VALUES (10, 'Iapetus', 4, 1469, false, NULL, false);
INSERT INTO public.moon VALUES (11, 'Dione', 4, 1123, false, NULL, false);
INSERT INTO public.moon VALUES (12, 'Tethys', 4, 1062, false, NULL, false);
INSERT INTO public.moon VALUES (13, 'Enceladus', 4, 504, true, NULL, false);
INSERT INTO public.moon VALUES (14, 'Miranda', 5, 472, false, NULL, false);
INSERT INTO public.moon VALUES (15, 'Ariel', 5, 1165, false, NULL, false);
INSERT INTO public.moon VALUES (16, 'Umbriel', 5, 1169, false, NULL, false);
INSERT INTO public.moon VALUES (17, 'Titania', 5, 1577, false, NULL, false);
INSERT INTO public.moon VALUES (18, 'Oberon', 5, 1523, false, NULL, false);
INSERT INTO public.moon VALUES (19, 'Triton', 6, 2706, true, NULL, false);
INSERT INTO public.moon VALUES (20, 'Nereid', 6, 340, false, NULL, false);
INSERT INTO public.moon VALUES (21, 'Proteus', 6, 420, false, NULL, false);
INSERT INTO public.moon VALUES (22, 'Charon', 7, 1212, true, NULL, false);
INSERT INTO public.moon VALUES (23, 'Hydra', 7, 61, false, NULL, false);
INSERT INTO public.moon VALUES (24, 'Nix', 7, 49, false, NULL, false);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 1, 365, false, 'Nitrogen, Oxygen', NULL, false);
INSERT INTO public.planet VALUES (2, 'Mars', 1, 687, false, 'Carbon Dioxide', NULL, false);
INSERT INTO public.planet VALUES (3, 'Jupiter', 1, 4333, true, 'Hydrogen, Helium', NULL, false);
INSERT INTO public.planet VALUES (4, 'Saturn', 1, 10759, true, 'Hydrogen, Helium', NULL, false);
INSERT INTO public.planet VALUES (5, 'Venus', 1, 225, false, 'Carbon Dioxide', NULL, false);
INSERT INTO public.planet VALUES (6, 'Mercury', 1, 88, false, 'None', NULL, false);
INSERT INTO public.planet VALUES (7, 'Neptune', 6, 60182, true, 'Hydrogen, Helium', NULL, false);
INSERT INTO public.planet VALUES (8, 'Uranus', 6, 30687, true, 'Hydrogen, Helium', NULL, false);
INSERT INTO public.planet VALUES (9, 'Pluto', 6, 90560, false, 'Nitrogen, Methane', NULL, false);
INSERT INTO public.planet VALUES (10, 'Titan', 6, 16, true, 'Nitrogen', NULL, false);
INSERT INTO public.planet VALUES (11, 'Callisto', 6, 17, false, 'None', NULL, false);
INSERT INTO public.planet VALUES (12, 'Ganymede', 6, 7, false, 'None', NULL, false);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 5778, 1, false, NULL, NULL);
INSERT INTO public.star VALUES (2, 'Sirius', 1, 9940, 25.4, false, NULL, NULL);
INSERT INTO public.star VALUES (3, 'Betelgeuse', 1, 3500, 126000, true, NULL, NULL);
INSERT INTO public.star VALUES (4, 'Proxima Centauri', 1, 3042, 0.0015, false, NULL, NULL);
INSERT INTO public.star VALUES (5, 'Alpha Centauri A', 1, 5790, 1.519, false, NULL, NULL);
INSERT INTO public.star VALUES (6, 'Alpha Centauri B', 1, 5280, 0.5, false, NULL, NULL);


--
-- Data for Name: students; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--



--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 24, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


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
-- Name: students students_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.students
    ADD CONSTRAINT students_pkey PRIMARY KEY (id);


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

