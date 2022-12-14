--
-- PostgreSQL database dump
--

-- Dumped from database version 15.0
-- Dumped by pg_dump version 15.0

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
-- Name: admin; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.admin (
    id integer NOT NULL,
    username character varying NOT NULL,
    password character varying NOT NULL,
    updationdate timestamp without time zone DEFAULT '2020-01-01 00:00:01'::timestamp without time zone NOT NULL
);


ALTER TABLE public.admin OWNER TO postgres;

--
-- Name: id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.id_seq OWNER TO postgres;

--
-- Name: id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.id_seq OWNED BY public.admin.id;


--
-- Name: tblbooking; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tblbooking (
    id integer NOT NULL,
    useremail character varying,
    vehicleid integer,
    fromdate character varying,
    todate character varying,
    message character varying,
    status integer,
    postingdate timestamp without time zone DEFAULT '2020-01-01 00:00:01'::timestamp without time zone NOT NULL
);


ALTER TABLE public.tblbooking OWNER TO postgres;

--
-- Name: id_seq1; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.id_seq1
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.id_seq1 OWNER TO postgres;

--
-- Name: id_seq1; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.id_seq1 OWNED BY public.tblbooking.id;


--
-- Name: tblbrands; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tblbrands (
    id integer NOT NULL,
    brandname character varying NOT NULL,
    creationdate timestamp without time zone DEFAULT '2020-01-01 00:00:01'::timestamp without time zone,
    updationdate timestamp without time zone DEFAULT '2020-01-01 00:00:01'::timestamp without time zone
);


ALTER TABLE public.tblbrands OWNER TO postgres;

--
-- Name: id_seq2; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.id_seq2
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.id_seq2 OWNER TO postgres;

--
-- Name: id_seq2; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.id_seq2 OWNED BY public.tblbrands.id;


--
-- Name: tblcontactusinfo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tblcontactusinfo (
    id integer NOT NULL,
    address character varying,
    emailid character varying,
    contactno character(11) DEFAULT NULL::bpchar
);


ALTER TABLE public.tblcontactusinfo OWNER TO postgres;

--
-- Name: id_seq3; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.id_seq3
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.id_seq3 OWNER TO postgres;

--
-- Name: id_seq3; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.id_seq3 OWNED BY public.tblcontactusinfo.id;


--
-- Name: tblcontactusquery; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tblcontactusquery (
    id integer NOT NULL,
    name character varying,
    emailid character varying,
    contactnumber character(11) DEFAULT NULL::bpchar,
    message character varying,
    postingdate timestamp without time zone DEFAULT '2020-01-01 00:00:01'::timestamp without time zone NOT NULL,
    status integer
);


ALTER TABLE public.tblcontactusquery OWNER TO postgres;

--
-- Name: id_seq4; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.id_seq4
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.id_seq4 OWNER TO postgres;

--
-- Name: id_seq4; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.id_seq4 OWNED BY public.tblcontactusquery.id;


--
-- Name: tblpages; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tblpages (
    id integer NOT NULL,
    pagename character varying,
    type character varying DEFAULT ''::character varying NOT NULL,
    detail character varying NOT NULL
);


ALTER TABLE public.tblpages OWNER TO postgres;

--
-- Name: id_seq5; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.id_seq5
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.id_seq5 OWNER TO postgres;

--
-- Name: id_seq5; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.id_seq5 OWNED BY public.tblpages.id;


--
-- Name: tblusers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tblusers (
    id integer NOT NULL,
    fullname character varying,
    emailid character varying,
    password character varying,
    contactno character(11) DEFAULT NULL::bpchar,
    dob character varying,
    address character varying,
    city character varying,
    country character varying,
    regdate timestamp without time zone DEFAULT '2020-01-01 00:00:01'::timestamp without time zone,
    updationdate timestamp without time zone DEFAULT '2020-01-01 00:00:01'::timestamp without time zone
);


ALTER TABLE public.tblusers OWNER TO postgres;

--
-- Name: id_seq6; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.id_seq6
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.id_seq6 OWNER TO postgres;

--
-- Name: id_seq6; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.id_seq6 OWNED BY public.tblusers.id;


--
-- Name: tblvehicles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tblvehicles (
    id integer NOT NULL,
    vehiclestitle character varying,
    vehiclesbrand integer,
    vehiclesoverview character varying,
    priceperday integer,
    fueltype character varying,
    modelyear integer,
    seatingcapacity integer,
    vimage1 character varying,
    vimage2 character varying,
    vimage3 character varying,
    vimage4 character varying,
    vimage5 character varying,
    airconditioner integer,
    powerdoorlocks integer,
    antilockbrakingsystem integer,
    brakeassist integer,
    powersteering integer,
    driverairbag integer,
    passengerairbag integer,
    powerwindows integer,
    cdplayer integer,
    centrallocking integer,
    crashsensor integer,
    leatherseats integer,
    regdate timestamp without time zone DEFAULT '2020-01-01 00:00:01'::timestamp without time zone NOT NULL,
    updationdate timestamp without time zone DEFAULT '2020-01-01 00:00:01'::timestamp without time zone
);


ALTER TABLE public.tblvehicles OWNER TO postgres;

--
-- Name: id_seq7; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.id_seq7
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.id_seq7 OWNER TO postgres;

--
-- Name: id_seq7; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.id_seq7 OWNED BY public.tblvehicles.id;


--
-- Name: tblsubscribers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tblsubscribers (
    id integer NOT NULL,
    subscriberemail character varying,
    postingdate timestamp without time zone DEFAULT '2020-01-01 00:00:01'::timestamp without time zone
);


ALTER TABLE public.tblsubscribers OWNER TO postgres;

--
-- Name: tbltestimonial; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tbltestimonial (
    id integer NOT NULL,
    useremail character varying NOT NULL,
    testimonial character varying NOT NULL,
    postingdate timestamp without time zone DEFAULT '2020-01-01 00:00:01'::timestamp without time zone NOT NULL,
    status integer
);


ALTER TABLE public.tbltestimonial OWNER TO postgres;

--
-- Name: admin id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin ALTER COLUMN id SET DEFAULT nextval('public.id_seq'::regclass);


--
-- Name: tblbooking id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tblbooking ALTER COLUMN id SET DEFAULT nextval('public.id_seq1'::regclass);


--
-- Name: tblbrands id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tblbrands ALTER COLUMN id SET DEFAULT nextval('public.id_seq2'::regclass);


--
-- Name: tblcontactusinfo id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tblcontactusinfo ALTER COLUMN id SET DEFAULT nextval('public.id_seq3'::regclass);


--
-- Name: tblcontactusquery id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tblcontactusquery ALTER COLUMN id SET DEFAULT nextval('public.id_seq4'::regclass);


--
-- Name: tblpages id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tblpages ALTER COLUMN id SET DEFAULT nextval('public.id_seq5'::regclass);


--
-- Name: tblusers id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tblusers ALTER COLUMN id SET DEFAULT nextval('public.id_seq6'::regclass);


--
-- Name: tblvehicles id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tblvehicles ALTER COLUMN id SET DEFAULT nextval('public.id_seq7'::regclass);


--
-- Data for Name: admin; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.admin (id, username, password, updationdate) FROM stdin;
1	admin	5c428d8875d2948607f3e3fe134d71b4	2022-04-20 12:22:38
\.


--
-- Data for Name: tblbooking; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tblbooking (id, useremail, vehicleid, fromdate, todate, message, status, postingdate) FROM stdin;
13	teenu@gmail.com	24	12/12/2022	12/12/2023	I'm interested	1	2020-01-01 00:00:01
14	customer@gmail.com	24	12/12/2022	12/12/2023	i'm interested	1	2020-01-01 00:00:01
15	customer1@gmail.com	26	12/12/2022	12/12/2023	i'm inteersted	0	2020-01-01 00:00:01
16	customer@gmail.com	26	12/12/2022	12/12/2023	i'm interested	1	2020-01-01 00:00:01
17	customer@gmail.com	27	12/12/2022	12/12/2023	i'm interested	1	2020-01-01 00:00:01
\.


--
-- Data for Name: tblbrands; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tblbrands (id, brandname, creationdate, updationdate) FROM stdin;
18	Vertex	2020-01-01 00:00:01	2020-01-01 00:00:01
19	Desert Palm	2020-01-01 00:00:01	2020-01-01 00:00:01
20	Canvas	2020-01-01 00:00:01	2020-01-01 00:00:01
21	Gateway	2020-01-01 00:00:01	2020-01-01 00:00:01
17	Onnix	2020-01-01 00:00:01	2020-01-01 00:00:01
26	paseo1	2020-01-01 00:00:01	2020-01-01 00:00:01
\.


--
-- Data for Name: tblcontactusinfo; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tblcontactusinfo (id, address, emailid, contactno) FROM stdin;
1	Kanairo\\r\\n\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t	HCIgroup@gmail.com	0707070708 
\.


--
-- Data for Name: tblcontactusquery; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tblcontactusquery (id, name, emailid, contactnumber, message, postingdate, status) FROM stdin;
2	Testor	test@gmail.com	0707070707 	lorem	2022-04-15 21:17:07	1
3	Ali	ali@gmail.com	0707070708 	i got an issue	2022-06-23 15:26:24	1
4	Ali	ali@gmail.com	0707070708 	i got an issue	2022-06-23 15:26:48	\N
5	Justin Nichols	xylyh@mailinator.com	0707070708 	Fugiat cupidatat ex	2022-06-25 14:59:19	\N
\.


--
-- Data for Name: tblpages; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tblpages (id, pagename, type, detail) FROM stdin;
1	Terms and Conditions	terms	\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t<p align=\\"justify\\"><font size=\\"2\\"><strong><font color=\\"#990000\\">(1) ACCEPTANCE OF TERMS</font></strong></font></p><p align=\\"justify\\"><span style=\\"color: rgb(20, 20, 20); font-family: &quot;Noto Sans&quot;, sans-serif; font-size: 18px; text-align: left;\\">The Company may refuse to conclude the Rental Agreement when any of the following items applies to the Renter or the Driver:</span></p><ol class=\\"list-number--brackets\\" style=\\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px; border: 0px; font-size: 18px; vertical-align: baseline; list-style: none; color: rgb(20, 20, 20); font-family: &quot;Noto Sans&quot;, sans-serif;\\"><li style=\\"margin-top: 10px; margin-bottom: 10px; margin-left: -1em; padding-left: 3em; border: 0px; vertical-align: baseline; counter-increment: brackets 1; text-indent: -2.5em;\\">When the driver???s license necessary to drive the Rental Car has not been presented;</li><li style=\\"margin-top: 10px; margin-bottom: 10px; margin-left: -1em; padding-left: 3em; border: 0px; vertical-align: baseline; counter-increment: brackets 1; text-indent: -2.5em;\\">When deemed to be under the influence of alcohol;</li><li style=\\"margin-top: 10px; margin-bottom: 10px; margin-left: -1em; padding-left: 3em; border: 0px; vertical-align: baseline; counter-increment: brackets 1; text-indent: -2.5em;\\">When deemed to be intoxicated by substances such as drugs, stimulants, and thinners;</li><li style=\\"margin-top: 10px; margin-bottom: 10px; margin-left: -1em; padding-left: 3em; border: 0px; vertical-align: baseline; counter-increment: brackets 1; text-indent: -2.5em;\\">When traveling with a child under the age of six without a toddler seat;</li><li style=\\"margin-top: 10px; margin-bottom: 10px; margin-left: -1em; padding-left: 3em; border: 0px; vertical-align: baseline; counter-increment: brackets 1; text-indent: -2.5em;\\">When he or she has been determined to be a member of or involved with a crime syndicate or organization affiliated with a crime syndicate, or a member of some other antisocial organization (\\"organized crime etc.\\" hereinafter), or facts have been identified that show that he or she has cooperated or been involved in maintenance and management of a crime syndicate or organization affiliated with a crime syndicate or has interacted with organized crime etc;</li><li style=\\"margin-top: 10px; margin-bottom: 10px; margin-left: -1em; padding-left: 3em; border: 0px; vertical-align: baseline; counter-increment: brackets 1; text-indent: -2.5em;\\">When the Driver specified at the time of reservation differs from the Driver at the time of concluding the Rental Agreement;</li><li style=\\"margin-top: 10px; margin-bottom: 10px; margin-left: -1em; padding-left: 3em; border: 0px; vertical-align: baseline; counter-increment: brackets 1; text-indent: -2.5em;\\">When there is evidence of belated payment of debt to the Company in past rental transactions;</li><li style=\\"margin-top: 10px; margin-bottom: 10px; margin-left: -1em; padding-left: 3em; border: 0px; vertical-align: baseline; counter-increment: brackets 1; text-indent: -2.5em;\\">When any of the acts provided for in Article 22 were committed in past rental transactions;</li><li style=\\"margin-top: 10px; margin-bottom: 10px; margin-left: -1em; padding-left: 3em; border: 0px; vertical-align: baseline; counter-increment: brackets 1; text-indent: -2.5em;\\">When any of the acts provided for in paragraph 6 of Article 26 or paragraph 1 of Article 35 were committed in past rental transactions (including past transactions with other car rental companies);</li><li style=\\"margin-top: 10px; margin-bottom: 10px; margin-left: -1em; padding-left: 3em; border: 0px; vertical-align: baseline; counter-increment: brackets 1; text-indent: -2.5em;\\">When there is evidence that automobile insurance was not applied in past rental transactions due to a violation of the Times CAR RENTAL Terms and Conditions or insurance terms and conditions;</li><li style=\\"margin-top: 10px; margin-bottom: 10px; margin-left: -1em; padding-left: 3em; border: 0px; vertical-align: baseline; counter-increment: brackets 1; text-indent: -2.5em;\\">When Rental Conditions prescribed separately by the Company have not been fulfilled;</li></ol>\\r\\n\t\t\t\t\t\t\t\t\t\t\\r\\n\t\t\t\t\t\t\t\t\t\t\\r\\n\t\t\t\t\t\t\t\t\t\t
2	Privacy Policy	privacy	<div style=\\"text-align: justify;\\"><span style=\\"font-size: 1em; color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif;\\">privacy policy</span></div>
3	About Us 	aboutus	\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t<h1><span style=\\"font-weight: bold; font-size: xx-large; font-family: impact;\\">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;GROUP MEMBERS<br></span><span style=\\"font-weight: bold; font-size: xx-large; font-family: impact;\\">1.Evans okania<br></span><span style=\\"font-weight: bold; font-size: xx-large; font-family: impact;\\">2.Sheikh Ali<br></span><span style=\\"font-weight: bold; font-size: xx-large; font-family: impact;\\">3.Hellen Ndathi<br></span><span style=\\"font-weight: bold; font-size: xx-large; font-family: impact;\\">4.Muchira munene<br></span><span style=\\"font-weight: bold; font-size: xx-large; font-family: impact;\\">5.Mbuthia Moko<br></span><span style=\\"font-weight: bold; font-size: xx-large; font-family: impact;\\">6.Jeff Kioko<br></span><span style=\\"font-weight: bold; font-size: xx-large; font-family: impact;\\">7.Wamaitha<br></span><span style=\\"font-weight: bold; font-size: xx-large; font-family: impact;\\">8.Joy</span></h1><div><span style=\\"font-weight: bold;\\"><br></span></div><div><span style=\\"font-weight: bold;\\"><br></span></div><div><span style=\\"font-weight: bold;\\"><br></span></div><div><span style=\\"font-weight: bold;\\"><br></span></div><div><span style=\\"font-weight: bold;\\"><br></span></div><div><span style=\\"font-weight: bold;\\"><br></span></div><div><span style=\\"font-weight: bold;\\"><br></span></div><div><br></div>\\r\\n\t\t\t\t\t\t\t\t\t\t\\r\\n\t\t\t\t\t\t\t\t\t\t\\r\\n\t\t\t\t\t\t\t\t\t\t
11	FAQs	faqs	\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t<p style=\\"box-sizing: inherit; margin-bottom: 1rem; padding: 0px; line-height: 1.6; text-rendering: optimizelegibility; color: rgb(10, 10, 10); font-family: Lato, sans-serif; background-color: rgb(254, 254, 254);\\"><a href=\\"https://victrans.com/vehicle-warranty-covered-by-non-dealer-auto-shop/\\" style=\\"box-sizing: inherit; line-height: inherit; color: rgb(243, 130, 56); cursor: pointer; -webkit-tap-highlight-color: rgba(0, 0, 0, 0.3); font-weight: bold; font-size: large;\\">Do I need to take my vehicle to the dealer to be covered under warranty?</a></p><p style=\\"box-sizing: inherit; margin-bottom: 1rem; padding: 0px; line-height: 1.6; text-rendering: optimizelegibility; color: rgb(10, 10, 10); font-family: Lato, sans-serif; background-color: rgb(254, 254, 254);\\"><a href=\\"https://victrans.com/difference-between-regular-oil-and-eco-power-oil/\\" target=\\"_blank\\" rel=\\"noopener noreferrer\\" style=\\"box-sizing: inherit; line-height: inherit; color: rgb(243, 130, 56); cursor: pointer; -webkit-tap-highlight-color: rgba(0, 0, 0, 0.3); font-weight: bold; font-size: large;\\">???What is the difference between regular oil and your Eco Power oil?</a></p><p style=\\"box-sizing: inherit; margin-bottom: 1rem; padding: 0px; line-height: 1.6; text-rendering: optimizelegibility; color: rgb(10, 10, 10); font-family: Lato, sans-serif; background-color: rgb(254, 254, 254);\\"><a href=\\"https://victrans.com/how-often-do-i-need-an-oil-change-in-victoria-bc/\\" target=\\"_blank\\" rel=\\"noopener noreferrer\\" style=\\"box-sizing: inherit; line-height: inherit; color: rgb(243, 130, 56); cursor: pointer; -webkit-tap-highlight-color: rgba(0, 0, 0, 0.3); font-weight: bold; font-size: large;\\">???How often do I need an oil change????</a></p><p style=\\"box-sizing: inherit; margin-bottom: 1rem; padding: 0px; line-height: 1.6; text-rendering: optimizelegibility; color: rgb(10, 10, 10); font-family: Lato, sans-serif; background-color: rgb(254, 254, 254);\\"><a href=\\"https://victrans.com/can-i-drop-off-my-car-before-work/\\" target=\\"_blank\\" rel=\\"noopener noreferrer\\" style=\\"box-sizing: inherit; line-height: inherit; color: rgb(243, 130, 56); cursor: pointer; -webkit-tap-highlight-color: rgba(0, 0, 0, 0.3); font-weight: bold; font-size: large;\\">???Can I drop off my car before work????</a></p><p style=\\"box-sizing: inherit; margin-bottom: 1rem; padding: 0px; line-height: 1.6; text-rendering: optimizelegibility; color: rgb(10, 10, 10); font-family: Lato, sans-serif; background-color: rgb(254, 254, 254);\\"><a href=\\"https://victrans.com/fleet-maintenance-packages/\\" target=\\"_blank\\" rel=\\"noopener noreferrer\\" style=\\"box-sizing: inherit; line-height: inherit; color: rgb(243, 130, 56); cursor: pointer; -webkit-tap-highlight-color: rgba(0, 0, 0, 0.3); font-weight: bold; font-size: large;\\">???Do you offer fleet maintenance packages????</a></p><p style=\\"box-sizing: inherit; margin-bottom: 1rem; padding: 0px; line-height: 1.6; text-rendering: optimizelegibility; color: rgb(10, 10, 10); font-family: Lato, sans-serif; background-color: rgb(254, 254, 254);\\"><a href=\\"https://victrans.com/manual-and-automatic-transmissions-servicing-needs/\\" target=\\"_blank\\" rel=\\"noopener noreferrer\\" style=\\"box-sizing: inherit; line-height: inherit; color: rgb(243, 130, 56); cursor: pointer; -webkit-tap-highlight-color: rgba(0, 0, 0, 0.3); font-weight: bold; font-size: large;\\">???Do manual and automatic transmissions have different servicing needs????</a></p><p style=\\"box-sizing: inherit; margin-bottom: 1rem; padding: 0px; line-height: 1.6; text-rendering: optimizelegibility; color: rgb(10, 10, 10); font-family: Lato, sans-serif; background-color: rgb(254, 254, 254);\\"><a href=\\"https://victrans.com/how-many-kms-before-transmission-replacement/\\" target=\\"_blank\\" rel=\\"noopener noreferrer\\" style=\\"box-sizing: inherit; line-height: inherit; color: rgb(243, 130, 56); cursor: pointer; -webkit-tap-highlight-color: rgba(0, 0, 0, 0.3); font-weight: bold; font-size: large;\\">???How many kilometres can a transmission take before needing replacement????</a></p><p style=\\"box-sizing: inherit; margin-bottom: 1rem; padding: 0px; line-height: 1.6; text-rendering: optimizelegibility; color: rgb(10, 10, 10); font-family: Lato, sans-serif; background-color: rgb(254, 254, 254);\\"><a href=\\"https://victrans.com/what-is-the-biggest-problem-with-transmissions/\\" target=\\"_blank\\" rel=\\"noopener noreferrer\\" style=\\"box-sizing: inherit; line-height: inherit; color: rgb(243, 130, 56); cursor: pointer; -webkit-tap-highlight-color: rgba(0, 0, 0, 0.3); font-weight: bold; font-size: large;\\">???What is the biggest problem with transmissions????</a></p><p style=\\"box-sizing: inherit; margin-bottom: 1rem; padding: 0px; line-height: 1.6; text-rendering: optimizelegibility; color: rgb(10, 10, 10); font-family: Lato, sans-serif; background-color: rgb(254, 254, 254);\\"><a href=\\"https://victrans.com/transmission-fluid-flush-cost/\\" target=\\"_blank\\" rel=\\"noopener noreferrer\\" style=\\"box-sizing: inherit; line-height: inherit; color: rgb(243, 130, 56); cursor: pointer; -webkit-tap-highlight-color: rgba(0, 0, 0, 0.3); font-weight: bold; font-size: large;\\">???What would it cost to flush out my old transmission fluid and fill with new fluid????</a></p><p style=\\"box-sizing: inherit; margin-bottom: 1rem; padding: 0px; line-height: 1.6; text-rendering: optimizelegibility; color: rgb(10, 10, 10); font-family: Lato, sans-serif; background-color: rgb(254, 254, 254);\\"><a href=\\"https://victrans.com/how-often-should-i-replace-my-windshield-wiper-blades/\\" target=\\"_blank\\" rel=\\"noopener noreferrer\\" style=\\"box-sizing: inherit; line-height: inherit; color: rgb(20, 104, 160); cursor: pointer; outline-width: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0.3); font-weight: bold; font-size: large;\\">???How often should I replace my windshield wiper blades????</a></p><div><br></div>\\r\\n\t\t\t\t\t\t\t\t\t\t\\r\\n\t\t\t\t\t\t\t\t\t\t\\r\\n\t\t\t\t\t\t\t\t\t\t
\.


--
-- Data for Name: tblsubscribers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tblsubscribers (id, subscriberemail, postingdate) FROM stdin;
\.


--
-- Data for Name: tbltestimonial; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tbltestimonial (id, useremail, testimonial, postingdate, status) FROM stdin;
3	test@gmail.com	Provident eveniet 	2022-04-16 00:20:46	1
4	test@gmail.com	Ipsa dicta tenetur 	2022-04-16 00:28:20	1
5	sheikh@gmail.com	Tempora incididunt q	2022-04-16 07:21:12	1
6	ali@gmail.com	this is a good testimonial	2022-06-23 14:38:47	1
7	xijeq@mailinator.com	Ipsum est id nulla 	2022-06-25 14:59:53	1
8	evans@gmail.com	great cars 	2022-06-25 15:12:16	1
9	ali@gmail.com	Nice Cars lorem ipsum ...	2022-06-25 18:25:07	1
\.


--
-- Data for Name: tblusers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tblusers (id, fullname, emailid, password, contactno, dob, address, city, country, regdate, updationdate) FROM stdin;
15	Teenu	teenu@gmail.com	0f3d22587bcba63a3040e08f40568996	4804804800 	\N	\N	\N	\N	2020-01-01 00:00:01	2020-01-01 00:00:01
19	Customer	customer@gmail.com	202cb962ac59075b964b07152d234b70	48048048213					2020-01-01 00:00:01	2020-01-01 00:00:01
\.


--
-- Data for Name: tblvehicles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tblvehicles (id, vehiclestitle, vehiclesbrand, vehiclesoverview, priceperday, fueltype, modelyear, seatingcapacity, vimage1, vimage2, vimage3, vimage4, vimage5, airconditioner, powerdoorlocks, antilockbrakingsystem, brakeassist, powersteering, driverairbag, passengerairbag, powerwindows, cdplayer, centrallocking, crashsensor, leatherseats, regdate, updationdate) FROM stdin;
1	Aston Martin	9	The Aston Martin is a high-performance grand tourer based on the DB9 and manufactured by the British luxury automobile manufacturer Aston Martin. Aston Martin has used the DBS name once before on their 1967???72 grand tourer coup??.	1500	Petrol	2020	2	Aston Martin DB113.jpg	Aston Martin DB111.jpg	Aston Martin DB112.jpg	Aston Martin DB114.jpg	Aston Martin DB115.jpg	1	1	1	1	1	1	1	1	1	\N	1	1	2022-04-22 10:01:11	2022-06-25 18:39:38
3	 Flying Spur	10	Overview\\r\\nEven though its built from the ground up to pamper its passengers, the 2022 Bentley Flying Spur also has an athletic chassis to entertain the driver. A trio of engine choices???including a new plug-in hybrid???provide seemingly endless power, and its adept handling turns lazy weekend cruises into joyful driving experiences. The cabin delights the senses with high-end leathers, woods, and metal accents intermingled with modern-day technology and conveniences. The rear seat is particularly relaxing, especially when equipped with luxury features such as rear bucket seats, which offer power adjustments and heated armrests. However, the Flying Spurs unbeatable blend of luxury and performance comes with an eye-watering six-figure price tag, and thats before you start tacking on customization options from Bentleys Mulliner line of personalization features.\\r\\n\\r\\n	3000	Petrol	2022	4	Bentley Flying Spur1.jpg	Bentley Flying Spur2.jpg	Bentley Flying Spur3.jpg	Bentley Flying Spur4.jpg	Bentley Flying Spur5.jpg	1	1	1	1	1	1	1	1	1	1	1	1	2022-04-22 10:56:28	2022-06-25 19:02:09
4	 Aventador	8	The Lamborghini Aventador  is a mid-engine sportscar produced by the Italian automotive manufacturer Lamborghini. In keeping with Lamborghini tradition, the Aventador is named after a Spanish fighting bull that fought in Zaragoza, Aragon in 1993	3000	Petrol	2022	2	lamborgini aventador1.jpg	lamborgini aventador2.jpg	lamborgini aventador3.jpg	lamborgini aventador4.jpg	lamborgini aventador5.jpg	1	1	1	\N	1	1	1	1	1	1	1	1	2022-04-22 11:06:59	2022-06-25 18:40:05
5	Cadillac Escallade	11	The Cadillac Escalade is a full-size luxury SUV engineered and manufactured by General Motors. It was Cadillacs first major entry into the SUV market. The Escalade was introduced for the 1999 model year in response to competition from the Mercedes-Benz G-Class, Range Rover and Lexus LX as well as Fords 1998 release of the Lincoln Navigator. The Escalade project went into production only ten months after it was approved. The Escalade is built in Arlington, Texas. The word \\"escalade\\" refers to a siege warfare tactic of scaling defensive walls or ramparts with the aid of ladders or siege towers.\\r\\n\\r\\nThe Escalade is currently sold in North America and select international markets (Europe and Asia) where Cadillac has official sales channels.[1] The Escalade ESV (Escalade Stretch Vehicle) is sold in North America, Russia, and Middle East but is available by special order only in some international markets. The right-hand-drive Escalade and Escalade ESV are available through the third-party conversion specialists without official agreement with Cadillac in Australian, Oceanic, and Japanese markets.	2300	Diesel	2019	4	Cadillac Escallade.jpg	Cadillac Escallade0.jpg	Cadillac Escallade1.jpg	Cadillac Escallade2.jpg	Cadillac Escallade3.jpg	1	1	1	1	1	1	1	1	1	1	1	\N	2022-04-22 11:13:10	2022-06-25 18:40:11
6	GT-R	4	The GT-R is an entirely new model sharing little with the Skyline GT-R save its signature four round tail lights. Like some later generations of the Skyline GT-R, the GT-R has the ATTESA E-TS all-wheel drive system with a twin-turbocharged 6-cylinder engine. But the four-wheel-steering HICAS system has been removed and the former straight-6 RB26DETT engine has been replaced with a new VR38DETT V6 engine.[11] Because of the GT-Rs heritage, the chassis code for the all-new version has been called CBA-R35 and for later model years as DBA-R35 and 4BA-R35,[12] or R35 for short (where CBA, DBA and 4BA stands for the emissions standard prefix), carrying on the naming trend from previous Skyline GT-R generations.\\r\\n\\r\\nThe GT-R has also retained its Skyline predecessors nickname, Godzilla,[13] originally given to it by the Australian motoring publication Wheels in 1989 for its R32 generation model.	3000	Petrol	2020	4	GTR1.jpg	GTR2.jpg	GTR3.jpg	GTR4.jpg	GTR5.jpg	1	1	1	\N	1	1	1	1	\N	1	1	1	2022-04-22 11:22:07	2022-06-25 18:40:19
7	Porsche Cayenne	12	The Porsche Cayenne is a series of mid-size luxury crossover sport utility vehicles manufactured by the German automaker Porsche since 2002, with North American sales beginning in 2003. It is the first V8-engined vehicle built by Porsche since 1995, when the Porsche 928 was discontinued. It is also Porsches first off-road variant vehicle since its Super and Junior tractors of the 1950s, and the first Porsche with four doors.\\r\\n\\r\\nThe second-generation Cayenne (Type 92A) was unveiled at the 2010 Geneva Motor Show in March following an online reveal. The Cayenne shares its platform, body frame, doors and electronics with the similar Volkswagen Touareg and Audi Q7. The third generation received a facelift in 2014 with minor external changes, and introduced a new plug-in E-Hybrid version, with its public launch at the Paris Motor Show.[2] Since 2008, all engines have featured direct injection technology.	3000	Petrol	2022	4	Porshe Cayenen 1.jpg	Porshe Cayenen 3.jpg	Porshe Cayenen 5.jpg	Porshe Cayenen 4.jpg	Porshe cayenne 2.jpg	1	1	1	1	1	1	1	1	1	1	1	1	2022-04-22 11:52:59	2022-06-25 18:40:25
21	 Huracan	8	The Huracan EVO is the evolution of the most successful V10-powered Lamborghini ever. The result of fine-tuning and refining existing features	3500	Petrol	2020	2	Huracan2 (1).jpg	Huracan2 (2).jpg	Huracan2 (3).jpg	Huracan2 (4).jpg	Huracan2 (5).jpg	1	1	1	1	1	1	1	\N	1	1	1	1	2022-06-25 18:55:23	\N
22	Cayenne	1	The Porsche Cayenne is a series of mid-size luxury crossover sport utility vehicles manufactured by the German automaker Porsche since 2002 (Type 9PA), with North American sales beginning in 2003. It is the first V8-engined vehicle built by Porsche since 1995, when the Porsche 928 was discontinued. It is also Porsches first off-road variant vehicle since its Super and Junior tractors of the 1950s, and the first Porsche with four doors	3500	Petrol	2020	4	Porshe Cayenen 1.jpg	Porshe cayenne 2.jpg	Porshe Cayenen 3.jpg	Porshe Cayenen 5.jpg	Porshe Cayenen 4.jpg	1	1	1	1	1	1	1	1	1	1	1	1	2022-06-25 19:11:45	\N
23	model 3	16	Tesla All-Wheel Drive has two independent motors for improved redundancy, each with only one moving part for minimal maintenance and maximum durability. Unlike traditional all-wheel drive systems, they digitally control torque to the front and rear wheels for far better handling and traction control.	3500	electric	2017	4	TESLA MODEL 3 (1).jpg	TESLA MODEL 3 (2).jpg	TESLA MODEL 3 (3).jpg	TESLA MODEL 3 (4).jpg	TESLA MODEL 3 (5).jpg	1	1	1	1	\N	1	1	\N	1	1	1	1	2022-06-26 06:39:19	\N
24	1132	17	Onnix provides comfort and accessibility to some of Tempe's most famous hot spots, entertainment, and dining. Our community is close to Mill Avenue, Arizona State University, Tempe Town Lake, and Tempe Marketplace. Renting in Tempe, AZ provides endless options for your commute.	1750	2	2014	1	onnix1.jpeg	onnix2.jpeg	onnix3.jpeg	onnix4.jpeg		\N	\N	1	1	1	1	1	\N	\N	\N	\N	\N	2020-01-01 00:00:01	2020-01-01 00:00:01
25	1069	18	Welcome to Vertex Apartments! We are proud to offer a community that is customized for the needs and interests of students looking for off campus housing near ASU	2200	3	2018	3	vertex1.jpeg	vertex2.jpeg	vertex3.jpeg	vertex4.jpeg		1	1	1	1	1	1	1	1	1	1	1	1	2020-01-01 00:00:01	2020-01-01 00:00:01
26	431	19	IMT Desert Palm Village in Tempe is in an ideal location offering a retreat from life???s hectic pace. From one to three bedrooms, IMT Desert Palm Village offers a garden-like setting, with contemporary kitchens complete with a range of high-performing appliances	1565	1	2018	1	dpv1.jpeg	dpv2.jpeg	dpv3.jpeg	dpv4.jpeg		\N	1	1	\N	1	1	1	\N	\N	1	\N	\N	2020-01-01 00:00:01	2020-01-01 00:00:01
27	4564	20	Canvas is a community of possibility. This is a home for wellness, focus, energy, relaxation, and creativity. Our Tempe apartments are made for you to design the lifestyle you???ve always dreamed of???rooftop pool and podcast studio included.	2010	3	2021	2	canvas1.jpeg	canvas2.jpeg	canvas3.jpeg	canvas4.jpeg		1	1	1	1	1	1	1	1	1	\N	1	1	2020-01-01 00:00:01	2020-01-01 00:00:01
28	12	21	Gateway at Tempe offers one-, two-, three-, and four- bedroom apartments in the heart of Tempe, Arizona. Whether you're hosting a dinner for all of your friends or meeting your new neighbors down at the pool, your new home has it all.	1750	2	2017	3	gateway1.jpeg	gateway2.jpeg	gateway3.jpeg	gateway4.jpeg		1	1	1	1	1	1	1	1	1	\N	1	1	2020-01-01 00:00:01	2020-01-01 00:00:01
30	104	25	new apartment	1800	2	2021	2	p1.jpeg	p2.jpeg	p3.jpeg	p4.jpeg	p5.jpeg	\N	1	\N	\N	\N	1	\N	\N	\N	\N	\N	\N	2020-01-01 00:00:01	2020-01-01 00:00:01
31	104	26	new apartment	1700	2	2021	2	p1.jpeg	p2.jpeg	p3.jpeg	p4.jpeg	p5.jpeg	\N	\N	\N	\N	\N	1	1	\N	\N	\N	\N	\N	2020-01-01 00:00:01	2020-01-01 00:00:01
\.


--
-- Name: id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.id_seq', 1, true);


--
-- Name: id_seq1; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.id_seq1', 17, true);


--
-- Name: id_seq2; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.id_seq2', 26, true);


--
-- Name: id_seq3; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.id_seq3', 1, true);


--
-- Name: id_seq4; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.id_seq4', 5, true);


--
-- Name: id_seq5; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.id_seq5', 11, true);


--
-- Name: id_seq6; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.id_seq6', 19, true);


--
-- Name: id_seq7; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.id_seq7', 31, true);


--
-- Name: admin admin_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin
    ADD CONSTRAINT admin_pkey PRIMARY KEY (id);


--
-- Name: tblbooking tblbooking_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tblbooking
    ADD CONSTRAINT tblbooking_pkey PRIMARY KEY (id);


--
-- Name: tblbrands tblbrands_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tblbrands
    ADD CONSTRAINT tblbrands_pkey PRIMARY KEY (id);


--
-- Name: tblcontactusinfo tblcontactusinfo_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tblcontactusinfo
    ADD CONSTRAINT tblcontactusinfo_pkey PRIMARY KEY (id);


--
-- Name: tblcontactusquery tblcontactusquery_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tblcontactusquery
    ADD CONSTRAINT tblcontactusquery_pkey PRIMARY KEY (id);


--
-- Name: tblpages tblpages_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tblpages
    ADD CONSTRAINT tblpages_pkey PRIMARY KEY (id);


--
-- Name: tblsubscribers tblsubscribers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tblsubscribers
    ADD CONSTRAINT tblsubscribers_pkey PRIMARY KEY (id);


--
-- Name: tbltestimonial tbltestimonial_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tbltestimonial
    ADD CONSTRAINT tbltestimonial_pkey PRIMARY KEY (id);


--
-- Name: tblusers tblusers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tblusers
    ADD CONSTRAINT tblusers_pkey PRIMARY KEY (id);


--
-- Name: tblvehicles tblvehicles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tblvehicles
    ADD CONSTRAINT tblvehicles_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

