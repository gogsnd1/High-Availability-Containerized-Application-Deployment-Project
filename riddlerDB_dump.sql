--
-- PostgreSQL database dump
--

-- Dumped from database version 15.12 (Debian 15.12-0+deb12u2)
-- Dumped by pg_dump version 15.12 (Debian 15.12-0+deb12u2)

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
-- Name: answer; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.answer (
    answerid integer NOT NULL,
    questionid integer,
    answer character varying(255) NOT NULL
);


ALTER TABLE public.answer OWNER TO postgres;

--
-- Name: answer_answerid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.answer_answerid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.answer_answerid_seq OWNER TO postgres;

--
-- Name: answer_answerid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.answer_answerid_seq OWNED BY public.answer.answerid;


--
-- Name: difficultylevel; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.difficultylevel (
    difficultyid integer NOT NULL,
    difficultyname character varying(20) NOT NULL
);


ALTER TABLE public.difficultylevel OWNER TO postgres;

--
-- Name: difficultylevel_difficultyid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.difficultylevel_difficultyid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.difficultylevel_difficultyid_seq OWNER TO postgres;

--
-- Name: difficultylevel_difficultyid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.difficultylevel_difficultyid_seq OWNED BY public.difficultylevel.difficultyid;


--
-- Name: question; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.question (
    questionid integer NOT NULL,
    title character varying(100) NOT NULL,
    question text NOT NULL,
    difficultyid integer
);


ALTER TABLE public.question OWNER TO postgres;

--
-- Name: question_questionid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.question_questionid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.question_questionid_seq OWNER TO postgres;

--
-- Name: question_questionid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.question_questionid_seq OWNED BY public.question.questionid;


--
-- Name: answer answerid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.answer ALTER COLUMN answerid SET DEFAULT nextval('public.answer_answerid_seq'::regclass);


--
-- Name: difficultylevel difficultyid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.difficultylevel ALTER COLUMN difficultyid SET DEFAULT nextval('public.difficultylevel_difficultyid_seq'::regclass);


--
-- Name: question questionid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.question ALTER COLUMN questionid SET DEFAULT nextval('public.question_questionid_seq'::regclass);


--
-- Data for Name: answer; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.answer (answerid, questionid, answer) FROM stdin;
\.


--
-- Data for Name: difficultylevel; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.difficultylevel (difficultyid, difficultyname) FROM stdin;
\.


--
-- Data for Name: question; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.question (questionid, title, question, difficultyid) FROM stdin;
\.


--
-- Name: answer_answerid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.answer_answerid_seq', 1, false);


--
-- Name: difficultylevel_difficultyid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.difficultylevel_difficultyid_seq', 1, false);


--
-- Name: question_questionid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.question_questionid_seq', 1, false);


--
-- Name: answer answer_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.answer
    ADD CONSTRAINT answer_pkey PRIMARY KEY (answerid);


--
-- Name: difficultylevel difficultylevel_difficultyname_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.difficultylevel
    ADD CONSTRAINT difficultylevel_difficultyname_key UNIQUE (difficultyname);


--
-- Name: difficultylevel difficultylevel_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.difficultylevel
    ADD CONSTRAINT difficultylevel_pkey PRIMARY KEY (difficultyid);


--
-- Name: question question_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.question
    ADD CONSTRAINT question_pkey PRIMARY KEY (questionid);


--
-- Name: answer answer_questionid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.answer
    ADD CONSTRAINT answer_questionid_fkey FOREIGN KEY (questionid) REFERENCES public.question(questionid) ON DELETE CASCADE;


--
-- Name: question question_difficultyid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.question
    ADD CONSTRAINT question_difficultyid_fkey FOREIGN KEY (difficultyid) REFERENCES public.difficultylevel(difficultyid);


--
-- PostgreSQL database dump complete
--