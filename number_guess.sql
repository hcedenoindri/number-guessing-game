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

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

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
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    name character varying(22),
    games_played integer NOT NULL,
    best_game integer
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (37, 'user_1685758188160', 1, 1000);
INSERT INTO public.users VALUES (38, 'user_1685758188159', 1, 1000);
INSERT INTO public.users VALUES (39, 'user_1685758263919', 1, 1000);
INSERT INTO public.users VALUES (40, 'user_1685758263918', 1, 1000);
INSERT INTO public.users VALUES (41, 'user_1685758440664', 1, 1000);
INSERT INTO public.users VALUES (42, 'user_1685758440663', 1, 1000);
INSERT INTO public.users VALUES (44, 'user_1685758696344', 2, 1000);
INSERT INTO public.users VALUES (43, 'user_1685758696345', 5, 1000);
INSERT INTO public.users VALUES (46, 'user_1685758777138', 2, 40);
INSERT INTO public.users VALUES (45, 'user_1685758777139', 5, 1000);
INSERT INTO public.users VALUES (47, 'hi', 1, 1000);
INSERT INTO public.users VALUES (48, 'jr', 1, 11);
INSERT INTO public.users VALUES (50, 'user_1685759304595', 2, 1000);
INSERT INTO public.users VALUES (49, 'user_1685759304596', 5, 1000);
INSERT INTO public.users VALUES (52, 'user_1685759982060', 2, 1000);
INSERT INTO public.users VALUES (51, 'user_1685759982061', 5, 78);
INSERT INTO public.users VALUES (54, 'user_1685760168370', 2, 23);
INSERT INTO public.users VALUES (53, 'user_1685760168371', 5, 12);
INSERT INTO public.users VALUES (56, 'user_1685760342454', 2, 558);
INSERT INTO public.users VALUES (55, 'user_1685760342455', 4, 639);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 56, true);


--
-- Name: users users_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_name_key UNIQUE (name);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- PostgreSQL database dump complete
--

