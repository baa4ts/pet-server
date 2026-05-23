--
-- Extensiones
-- 
CREATE EXTENSION IF NOT EXISTS pg_stat_statements;

--
-- PostgreSQL database dump
--

\restrict RQUUHaDwjq6sBaFODWl1Gdfcn96qXtA8SR0K7cLmkX9h7zSm6monbBzVsIiYDPL

-- Dumped from database version 16.14
-- Dumped by pg_dump version 16.14

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
-- Name: _prisma_migrations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public._prisma_migrations (
    id character varying(36) NOT NULL,
    checksum character varying(64) NOT NULL,
    finished_at timestamp with time zone,
    migration_name character varying(255) NOT NULL,
    logs text,
    rolled_back_at timestamp with time zone,
    started_at timestamp with time zone DEFAULT now() NOT NULL,
    applied_steps_count integer DEFAULT 0 NOT NULL
);


--
-- Name: account; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.account (
    id text NOT NULL,
    "accountId" text NOT NULL,
    "providerId" text NOT NULL,
    "userId" text NOT NULL,
    "accessToken" text,
    "refreshToken" text,
    "idToken" text,
    "accessTokenExpiresAt" timestamp(3) without time zone,
    "refreshTokenExpiresAt" timestamp(3) without time zone,
    scope text,
    password text,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL
);


--
-- Name: ausencias; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.ausencias (
    id integer NOT NULL,
    materia text NOT NULL,
    fecha timestamp(3) without time zone NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "docenteId" text NOT NULL,
    "publicadorId" text NOT NULL
);


--
-- Name: ausencias_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.ausencias_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: ausencias_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.ausencias_id_seq OWNED BY public.ausencias.id;


--
-- Name: eventos; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.eventos (
    id integer NOT NULL,
    nombre text NOT NULL,
    descripcion text NOT NULL,
    "fechaInicio" timestamp(3) without time zone NOT NULL,
    "fechaFin" timestamp(3) without time zone,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL,
    "userId" text NOT NULL
);


--
-- Name: eventos_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.eventos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: eventos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.eventos_id_seq OWNED BY public.eventos.id;


--
-- Name: noticias; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.noticias (
    id integer NOT NULL,
    titulo text NOT NULL,
    descripcion text NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL,
    "userId" text NOT NULL
);


--
-- Name: noticias_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.noticias_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: noticias_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.noticias_id_seq OWNED BY public.noticias.id;


--
-- Name: recursos; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.recursos (
    id integer NOT NULL,
    url text NOT NULL,
    tipo text,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "noticiaId" integer,
    "userId" text NOT NULL
);


--
-- Name: recursos_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.recursos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: recursos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.recursos_id_seq OWNED BY public.recursos.id;


--
-- Name: session; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.session (
    id text NOT NULL,
    "expiresAt" timestamp(3) without time zone NOT NULL,
    token text NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL,
    "ipAddress" text,
    "userAgent" text,
    "userId" text NOT NULL
);


--
-- Name: usuarios; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.usuarios (
    id text NOT NULL,
    name text NOT NULL,
    email text NOT NULL,
    "emailVerified" boolean DEFAULT false NOT NULL,
    image text,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL,
    permisos text DEFAULT ''::text NOT NULL
);


--
-- Name: verification; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.verification (
    id text NOT NULL,
    identifier text NOT NULL,
    value text NOT NULL,
    "expiresAt" timestamp(3) without time zone NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL
);


--
-- Name: ausencias id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ausencias ALTER COLUMN id SET DEFAULT nextval('public.ausencias_id_seq'::regclass);


--
-- Name: eventos id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.eventos ALTER COLUMN id SET DEFAULT nextval('public.eventos_id_seq'::regclass);


--
-- Name: noticias id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.noticias ALTER COLUMN id SET DEFAULT nextval('public.noticias_id_seq'::regclass);


--
-- Name: recursos id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.recursos ALTER COLUMN id SET DEFAULT nextval('public.recursos_id_seq'::regclass);


--
-- Data for Name: _prisma_migrations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public._prisma_migrations (id, checksum, finished_at, migration_name, logs, rolled_back_at, started_at, applied_steps_count) FROM stdin;
\.


--
-- Data for Name: account; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.account (id, "accountId", "providerId", "userId", "accessToken", "refreshToken", "idToken", "accessTokenExpiresAt", "refreshTokenExpiresAt", scope, password, "createdAt", "updatedAt") FROM stdin;
EQnFnSBt809LCEURt7BUFNOjeWn4wARY	pM9vBBQyY56C7RspHdQvL4W57G7PnMZG	credential	pM9vBBQyY56C7RspHdQvL4W57G7PnMZG	\N	\N	\N	\N	\N	\N	9e0ae64a6ffc03e03021aa81a51fdd46:fe4f58dc49b945436ae64a98889d52908d80a2d224c48e898e612ccca31ab95ddeaa7d72749c6909dbb9b0410d59eb10356ae9416fd043da3c2fa5bec9b7e018	2026-05-23 17:21:43.523	2026-05-23 17:21:43.523
EYCIdWLwpedJiSq2Dq28NLBYSp8AZchv	aXVrxjuPaTfBoIjy8tjZsWGTDac9Hbj4	credential	aXVrxjuPaTfBoIjy8tjZsWGTDac9Hbj4	\N	\N	\N	\N	\N	\N	94ea906f8c81b52e04a70ee700ae3249:60b7b69e0fa8746cc117b964d0e614aac8d9bb0923c9d5dc69cd75f956b717ee6c9845af20db969621626bcdf966482f8ed0a0c2af56dc0cdd3221f57316da0f	2026-05-23 17:21:43.815	2026-05-23 17:21:43.815
kcdGDMxQlEeb5DKKIkId1RrDB7zoViaJ	u5jWdvtZnggzVe44gu4l1cbprTBNsUgL	credential	u5jWdvtZnggzVe44gu4l1cbprTBNsUgL	\N	\N	\N	\N	\N	\N	842388b7cdc8b7f18916a47e80044488:d5e5f388de327fbb14692f337f7f3df59bf98b1f7399d58d97996ff8b6273d7e589337a33155062b565e1b1e6568d2c1292c4e76ba789fe1b1308367e9935b18	2026-05-23 17:21:44.061	2026-05-23 17:21:44.061
\.


--
-- Data for Name: ausencias; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.ausencias (id, materia, fecha, "createdAt", "docenteId", "publicadorId") FROM stdin;
\.


--
-- Data for Name: eventos; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.eventos (id, nombre, descripcion, "fechaInicio", "fechaFin", "createdAt", "updatedAt", "userId") FROM stdin;
\.


--
-- Data for Name: noticias; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.noticias (id, titulo, descripcion, "createdAt", "updatedAt", "userId") FROM stdin;
\.


--
-- Data for Name: recursos; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.recursos (id, url, tipo, "createdAt", "noticiaId", "userId") FROM stdin;
\.


--
-- Data for Name: session; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.session (id, "expiresAt", token, "createdAt", "updatedAt", "ipAddress", "userAgent", "userId") FROM stdin;
LoEMNg4REXTEStk97d8mPZuVqPEBHQRD	2026-05-23 17:41:43.545	pSyCz78YMPw6PFMANFM61ozovaJkTPYy	2026-05-23 17:21:43.545	2026-05-23 17:21:43.545			pM9vBBQyY56C7RspHdQvL4W57G7PnMZG
9UtIR79pZDv3uGrFNsJGWWpxmgtbxwEF	2026-05-23 17:41:43.824	K9Ll8FbCUtq5uO3YCZMAWOtae1WjUiaB	2026-05-23 17:21:43.824	2026-05-23 17:21:43.824			aXVrxjuPaTfBoIjy8tjZsWGTDac9Hbj4
gpvSjc3g9C0bL9zY0WiJoApnz3iwvfrK	2026-05-23 17:41:44.068	KYzZtGzXOToZHwKJUamgZepvZspZyc2r	2026-05-23 17:21:44.068	2026-05-23 17:21:44.068			u5jWdvtZnggzVe44gu4l1cbprTBNsUgL
\.


--
-- Data for Name: usuarios; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.usuarios (id, name, email, "emailVerified", image, "createdAt", "updatedAt", permisos) FROM stdin;
aXVrxjuPaTfBoIjy8tjZsWGTDac9Hbj4	yei	yeir@yeir.com	f	\N	2026-05-23 17:21:43.806	2026-05-23 17:21:43.806	
u5jWdvtZnggzVe44gu4l1cbprTBNsUgL	rula	rula@rula.com	f	\N	2026-05-23 17:21:44.054	2026-05-23 17:21:44.054	
pM9vBBQyY56C7RspHdQvL4W57G7PnMZG	Admin	admin@admin.com	f	\N	2026-05-23 17:21:43.48	2026-05-23 17:21:44.097	ausencias,eventos,noticias,usuarios,recursos,permisos,analitica
\.


--
-- Data for Name: verification; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.verification (id, identifier, value, "expiresAt", "createdAt", "updatedAt") FROM stdin;
\.


--
-- Name: ausencias_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.ausencias_id_seq', 1, false);


--
-- Name: eventos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.eventos_id_seq', 1, false);


--
-- Name: noticias_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.noticias_id_seq', 1, false);


--
-- Name: recursos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.recursos_id_seq', 1, false);


--
-- Name: _prisma_migrations _prisma_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public._prisma_migrations
    ADD CONSTRAINT _prisma_migrations_pkey PRIMARY KEY (id);


--
-- Name: account account_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.account
    ADD CONSTRAINT account_pkey PRIMARY KEY (id);


--
-- Name: ausencias ausencias_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ausencias
    ADD CONSTRAINT ausencias_pkey PRIMARY KEY (id);


--
-- Name: eventos eventos_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.eventos
    ADD CONSTRAINT eventos_pkey PRIMARY KEY (id);


--
-- Name: noticias noticias_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.noticias
    ADD CONSTRAINT noticias_pkey PRIMARY KEY (id);


--
-- Name: recursos recursos_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.recursos
    ADD CONSTRAINT recursos_pkey PRIMARY KEY (id);


--
-- Name: session session_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.session
    ADD CONSTRAINT session_pkey PRIMARY KEY (id);


--
-- Name: usuarios usuarios_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_pkey PRIMARY KEY (id);


--
-- Name: verification verification_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.verification
    ADD CONSTRAINT verification_pkey PRIMARY KEY (id);


--
-- Name: account_userId_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "account_userId_idx" ON public.account USING btree ("userId");


--
-- Name: ausencias_docenteId_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "ausencias_docenteId_idx" ON public.ausencias USING btree ("docenteId");


--
-- Name: ausencias_fecha_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX ausencias_fecha_idx ON public.ausencias USING btree (fecha);


--
-- Name: ausencias_publicadorId_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "ausencias_publicadorId_idx" ON public.ausencias USING btree ("publicadorId");


--
-- Name: eventos_fechaInicio_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "eventos_fechaInicio_idx" ON public.eventos USING btree ("fechaInicio");


--
-- Name: eventos_userId_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "eventos_userId_idx" ON public.eventos USING btree ("userId");


--
-- Name: noticias_createdAt_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "noticias_createdAt_idx" ON public.noticias USING btree ("createdAt");


--
-- Name: noticias_userId_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "noticias_userId_idx" ON public.noticias USING btree ("userId");


--
-- Name: recursos_noticiaId_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "recursos_noticiaId_idx" ON public.recursos USING btree ("noticiaId");


--
-- Name: recursos_userId_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "recursos_userId_idx" ON public.recursos USING btree ("userId");


--
-- Name: session_token_key; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX session_token_key ON public.session USING btree (token);


--
-- Name: session_userId_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "session_userId_idx" ON public.session USING btree ("userId");


--
-- Name: usuarios_email_key; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX usuarios_email_key ON public.usuarios USING btree (email);


--
-- Name: verification_identifier_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX verification_identifier_idx ON public.verification USING btree (identifier);


--
-- Name: account account_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.account
    ADD CONSTRAINT "account_userId_fkey" FOREIGN KEY ("userId") REFERENCES public.usuarios(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: ausencias ausencias_docenteId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ausencias
    ADD CONSTRAINT "ausencias_docenteId_fkey" FOREIGN KEY ("docenteId") REFERENCES public.usuarios(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: ausencias ausencias_publicadorId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ausencias
    ADD CONSTRAINT "ausencias_publicadorId_fkey" FOREIGN KEY ("publicadorId") REFERENCES public.usuarios(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: eventos eventos_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.eventos
    ADD CONSTRAINT "eventos_userId_fkey" FOREIGN KEY ("userId") REFERENCES public.usuarios(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: noticias noticias_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.noticias
    ADD CONSTRAINT "noticias_userId_fkey" FOREIGN KEY ("userId") REFERENCES public.usuarios(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: recursos recursos_noticiaId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.recursos
    ADD CONSTRAINT "recursos_noticiaId_fkey" FOREIGN KEY ("noticiaId") REFERENCES public.noticias(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: recursos recursos_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.recursos
    ADD CONSTRAINT "recursos_userId_fkey" FOREIGN KEY ("userId") REFERENCES public.usuarios(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: session session_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.session
    ADD CONSTRAINT "session_userId_fkey" FOREIGN KEY ("userId") REFERENCES public.usuarios(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--
SELECT pg_stat_statements_reset();
\unrestrict RQUUHaDwjq6sBaFODWl1Gdfcn96qXtA8SR0K7cLmkX9h7zSm6monbBzVsIiYDPL

