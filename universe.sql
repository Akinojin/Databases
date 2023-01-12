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
-- Name: constellation; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.constellation (
    constellation_id integer NOT NULL,
    name character varying(30) NOT NULL,
    info text
);


ALTER TABLE public.constellation OWNER TO freecodecamp;

--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.constellation_constellation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.constellation_constellation_id_seq OWNER TO freecodecamp;

--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.constellation_constellation_id_seq OWNED BY public.constellation.constellation_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30),
    apparent_magnitude numeric,
    distance_myl_int integer,
    visible boolean,
    constellation_id integer NOT NULL
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
    name character varying(30),
    numeral integer,
    constellation_id integer,
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
    name character varying(30),
    has_life boolean,
    constellation_id integer,
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
    name character varying(30),
    evolutionary_stage character varying(30),
    galaxy_id integer NOT NULL,
    constellation_id integer
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
-- Name: constellation constellation_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation ALTER COLUMN constellation_id SET DEFAULT nextval('public.constellation_constellation_id_seq'::regclass);


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
-- Data for Name: constellation; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.constellation VALUES (1, 'Sagittarius', 'Sagittarius is one of the constellations of the zodiac and is located in the Southern celestial hemisphere');
INSERT INTO public.constellation VALUES (2, 'Tucana', 'Tucana (The Toucan) is a constellation of stars in the southern sky, named after the toucan, a South American bird.');
INSERT INTO public.constellation VALUES (3, 'Andromeda', 'Andromeda is one of the 48 constellations listed by the 2-nd century Greco-Roman astronomer Ptolemy, and one of the 88 modern condtellations.');
INSERT INTO public.constellation VALUES (4, 'Triangulum', 'Triangulum is a small constellation in thr northen sky.');
INSERT INTO public.constellation VALUES (5, 'Centaurus', 'Centaurus is a bright constellation in the southern sky.');
INSERT INTO public.constellation VALUES (6, 'Ursa Major', 'Ursa Major is a  constillation in the northen sky, whose associated mythology likely dates into prehistory');
INSERT INTO public.constellation VALUES (7, 'Scorpius', 'Scorpius is a zodiac condtillation located in the Southern celestial hemisphere, where it sits near the center of the Milky Way, between Libra to the west and Sagittarius to the east.');
INSERT INTO public.constellation VALUES (8, 'Lyra', 'Lyra is a small constellation.');
INSERT INTO public.constellation VALUES (9, 'Orion', 'Orion is a prominent constellation located on the celestial equator and visible throughout the world.');
INSERT INTO public.constellation VALUES (10, 'Canis Major', 'Canis Major is a constellation in the southern celestial hemisphere.');
INSERT INTO public.constellation VALUES (11, 'Aquila', 'Aquila is a constellation on the celestial equator.');
INSERT INTO public.constellation VALUES (12, 'Pisces', 'Pisces is a constellation of the zodiac.');
INSERT INTO public.constellation VALUES (13, 'Capricornus', 'Capricornus is one of the constellations of the zodiac.');
INSERT INTO public.constellation VALUES (14, 'Taurus', 'Taurus (Latin for "the Bull") is one of the constellations of the zodiac and is located in the northen celestial hemisphere.');
INSERT INTO public.constellation VALUES (15, 'Aries', 'Aries is one of the constellations of the zodiac.');
INSERT INTO public.constellation VALUES (16, 'Aquarius', 'Aquarius is an equatorial constellatoin of the zodiac, between Capricornus and Pisces.');
INSERT INTO public.constellation VALUES (17, 'Cetus', 'Cetus is a constellation, sometimes called "the whale" in English.');
INSERT INTO public.constellation VALUES (18, 'Virgo', 'Virgo is one of the constellations of the zodiac.');
INSERT INTO public.constellation VALUES (19, 'Bootes', 'Bootes is a constellation in the northen sky, located between 0 and +60 declination, and 13 and 16 hours of right ascension on the celestial sphere.');
INSERT INTO public.constellation VALUES (20, 'Leo', 'Leo is one of the constellations of the zodiac.');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', -6.5, 0, true, 1);
INSERT INTO public.galaxy VALUES (2, 'Small Magellanic Cloud', 0.9, 0, true, 2);
INSERT INTO public.galaxy VALUES (3, 'Andromeda Galaxy', 3.4, 2, true, 3);
INSERT INTO public.galaxy VALUES (4, 'Triangulum Galaxy', 5.7, 2, true, 4);
INSERT INTO public.galaxy VALUES (5, 'Centaurus A', 6.84, 13, true, 5);
INSERT INTO public.galaxy VALUES (6, 'Bode''s Galaxy', 6.94, 12, true, 6);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 1, 20, 1);
INSERT INTO public.moon VALUES (2, 'Europa', 1, 14, 2);
INSERT INTO public.moon VALUES (3, 'Ganymede', 3, 16, 2);
INSERT INTO public.moon VALUES (4, 'Callisto', 4, 6, 2);
INSERT INTO public.moon VALUES (5, 'Mimas', 1, NULL, 3);
INSERT INTO public.moon VALUES (6, 'Enceladus', 2, NULL, 3);
INSERT INTO public.moon VALUES (7, 'Tethys', 3, NULL, 3);
INSERT INTO public.moon VALUES (8, 'Dione', 4, NULL, 3);
INSERT INTO public.moon VALUES (9, 'Rhea', 5, NULL, 3);
INSERT INTO public.moon VALUES (10, 'Phobos', 1, NULL, 4);
INSERT INTO public.moon VALUES (11, 'Deimos', 2, NULL, 4);
INSERT INTO public.moon VALUES (12, 'Ariel', 1, NULL, 7);
INSERT INTO public.moon VALUES (13, 'Umbriel', 2, NULL, 7);
INSERT INTO public.moon VALUES (14, 'Titania', 3, NULL, 7);
INSERT INTO public.moon VALUES (15, 'Oberon', 4, NULL, 7);
INSERT INTO public.moon VALUES (16, 'Triton', 1, NULL, 8);
INSERT INTO public.moon VALUES (17, 'Nereid', 2, NULL, 8);
INSERT INTO public.moon VALUES (18, 'Charon', 1, NULL, 9);
INSERT INTO public.moon VALUES (19, 'Nix', 2, NULL, 9);
INSERT INTO public.moon VALUES (20, 'Dysnomia', 1, NULL, 10);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', true, NULL, 1);
INSERT INTO public.planet VALUES (3, 'Saturn', false, 13, 1);
INSERT INTO public.planet VALUES (2, 'Jupiter', false, 12, 1);
INSERT INTO public.planet VALUES (4, 'Mars', false, 14, 1);
INSERT INTO public.planet VALUES (5, 'Mercury', false, 1, 1);
INSERT INTO public.planet VALUES (6, 'Venus', false, 1, 1);
INSERT INTO public.planet VALUES (9, 'Pluto', false, 1, 1);
INSERT INTO public.planet VALUES (7, 'Uranus', false, 15, 1);
INSERT INTO public.planet VALUES (8, 'Neptune', false, 16, 1);
INSERT INTO public.planet VALUES (10, 'Eris', false, 17, 1);
INSERT INTO public.planet VALUES (11, 'Ceres', false, 18, 1);
INSERT INTO public.planet VALUES (12, 'Haumea', false, 19, 1);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', NULL, 1, NULL);
INSERT INTO public.star VALUES (2, 'Antares', 'Red supergiant', 1, 7);
INSERT INTO public.star VALUES (3, 'Vega', 'Main sequence', 1, 8);
INSERT INTO public.star VALUES (4, 'Rigel', 'Blue supergiant', 1, 9);
INSERT INTO public.star VALUES (5, 'VY Canis Majoris', 'Red hypergiant', 1, 10);
INSERT INTO public.star VALUES (6, 'Altair', 'Main sequence', 1, 11);


--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.constellation_constellation_id_seq', 20, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 7, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 39, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: constellation constellation_name_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_name_unique UNIQUE (name);


--
-- Name: constellation constellation_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_pkey PRIMARY KEY (constellation_id);


--
-- Name: galaxy galaxy_name_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_unique UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_unique UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_unique UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_unique UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: galaxy galaxy_constellation_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_constellation_id_fkey FOREIGN KEY (constellation_id) REFERENCES public.constellation(constellation_id);


--
-- Name: moon moon_constellation_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_constellation_id_fkey FOREIGN KEY (constellation_id) REFERENCES public.constellation(constellation_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_constellation_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_constellation_id_fkey FOREIGN KEY (constellation_id) REFERENCES public.constellation(constellation_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_constellation_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_constellation_id_fkey FOREIGN KEY (constellation_id) REFERENCES public.constellation(constellation_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--
