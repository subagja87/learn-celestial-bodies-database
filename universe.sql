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
    name character varying(30) NOT NULL,
    age_in_millions_of_years integer NOT NULL,
    distance_in_million_light_years integer NOT NULL,
    galaxy_types text NOT NULL,
    has_supermassive_black_hole boolean,
    diameter_in_thousand_light_years numeric(6,1) NOT NULL
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
-- Name: index; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.index (
    moon_id integer,
    planet_id integer,
    star_id integer,
    galaxy_id integer,
    index_id integer NOT NULL,
    name character varying(30) NOT NULL
);


ALTER TABLE public.index OWNER TO freecodecamp;

--
-- Name: index_index_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.index_index_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.index_index_seq OWNER TO freecodecamp;

--
-- Name: index_index_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.index_index_seq OWNED BY public.index.index_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30) NOT NULL,
    planet_id integer NOT NULL,
    star_id integer,
    galaxy_id integer
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
    has_life boolean,
    star_id integer NOT NULL,
    galaxy_id integer
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
    galaxy_id integer NOT NULL,
    temperature_in_thousand_celcius integer,
    diameter_in_thousand_kilometers integer
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

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: index index_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.index ALTER COLUMN index_id SET DEFAULT nextval('public.index_index_seq'::regclass);


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

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 13600, 0, 'Spiral Galaxy', true, 110.0);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 13000, 3, 'Spiral Galaxy', true, 220.0);
INSERT INTO public.galaxy VALUES (3, 'Cigar Galaxy', 8, 12, 'Irregular Galaxy', true, 37.0);
INSERT INTO public.galaxy VALUES (6, 'Triangulum Galaxy', 11500, 2730, 'Spiral Galaxy', false, 55.0);
INSERT INTO public.galaxy VALUES (7, 'Sombrero Galaxy', 13000, 29, 'Unclassified', true, 50.0);
INSERT INTO public.galaxy VALUES (8, 'Whirlpool Galaxy', 13000, 23, 'Grand Design Spiral Galaxy', true, 60.0);


--
-- Data for Name: index; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.index VALUES (1, 1, 2, 1, 1, 'Celestial Bodies');
INSERT INTO public.index VALUES (2, 2, 2, 1, 2, 'Celestial Bodies');
INSERT INTO public.index VALUES (3, 2, 2, 1, 3, 'Celestial Bodies');
INSERT INTO public.index VALUES (4, 2, 2, 1, 4, 'Celestial Bodies');
INSERT INTO public.index VALUES (5, 2, 2, 1, 5, 'Celestial Bodies');
INSERT INTO public.index VALUES (6, 7, 2, 1, 6, 'Celestial Bodies');
INSERT INTO public.index VALUES (7, 7, 2, 1, 7, 'Celestial Bodies');
INSERT INTO public.index VALUES (8, 7, 2, 1, 8, 'Celestial Bodies');
INSERT INTO public.index VALUES (9, 7, 2, 1, 9, 'Celestial Bodies');
INSERT INTO public.index VALUES (10, 8, 2, 1, 10, 'Celestial Bodies');
INSERT INTO public.index VALUES (11, 8, 2, 1, 11, 'Celestial Bodies');
INSERT INTO public.index VALUES (12, 8, 2, 1, 12, 'Celestial Bodies');
INSERT INTO public.index VALUES (13, 8, 2, 1, 13, 'Celestial Bodies');
INSERT INTO public.index VALUES (14, 9, 2, 1, 14, 'Celestial Bodies');
INSERT INTO public.index VALUES (15, 9, 2, 1, 15, 'Celestial Bodies');
INSERT INTO public.index VALUES (16, 9, 2, 1, 16, 'Celestial Bodies');
INSERT INTO public.index VALUES (17, 10, 2, 1, 17, 'Celestial Bodies');
INSERT INTO public.index VALUES (18, 12, 2, 1, 18, 'Celestial Bodies');
INSERT INTO public.index VALUES (19, 2, 2, 1, 19, 'Celestial Bodies');
INSERT INTO public.index VALUES (20, 2, 2, 1, 20, 'Celestial Bodies');
INSERT INTO public.index VALUES (21, 2, 2, 1, 21, 'Celestial Bodies');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'The Moon', 1, 2, 1);
INSERT INTO public.moon VALUES (2, 'Io', 2, 2, 1);
INSERT INTO public.moon VALUES (3, 'Europa', 2, 2, 1);
INSERT INTO public.moon VALUES (4, 'Ganymede', 2, 2, 1);
INSERT INTO public.moon VALUES (5, 'Callisto', 2, 2, 1);
INSERT INTO public.moon VALUES (6, 'Titan', 7, 2, 1);
INSERT INTO public.moon VALUES (7, 'Enceladus', 7, 2, 1);
INSERT INTO public.moon VALUES (8, 'Rhea', 7, 2, 1);
INSERT INTO public.moon VALUES (9, 'Iapetus', 7, 2, 1);
INSERT INTO public.moon VALUES (10, 'Titania', 8, 2, 1);
INSERT INTO public.moon VALUES (11, 'Oberon', 8, 2, 1);
INSERT INTO public.moon VALUES (12, 'Umbriel', 8, 2, 1);
INSERT INTO public.moon VALUES (13, 'Ariel', 8, 2, 1);
INSERT INTO public.moon VALUES (14, 'Triton', 9, 2, 1);
INSERT INTO public.moon VALUES (15, 'Proteus', 9, 2, 1);
INSERT INTO public.moon VALUES (16, 'Nereid', 9, 2, 1);
INSERT INTO public.moon VALUES (17, 'Charon', 10, 2, 1);
INSERT INTO public.moon VALUES (18, 'Namaka', 12, 2, 1);
INSERT INTO public.moon VALUES (19, 'Amalthea', 2, 2, 1);
INSERT INTO public.moon VALUES (20, 'Himalia', 2, 2, 1);
INSERT INTO public.moon VALUES (21, 'Metis', 2, 2, 1);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (12, 'Haumea', false, 2, 1);
INSERT INTO public.planet VALUES (11, 'Ceres', false, 2, 1);
INSERT INTO public.planet VALUES (3, 'Proxima Centauri b', false, 3, 1);
INSERT INTO public.planet VALUES (10, 'Pluto', false, 2, 1);
INSERT INTO public.planet VALUES (9, 'Neptune', false, 2, 1);
INSERT INTO public.planet VALUES (8, 'Uranus', false, 2, 1);
INSERT INTO public.planet VALUES (7, 'Saturn', false, 2, 1);
INSERT INTO public.planet VALUES (6, 'Mercury', false, 2, 1);
INSERT INTO public.planet VALUES (5, 'Venus', false, 2, 1);
INSERT INTO public.planet VALUES (4, 'Mars', false, 2, 1);
INSERT INTO public.planet VALUES (2, 'Jupiter', false, 2, 1);
INSERT INTO public.planet VALUES (1, 'Earth', true, 2, 1);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (7, 'M82-VXX', 3, 20, 60000);
INSERT INTO public.star VALUES (2, 'Sun', 1, 5, 1392);
INSERT INTO public.star VALUES (6, 'Vega', 2, 9, 3800);
INSERT INTO public.star VALUES (5, 'V1', 2, 5, 49000);
INSERT INTO public.star VALUES (4, 'Sirius', 1, 25, 11);
INSERT INTO public.star VALUES (3, 'Alpha Centauri', 1, 6, 1700);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 8, true);


--
-- Name: index_index_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.index_index_seq', 21, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 21, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 9, true);


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
-- Name: index index_index_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.index
    ADD CONSTRAINT index_index_key UNIQUE (index_id);


--
-- Name: index index_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.index
    ADD CONSTRAINT index_pkey PRIMARY KEY (index_id);


--
-- Name: moon moon_moon_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_moon_id_key UNIQUE (moon_id);


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
-- Name: index index_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.index
    ADD CONSTRAINT index_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: index index_moon_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.index
    ADD CONSTRAINT index_moon_id_fkey FOREIGN KEY (moon_id) REFERENCES public.moon(moon_id);


--
-- Name: index index_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.index
    ADD CONSTRAINT index_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: index index_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.index
    ADD CONSTRAINT index_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


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

