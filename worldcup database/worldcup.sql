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

DROP DATABASE worldcup;
--
-- Name: worldcup; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE worldcup WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE worldcup OWNER TO freecodecamp;

\connect worldcup

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
-- Name: games; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.games (
    game_id integer NOT NULL,
    year integer NOT NULL,
    round character varying NOT NULL,
    winner_id integer NOT NULL,
    opponent_id integer NOT NULL,
    winner_goals integer NOT NULL,
    opponent_goals integer NOT NULL
);


ALTER TABLE public.games OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.games_game_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.games_game_id_seq OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.games_game_id_seq OWNED BY public.games.game_id;


--
-- Name: teams; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.teams (
    team_id integer NOT NULL,
    name character varying NOT NULL
);


ALTER TABLE public.teams OWNER TO freecodecamp;

--
-- Name: teams_team_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.teams_team_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.teams_team_id_seq OWNER TO freecodecamp;

--
-- Name: teams_team_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.teams_team_id_seq OWNED BY public.teams.team_id;


--
-- Name: games game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.games_game_id_seq'::regclass);


--
-- Name: teams team_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.teams ALTER COLUMN team_id SET DEFAULT nextval('public.teams_team_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (490, 2018, 'Final', 465, 466, 4, 2);
INSERT INTO public.games VALUES (491, 2018, 'Third Place', 467, 468, 2, 0);
INSERT INTO public.games VALUES (492, 2018, 'Semi-Final', 466, 468, 2, 1);
INSERT INTO public.games VALUES (493, 2018, 'Semi-Final', 465, 467, 1, 0);
INSERT INTO public.games VALUES (494, 2018, 'Quarter-Final', 466, 469, 3, 2);
INSERT INTO public.games VALUES (495, 2018, 'Quarter-Final', 468, 470, 2, 0);
INSERT INTO public.games VALUES (496, 2018, 'Quarter-Final', 467, 471, 2, 1);
INSERT INTO public.games VALUES (497, 2018, 'Quarter-Final', 465, 472, 2, 0);
INSERT INTO public.games VALUES (498, 2018, 'Eighth-Final', 468, 473, 2, 1);
INSERT INTO public.games VALUES (499, 2018, 'Eighth-Final', 470, 474, 1, 0);
INSERT INTO public.games VALUES (500, 2018, 'Eighth-Final', 467, 475, 3, 2);
INSERT INTO public.games VALUES (501, 2018, 'Eighth-Final', 471, 476, 2, 0);
INSERT INTO public.games VALUES (502, 2018, 'Eighth-Final', 466, 477, 2, 1);
INSERT INTO public.games VALUES (503, 2018, 'Eighth-Final', 469, 478, 2, 1);
INSERT INTO public.games VALUES (504, 2018, 'Eighth-Final', 472, 479, 2, 1);
INSERT INTO public.games VALUES (505, 2018, 'Eighth-Final', 465, 480, 4, 3);
INSERT INTO public.games VALUES (506, 2014, 'Final', 481, 480, 1, 0);
INSERT INTO public.games VALUES (507, 2014, 'Third Place', 482, 471, 3, 0);
INSERT INTO public.games VALUES (508, 2014, 'Semi-Final', 480, 482, 1, 0);
INSERT INTO public.games VALUES (509, 2014, 'Semi-Final', 481, 471, 7, 1);
INSERT INTO public.games VALUES (510, 2014, 'Quarter-Final', 482, 483, 1, 0);
INSERT INTO public.games VALUES (511, 2014, 'Quarter-Final', 480, 467, 1, 0);
INSERT INTO public.games VALUES (512, 2014, 'Quarter-Final', 471, 473, 2, 1);
INSERT INTO public.games VALUES (513, 2014, 'Quarter-Final', 481, 465, 1, 0);
INSERT INTO public.games VALUES (514, 2014, 'Eighth-Final', 471, 484, 2, 1);
INSERT INTO public.games VALUES (515, 2014, 'Eighth-Final', 473, 472, 2, 0);
INSERT INTO public.games VALUES (516, 2014, 'Eighth-Final', 465, 485, 2, 0);
INSERT INTO public.games VALUES (517, 2014, 'Eighth-Final', 481, 486, 2, 1);
INSERT INTO public.games VALUES (518, 2014, 'Eighth-Final', 482, 476, 2, 1);
INSERT INTO public.games VALUES (519, 2014, 'Eighth-Final', 483, 487, 2, 1);
INSERT INTO public.games VALUES (520, 2014, 'Eighth-Final', 480, 474, 1, 0);
INSERT INTO public.games VALUES (521, 2014, 'Eighth-Final', 467, 488, 2, 1);


--
-- Data for Name: teams; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.teams VALUES (465, 'France');
INSERT INTO public.teams VALUES (466, 'Croatia');
INSERT INTO public.teams VALUES (467, 'Belgium');
INSERT INTO public.teams VALUES (468, 'England');
INSERT INTO public.teams VALUES (469, 'Russia');
INSERT INTO public.teams VALUES (470, 'Sweden');
INSERT INTO public.teams VALUES (471, 'Brazil');
INSERT INTO public.teams VALUES (472, 'Uruguay');
INSERT INTO public.teams VALUES (473, 'Colombia');
INSERT INTO public.teams VALUES (474, 'Switzerland');
INSERT INTO public.teams VALUES (475, 'Japan');
INSERT INTO public.teams VALUES (476, 'Mexico');
INSERT INTO public.teams VALUES (477, 'Denmark');
INSERT INTO public.teams VALUES (478, 'Spain');
INSERT INTO public.teams VALUES (479, 'Portugal');
INSERT INTO public.teams VALUES (480, 'Argentina');
INSERT INTO public.teams VALUES (481, 'Germany');
INSERT INTO public.teams VALUES (482, 'Netherlands');
INSERT INTO public.teams VALUES (483, 'Costa Rica');
INSERT INTO public.teams VALUES (484, 'Chile');
INSERT INTO public.teams VALUES (485, 'Nigeria');
INSERT INTO public.teams VALUES (486, 'Algeria');
INSERT INTO public.teams VALUES (487, 'Greece');
INSERT INTO public.teams VALUES (488, 'United States');


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 521, true);


--
-- Name: teams_team_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.teams_team_id_seq', 488, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);


--
-- Name: teams teams_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.teams
    ADD CONSTRAINT teams_name_key UNIQUE (name);


--
-- Name: teams teams_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.teams
    ADD CONSTRAINT teams_pkey PRIMARY KEY (team_id);


--
-- Name: games games_opponent_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_opponent_id_fkey FOREIGN KEY (opponent_id) REFERENCES public.teams(team_id);


--
-- Name: games games_winner_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_winner_id_fkey FOREIGN KEY (winner_id) REFERENCES public.teams(team_id);


--
-- PostgreSQL database dump complete
--

