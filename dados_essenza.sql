--
-- PostgreSQL database dump
--

\restrict PbUnGvc60N2KYggzwXym2TEVPVNOfL3R50gDNfcFjNTPPPsRXNWEzJ0BdDU2hNW

-- Dumped from database version 16.13 (Ubuntu 16.13-0ubuntu0.24.04.1)
-- Dumped by pg_dump version 16.13 (Ubuntu 16.13-0ubuntu0.24.04.1)

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

--
-- Data for Name: Usuario; Type: TABLE DATA; Schema: public; Owner: essenza_user
--

COPY public."Usuario" (id, name, email, cpf, birth, password, "criadoEm", "resetExpires", "resetToken") FROM stdin;
5	Admin	admin@essenza.com	00000000000	1961-09-04 00:00:00	$2b$10$DKP6PbC/2cwQbPr4Qcd7wOASChasmHMnzo9EH7Z5tJNFk6PtwXTs6	2026-03-10 15:05:28.529	\N	\N
3	Pedro Faria	pedrofariagaldino@gmail.com	37979657888	2001-10-18 02:00:00	$2b$10$DfWwNSOPcGG5awNgN3n4IuEvcPMIP9WX/EWmLLXt2iLuMZtZwdWpG	2025-11-08 03:53:27.899	\N	\N
\.


--
-- Data for Name: Order; Type: TABLE DATA; Schema: public; Owner: essenza_user
--

COPY public."Order" (id, "userId", status, items, subtotal_cents, shipping_cents, total_cents, "paymentId", "paymentMethod", "shippingAddress", "shippingService", "shippingDays", "createdAt", "updatedAt") FROM stdin;
cmj7p4pbl0001sf1tcbd7suls	3	PENDING_PAYMENT	[{"name": "Vela Haste Canelada", "quantity": 1, "productId": "cmietjka60000sfoldqu6rx78", "variantId": null, "price_in_cents": 3000}]	3000	1861	4861	\N	credit_card	{"cep": "12244574", "city": "São José dos Campos", "phone": "12997763331", "state": "SP", "number": "54", "address": "Rua Pedro Synésio Vanzella", "lastName": "BELLI", "firstName": "LEONARDO", "complement": "", "neighborhood": "urbanova"}	PAC	6	2025-12-15 21:59:07.569	2025-12-15 21:59:07.569
cmj7p9rci0001sfk94tkz8qxf	3	PENDING_PAYMENT	[{"name": "Vela Haste Canelada", "quantity": 1, "productId": "cmietjka60000sfoldqu6rx78", "variantId": null, "price_in_cents": 3000}]	3000	1861	4861	\N	credit_card	{"cep": "12244574", "city": "São José dos Campos", "phone": "12997763331", "state": "SP", "number": "54", "address": "Rua Pedro Synésio Vanzella", "lastName": "BELLI", "firstName": "LEONARDO", "complement": "", "neighborhood": "urbanova"}	PAC	6	2025-12-15 22:03:03.474	2025-12-15 22:03:03.474
cmj7pk8460001sfzdd6qzm3nf	3	PENDING_PAYMENT	[{"name": "Vela Haste Canelada", "quantity": 1, "productId": "cmietjka60000sfoldqu6rx78", "variantId": null, "price_in_cents": 3000}]	3000	1861	4861	3050539883-32f8eb27-bbaf-431d-bc17-f286d8c4d8dc	credit_card	{"cep": "12244574", "city": "São José dos Campos", "phone": "12997763331", "state": "SP", "number": "54", "address": "Rua Pedro Synésio Vanzella", "lastName": "BELLI", "firstName": "LEONARDO", "complement": "", "neighborhood": "urbanova"}	PAC	6	2025-12-15 22:11:11.767	2025-12-15 22:11:12.455
cmj7q1a080001sfqhaio14hf0	3	PENDING_PAYMENT	[{"name": "Vela Haste Canelada", "quantity": 1, "productId": "cmietjka60000sfoldqu6rx78", "variantId": "cmietjkae0003sfol071my9zc", "price_in_cents": 3000}]	3000	1861	4861	3050539883-c005d712-9c18-4dba-8805-53742901e908	credit_card	{"cep": "12244574", "city": "São José dos Campos", "phone": "12997763331", "state": "SP", "number": "54", "address": "Rua Pedro Synésio Vanzella", "lastName": "BELLI", "firstName": "LEONARDO", "complement": "", "neighborhood": "urbanova"}	PAC	6	2025-12-15 22:24:27.368	2025-12-15 22:24:28.118
cmjcftwoq0001sfbq267kfj5f	3	PENDING_PAYMENT	[{"name": "Casa Porta Vela", "quantity": 1, "productId": "cmjce38mx0017sftapwl12w6s", "variantId": "cmjce38n2001csftaxfsua6pr", "variantLabel": "Verde", "price_in_cents": 4490}]	4490	1861	6351	\N	credit_card	{"cep": "12244574", "city": "São José dos Campos", "phone": "12997763331", "state": "SP", "number": "54", "address": "Rua Pedro Synésio Vanzella", "lastName": "BELLI", "firstName": "LEONARDO", "complement": "", "neighborhood": "urbanova"}	PAC	6	2025-12-19 05:37:38.233	2025-12-19 05:37:38.233
cmjcg0mdz0001sf291bw2skgz	3	PENDING_PAYMENT	[{"name": "Casa Porta Vela", "quantity": 1, "productId": "cmjce38mx0017sftapwl12w6s", "variantId": "cmjce38n2001csftaxfsua6pr", "variantLabel": "Verde", "price_in_cents": 4490}]	4490	1861	6351	\N	credit_card	{"cep": "12244574", "city": "São José dos Campos", "phone": "12997763331", "state": "SP", "number": "54", "address": "Rua Pedro Synésio Vanzella", "lastName": "BELLI", "firstName": "LEONARDO", "complement": "", "neighborhood": "urbanova"}	PAC	6	2025-12-19 05:42:51.479	2025-12-19 05:42:51.479
cmjcg2ox00003sf29wmhkf17r	3	PENDING_PAYMENT	[{"name": "Casa Porta Vela", "quantity": 1, "productId": "cmjce38mx0017sftapwl12w6s", "variantId": "cmjce38n2001csftaxfsua6pr", "variantLabel": "Verde", "price_in_cents": 4490}]	4490	1861	6351	\N	credit_card	{"cep": "12244574", "city": "São José dos Campos", "phone": "12997763331", "state": "SP", "number": "54", "address": "Rua Pedro Synésio Vanzella", "lastName": "BELLI", "firstName": "LEONARDO", "complement": "", "neighborhood": "urbanova"}	PAC	6	2025-12-19 05:44:28.067	2025-12-19 05:44:28.067
cmjcgddq60001sf28chpc7xep	3	PENDING_PAYMENT	[{"name": "Vela Floco de Neve Grande", "quantity": 1, "productId": "cmjceo9mz001zsfd9oh2f16cz", "variantId": "cmjceo9n40022sfd93846o2pm", "variantLabel": "Cereja e avelã", "price_in_cents": 4990}]	4990	1861	6851	3050539883-52859772-f16d-4ab4-9661-0956a3e544ae	credit_card	{"cep": "12244574", "city": "São José dos Campos", "phone": "12997763331", "state": "SP", "number": "54", "address": "Rua Pedro Synésio Vanzella", "lastName": "BELLI", "firstName": "LEONARDO", "complement": "", "neighborhood": "urbanova"}	PAC	6	2025-12-19 05:52:46.782	2025-12-19 05:52:47.867
cmjcgfmap0001sf92bbv5c2sf	3	PENDING_PAYMENT	[{"name": "Vela Pinnheiro de Natal Média", "quantity": 1, "productId": "cmjce38n7001fsftauv966p55", "variantId": "cmjce38nb001isftasw6rx0pb", "variantLabel": "Maça e canela", "price_in_cents": 5490}]	5490	1861	7351	3050539883-e08c5f6c-1eee-4b6a-9bd8-98600e2da4d7	credit_card	{"cep": "12244574", "city": "São José dos Campos", "phone": "12997763331", "state": "SP", "number": "54", "address": "Rua Pedro Synésio Vanzella", "lastName": "BELLI", "firstName": "LEONARDO", "complement": "", "neighborhood": "urbanova"}	PAC	6	2025-12-19 05:54:31.2	2025-12-19 05:54:32.406
cmjczsa8u0001sfqyjwoprkt9	3	PENDING_PAYMENT	[{"name": "Vela Rena Pequena", "quantity": 1, "productId": "cmjceo9ms001vsfd99iro4pa2", "variantId": "cmjceo9mw001ysfd9qrcr2e9l", "variantLabel": "Cereja e avelã", "price_in_cents": 2800}]	2800	1861	4661	3050539883-4484afd8-d24f-444f-8708-3b14f0141c2b	credit_card	{"cep": "12244574", "city": "São José dos Campos", "phone": "12997763331", "state": "SP", "number": "54", "address": "Rua Pedro Synésio Vanzella", "lastName": "BELLI", "firstName": "LEONARDO", "complement": "", "neighborhood": "urbanova"}	PAC	6	2025-12-19 14:56:14.814	2025-12-19 14:56:15.551
cmjczxa8i0003sfqyzf91h5rl	3	PENDING_PAYMENT	[{"name": "Casa Porta Vela", "quantity": 1, "productId": "cmjce38mx0017sftapwl12w6s", "variantId": "cmjce38n5001esftav8uapr7b", "variantLabel": "Vermelha", "price_in_cents": 4490}]	4490	2059	6549	3050539883-831efd2f-d801-488d-931f-1202784ca381	credit_card	{"cep": "12233002", "city": "São José dos Campos", "phone": "12997763331", "state": "SP", "number": "2750", "address": "av cidade l", "lastName": "Faria", "firstName": "Pedro", "complement": "22", "neighborhood": "bosque dos eucaliptos"}	SEDEX	2	2025-12-19 15:00:08.082	2025-12-19 15:00:08.849
cmjdg60pd0001sf73gfi63jes	3	PENDING_PAYMENT	[{"name": "Vela Haste Canelada", "quantity": 1, "productId": "cmietjka60000sfoldqu6rx78", "variantId": "cmietjkaj0005sfolofe1kmfh", "variantLabel": "Verde / Capim limão", "price_in_cents": 3000}]	3000	1861	4861	3050539883-dfda5b21-7f6d-4698-a7a7-2986cdd1e7cc	credit_card	{"cep": "12244574", "city": "São José dos Campos", "phone": "12997763331", "state": "SP", "number": "54", "address": "Rua Pedro Synésio Vanzella", "lastName": "BELLI", "firstName": "LEONARDO", "complement": "", "neighborhood": "urbanova"}	PAC	6	2025-12-19 22:34:49.489	2025-12-19 22:34:50.305
cmjhawz3e0001sf1lpx7cseof	3	PENDING_PAYMENT	[{"name": "Vela Pinnheiro de Natal Média", "quantity": 1, "productId": "cmjce38n7001fsftauv966p55", "variantId": "cmjce38nb001isftasw6rx0pb", "variantLabel": "Maça e canela", "price_in_cents": 5490}]	5490	1861	7351	3050539883-31e69e92-9ff4-422e-a20d-4443d67eea28	credit_card	{"cep": "12244574", "city": "São José dos Campos", "phone": "12997763331", "state": "SP", "number": "54", "address": "Rua Pedro Synésio Vanzella", "lastName": "BELLI", "firstName": "LEONARDO", "complement": "", "neighborhood": "urbanova"}	PAC	6	2025-12-22 15:18:54.122	2025-12-22 15:18:54.891
cmlci8hc40001sf1g5ldxxx53	3	PENDING_PAYMENT	[{"name": "Casa Porta Vela", "quantity": 1, "productId": "cmjce38mx0017sftapwl12w6s", "variantId": "cmjce38n2001csftaxfsua6pr", "variantLabel": "Verde", "price_in_cents": 4490}]	4490	1894	6384	3050539883-67ceb679-4010-4a64-8225-ff55eda4f47d	credit_card	{"cep": "12244574", "city": "São José dos Campos", "phone": "12997763331", "state": "SP", "number": "54", "address": "Rua Pedro Synésio Vanzella", "lastName": "BELLI", "firstName": "LEONARDO", "complement": "", "neighborhood": "urbanova"}	PAC	6	2026-02-07 16:04:22.084	2026-02-07 16:04:22.937
cmm5qg27a0001sfjbcs5ujq9o	3	PENDING_PAYMENT	[{"name": "Geleia de Banho", "quantity": 1, "productId": "cmm2ez86q0025sfkmr0ges9tj", "variantId": "cmm2ez86y002bsfkm4t18tk4d", "variantLabel": "Maracujá", "price_in_cents": 4500}]	4500	2095	6595	3050539883-09983fdb-1409-49ea-b3e5-50a8dc9c73b1	credit_card	{"cep": "12244574", "city": "São José dos Campos", "phone": "12997763331", "state": "SP", "number": "54", "address": "Rua Pedro Synésio Vanzella", "lastName": "BELLI", "firstName": "LEONARDO", "complement": "", "neighborhood": "urbanova"}	SEDEX	2	2026-02-28 02:59:31.749	2026-02-28 02:59:32.821
cmm5qqozt0003sfjbrd6de5vl	3	PENDING_PAYMENT	[{"name": "Geleia de Banho", "quantity": 1, "productId": "cmm2ez86q0025sfkmr0ges9tj", "variantId": "cmm2ez86y002bsfkm4t18tk4d", "variantLabel": "Maracujá", "price_in_cents": 4500}]	4500	2095	6595	3050539883-12c86561-a78c-4d80-bbe2-0b0bf8795e38	credit_card	{"cep": "12244574", "city": "São José dos Campos", "phone": "12997763331", "state": "SP", "number": "54", "address": "Rua Pedro Synésio Vanzella", "lastName": "BELLI", "firstName": "LEONARDO", "complement": "", "neighborhood": "urbanova"}	SEDEX	2	2026-02-28 03:07:47.849	2026-02-28 03:07:48.677
cmm5rbtko0005sfjb347vxtq5	3	PENDING_PAYMENT	[{"name": "Geleia de Banho", "quantity": 1, "productId": "cmm2ez86q0025sfkmr0ges9tj", "variantId": "cmm2ez86y002bsfkm4t18tk4d", "variantLabel": "Maracujá", "price_in_cents": 4500}]	4500	2095	6595	3050539883-5ba3cb40-8b9c-4a92-a844-c80660469664	credit_card	{"cep": "12244574", "city": "São José dos Campos", "phone": "12997763331", "state": "SP", "number": "54", "address": "Rua Pedro Synésio Vanzella", "lastName": "BELLI", "firstName": "LEONARDO", "complement": "", "neighborhood": "urbanova"}	SEDEX	2	2026-02-28 03:24:13.56	2026-02-28 03:24:14.399
cmm5rfqsf0007sfjbwl6jc8jv	3	PENDING_PAYMENT	[{"name": "Geleia de Banho", "quantity": 1, "productId": "cmm2ez86q0025sfkmr0ges9tj", "variantId": "cmm2ez86y002bsfkm4t18tk4d", "variantLabel": "Maracujá", "price_in_cents": 4500}]	4500	2095	6595	3050539883-33bd2422-9598-478b-86c9-4e2cecd94a81	credit_card	{"cep": "12244574", "city": "São José dos Campos", "phone": "12997763331", "state": "SP", "number": "54", "address": "Rua Pedro Synésio Vanzella", "lastName": "BELLI", "firstName": "LEONARDO", "complement": "", "neighborhood": "urbanova"}	SEDEX	2	2026-02-28 03:27:16.575	2026-02-28 03:27:17.455
cmm98ndl60001sfetbgvy2aor	3	PENDING_PAYMENT	[{"name": "Vela Haste Lisa", "quantity": 1, "productId": "cmietjkb3000gsfolmsufzd11", "variantId": "cmietjkbb000lsfolodz2o4s0", "variantLabel": "Verde / Capim limão", "price_in_cents": 2500}]	2500	2095	4595	3050539883-96053c1b-6e35-444e-96a6-7e83f95c7c3c	credit_card	{"cep": "12244574", "city": "São José dos Campos", "phone": "12997763331", "state": "SP", "number": "54", "address": "Rua Pedro Synésio Vanzella", "lastName": "BELLI", "firstName": "LEONARDO", "complement": "", "neighborhood": "urbanova"}	SEDEX	2	2026-03-02 13:52:24.714	2026-03-02 13:52:25.521
cmng3to5g0001sf31epmwkoe6	3	PENDING_PAYMENT	[{"name": "Castiçal Vilarejo", "quantity": 1, "productId": "cmlu2jajs0018sfzvudisz1ho", "variantId": "cmlu2jak5001csfzvxt305nzi", "variantLabel": "Bege", "price_in_cents": 8290}]	8290	2095	10385	3050539883-af73af72-2e45-4f8a-b531-288cec6fded3	credit_card	{"cep": "12244574", "city": "São José dos Campos", "phone": "12997763331", "state": "SP", "number": "54", "address": "Rua Pedro Synésio Vanzella", "lastName": "BELLI", "firstName": "LEONARDO", "complement": "", "neighborhood": "urbanova"}	SEDEX	2	2026-04-01 13:51:25.827	2026-04-01 13:51:26.667
\.


--
-- Data for Name: Product; Type: TABLE DATA; Schema: public; Owner: essenza_user
--

COPY public."Product" (id, name, slug, price_in_cents, description, category, active, "createdAt", "updatedAt", stock) FROM stdin;
cmjce38mx0017sftapwl12w6s	Casa Porta Vela	casa-porta-vela	4490	Porta vela produzido em material orgânico (5,5cm x 5cm x 7,5cm).	DECORACAO	t	2025-12-19 04:48:54.393	2026-03-30 15:20:31.744	3
cmml78zan000isf9dotx9ocwf	Pássaro Apoio p/ Celular	passaro-apoio-celular	3890	Porta celular ou porta cartão em formato de pássaro, produzido em material orgânico. Leve, resistente e com um toque aveludado. Adicione charme e praticidade ao seu dia a dia.	DECORACAO	t	2026-03-10 22:46:27.484	2026-03-30 15:46:51.272	4
cmml7oo00000msf9dckwncq5b	Castiçal Colmeia	castiçal-colmeia	4500	Castiçal em material orgânico. Componha a decoração com praticidade, sendo parceiro ideal para as velas haste encontradas no site.	DECORACAO	t	2026-03-10 22:58:39.343	2026-03-31 02:06:17.993	7
cmmmwefrz0007sfyj49aal1x6	Bandeja Decorativa Circular Bubble	bandeja-circular-bubble	3500	Bandeja Decorativa Circular produzida em material orgânico. Leve, resistente e com toque aveludado (13cm diâmetro).	DECORACAO	t	2026-03-12 03:18:18.696	2026-03-30 15:28:27.736	3
cmmnns4gu000isfyvrj7917m2	Ursinho Aromatizador	ursinho-aromatizador	3000	Ursinho aromatizador (5,5cm / 4,5cm) produzido em material orgânico, acompanha um frasco de mini home spray.	AROMATIZADORES	t	2026-03-12 16:04:46.878	2026-03-30 16:28:32.432	3
cmmtdrlxf000csfx1of2dbygs	Vela Pote	vela-pote	6000	Vela Aromática produzida com cera de coco e pavio de algodão, em potes de material orgânico também de fabricação própria.	VELAS	t	2026-03-16 16:11:03.747	2026-03-19 17:14:47.128	2
cmlzio07n001fsfr0om55h3ni	Vela de Massagem: Concha	vela-massagem-concha	6500	Vela produzida com cera de Carnaúba, manteiga de Manga e Karite e óleo de semente de uvas. Ao derreter se trasforma em um magnífico óleo hidratante totalmente absorvido pela pele sem te deixar lambuzada.	VELAS	t	2026-02-23 18:35:08.435	2026-03-31 01:43:55.673	7
cmlu2jajs0018sfzvudisz1ho	Castiçal Vilarejo	castical-vilarejo	8290	Porta vela produzido em material orgânico + uma vela haste canelada aromática produzida com cera de coco/palma e pavio de algodão; aroma da vela conforme disponibilade no estoque, acompanha um saquinho com pedriscos para composição (base: 14,5 cm de diâmetro, casinhas: 15cm x 4cm | 11,5cm x 3,5cm).	DECORACAO	t	2026-02-19 23:04:43.816	2026-03-31 02:07:47.062	3
cmml82i5a000rsf9dblttw0mc	Casinha Aromática	casinha-aromatica	3800	Charmosa casinha em material orgânico, acompanha um frasco de mini home spray.	AROMATIZADORES	t	2026-03-10 23:09:24.936	2026-03-30 15:29:57.952	9
cmmku0ftp0000sf1p6gn37c4o	Saboneteira	saboneteira	3990	Saboneteira produzida em material orgânico. Leve, resistente e com toque aveludado. Design exclusivo que proporciona rápida secagem do seu item de higiene (exemplos: sabonete em barra, shampoo/condicionador sólido). Medidas: 8cm - largura, 11,5cm - comprimento, 1,5 cm - altura, +-200g - peso.	DECORACAO	t	2026-03-10 16:35:54.012	2026-03-30 16:23:56.688	16
cmmtdboub0007sfx1234azv8k	Vela Buda	vela-buda	6500	Vela Aromática produzida com cera de coco e pavio de algodão, em potes de material orgânico também de fabricação própria em formato de buda.	VELAS	t	2026-03-16 15:58:41.003	2026-03-31 01:36:52.761	4
cmmmw7z370006sfyjpnpys5ql	Rechaud Aromatizador	rechaud-aromatizador	7500	Rechaud aromatizador em material orgânico com bandeja em metal para Óleos Essenciais e Wax Melts (base: 9,5cm diâmetro, altura: 9cm).	AROMATIZADORES	t	2026-03-12 03:13:17.141	2026-03-30 16:18:29.748	4
cmmnm37ue0002sfyvlbdezwto	Bandeja Decorativa Oval	bandeja-oval	3500	Bandeja decorativa oval produzida em material orgânico. Leve, resistente e com toque aveludado (18cm - comprimento, 9cm - largura).\nObs: a variante "Bege com mescla" possui em cores variadas conforme disponibilidade no estoque.	DECORACAO	t	2026-03-12 15:17:25.209	2026-03-30 15:28:16.027	11
cmm2ez86q0025sfkmr0ges9tj	Geleia de Banho	geleia-banho	5000	Sabonte liquido vegano 300ml, biodegradável, com sementes; Maracujá com sementes de Maracujá, Bergamota e Morango com sementes de Gergelim. Por conta da densidade do produto ele mantém as particulas em suspensão. Um toque de glamour e perfume no seu banho diário.	CORPO_BANHO	t	2026-02-25 19:15:12.051	2026-03-30 15:44:18.761	7
cmm15ql1i001ssfkg2qoual0z	Vela Estrela do Mar	vela-estrela-mar	6500	Vela Aromática produzida com cera de coco e pavio de algodão, em potes de material orgânico em cores diversas também de fabricação própria em formato de estrela do mar, levam elementos marinhos no topo.	VELAS	t	2026-02-24 22:08:46.087	2026-03-30 16:53:08.103	4
cmmmwhzjr000bsfyjo1575xc5	Bandeja Decorativa Circular	bandeja-circular	4000	Bandeja decorativa circular produzida em material orgânico. Leve, resistente e com toque aveludado (16cm diâmetro).	DECORACAO	t	2026-03-12 03:21:04.31	2026-03-30 15:27:46.98	3
cmietjkb3000gsfolmsufzd11	Vela Haste Lisa	vela-haste-lisa	2500	Vela Aromática produzida com cera de coco/palma e pavio de algodão (17cm comprimento e 2cm diâmetro).	VELAS	t	2025-11-25 16:57:20.272	2026-03-31 01:49:24.391	1
cmmnnkmje000fsfyvatpabjbp	Pendente Ninho do Amor	pendente-ninho-amor	4000	Casinha de pássaros (10,5cm / 8cm) produzida em material orgânico. Leve, resistente e com toque gentil, podendo ser utilizado como aromatizador bastando para isso adicionar o seu home spray ou óleo essencial preferido.\nAdicione mais aconchego ao seu lar!	DECORACAO	t	2026-03-12 15:58:57.05	2026-03-24 03:06:09.717	4
cmietjka60000sfoldqu6rx78	Vela Haste Canelada	vela-haste-canelada	3000	Vela Aromática produzida com cera de coco/palma e pavio de algodão (17cm comprimento e 2cm diâmetro).	VELAS	t	2025-11-25 16:57:20.238	2026-03-31 01:49:04.932	9
cmmmw10ay0000sfyjlrrlxiep	Vaso Decorativo	vaso-decorativo	4000	Vaso decorativo produzido em material orgânico. Acompanha folhagens típicas do cerrado brasileiro (base: 6,5cm diâmetro, altura: 9cm).	DECORACAO	t	2026-03-12 03:07:52.112	2026-03-30 16:29:50.647	7
cmietjkau000csfolp35ln6hy	Vela Nossa Senhora	vela-nossa-senhora	3000	Vela Aromática produzida com cera de coco/palma e pavio de algodão. Formato de Nossa Senhora. (10cm altura e 4,5cm largura)	VELAS	t	2025-11-25 16:57:20.263	2026-03-18 01:56:36.531	2
cmmtcowwb0000sfx1036wvn3r	Vela de Massagem: Pote	vela-massagem-pote	5500	Vela produzida com cera de Carnaúba, manteiga de Manga e Karite e óleo de semente de uvas. Ao derreter se trasforma em um magnífico óleo hidratante totalmente absorvido pela pele sem te deixar lambuzada.	VELAS	t	2026-03-16 15:40:58.364	2026-03-31 01:45:21.273	10
cmmti38mh000fsfx1ku0jqedi	Vela Pote Flor	vela-pote-flor	7000	Vela Aromática produzida com cera de coco e pavio de algodão, contém flor no topo da vela. Pote em material orgânico com flor na tampa, essa flor pode ser utilizada como aromatizador bastando para isso adicionar óleo essencial ou home spray.	VELAS	t	2026-03-16 18:12:04.809	2026-03-24 01:55:08.23	5
cmml3udqo0007sfucg6rk24a3	Vela Haste Ondulada	vela-haste-ondulada	3500	Vela Aromática produzida com cera de coco/palma e pavio de algodão (17cm comprimento e 2cm diâmetro).	VELAS	t	2026-03-10 21:11:07.517	2026-03-31 01:49:43.276	1
cmmtn5hdi0022sfx1ccz71zzn	Água para Lençol	agua-lençol	3290	Própria para tecidos, pode ser utilizada na roupa de cama e banho além de cortinas e almofadas.\nBorrife a uma distância de um metro mais ou menos depois de ter esticado os lençóis da cama, por 4 ou 5 vezes. E tenha um sonho de rainha. A sua composição fará com que vá aderindo as fibras do tecido. Deixe tudo com o seu aroma preferido. \nFrasco pet de 250 ml com bico vaporizador.	AROMATIZADORES	t	2026-03-16 20:33:47.557	2026-03-30 15:24:34.401	39
cmmtih4sl000jsfx1fitwbo4y	Vela Copo Florida	vela-copo-florida	7000	Vela Aromática produzida com cera de coco e pavio de algodão, contém flor no topo.\nCopo de vidro, tampa em madeira de reflorestamento com flor de material orgânico, que pode ser utilizada como aromatizador, bastando para isso adicionar óleo essencial ou home spray.	VELAS	t	2026-03-16 18:22:53.036	2026-03-31 01:38:28.509	9
cmmtjeelc000ssfx1kysapr4b	Wax Melts	wax-melts	4000	Wax Melts 50g; a maneira mais prática e eficiente para perfumar os ambientes.\nO seu desempemnho ocorre através de calor, seja utilizando rechaud com vela ou elétrico. Para perfumar o seu ambiente, basta ativar o seu rechaud, colocar um wax melts no compartimento superior e assim que ele derreter, começa a exalar o seu perfume e irá perfurmar até que o calor acabe.	AROMATIZADORES	t	2026-03-16 18:48:45.387	2026-03-31 02:22:34.288	17
cmmto0w4g0028sfx16l1k81dr	Difusor de Varetas	difusor-varetas	6500	Difusor produzido com álcool de cereias e fragâncias premium, acompanha kit de varetas que deverão ser viradas pelo menos duas vezes ao dia, garantindo assim aromatização e circulação do aroma escolhido, importante não diminuir o número das varetas para aromatização eficiente e durabilidade do produto. 	AROMATIZADORES	t	2026-03-16 20:58:13.005	2026-03-31 02:12:57.175	12
cmmtj1uc6000rsfx145vxaqyk	Sérum Facial	serum-facial	6500	Sérum elaborado com gel de linhaça dourada, óleo essencial de gerânio e lavanda, extrato de folha de oliva e óleo vegetal de rosa mosqueta.\nEle vai agir na camada mais profunda da sua pele. Deixando-a mais uniforme, macia, hidratada e amenizando rugas, além de eliminar manchas de sol. Tudo isso graças a sua composição.\nA recomendação de uso é pós banho, com a pele limpa e seca. Agite bem o frasco para que todas as propriedades interajam e com o conta gotas aplique na pele do rosto e colo. Ele será rapidamente absorvido dando um toque aveludado a sua pele.\nFrasco de vidro âmbar com conta gotas de 30ml. Dica extra: guarde na geladeria para potencializar o efeito refrescante e descongestionante!	CORPO_BANHO	t	2026-03-16 18:38:59.264	2026-03-31 02:00:28.9	0
cmmtms2gs001wsfx1rbyobmvz	Home Spray	home-spray	5500	O par perfeito para seu Difusor ou Água para Lençol. Aromatiza rapidamente qualquer ambiente, perfeito para aplicar em materiais porosos como madeira, pedras, etc.\nBasta algumas borrifadas para o aroma circular pelo local.\nProduzido com álcool de cereias e fragâncias premium.	AROMATIZADORES	t	2026-03-16 20:23:21.698	2026-03-31 02:14:21.187	15
cmmnmh2mm0008sfyveencayl1	Penca de Coração	penca-coraçao	3500	Penca de coração de material orgânico(3,5cm/3,5cm) podendo ser utilizado como aromatizador bastando para isso adicionar o seu home spray ou óleo essencial preferido.	DECORACAO	t	2026-03-12 15:28:11.637	2026-03-30 15:52:33.878	8
cmmtilsz9000psfx1ewuqyh86	Vela Copo Olho Grego	vela-copo-olho-grego	6500	Vela Aromática produzida com cera de coco e pavio de algodão.\nCopo de vidro com tampa em madeira de reflorestamento com adesivo olho grego. Aroma proporciona equilíbrio, frescor e sofisticação e uma dose extra de proteção.\nFamília Olfativa: floral/herbal. Notas Olfativas: Saída: Anis, Lima, Sálvia, Alecrim, Lavanda, Gálbano. Corpo: Rosa, Coentro, Gerânio, Patchouly, Gardênia, Lírio do Vale. Fundo: Musk, Tonka, Sândalo, Cedro Branco.\n	VELAS	t	2026-03-16 18:26:31.029	2026-03-31 01:41:30.562	3
cmmtk2b6g0010sfx1tkhvkiqt	Pingente Aromatizador Camafeu Anjo	pingente-aromatizador-camafeu-anjo	4800	Produzido em material orgânico. Decore e perfume seu ambiente. Acompanha mini home spray produzido com álcool de cereais e colorido com mica.	AROMATIZADORES	t	2026-03-16 19:07:20.701	2026-03-19 16:45:55.452	4
cmmtju124000wsfx12kxyc8t1	Pingente Aromatizador Hamsá	pingente-aromatizador-hamsa	3990	Pingente aromatizador Hamsá, também conhecido como "Mão de Fátima", símbolo de proteção, força, poder e sorte.\nProduzido em material orgânico, acompanha mini home spray produzido com álcool de cereais e colorido com mica.\nMantenha seus armários e closet sempre cheirosos.	AROMATIZADORES	t	2026-03-16 19:00:54.339	2026-03-19 16:52:44.885	4
cmmtl8jk7001gsfx1311ovsjy	Vela Pote Bomboniere	vela-pote-bomboniere	6000	Vela Aromática produzida com cera de coco e pavio de algodão, contém flor no topo da vela. Pote em material orgânico em formato de bomboniere.	VELAS	t	2026-03-16 19:40:11.143	2026-03-24 02:21:05.467	3
cmmtl3thr001csfx1lzwgplby	Pingente Aromatizador Divino Espírito Santo	pingente-aromatizador-divino-espirito-santo	3990	Produzido em material orgânico, acompanha mini home spray produzido com álcool de cereais e colorido com mica. Mantenha seus armários e closet sempre cheirosos.	AROMATIZADORES	t	2026-03-16 19:36:30.734	2026-03-29 00:48:39.43	4
cmmtkukqj0014sfx1ejngc5gm	Pingente Aromatizador Coração	pingente-aromatizador-coraçao	3990	Produzido em material orgânico, acompanha mini home spray produzido com álcool de cereais e colorido com mica. Mantenha seus armários e closet sempre cheirosos.	AROMATIZADORES	t	2026-03-16 19:29:19.482	2026-03-30 16:00:37.045	8
cmmtkzl7u0018sfx12c5q7sw9	Pingente Aromatizador Asas de Anjo	pingente-aromatizador-asas-anjo	3990	Produzido em material orgânico, acompanha mini home spray produzido com álcool de cereais e colorido com mica. Mantenha seus armários e closet sempre cheirosos.	AROMATIZADORES	t	2026-03-16 19:33:13.386	2026-03-30 16:00:55.95	15
cmn42aeoh0006sfmil4t9708u	Pastilha de Cera Aromatizadora Sicília	pastilha-cera-aromatizadora-sicilia	3800	Pastilha produzida com cera de coco e palma, com cordão para pendurar nos seus cabides ou closets, acompanha saquinho de algodão.\nTenha o seu aroma preferido dentro do seu armário, também versátil e de extremo bom gosto para presentear alguém especial.	AROMATIZADORES	t	2026-03-24 03:35:13.341	2026-03-31 02:16:49.762	2
cmmxm117y0000sffx8lzxnrnn	Pingente Aromatizador Premium	pingente-aromatizador-premium	3990	Produzido em material orgânico, acompanha mini home spray produzido com álcool de cereais e colorido com mica. Mantenha seus armários e closet sempre cheirosos.	AROMATIZADORES	t	2026-03-19 15:13:25.083	2026-03-30 16:00:08.342	2
cmn421xup0003sfmiloznf209	Pastilha de Cera Aromatizadora Malika	pastilha-cera-aromatizadora-malika	3200	Pastilha produzida com cera de coco e palma, com cordão para pendurar nos seus cabides ou closets, acompanha saquinho de algodão.\nTenha o seu aroma preferido dentro do seu armário, também versátil e de extremo bom gosto para presentear alguém especial.	AROMATIZADORES	t	2026-03-24 03:28:38.278	2026-03-31 02:18:24.386	10
cmmvciy2m0009sfb93f2k749b	Sabonete de Anil	sabonete-anil	2500	Sabonete produzido com glicerina, Anil Bleu D'Outremer, manteiga de Ucuuba e aroma exclusivo.\nUtilizado para neutralizar as energias das pessoas e ambientes, levando embora com a espuma do banho as energias negativas e a influência de baixas vibrações.\nUtiize sempre que sentir energia estagnada ou quando houver discussões, brigas e desentendimentos.\nRecomendação de uso: a cada 15 dias no banho de higiene, imagine descendo pelo ralo junto com a espuma do banho tudo aquilo que estagna e lhe entristece.\nFaça em seguida uma prece de agradecimento, segundo sua crença.	CORPO_BANHO	t	2026-03-18 01:11:52.318	2026-03-30 16:16:27.966	4
cmmvb31k80000sfb9z7rqq19w	Aromatizador Hamsá	aromatizador-hamsa	2990	Aromatizador Hamsá, também conhecido como "Mão de Fátima", símbolo de proteção, força, poder e sorte. Produzido em material orgânico, acompanha mini home spray produzido com álcool de cereais e colorido com mica. Mantenha seus armários e closet sempre cheirosos.	AROMATIZADORES	t	2026-03-18 00:31:30.711	2026-03-30 16:02:31.523	6
cmml2r67x0000sfuc2z41n9gl	Trio de Anjos	trio-anjos	5990	Item decorativo atemporal em formato de anjos com pendentes em corda de sisal, podendo ser utilizado como aromatizador de ambientes, bastando para isso, borrifar o seu home spray ou gotas do seu óleo essencial. Produzido em material orgânico. Leve, resistente e com um toque aveludado (Anjo grande: 12cm/7cm, anjo médio: 10,5cm/6cm, anjo menor: 8,5cm/5cm).	DECORACAO	t	2026-03-10 20:40:38.176	2026-03-31 02:10:30.303	8
cmmvbdhv90004sfb9hgie33k3	Aromatizador Peônia	aromatizador-peonia	2990	Produzido em material orgânico, acompanha mini home spray produzido com álcool de cereais e colorido com mica. Mantenha suas gavetas e ambientes sempre cheirosos.	AROMATIZADORES	t	2026-03-18 00:39:38.421	2026-03-30 15:25:46.316	2
cmmxo7cnn000osffxmkjskgs0	Pastilha de Cera Aromatizadora Boneco	pastilha-cera-aromatizadora-boneco	3800	Pastilha produzida com cera de coco e palma, acompanha saquinho de algodão.\nTenha o seu aroma preferido dentro do seu armário. Também versátil e de extremo bom gosto para presentear alguém especial.	AROMATIZADORES	t	2026-03-19 16:14:19.073	2026-03-31 02:15:20.017	2
cmn41rbvd0000sfmi9knsq6k7	Pastilha de Cera Aromatizadora Santorini	pastilha-cera-aromatizadora-santorini	3800	Pastilha produzida com cera de coco e palma, com cordão para pendurar nos seus cabides ou closets, acompanha saquinho de algodão.\nTenha o seu aroma preferido dentro do seu armário, também versátil e de extremo bom gosto para presentear alguém especial.	AROMATIZADORES	t	2026-03-24 03:20:23.239	2026-03-31 02:16:35.059	5
cmmtm2zrk001jsfx164kh9geq	Sabonete Artesanal Glicerinado	sabonete-glicerinado	1990	Sabonete produzido com glicerina, extratos, manteigas e oleos vegetais. Aquele básico que a gente não abre mão. Sabonetes artesanais glicerinados biodegradaveis com insumos apropriados para o ph da sua pele.\nA diferença e superioridade entre um poduto artesanal e um industrializado que você já conhece.\nNos sabonetes artesanais a glicerina gerada no processo de saponificação é utilizada na base do sabonete artesanal. Ela a glicerina é responsável pela hidratação da pele.\nNo processo industrial a glicerina é retirada e utilizada em outros produtos de beleza mas não no sabonete.\nJá no artesanal ela é 100% utilizada, retendo a água na pele, evitando sua perda e mantendo a suavidade, elasticidade  e maciez.	CORPO_BANHO	t	2026-03-16 20:03:51.804	2026-03-31 01:53:51.01	12
\.


--
-- Data for Name: ProductImage; Type: TABLE DATA; Schema: public; Owner: essenza_user
--

COPY public."ProductImage" (id, url, alt, "productId", "position") FROM stdin;
cmm9xvd190003sfh0qxyxwjss	https://cdn.essenzame.com.br/products/vela-haste-canelada/1.webp	Rosa	cmietjka60000sfoldqu6rx78	0
cmm9xvd190004sfh0ae3g74v3	https://cdn.essenzame.com.br/products/vela-haste-canelada/2.webp	Verde	cmietjka60000sfoldqu6rx78	1
cmm9xvd1y000hsfh0wbftcult	https://cdn.essenzame.com.br/products/vela-nossa-senhora/1.webp	Vela Nossa Senhora	cmietjkau000csfolp35ln6hy	0
cmm9xvd28000msfh0yzsy6dlr	https://cdn.essenzame.com.br/products/vela-haste-lisa/1.webp	Vela haste lisa rosa	cmietjkb3000gsfolmsufzd11	0
cmm9xvd3q0016sfh0ehfhq6ba	https://cdn.essenzame.com.br/products/casti%C3%A7al-vilarejo/1.webp	Castiçal vilarejo bege	cmlu2jajs0018sfzvudisz1ho	0
cmm9xvd60001rsfh0qyx5hqn4	https://cdn.essenzame.com.br/products/vela-estrela-mar/1.webp	Verde	cmm15ql1i001ssfkg2qoual0z	0
cmm9xvd60001ssfh0ufddt380	https://cdn.essenzame.com.br/products/vela-estrela-mar/2.webp	Branca	cmm15ql1i001ssfkg2qoual0z	1
cmm9xvd760024sfh0x8702enk	https://cdn.essenzame.com.br/products/geleia-banho/1.webp	Maracujá	cmm2ez86q0025sfkmr0ges9tj	0
cmm9xvd760025sfh0qe7f8nib	https://cdn.essenzame.com.br/products/geleia-banho/2.webp	Bergamóta	cmm2ez86q0025sfkmr0ges9tj	1
cmmku0ftp0001sf1p8prrb73n	https://cdn.essenzame.com.br/products/saboneteira/1.webp	Saboneteira Bege 1	cmmku0ftp0000sf1p6gn37c4o	0
cmmku0ftp0002sf1p8fshkzst	https://cdn.essenzame.com.br/products/saboneteira/2.webp	Saboneteira Bege 2	cmmku0ftp0000sf1p6gn37c4o	1
cmml2r67y0001sfucoe00my6e	https://cdn.essenzame.com.br/products/trio-anjos/1.webp	Trio castanho	cmml2r67x0000sfuc2z41n9gl	0
cmml2r67y0002sfucgwgx6ilg	https://cdn.essenzame.com.br/products/trio-anjos/2.webp	Trio branco/vermelho	cmml2r67x0000sfuc2z41n9gl	1
cmml2r67y0003sfucbs2r70ao	https://cdn.essenzame.com.br/products/trio-anjos/3.webp	Trio colorido	cmml2r67x0000sfuc2z41n9gl	2
cmml6g3q10001sf9dk6k9fuql	https://cdn.essenzame.com.br/products/vela-haste-ondulada/1.webp	Vela Haste Ondulada Verbena	cmml3udqo0007sfucg6rk24a3	0
cmml6ikto0005sf9dr226vqpo	https://cdn.essenzame.com.br/products/vela-haste-canelada/3.webp	Vela Haste Canelada Lavanda	cmietjka60000sfoldqu6rx78	2
cmml6kmtx0007sf9de5otgb1p	https://cdn.essenzame.com.br/products/saboneteira/3.webp	Saboneteira Mesclado	cmmku0ftp0000sf1p6gn37c4o	2
cmmmgeo450001sfvippnjwpxg	https://cdn.essenzame.com.br/products/casti%C3%A7al-colmeia/1.webp	Castiçal Colmeia Branco Mesclado	cmml7oo00000msf9dckwncq5b	0
cmmmgfyd20003sfvirm36b1c7	https://cdn.essenzame.com.br/products/casti%C3%A7al-colmeia/2.webp	Castiçal Colmeia Bege Mesclado	cmml7oo00000msf9dckwncq5b	1
cmmmh9viv0001sf94kjb5h3ud	https://cdn.essenzame.com.br/products/casa-porta-vela/1.webp	Casa porta vela branca	cmjce38mx0017sftapwl12w6s	0
cmmmhrbhl0005sf8d9y4qp3zg	https://cdn.essenzame.com.br/products/casinha-aromatica/1.webp	Casinha aromatica bege com verde	cmml82i5a000rsf9dblttw0mc	0
cmmmhs7yo0009sf8d1k0wdjdh	https://cdn.essenzame.com.br/products/casinha-aromatica/2.webp	Casinha aromatica bege com verde 2	cmml82i5a000rsf9dblttw0mc	1
cmmmwpynj000fsfyj9jutalqd	https://cdn.essenzame.com.br/products/casti%C3%A7al-vilarejo/2.webp	Castiçal vilarejo branco	cmlu2jajs0018sfzvudisz1ho	1
cmmmwy9na000hsfyjv01uu0yj	https://cdn.essenzame.com.br/products/bandeja-circular/1.webp	Bandeja circular girassol	cmmmwhzjr000bsfyjo1575xc5	0
cmmmx1r9w000jsfyjp2tty32u	https://cdn.essenzame.com.br/products/bandeja-circular-bubble/1.webp	Bandeja circular bubble rosa	cmmmwefrz0007sfyj49aal1x6	0
cmmmx26lm000lsfyjyh46wc34	https://cdn.essenzame.com.br/products/bandeja-circular-bubble/2.webp	Bandeja circular bubble azul	cmmmwefrz0007sfyj49aal1x6	1
cmmmx2ifp000nsfyjfdsefolt	https://cdn.essenzame.com.br/products/bandeja-circular-bubble/3.webp	Bandeja circular bubble rosé	cmmmwefrz0007sfyj49aal1x6	2
cmmmx6cvr000psfyjffpchbzq	https://cdn.essenzame.com.br/products/rechaud-aromatizador/1.webp	Rechaud aromatizador	cmmmw7z370006sfyjpnpys5ql	0
cmmmxg08y000rsfyjfmmmwda0	https://cdn.essenzame.com.br/products/vaso-decorativo/1.webp	Vaso decorativo marrom	cmmmw10ay0000sfyjlrrlxiep	0
cmmmxgmu5000vsfyjcycf47x8	https://cdn.essenzame.com.br/products/vaso-decorativo/2.webp	Vaso decorativo bege	cmmmw10ay0000sfyjlrrlxiep	1
cmmmxhsd5000xsfyjc8ukzuu8	https://cdn.essenzame.com.br/products/vaso-decorativo/3.webp	Vaso decorativo preto	cmmmw10ay0000sfyjlrrlxiep	2
cmmmxjbm0000zsfyjjmad6860	https://cdn.essenzame.com.br/products/vaso-decorativo/4.webp	Vaso decorativo branco com verde	cmmmw10ay0000sfyjlrrlxiep	3
cmmmxjoxv0011sfyjpd6tqb54	https://cdn.essenzame.com.br/products/vaso-decorativo/5.webp	Vaso decorativo branco com azul	cmmmw10ay0000sfyjlrrlxiep	4
cmmmxpqkl0013sfyj2gl8brko	https://cdn.essenzame.com.br/products/passaro-apoio-celular/1.webp	Passaro apoio celular branco mesclado	cmml78zan000isf9dotx9ocwf	0
cmmmxq4a50015sfyjimzlavw3	https://cdn.essenzame.com.br/products/passaro-apoio-celular/2.webp	Passaro apoio celular bege mesclado	cmml78zan000isf9dotx9ocwf	1
cmmmxqmyj0017sfyjamdo3wkd	https://cdn.essenzame.com.br/products/passaro-apoio-celular/3.webp	Passaro apoio celular rosé	cmml78zan000isf9dotx9ocwf	2
cmmmxr6hf0019sfyjzuwwfal6	https://cdn.essenzame.com.br/products/passaro-apoio-celular/4.webp	Passaro apoio celular 4	cmml78zan000isf9dotx9ocwf	3
cmmmxrj32001bsfyjxraen6bj	https://cdn.essenzame.com.br/products/passaro-apoio-celular/5.webp	Passaro apoio celular 5	cmml78zan000isf9dotx9ocwf	4
cmmnlb0j90001sfyvx5x5wbd9	https://cdn.essenzame.com.br/products/bandeja-circular/2.webp	Bandeja circular bege com verde	cmmmwhzjr000bsfyjo1575xc5	1
cmmnp1ng3000msfyvem98dv5t	https://cdn.essenzame.com.br/products/bandeja-oval/1.webp	Bandeja oval azul	cmmnm37ue0002sfyvlbdezwto	0
cmmnp23h3000osfyvgugjfofs	https://cdn.essenzame.com.br/products/bandeja-oval/2.webp	Bandeja oval marrom	cmmnm37ue0002sfyvlbdezwto	1
cmmnp2gd0000qsfyvei2ot568	https://cdn.essenzame.com.br/products/bandeja-oval/3.webp	Bandeja oval rosa	cmmnm37ue0002sfyvlbdezwto	2
cmmnp3bjj000usfyvztg2e9wc	https://cdn.essenzame.com.br/products/bandeja-oval/4.webp	Bandeja oval bege	cmmnm37ue0002sfyvlbdezwto	3
cmmnp3qge000wsfyvl2ykqv07	https://cdn.essenzame.com.br/products/bandeja-oval/5.webp	Bandeja oval bege com mescla	cmmnm37ue0002sfyvlbdezwto	4
cmmnp9ev6000ysfyvewfhabb9	https://cdn.essenzame.com.br/products/penca-cora%C3%A7ao/1.webp	Penca coração branco com azul	cmmnmh2mm0008sfyveencayl1	0
cmmnpa2q70010sfyv1byw5bb4	https://cdn.essenzame.com.br/products/penca-cora%C3%A7ao/2.webp	Penca coração branco	cmmnmh2mm0008sfyveencayl1	1
cmmnpanot0012sfyvmyu7i662	https://cdn.essenzame.com.br/products/penca-cora%C3%A7ao/3.webp	Penca coração areia com rosé	cmmnmh2mm0008sfyveencayl1	2
cmmnpbfix0014sfyvxjhavjab	https://cdn.essenzame.com.br/products/penca-cora%C3%A7ao/4.webp	Penca coração areia com branco	cmmnmh2mm0008sfyveencayl1	3
cmmnpbvgs0016sfyv9h9gjsmt	https://cdn.essenzame.com.br/products/penca-cora%C3%A7ao/5.webp	Penca coração areia	cmmnmh2mm0008sfyveencayl1	4
cmmo56jea0018sfyvyp0oepg4	https://cdn.essenzame.com.br/products/casti%C3%A7al-colmeia/3.webp	Castiçal colmeia verde	cmml7oo00000msf9dckwncq5b	2
cmmo5bivg001csfyvb92dk3xs	https://cdn.essenzame.com.br/products/casa-porta-vela/2.webp	Casa porta vela branca 2	cmjce38mx0017sftapwl12w6s	1
cmmo5iiqd001esfyv6nj61x56	https://cdn.essenzame.com.br/products/pendente-ninho-amor/1.webp	Pendente ninho amor areia mesclada	cmmnnkmje000fsfyvatpabjbp	0
cmmo5nohi001isfyvzbcc93ah	https://cdn.essenzame.com.br/products/ursinho-aromatizador/1.webp	Ursinho aromatizador branco	cmmnns4gu000isfyvrj7917m2	0
cmmo5obza001ksfyvizia2ozd	https://cdn.essenzame.com.br/products/ursinho-aromatizador/2.webp	Ursinho aromatizador bege	cmmnns4gu000isfyvrj7917m2	1
cmmxmxfvs0005sffxrwcp11ca	https://cdn.essenzame.com.br/products/vela-copo-olho-grego/1.webp	Vela copo olho grego	cmmtilsz9000psfx1ewuqyh86	0
cmmxn7n9o0007sffxu92hng6k	https://cdn.essenzame.com.br/products/vela-buda/1.webp	Vela buda branco	cmmtdboub0007sfx1234azv8k	0
cmmxn89x50009sffxlx7cw7i5	https://cdn.essenzame.com.br/products/vela-buda/2.webp	Vela buda preto	cmmtdboub0007sfx1234azv8k	1
cmmxn8rgj000bsffxnke1q4ia	https://cdn.essenzame.com.br/products/vela-buda/3.webp	Vela buda bege	cmmtdboub0007sfx1234azv8k	2
cmmxnccq6000fsffxtrxpg9hj	https://cdn.essenzame.com.br/products/aromatizador-hamsa/1.webp	Aromatizador hamsa	cmmvb31k80000sfb9z7rqq19w	0
cmmxnfxqr000hsffxu6g5b36o	https://cdn.essenzame.com.br/products/aromatizador-peonia/1.webp	Aromatizador peonia	cmmvbdhv90004sfb9hgie33k3	0
cmmxni6it000jsffxkr64pqkz	https://cdn.essenzame.com.br/products/pingente-aromatizador-asas-anjo/1.webp	Pingente aromatizador asas de anjo	cmmtkzl7u0018sfx12c5q7sw9	0
cmmxnmred000lsffxmnew9jto	https://cdn.essenzame.com.br/products/pingente-aromatizador-divino-espirito-santo/1.webp	Pingente aromatizador divino espirito santo	cmmtl3thr001csfx1lzwgplby	0
cmmxo7cnn000psffxdqadrnuo	https://cdn.essenzame.com.br/products/pastilha-cera-aromatizadora-boneco/1.webp	Pastilha cera aromatizadora boneco	cmmxo7cnn000osffxmkjskgs0	0
cmmxojmju000zsffx7zdgdu6d	https://cdn.essenzame.com.br/products/serum-facial/1.webp	Serum facial	cmmtj1uc6000rsfx145vxaqyk	0
cmmxp7eyy0011sffx4g4g1eg4	https://cdn.essenzame.com.br/products/pingente-aromatizador-premium/1.webp	Pingente aromatizador premium	cmmxm117y0000sffx8lzxnrnn	0
cmmxpb2ar0013sffxtly8mheh	https://cdn.essenzame.com.br/products/pingente-aromatizador-camafeu-anjo/1.webp	Pingente aromatizador camafeu anjo	cmmtk2b6g0010sfx1tkhvkiqt	0
cmmxpbot60015sffxmdt8sjvj	https://cdn.essenzame.com.br/products/pingente-aromatizador-camafeu-anjo/2.webp	Pingente aromatizador camafeu anjo	cmmtk2b6g0010sfx1tkhvkiqt	1
cmmxpg7ry0017sffxw39gzrg1	https://cdn.essenzame.com.br/products/pingente-aromatizador-cora%C3%A7ao/1.webp	Pingente aromatizador coração	cmmtkukqj0014sfx1ejngc5gm	0
cmmxpgumz0019sffx68w8ilwg	https://cdn.essenzame.com.br/products/pingente-aromatizador-cora%C3%A7ao/2.webp	Pingente aromatizador coração 2	cmmtkukqj0014sfx1ejngc5gm	1
cmmxpk6da001bsffxo4sz7faq	https://cdn.essenzame.com.br/products/pingente-aromatizador-hamsa/1.webp	Pingente aromatizador hamsa	cmmtju124000wsfx12kxyc8t1	0
cmmxpkkmz001dsffx91z9hhm7	https://cdn.essenzame.com.br/products/pingente-aromatizador-hamsa/2.webp	Pingente aromatizador hamsa 2	cmmtju124000wsfx12kxyc8t1	1
cmmxps3ak001fsffxyl3aqbho	https://cdn.essenzame.com.br/products/vela-copo-florida/1.webp	Vela copo florida verbena	cmmtih4sl000jsfx1fitwbo4y	0
cmmxpstex001hsffxfyins2qb	https://cdn.essenzame.com.br/products/vela-copo-florida/2.webp	Vela Copo Florida Flor de Cerejeira	cmmtih4sl000jsfx1fitwbo4y	1
cmmxptp2s001jsffxjx07swsg	https://cdn.essenzame.com.br/products/vela-copo-florida/3.webp	Vela Copo Florida Camomila	cmmtih4sl000jsfx1fitwbo4y	2
cmmxpuyyf001lsffxnvbglzqb	https://cdn.essenzame.com.br/products/vela-copo-florida/4.webp	Vela Copo FLorida Capim Limão e Bamboo	cmmtih4sl000jsfx1fitwbo4y	3
cmmxqch8h001nsffx2kdgq5an	https://cdn.essenzame.com.br/products/vela-pote/1.webp	Vela Pote Capim Limão	cmmtdrlxf000csfx1of2dbygs	0
cmmxqd1hb001psffx9sxu0y81	https://cdn.essenzame.com.br/products/vela-pote/2.webp	Vela Pote Lavanda e Alecrim	cmmtdrlxf000csfx1of2dbygs	1
cmmxwyi6e0001sf9lc175rmpj	https://cdn.essenzame.com.br/products/vela-massagem-pote/1.webp	Vela Massagem Pote Rosa	cmmtcowwb0000sfx1036wvn3r	0
cmmxwywlc0003sf9lp0qyu7d6	https://cdn.essenzame.com.br/products/vela-massagem-pote/2.webp	Vela Massagem Pote Marrom	cmmtcowwb0000sfx1036wvn3r	1
cmmxwzc7k0005sf9l47szj6fh	https://cdn.essenzame.com.br/products/vela-massagem-pote/3.webp	Vela Massagem Pote Azul	cmmtcowwb0000sfx1036wvn3r	2
cmmxx019z0007sf9lgw5nv6sb	https://cdn.essenzame.com.br/products/vela-massagem-pote/4.webp	Vela Massagem Pote Bege	cmmtcowwb0000sfx1036wvn3r	3
cmmxx0g5n0009sf9l7szlio3x	https://cdn.essenzame.com.br/products/vela-massagem-pote/5.webp	Vela Massagem Pote Verde	cmmtcowwb0000sfx1036wvn3r	4
cmmxx0xdq000bsf9ln3g9i4jv	https://cdn.essenzame.com.br/products/vela-massagem-pote/6.webp	Vela Massagem Pote Mesclado	cmmtcowwb0000sfx1036wvn3r	5
cmn3yn5ih0001sf5f3ivsf49n	https://cdn.essenzame.com.br/products/vela-pote-flor/1.webp	Vela Pote Flor Flor de Figo	cmmti38mh000fsfx1ku0jqedi	0
cmn3yo5bm0003sf5f991fccbw	https://cdn.essenzame.com.br/products/vela-pote-flor/2.webp	Vela Pote Flor Camomila	cmmti38mh000fsfx1ku0jqedi	1
cmn3yoxs30005sf5fz9jdd32r	https://cdn.essenzame.com.br/products/vela-pote-flor/3.webp	Vela Pote Flor Verbena e Bergamota	cmmti38mh000fsfx1ku0jqedi	2
cmn3ypmmi0007sf5fqweccyvh	https://cdn.essenzame.com.br/products/vela-pote-flor/4.webp	Vela Pote Flor Black Vanilla	cmmti38mh000fsfx1ku0jqedi	3
cmn3z4z9c0009sf5fffkfhkcu	https://cdn.essenzame.com.br/products/saboneteira/4.webp	Saboneteira Azul	cmmku0ftp0000sf1p6gn37c4o	3
cmn3z5ka5000bsf5fhet9u8zc	https://cdn.essenzame.com.br/products/saboneteira/5.webp	Saboneteira Verde	cmmku0ftp0000sf1p6gn37c4o	4
cmn3z6d43000dsf5f9ixi87le	https://cdn.essenzame.com.br/products/saboneteira/6.webp	Saboneteira rosé	cmmku0ftp0000sf1p6gn37c4o	5
cmn3z6uw8000fsf5ffyyh4ezt	https://cdn.essenzame.com.br/products/saboneteira/7.webp	Saboneteira Mostarda	cmmku0ftp0000sf1p6gn37c4o	6
cmn3zc4gb000hsf5f3vzyyvmz	https://cdn.essenzame.com.br/products/geleia-banho/3.webp	Morango	cmm2ez86q0025sfkmr0ges9tj	2
cmn3zm01m000jsf5fft8kd7ti	https://cdn.essenzame.com.br/products/vela-pote-bomboniere/1.webp	Vela Pote Bomboniere Rosa	cmmtl8jk7001gsfx1311ovsjy	0
cmn3zmnk1000lsf5fe8n3qxr7	https://cdn.essenzame.com.br/products/vela-pote-bomboniere/2.webp	Vela Pote Bomboniere Bege	cmmtl8jk7001gsfx1311ovsjy	1
cmn40kt0p000nsf5foajyyfk4	https://cdn.essenzame.com.br/products/vela-massagem-concha/1.webp	Vela Massagem Concha Verde	cmlzio07n001fsfr0om55h3ni	0
cmn40milg000psf5fzh2vl9jj	https://cdn.essenzame.com.br/products/vela-massagem-concha/2.webp	Vela Massagem Concha Azul	cmlzio07n001fsfr0om55h3ni	1
cmn40ny5i000rsf5ftxupy7cc	https://cdn.essenzame.com.br/products/vela-massagem-concha/3.webp	Vela Massagem Concha Bege	cmlzio07n001fsfr0om55h3ni	2
cmn40onf3000tsf5f53zpyxuq	https://cdn.essenzame.com.br/products/vela-massagem-concha/4.webp	Vela Massagem Concha Branca	cmlzio07n001fsfr0om55h3ni	3
cmn40stz0000vsf5f27s4sxei	https://cdn.essenzame.com.br/products/vela-haste-canelada/4.webp	Vela Haste Canelada Areia	cmietjka60000sfoldqu6rx78	3
cmn410wjn000xsf5fmyuwe1h8	https://cdn.essenzame.com.br/products/vela-estrela-mar/3.webp	Azul	cmm15ql1i001ssfkg2qoual0z	2
cmn411d3x000zsf5fzhec1ufm	https://cdn.essenzame.com.br/products/vela-estrela-mar/4.webp	Bege	cmm15ql1i001ssfkg2qoual0z	3
cmn418bao0013sf5fskv6et7x	https://cdn.essenzame.com.br/products/pendente-ninho-amor/2.webp	Pendente ninho amor verde mesclada	cmmnnkmje000fsfyvatpabjbp	1
cmn418y0l0015sf5fcdr3ozls	https://cdn.essenzame.com.br/products/pendente-ninho-amor/3.webp	Pendente ninho amor branco	cmmnnkmje000fsfyvatpabjbp	2
cmn41rbvd0001sfmi998yi8tz	https://cdn.essenzame.com.br/products/pastilha-cera-aromatizadora-santorini/1.webp	Pastilha Cera Aromarizadora Santorini	cmn41rbvd0000sfmi9knsq6k7	0
cmn421xup0004sfmi8h2jblwz	https://cdn.essenzame.com.br/products/pastilha-cera-aromatizadora-malika/1.webp	Pastilha Cera Aromatizadora Malika	cmn421xup0003sfmiloznf209	0
cmn42aeoh0007sfmixmvbvamp	https://cdn.essenzame.com.br/products/pastilha-cera-aromatizadora-sicilia/1.webp	Pastilha Cera Aromatizadora Sicilia	cmn42aeoh0006sfmil4t9708u	0
cmn42gwf3000asfmilsx3jp5y	https://cdn.essenzame.com.br/products/casinha-aromatica/3.webp	Casinha aromatica Tons Terrosos	cmml82i5a000rsf9dblttw0mc	2
cmn42hmsx000csfmitcf6coo4	https://cdn.essenzame.com.br/products/casinha-aromatica/4.webp	Casinha Aromatica Rosé	cmml82i5a000rsf9dblttw0mc	3
cmn42i5yg000esfmicge2mls5	https://cdn.essenzame.com.br/products/casinha-aromatica/5.webp	Casinha Aromatica Branca	cmml82i5a000rsf9dblttw0mc	4
cmn7jpcyw0001sfl4s5wfsv66	https://cdn.essenzame.com.br/products/agua-len%C3%A7ol/1.webp	Agua para lençol	cmmtn5hdi0022sfx1ccz71zzn	0
cmn7jst3b0003sfl46q8yiq8j	https://cdn.essenzame.com.br/products/difusor-varetas/1.webp	Difusor de Varetas	cmmto0w4g0028sfx16l1k81dr	0
cmn7ju7vm0005sfl4ybmgubd0	https://cdn.essenzame.com.br/products/home-spray/1.webp	Home Spray	cmmtms2gs001wsfx1rbyobmvz	0
cmn7m10yf0009sfl4qr3d0asj	https://cdn.essenzame.com.br/products/wax-melts/1.webp	Wax Melts Maçã e Canela	cmmtjeelc000ssfx1kysapr4b	0
cmn7m1lfe000bsfl4ojyrkoaw	https://cdn.essenzame.com.br/products/wax-melts/2.webp	Wax Melts Flor de Laranjeira	cmmtjeelc000ssfx1kysapr4b	1
cmn7m238r000dsfl4g6usy2ab	https://cdn.essenzame.com.br/products/wax-melts/3.webp	Wax Melts Limão	cmmtjeelc000ssfx1kysapr4b	2
cmn7m2scc000fsfl4rgt5nc63	https://cdn.essenzame.com.br/products/wax-melts/4.webp	Wax Melts Amora Negra	cmmtjeelc000ssfx1kysapr4b	3
cmn7m39sm000hsfl44955doay	https://cdn.essenzame.com.br/products/wax-melts/5.webp	Wax Melts Pimenta Rosa	cmmtjeelc000ssfx1kysapr4b	4
cmn7m3q5l000jsfl4wtsidzyu	https://cdn.essenzame.com.br/products/wax-melts/6.webp	Wax Melts Lavanda	cmmtjeelc000ssfx1kysapr4b	5
cmn7m4jrt000lsfl4ow6sc4xh	https://cdn.essenzame.com.br/products/wax-melts/7.webp	Wax Melts Chá Branco	cmmtjeelc000ssfx1kysapr4b	6
cmn7mn280000psfl4ob27jaxe	https://cdn.essenzame.com.br/products/vela-copo-florida/5.webp	Vela Copo Florida Lavanda	cmmtih4sl000jsfx1fitwbo4y	4
cmn7mnx0k000rsfl4djlnazjd	https://cdn.essenzame.com.br/products/vela-copo-florida/6.webp	Vela Copo Florida Flor de Figo	cmmtih4sl000jsfx1fitwbo4y	5
cmn7mraql000tsfl4m5xqoygl	https://cdn.essenzame.com.br/products/wax-melts/8.webp	Wax Melts	cmmtjeelc000ssfx1kysapr4b	7
cmn7nwx0s000vsfl4f4d61of6	https://cdn.essenzame.com.br/products/sabonete-anil/1.webp	Sabonete de Anil Iemanjá	cmmvciy2m0009sfb93f2k749b	0
cmn7nxham000xsfl4fuyawnrd	https://cdn.essenzame.com.br/products/sabonete-anil/2.webp	Sabonete de Anil Liso	cmmvciy2m0009sfb93f2k749b	1
cmn7ol883000zsfl4ng4xgkhz	https://cdn.essenzame.com.br/products/sabonete-glicerinado/1.webp	Sabonete Glicerinado Frutas Vermelhas	cmmtm2zrk001jsfx164kh9geq	0
cmn7olsv10011sfl47bijz8xp	https://cdn.essenzame.com.br/products/sabonete-glicerinado/2.webp	Sabonete Glicerinado Capim Limão	cmmtm2zrk001jsfx164kh9geq	1
cmn7ombby0013sfl4wwf3psja	https://cdn.essenzame.com.br/products/sabonete-glicerinado/3.webp	Sabonete Glicerinado Maracujá	cmmtm2zrk001jsfx164kh9geq	2
cmn7omqtk0015sfl4pu28p1t5	https://cdn.essenzame.com.br/products/sabonete-glicerinado/4.webp	Sabonete Glicerinado Lavanda	cmmtm2zrk001jsfx164kh9geq	3
cmn7onjc80017sfl4j5ic4p25	https://cdn.essenzame.com.br/products/sabonete-glicerinado/5.webp	Sabonetes Glicerinados	cmmtm2zrk001jsfx164kh9geq	4
cmndy54m80001sfljogxv2b3j	https://cdn.essenzame.com.br/products/vela-buda/4.webp	Vela buda verde	cmmtdboub0007sfx1234azv8k	3
cmndz6x270003sflj7v3hts5o	https://cdn.essenzame.com.br/products/casti%C3%A7al-colmeia/4.webp	Castiçal colmeia off-white	cmml7oo00000msf9dckwncq5b	3
\.


--
-- Data for Name: ProductVariant; Type: TABLE DATA; Schema: public; Owner: essenza_user
--

COPY public."ProductVariant" (id, "productId", label, aroma, color, active, "createdAt", "updatedAt", stock) FROM stdin;
cmm2ez86y002bsfkm4t18tk4d	cmm2ez86q0025sfkmr0ges9tj	Maracujá	Maracujá	\N	t	2026-02-25 19:15:12.059	2026-03-30 15:44:18.735	2
cmm2ez872002dsfkmip5wa3d9	cmm2ez86q0025sfkmr0ges9tj	Bergamóta	Bergamóta	\N	t	2026-02-25 19:15:12.062	2026-03-30 15:44:18.735	3
cmmku0ftp0005sf1pir73lezt	cmmku0ftp0000sf1p6gn37c4o	Azul		Azul	t	2026-03-10 16:35:54.012	2026-03-30 16:23:56.649	2
cmmku0ftp0003sf1pj11uetmj	cmmku0ftp0000sf1p6gn37c4o	Bege		Bege	t	2026-03-10 16:35:54.012	2026-03-30 16:23:56.649	1
cmm2ez876002fsfkm8srw9277	cmm2ez86q0025sfkmr0ges9tj	Morango	Morango	\N	t	2026-02-25 19:15:12.066	2026-03-30 15:44:18.735	2
cmml78zan000jsf9dgbdzcnzp	cmml78zan000isf9dotx9ocwf	Branco mesclado		branco com verde	t	2026-03-10 22:46:27.484	2026-03-30 15:46:51.266	1
cmml78zan000ksf9d3h7k5mqw	cmml78zan000isf9dotx9ocwf	Rosé		branco com rosé	t	2026-03-10 22:46:27.484	2026-03-30 15:46:51.266	1
cmml2r67y0004sfuchcyc85wa	cmml2r67x0000sfuc2z41n9gl	Castanho		Castanho	t	2026-03-10 20:40:38.176	2026-03-31 02:10:30.299	2
cmml2r67y0005sfucq74okr3j	cmml2r67x0000sfuc2z41n9gl	Branco/vermelho		Branco/vermelho	t	2026-03-10 20:40:38.176	2026-03-31 02:10:30.299	3
cmml78zan000lsf9dq7xi7v0h	cmml78zan000isf9dotx9ocwf	Bege mesclado		bege com verde	t	2026-03-10 22:46:27.484	2026-03-30 15:46:51.266	2
cmml7oo00000nsf9do9vfft6i	cmml7oo00000msf9dckwncq5b	Verde		verde	t	2026-03-10 22:58:39.343	2026-03-31 02:06:17.958	2
cmml7oo00000qsf9dvws0lbsd	cmml7oo00000msf9dckwncq5b	Branco mesclado		branco	t	2026-03-10 22:58:39.343	2026-03-31 02:06:17.958	2
cmlzio07z001nsfr00dplxp4k	cmlzio07n001fsfr0om55h3ni	Lavanda com capim limão / Mostarda	Lavanda com capim limão	Mostarda	t	2026-02-23 18:35:08.447	2026-03-31 01:43:55.631	0
cmmku0ftp0007sf1p3qn1mncf	cmmku0ftp0000sf1p6gn37c4o	Mostarda		Mostarda	t	2026-03-10 16:35:54.012	2026-03-30 16:23:56.647	1
cmmku0ftp0006sf1pvpwy7ked	cmmku0ftp0000sf1p6gn37c4o	Rosé		Rosé	t	2026-03-10 16:35:54.012	2026-03-30 16:23:56.647	2
cmnar4fyk0009sf8vnzlmn8b2	cmmtn5hdi0022sfx1ccz71zzn	Ozônio	Ozônio	\N	t	2026-03-28 19:57:02.54	2026-03-30 15:24:34.355	3
cmnar2bqb0001sf8vipagoqyy	cmmtn5hdi0022sfx1ccz71zzn	Amber Zara	Amber Zara	\N	t	2026-03-28 19:55:23.744	2026-03-30 15:24:34.355	3
cmjce38n2001csftaxfsua6pr	cmjce38mx0017sftapwl12w6s	Branca		Branca	t	2025-12-19 04:48:54.398	2026-03-30 15:20:31.738	3
cmietjkaz000fsfoluu72pp57	cmietjkau000csfolp35ln6hy	Lavanda e Alecrim	Lavanda e Alecrim	Natural	t	2025-11-25 16:57:20.268	2026-03-18 01:56:36.525	2
cmlzio07w001lsfr0ah526xkl	cmlzio07n001fsfr0om55h3ni	Lavanda com capim limão / Verde	Lavanda com capim limão	Verde	t	2026-02-23 18:35:08.444	2026-03-31 01:43:55.631	0
cmietjkae0003sfol071my9zc	cmietjka60000sfoldqu6rx78	Flor de Cerejeira / Rosa	Flor de Cerejeira	Rosa	t	2025-11-25 16:57:20.247	2026-03-31 01:49:04.881	0
cmmku0ftp0004sf1p7ocr42x1	cmmku0ftp0000sf1p6gn37c4o	Verde		Verde	t	2026-03-10 16:35:54.012	2026-03-30 16:23:56.647	1
cmmnm37ue0003sfyvknqs274a	cmmnm37ue0002sfyvlbdezwto	Bege com mescla		Bege com mescla	t	2026-03-12 15:17:25.209	2026-03-30 15:28:16.021	7
cmlu2jakb001esfzv04tulmdx	cmlu2jajs0018sfzvudisz1ho	Branco	\N	branco	t	2026-02-19 23:04:43.835	2026-03-31 02:07:47.056	2
cmmku0ftp0008sf1p7izmefpl	cmmku0ftp0000sf1p6gn37c4o	Mesclado		Mesclado	t	2026-03-10 16:35:54.012	2026-03-30 16:23:56.647	9
cmm2ez86l0024sfkmx50o7xn6	cmm15ql1i001ssfkg2qoual0z	Flor de Figo	Flor de Figo		t	2026-02-25 19:15:12.045	2026-03-30 16:53:08.065	1
cmml7oo00000psf9dx2x1mh7a	cmml7oo00000msf9dckwncq5b	Off-White		Off-White	t	2026-03-10 22:58:39.343	2026-03-31 02:06:17.958	1
cmml7oo00000osf9d2s7welc9	cmml7oo00000msf9dckwncq5b	Bege mesclado		bege	t	2026-03-10 22:58:39.343	2026-03-31 02:06:17.958	2
cmmnm37ue0005sfyvu0p2qbev	cmmnm37ue0002sfyvlbdezwto	Marrom		Marrom	t	2026-03-12 15:17:25.209	2026-03-30 15:28:16.021	1
cmjce38n5001esftav8uapr7b	cmjce38mx0017sftapwl12w6s	Bege		Bege	t	2025-12-19 04:48:54.401	2026-03-30 15:20:31.738	0
cmmnm37ue0007sfyv2zy2teb3	cmmnm37ue0002sfyvlbdezwto	Rosa		Rosa	t	2026-03-12 15:17:25.209	2026-03-30 15:28:16.021	1
cmlu2jak5001csfzvxt305nzi	cmlu2jajs0018sfzvudisz1ho	Bege	\N	bege	t	2026-02-19 23:04:43.829	2026-03-31 02:07:47.056	1
cmm2ez86e0020sfkmkqeb5v2f	cmm15ql1i001ssfkg2qoual0z	Bamboo	Bamboo		t	2026-02-25 19:15:12.038	2026-03-30 16:53:08.065	0
cmm2ez86h0022sfkm9d6n54ha	cmm15ql1i001ssfkg2qoual0z	Sândalo	Sândalo		t	2026-02-25 19:15:12.042	2026-03-30 16:53:08.065	0
cmm2ez86b001ysfkmc6plri3v	cmm15ql1i001ssfkg2qoual0z	Lavanda com Alecrim	Lavanda com Alecrim		t	2026-02-25 19:15:12.035	2026-03-30 16:53:08.065	3
cmml3udqo000csfuc7a43v4lq	cmml3udqo0007sfucg6rk24a3	Capim Limão / Verde	Capim Limão	Verde	t	2026-03-10 21:11:07.517	2026-03-31 01:49:43.27	0
cmml3udqo0009sfuca73tvoyf	cmml3udqo0007sfucg6rk24a3	Lavanda e Alecrim / Azul	Lavanda e Alecrim	Azul	t	2026-03-10 21:11:07.517	2026-03-31 01:49:43.27	0
cmml3udqo000asfucnt77s9w1	cmml3udqo0007sfucg6rk24a3	Madeira do Oriente / Areia	Madeira do Oriente	Areia	t	2026-03-10 21:11:07.517	2026-03-31 01:49:43.27	0
cmml3udqo000bsfucy3wvzo0b	cmml3udqo0007sfucg6rk24a3	Flor de Cerejeira / Rosa	Flor de Cerejeira	Rosa	t	2026-03-10 21:11:07.517	2026-03-31 01:49:43.27	0
cmml3udqo0008sfuc9g07bmfg	cmml3udqo0007sfucg6rk24a3	Verbena e Bergamota / Verde	Verbena e Bergamota	Verde	t	2026-03-10 21:11:07.517	2026-03-31 01:49:43.27	1
cmietjkar000bsfolzqco4fsx	cmietjka60000sfoldqu6rx78	Lavanda e Alecrim / Azul	Lavanda e Alecrim	Azul	t	2025-11-25 16:57:20.259	2026-03-31 01:49:04.881	2
cmlzio085001rsfr02v5ktvsc	cmlzio07n001fsfr0om55h3ni	Lavanda com capim limão / Branca	Lavanda com capim limão	Branca	t	2026-02-23 18:35:08.453	2026-03-31 01:43:55.631	3
cmietjkaj0005sfolofe1kmfh	cmietjka60000sfoldqu6rx78	Capim Limão / Verde	Capim Limão	Verde	t	2025-11-25 16:57:20.251	2026-03-31 01:49:04.881	2
cmietjkao0009sfolp8xjxidv	cmietjka60000sfoldqu6rx78	Verbena e Bergamota / Verde	Verbena e Bergamota	Verde	t	2025-11-25 16:57:20.256	2026-03-31 01:49:04.881	3
cmietjkbf000nsfolvadivli6	cmietjkb3000gsfolmsufzd11	Sândalo / Bege	Sândalo	Bege	t	2025-11-25 16:57:20.284	2026-03-31 01:49:24.384	0
cmietjkbb000lsfolodz2o4s0	cmietjkb3000gsfolmsufzd11	Capim Limão / Verde	Capim Limão	Verde	t	2025-11-25 16:57:20.28	2026-03-31 01:49:24.384	0
cmietjkbj000psfolzrti0308	cmietjkb3000gsfolmsufzd11	Flor de Figo / Marrom	Flor de Figo	Marrom	t	2025-11-25 16:57:20.287	2026-03-31 01:49:24.384	0
cmietjkbn000rsfol7oo4n2bq	cmietjkb3000gsfolmsufzd11	Lavanda e Alecrim / Azul	Lavanda e Alecrim	Azul	t	2025-11-25 16:57:20.291	2026-03-31 01:49:24.384	1
cmietjkb8000jsfolzxslk8cu	cmietjkb3000gsfolmsufzd11	Flor de Cerejeira / Rosa	Flor de Cerejeira	Rosa	t	2025-11-25 16:57:20.277	2026-03-31 01:49:24.384	0
cmml2r67y0006sfucjzsyf059	cmml2r67x0000sfuc2z41n9gl	Colorido		Colorido	t	2026-03-10 20:40:38.176	2026-03-31 02:10:30.299	3
cmmnnkmje000hsfyvvcdrzelh	cmmnnkmje000fsfyvatpabjbp	Verde mesclada		Verde mesclada	t	2026-03-12 15:58:57.05	2026-03-24 03:06:09.676	1
cmmmw10ay0001sfyjvgo1j9zt	cmmmw10ay0000sfyjlrrlxiep	Bege		Bege	t	2026-03-12 03:07:52.112	2026-03-30 16:29:50.606	2
cmnar4ydd000dsf8v1dpeve8e	cmmtn5hdi0022sfx1ccz71zzn	Terra Molhada	Terra Molhada	\N	t	2026-03-28 19:57:26.401	2026-03-30 15:24:34.355	3
cmmmwefs0000asfyj1i1pxoev	cmmmwefrz0007sfyj49aal1x6	Rosé		Rosé	t	2026-03-12 03:18:18.696	2026-03-30 15:28:27.729	1
cmmtjeelc000usfx16smtgtko	cmmtjeelc000ssfx1kysapr4b	Flor de Laranjeira	Flor de Laranjeira		t	2026-03-16 18:48:45.387	2026-03-31 02:22:34.239	2
cmmtm2zrk001rsfx1uwm8kuee	cmmtm2zrk001jsfx164kh9geq	Amora	Amora	Vinho	t	2026-03-16 20:03:51.804	2026-03-31 01:53:50.968	0
cmmmw10ay0003sfyj4e91icb5	cmmmw10ay0000sfyjlrrlxiep	Preto		Preto	t	2026-03-12 03:07:52.112	2026-03-30 16:29:50.606	1
cmmtjeelc000vsfx1alioz9tt	cmmtjeelc000ssfx1kysapr4b	Limão	Limão		t	2026-03-16 18:48:45.387	2026-03-31 02:22:34.239	3
cmmtih4sl000lsfx16bav4bqn	cmmtih4sl000jsfx1fitwbo4y	Verbena	Verbena		t	2026-03-16 18:22:53.036	2026-03-31 01:38:28.472	2
cmmtilsza000qsfx1xktioqk3	cmmtilsz9000psfx1ewuqyh86	Lavanda e Alecrim	Lavanda e Alecrim		t	2026-03-16 18:26:31.029	2026-03-31 01:41:30.556	3
cmlzio082001psfr0o3drcb93	cmlzio07n001fsfr0om55h3ni	Lavanda com capim limão / Bege	Lavanda com capim limão	Bege	t	2026-02-23 18:35:08.45	2026-03-31 01:43:55.631	2
cmmti38mh000hsfx1tynrdxrs	cmmti38mh000fsfx1ku0jqedi	Verbena e Bergamota	Verbena e Bergamota		t	2026-03-16 18:12:04.809	2026-03-24 01:55:08.193	1
cmmtm2zrk001qsfx1kphdk55p	cmmtm2zrk001jsfx164kh9geq	Mel	Mel	Mel	t	2026-03-16 20:03:51.804	2026-03-31 01:53:50.968	0
cmmnns4gu000ksfyvqys6pzgk	cmmnns4gu000isfyvrj7917m2	Bege		Bege	t	2026-03-12 16:04:46.878	2026-03-30 16:28:32.426	1
cmmnm37ue0006sfyvcb87k29b	cmmnm37ue0002sfyvlbdezwto	Azul		Azul	t	2026-03-12 15:17:25.209	2026-03-30 15:28:16.021	1
cmmnm37ue0004sfyva36ibeah	cmmnm37ue0002sfyvlbdezwto	Bege		Bege	t	2026-03-12 15:17:25.209	2026-03-30 15:28:16.021	1
cmml82i5a000usf9dgta8mrrd	cmml82i5a000rsf9dblttw0mc	Camomila / Tons terrosos	Camomila	Tons terrosos	t	2026-03-10 23:09:24.936	2026-03-30 15:29:57.91	3
cmmtju124000zsfx1jogl022g	cmmtju124000wsfx12kxyc8t1	Flor de Cerejeira	Flor de Cerejeira		t	2026-03-16 19:00:54.339	2026-03-19 16:52:44.855	1
cmmnns4gu000jsfyv8elh4vsh	cmmnns4gu000isfyvrj7917m2	Branco		Branco	t	2026-03-12 16:04:46.878	2026-03-30 16:28:32.426	2
cmml82i5a000ssf9dbqtof0xp	cmml82i5a000rsf9dblttw0mc	Bamboo / Bege com verde	Bamboo	Bege com verde	t	2026-03-10 23:09:24.936	2026-03-30 15:29:57.91	2
cmmmw10ay0004sfyjc47v9kfe	cmmmw10ay0000sfyjlrrlxiep	Branco com verde		Branco e verde	t	2026-03-12 03:07:52.112	2026-03-30 16:29:50.606	1
cmmnmh2mm000asfyvdppvdx3g	cmmnmh2mm0008sfyveencayl1	Areia com rosé		Areia com rosé	t	2026-03-12 15:28:11.637	2026-03-30 15:52:33.869	1
cmmtjeelc000tsfx1y8ddmb4e	cmmtjeelc000ssfx1kysapr4b	Lavanda	Lavanda		t	2026-03-16 18:48:45.387	2026-03-31 02:22:34.239	3
cmmmwefs00009sfyjbla71jg3	cmmmwefrz0007sfyj49aal1x6	Azul		Azul	t	2026-03-12 03:18:18.696	2026-03-30 15:28:27.729	1
cmmnnkmje000gsfyvpjqj2uez	cmmnnkmje000fsfyvatpabjbp	Areia mesclada		Areia mesclada	t	2026-03-12 15:58:57.05	2026-03-24 03:06:09.676	2
cmmmwhzjr000csfyj0krnzu3j	cmmmwhzjr000bsfyjo1575xc5	Girassol		Girassol	t	2026-03-12 03:21:04.31	2026-03-30 15:27:46.973	1
cmmmw10ay0002sfyj0dqniawk	cmmmw10ay0000sfyjlrrlxiep	Marrom		Marrom	t	2026-03-12 03:07:52.112	2026-03-30 16:29:50.606	1
cmnar3izt0005sf8v9rwft8ss	cmmtn5hdi0022sfx1ccz71zzn	Flor de Cerejeira	Flor de Cerejeira	\N	t	2026-03-28 19:56:19.818	2026-03-30 15:24:34.355	3
cmmtk2b6g0011sfx1e5qn6cy6	cmmtk2b6g0010sfx1tkhvkiqt	Lavanda	Lavanda		t	2026-03-16 19:07:20.701	2026-03-19 16:45:55.425	1
cmmtju124000ysfx11opgudt9	cmmtju124000wsfx12kxyc8t1	Bamboo	Bamboo		t	2026-03-16 19:00:54.339	2026-03-19 16:52:44.855	1
cmmmw10ay0005sfyjasu88zg5	cmmmw10ay0000sfyjlrrlxiep	Branco com azul		Branco com azul	t	2026-03-12 03:07:52.112	2026-03-30 16:29:50.606	2
cmmnmh2mm000bsfyvo3j13x03	cmmnmh2mm0008sfyveencayl1	Areia com branco		Areia com branco	t	2026-03-12 15:28:11.637	2026-03-30 15:52:33.869	1
cmmmwefs00008sfyjdp8z4hrb	cmmmwefrz0007sfyj49aal1x6	Rosa		Rosa	t	2026-03-12 03:18:18.696	2026-03-30 15:28:27.729	1
cmmtdboub000asfx1znrjztq7	cmmtdboub0007sfx1234azv8k	Capim Limão / Verde	Capim Limão	Verde	t	2026-03-16 15:58:41.003	2026-03-31 01:36:52.721	1
cmmtdboub0009sfx1m0q3gs1f	cmmtdboub0007sfx1234azv8k	Lavanda / Bege	Lavanda	Bege	t	2026-03-16 15:58:41.003	2026-03-31 01:36:52.721	1
cmmtih4sl000ksfx134nqk5fc	cmmtih4sl000jsfx1fitwbo4y	Capim Limão e Bamboo	Capim Limão e Bamboo		t	2026-03-16 18:22:53.036	2026-03-31 01:38:28.472	1
cmmtih4sl000msfx1vq8579pv	cmmtih4sl000jsfx1fitwbo4y	Flor de Cerejeira	Flor de Cerejeira		t	2026-03-16 18:22:53.036	2026-03-31 01:38:28.472	1
cmmtdrlxf000dsfx17ni4dz1j	cmmtdrlxf000csfx1of2dbygs	Capim Limão	Capim Limão		t	2026-03-16 16:11:03.747	2026-03-19 17:14:47.095	1
cmmtk2b6g0012sfx109u57bui	cmmtk2b6g0010sfx1tkhvkiqt	Bamboo	Bamboo		t	2026-03-16 19:07:20.701	2026-03-19 16:45:55.425	2
cmmtju124000xsfx1gb2v2v6h	cmmtju124000wsfx12kxyc8t1	Lavanda	Lavanda		t	2026-03-16 19:00:54.339	2026-03-19 16:52:44.855	2
cmmtdboub0008sfx17961k8md	cmmtdboub0007sfx1234azv8k	Sândalo / Branco	Sândalo	Branco	t	2026-03-16 15:58:41.003	2026-03-31 01:36:52.721	1
cmmtdboub000bsfx1sgo6pwc1	cmmtdboub0007sfx1234azv8k	Black Vanilla / Preto	Black Vanilla	Preto	t	2026-03-16 15:58:41.003	2026-03-31 01:36:52.721	1
cmmtih4sl000nsfx1iv9symmz	cmmtih4sl000jsfx1fitwbo4y	Camomila	Camomila		t	2026-03-16 18:22:53.036	2026-03-31 01:38:28.472	1
cmmtih4sl000osfx1qn1ey6vr	cmmtih4sl000jsfx1fitwbo4y	Lavanda	Lavanda		t	2026-03-16 18:22:53.036	2026-03-31 01:38:28.472	2
cmmtcowwb0001sfx1aifn4516	cmmtcowwb0000sfx1036wvn3r	Lavanda com capim limão / Azul	Lavanda com capim limão	Azul	t	2026-03-16 15:40:58.364	2026-03-31 01:45:21.266	1
cmmtcowwb0006sfx1xi7532ka	cmmtcowwb0000sfx1036wvn3r	Lavanda com capim limão / Mesclado	Lavanda com capim limão	Mesclado	t	2026-03-16 15:40:58.364	2026-03-31 01:45:21.266	4
cmmtcowwb0003sfx1g3gszdnn	cmmtcowwb0000sfx1036wvn3r	Lavanda com capim limão / Marrom	Lavanda com capim limão	Marrom	t	2026-03-16 15:40:58.364	2026-03-31 01:45:21.266	1
cmmtdrlxf000esfx15hnza0ve	cmmtdrlxf000csfx1of2dbygs	Lavanda e Alecrim	Lavanda e Alecrim		t	2026-03-16 16:11:03.747	2026-03-19 17:14:47.095	1
cmmtcowwb0005sfx17vqlfokx	cmmtcowwb0000sfx1036wvn3r	Lavanda com capim limão / Bege	Lavanda com capim limão	Bege	t	2026-03-16 15:40:58.364	2026-03-31 01:45:21.266	2
cmmti38mh000gsfx14mwbc3yc	cmmti38mh000fsfx1ku0jqedi	Flor de Figo	Flor de Figo		t	2026-03-16 18:12:04.809	2026-03-24 01:55:08.193	1
cmmti38mh000isfx19ogdutzt	cmmti38mh000fsfx1ku0jqedi	Camomila	Camomila		t	2026-03-16 18:12:04.809	2026-03-24 01:55:08.193	1
cmmtk2b6g0013sfx1wrk4e7e0	cmmtk2b6g0010sfx1tkhvkiqt	Flor de Cerejeira	Flor de Cerejeira		t	2026-03-16 19:07:20.701	2026-03-19 16:45:55.425	1
cmnar4otp000bsf8vt721mcu7	cmmtn5hdi0022sfx1ccz71zzn	Tenue Gold	Tenue Gold	\N	t	2026-03-28 19:57:14.028	2026-03-30 15:24:34.355	3
cmnar37xr0003sf8vx4neawkh	cmmtn5hdi0022sfx1ccz71zzn	Brisa do Campo	Brisa do Campo	\N	t	2026-03-28 19:56:05.486	2026-03-30 15:24:34.355	3
cmmmwhzjr000dsfyjuuf0t2sm	cmmmwhzjr000bsfyjo1575xc5	Bege com verde		Bege com verde	t	2026-03-12 03:21:04.31	2026-03-30 15:27:46.973	2
cmmnmh2mm000esfyv5d3plkak	cmmnmh2mm0008sfyveencayl1	Mesclado		Mesclado	t	2026-03-12 15:28:11.637	2026-03-30 15:52:33.869	2
cmlzio07t001jsfr0em4g68bd	cmlzio07n001fsfr0om55h3ni	Lavanda com capim limão / Azul	Lavanda com capim limão	Azul	t	2026-02-23 18:35:08.441	2026-03-31 01:43:55.631	2
cmmtcowwb0004sfx1xqvcxklt	cmmtcowwb0000sfx1036wvn3r	Lavanda com capim limão / Rosa	Lavanda com capim limão	Rosa	t	2026-03-16 15:40:58.364	2026-03-31 01:45:21.266	1
cmnara8oc000jsf8v3tyq4bhm	cmmtm2zrk001jsfx164kh9geq	Flor de Cerejeira	Flor de Cerejeira	Rosa	t	2026-03-28 20:01:33.035	2026-03-31 01:53:50.968	2
cmmtn5hdi0026sfx14yo87q9p	cmmtn5hdi0022sfx1ccz71zzn	Orquídea	Orquídea		t	2026-03-16 20:33:47.557	2026-03-30 15:24:34.355	3
cmmtn5hdi0024sfx14svbfhjx	cmmtn5hdi0022sfx1ccz71zzn	Capim Limão	Capim limão		t	2026-03-16 20:33:47.557	2026-03-30 15:24:34.356	3
cmmtm2zrk001nsfx1myv8z5yn	cmmtm2zrk001jsfx164kh9geq	Maracujá	Maracuja	Amarelo	t	2026-03-16 20:03:51.804	2026-03-31 01:53:50.969	1
cmmvbdhv90005sfb9efdnr6ri	cmmvbdhv90004sfb9hgie33k3	Bamboo	Bamboo		t	2026-03-18 00:39:38.421	2026-03-30 15:25:46.309	1
cmmtm2zrk001tsfx1i7ghh1t3	cmmtm2zrk001jsfx164kh9geq	Cedro	Cedro	Bege	t	2026-03-16 20:03:51.804	2026-03-31 01:53:50.968	0
cmmtn5hdi0023sfx1hcoydi5u	cmmtn5hdi0022sfx1ccz71zzn	Lavanda	Lavanda		t	2026-03-16 20:33:47.557	2026-03-30 15:24:34.356	3
cmmvciy2m000asfb9p91223ou	cmmvciy2m0009sfb93f2k749b	Iemanjá		Iemanjá	t	2026-03-18 01:11:52.318	2026-03-30 16:16:27.961	0
cmmvbdhv90006sfb9d4s90r7a	cmmvbdhv90004sfb9hgie33k3	Lavanda	Lavanda		t	2026-03-18 00:39:38.421	2026-03-30 15:25:46.309	1
cmn42aeoh0008sfmi6uvok8ye	cmn42aeoh0006sfmil4t9708u	Verbena		Verbena	t	2026-03-24 03:35:13.341	2026-03-31 02:16:49.759	2
cmmtm2zrk001msfx1u3d55x5z	cmmtm2zrk001jsfx164kh9geq	Bergamota	Bergamota	Laranja	t	2026-03-16 20:03:51.804	2026-03-31 01:53:50.968	0
cmmvciy2m000bsfb9j0gv8vyf	cmmvciy2m0009sfb93f2k749b	Liso		Liso	t	2026-03-18 01:11:52.318	2026-03-30 16:16:27.961	4
cmmtcowwb0002sfx11qrip6cb	cmmtcowwb0000sfx1036wvn3r	Lavanda com capim limão / Verde	Lavanda com capim limão	Verde	t	2026-03-16 15:40:58.364	2026-03-31 01:45:21.266	1
cmmvdeh5y000dsfb94aoewke5	cmmtdboub0007sfx1234azv8k	Bamboo / Mesclado	Bamboo	Mesclado	t	2026-03-18 01:36:23.398	2026-03-31 01:36:52.721	0
cmmto0w4g002asfx1ognjq8y9	cmmto0w4g0028sfx16l1k81dr	Lavanda	Lavanda		t	2026-03-16 20:58:13.005	2026-03-31 02:12:57.14	3
cmietjkal0007sfolqjitu1xi	cmietjka60000sfoldqu6rx78	Madeira do Oriente / Areia	Madeira do Oriente	Areia	t	2025-11-25 16:57:20.254	2026-03-31 01:49:04.881	2
cmmvb31k80002sfb9h1p7hca3	cmmvb31k80000sfb9z7rqq19w	Flor de Cerejeira	Flor de Cerejeira		t	2026-03-18 00:31:30.711	2026-03-30 16:02:31.516	2
cmmtkzl7u0019sfx13599w2il	cmmtkzl7u0018sfx12c5q7sw9	Lavanda	Lavanda		t	2026-03-16 19:33:13.386	2026-03-30 16:00:55.945	5
cmmtl3thr001esfx1vwpvu8ys	cmmtl3thr001csfx1lzwgplby	Bamboo	Bamboo		t	2026-03-16 19:36:30.734	2026-03-29 00:48:39.399	1
cmmtl3thr001dsfx1kei324nt	cmmtl3thr001csfx1lzwgplby	Lavanda	Lavanda		t	2026-03-16 19:36:30.734	2026-03-29 00:48:39.399	1
cmmtl3thr001fsfx1pvc1g1i9	cmmtl3thr001csfx1lzwgplby	Flor de Cerejeira	Flor de Cerejeira		t	2026-03-16 19:36:30.734	2026-03-29 00:48:39.399	2
cmmtm2zrk001osfx12o6yx7q7	cmmtm2zrk001jsfx164kh9geq	Frutas vermelhas	Frutas vermelhas	Vermelho	t	2026-03-16 20:03:51.804	2026-03-31 01:53:50.968	0
cmmtms2gs0020sfx1b7cmhaaa	cmmtms2gs001wsfx1rbyobmvz	Verbena	Verbena		t	2026-03-16 20:23:21.698	2026-03-31 02:14:21.156	3
cmmxo7cnn000rsffx3bfs44oe	cmmxo7cnn000osffxmkjskgs0	Mamãe Bebe	Mamãe Bebe		t	2026-03-19 16:14:19.073	2026-03-31 02:15:20.009	1
cmmtn5hdi0025sfx1uok6d8fn	cmmtn5hdi0022sfx1ccz71zzn	Verbena	Verbena		t	2026-03-16 20:33:47.557	2026-03-30 15:24:34.359	3
cmmtn5hdi0027sfx1itbk127v	cmmtn5hdi0022sfx1ccz71zzn	Algodão	Algodão		t	2026-03-16 20:33:47.557	2026-03-30 15:24:34.355	3
cmnar468i0007sf8vm7tc6i4p	cmmtn5hdi0022sfx1ccz71zzn	Martan	Martan	\N	t	2026-03-28 19:56:49.938	2026-03-30 15:24:34.356	3
cmmtm2zrk001ssfx10mkt9dfq	cmmtm2zrk001jsfx164kh9geq	Verbena	Verbena	Esverdeado	t	2026-03-16 20:03:51.804	2026-03-31 01:53:50.968	0
cmmtl8jk8001hsfx19hxw90cz	cmmtl8jk7001gsfx1311ovsjy	Camomila / Bege	Camomila	Bege	t	2026-03-16 19:40:11.143	2026-03-24 02:21:05.434	2
cmml82i5a000vsf9dcivqp6bu	cmml82i5a000rsf9dblttw0mc	Lavanda / Branca	Lavanda	Branca	t	2026-03-10 23:09:24.936	2026-03-30 15:29:57.91	2
cmn421xup0005sfmi28zffnhz	cmn421xup0003sfmiloznf209	Alecrim		Alecrim	t	2026-03-24 03:28:38.278	2026-03-31 02:18:24.382	10
cmmvb31k80003sfb9xlvx12oe	cmmvb31k80000sfb9z7rqq19w	Lavanda	Lavanda		t	2026-03-18 00:31:30.711	2026-03-30 16:02:31.516	2
cmmnmh2mm0009sfyv6xfp73wa	cmmnmh2mm0008sfyveencayl1	Areia		Areia	t	2026-03-12 15:28:11.637	2026-03-30 15:52:33.87	2
cmmvb31k80001sfb9m515m63a	cmmvb31k80000sfb9z7rqq19w	Bamboo	Bamboo		t	2026-03-18 00:31:30.711	2026-03-30 16:02:31.516	2
cmmtkzl7u001asfx1t1cqt7x7	cmmtkzl7u0018sfx12c5q7sw9	Bamboo	Bamboo		t	2026-03-16 19:33:13.386	2026-03-30 16:00:55.945	5
cmmtkzl7u001bsfx1sqn6lx3b	cmmtkzl7u0018sfx12c5q7sw9	Flor de Cerejeira	Flor de Cerejeira		t	2026-03-16 19:33:13.386	2026-03-30 16:00:55.945	5
cmmxm117y0003sffxj00mur4e	cmmxm117y0000sffx8lzxnrnn	Flor de Cerejeira	Flor de Cerejeira		t	2026-03-19 15:13:25.083	2026-03-30 16:00:08.31	1
cmmxm117y0002sffxok1wws3e	cmmxm117y0000sffx8lzxnrnn	Bamboo	Bamboo		t	2026-03-19 15:13:25.083	2026-03-30 16:00:08.31	0
cmmxm117y0001sffxr9vxfd3w	cmmxm117y0000sffx8lzxnrnn	Lavanda	Lavanda		t	2026-03-19 15:13:25.083	2026-03-30 16:00:08.31	1
cmmtkukqj0017sfx1gg7wmc42	cmmtkukqj0014sfx1ejngc5gm	Flor de Cerejeira	Flor de Cerejeira		t	2026-03-16 19:29:19.482	2026-03-30 16:00:37.04	2
cmmtkukqj0015sfx1d0z6ycq9	cmmtkukqj0014sfx1ejngc5gm	Lavanda	Lavanda		t	2026-03-16 19:29:19.482	2026-03-30 16:00:37.04	3
cmmtkukqj0016sfx1kmmygz5d	cmmtkukqj0014sfx1ejngc5gm	Bamboo	Bamboo		t	2026-03-16 19:29:19.482	2026-03-30 16:00:37.04	3
cmmto0w4g0029sfx1w0yexsy6	cmmto0w4g0028sfx16l1k81dr	Capim Limão	Capim Limão		t	2026-03-16 20:58:13.005	2026-03-31 02:12:57.14	3
cmmtms2gs001xsfx1c01k6uth	cmmtms2gs001wsfx1rbyobmvz	Orquídea	Orquídea		t	2026-03-16 20:23:21.698	2026-03-31 02:14:21.156	3
cmnar91jr000hsf8v4czaa80h	cmmtm2zrk001jsfx164kh9geq	Dama da Noite	Dama da Noite	Branco	t	2026-03-28 20:00:37.142	2026-03-31 01:53:50.968	0
cmmtm2zrk001usfx19y5weiul	cmmtm2zrk001jsfx164kh9geq	Maça Madura	Maça Madura	Rosado	t	2026-03-16 20:03:51.804	2026-03-31 01:53:50.968	0
cmmtms2gs001zsfx1mvk2ym7s	cmmtms2gs001wsfx1rbyobmvz	Capim Limâo	Capim Limão		t	2026-03-16 20:23:21.698	2026-03-31 02:14:21.156	3
cmmxo7cnn000qsffx7r52qtqq	cmmxo7cnn000osffxmkjskgs0	Apple Spice	Apple Spice		t	2026-03-19 16:14:19.073	2026-03-31 02:15:20.009	1
cmn41rbvd0002sfmi8biwqsdh	cmn41rbvd0000sfmi9knsq6k7	Flor de Laranjeira			t	2026-03-24 03:20:23.239	2026-03-31 02:16:35.055	5
cmmvdkq06000fsfb9gs6tnabp	cmmti38mh000fsfx1ku0jqedi	Black Vanilla	Black Vanilla	\N	t	2026-03-18 01:41:14.771	2026-03-24 01:55:08.193	2
cmmtl8jk8001isfx1wtg4wj9q	cmmtl8jk7001gsfx1311ovsjy	Flor de Cerejeira / Rosa	Flor de Cerejeira	Rosa	t	2026-03-16 19:40:11.143	2026-03-24 02:21:05.434	1
cmn417g4d0011sf5fxoj0j67g	cmmnnkmje000fsfyvatpabjbp	Branco	\N	Branco	t	2026-03-24 03:04:55.644	2026-03-24 03:06:09.677	1
cmn7mlihw000nsfl4ioxoghfp	cmmtih4sl000jsfx1fitwbo4y	Flor de Figo	Flor de Figo	\N	t	2026-03-26 15:27:02.371	2026-03-31 01:38:28.472	2
cmmtm2zrk001ksfx1wffn58fb	cmmtm2zrk001jsfx164kh9geq	Lavanda	Lavanda	Lilás	t	2026-03-16 20:03:51.804	2026-03-31 01:53:50.968	5
cmnarctc1000lsf8va3hf5yic	cmmtm2zrk001jsfx164kh9geq	Pitanga Preta	Pitanga Preta	Preto	t	2026-03-28 20:03:33.12	2026-03-31 01:53:50.968	0
cmmtm2zrk001lsfx1x396p1n3	cmmtm2zrk001jsfx164kh9geq	Capim limão	Capim limão	Verde	t	2026-03-16 20:03:51.804	2026-03-31 01:53:50.968	3
cmmtm2zrk001psfx1dq4fn1ft	cmmtm2zrk001jsfx164kh9geq	Limão Siciliano	Limão siciliano	Amarelo esverdeado	t	2026-03-16 20:03:51.804	2026-03-31 01:53:50.968	1
cmn561ymm0003sfe8v5px0e9s	cmmto0w4g0028sfx16l1k81dr	Algodão	Algodão	\N	t	2026-03-24 22:08:23.949	2026-03-31 02:12:57.14	3
cmn561ln30001sfe85k9komc7	cmmto0w4g0028sfx16l1k81dr	Orquídea	Orquídea	\N	t	2026-03-24 22:08:07.116	2026-03-31 02:12:57.14	3
cmmtms2gs001ysfx1ypf231qf	cmmtms2gs001wsfx1rbyobmvz	Lavanda	Lavanda		t	2026-03-16 20:23:21.698	2026-03-31 02:14:21.156	3
cmnar6n8j000fsf8vkl7spvtf	cmmtn5hdi0022sfx1ccz71zzn	Bamboo	Bamboo	\N	t	2026-03-28 19:58:45.283	2026-03-30 15:24:34.356	3
cmml82i5a000tsf9d6v88lcsm	cmml82i5a000rsf9dblttw0mc	Flor de Cerejeira / Rosé	Flor de Cerejeira	Rosé	t	2026-03-10 23:09:24.936	2026-03-30 15:29:57.91	2
cmmnmh2mm000dsfyvb3z24cs9	cmmnmh2mm0008sfyveencayl1	Branco com azul			t	2026-03-12 15:28:11.637	2026-03-30 15:52:33.869	1
cmmnmh2mm000csfyvjf3ueiun	cmmnmh2mm0008sfyveencayl1	Branco		Branco	t	2026-03-12 15:28:11.637	2026-03-30 15:52:33.869	1
cmmtms2gs0021sfx194pz9ely	cmmtms2gs001wsfx1rbyobmvz	Algodão	Algodão		t	2026-03-16 20:23:21.698	2026-03-31 02:14:21.156	3
cmn569il2000bsfe8q0nq3jxe	cmmtjeelc000ssfx1kysapr4b	Pimenta Rosa	Pimenta Rosa	\N	t	2026-03-24 22:14:16.405	2026-03-31 02:22:34.24	2
cmn567mu00005sfe8zaofh6o0	cmmtjeelc000ssfx1kysapr4b	Chá Branco	Chá Branco	\N	t	2026-03-24 22:12:48.599	2026-03-31 02:22:34.24	2
cmn5692rc0009sfe8orw23woc	cmmtjeelc000ssfx1kysapr4b	Maçã e Canela	Maçã e Canela	\N	t	2026-03-24 22:13:55.896	2026-03-31 02:22:34.24	3
cmn5681yy0007sfe863si65s0	cmmtjeelc000ssfx1kysapr4b	Amora Negra	Amora Negra	\N	t	2026-03-24 22:13:08.217	2026-03-31 02:22:34.24	2
\.


--
-- Name: Usuario_id_seq; Type: SEQUENCE SET; Schema: public; Owner: essenza_user
--

SELECT pg_catalog.setval('public."Usuario_id_seq"', 5, true);


--
-- PostgreSQL database dump complete
--

\unrestrict PbUnGvc60N2KYggzwXym2TEVPVNOfL3R50gDNfcFjNTPPPsRXNWEzJ0BdDU2hNW

