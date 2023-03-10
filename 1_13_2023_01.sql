PGDMP     %                     {            blogs     14.6 (Ubuntu 14.6-1.pgdg22.04+1)     15.1 (Ubuntu 15.1-1.pgdg22.04+1) ?    }           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            ~           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            ?           1262    16637    blogs    DATABASE     q   CREATE DATABASE blogs WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.UTF-8';
    DROP DATABASE blogs;
                postgres    false                        2615    2200    public    SCHEMA     2   -- *not* creating schema, since initdb creates it
 2   -- *not* dropping schema, since initdb creates it
                postgres    false            ?           0    0    SCHEMA public    ACL     Q   REVOKE USAGE ON SCHEMA public FROM PUBLIC;
GRANT ALL ON SCHEMA public TO PUBLIC;
                   postgres    false    4            ?            1259    37592    blog_contents    TABLE     ?   CREATE TABLE public.blog_contents (
    id integer NOT NULL,
    content text NOT NULL,
    image text,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    blog_id integer
);
 !   DROP TABLE public.blog_contents;
       public         heap    postgres    false    4            ?            1259    37591    blog_contents_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.blog_contents_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.blog_contents_id_seq;
       public          postgres    false    4    217            ?           0    0    blog_contents_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.blog_contents_id_seq OWNED BY public.blog_contents.id;
          public          postgres    false    216            ?            1259    18512    blogs    TABLE     ?  CREATE TABLE public.blogs (
    id integer NOT NULL,
    author text,
    url text NOT NULL,
    title text NOT NULL,
    likes integer DEFAULT 0,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    user_id integer NOT NULL,
    year integer NOT NULL,
    subtitle text NOT NULL,
    happy integer DEFAULT 0,
    angry integer DEFAULT 0,
    sad integer DEFAULT 0
);
    DROP TABLE public.blogs;
       public         heap    postgres    false    4            ?            1259    18511    blogs_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.blogs_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.blogs_id_seq;
       public          postgres    false    4    211            ?           0    0    blogs_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.blogs_id_seq OWNED BY public.blogs.id;
          public          postgres    false    210            ?            1259    41925    comments    TABLE     ?   CREATE TABLE public.comments (
    id integer NOT NULL,
    author text NOT NULL,
    content text NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    blog_id integer,
    user_id integer
);
    DROP TABLE public.comments;
       public         heap    postgres    false    4            ?            1259    41924    comments_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.comments_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.comments_id_seq;
       public          postgres    false    4    219            ?           0    0    comments_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.comments_id_seq OWNED BY public.comments.id;
          public          postgres    false    218            ?            1259    18506 
   migrations    TABLE     M   CREATE TABLE public.migrations (
    name character varying(255) NOT NULL
);
    DROP TABLE public.migrations;
       public         heap    postgres    false    4            ?            1259    22061    reading_lists    TABLE     ?  CREATE TABLE public.reading_lists (
    id integer NOT NULL,
    user_id integer NOT NULL,
    blog_id integer NOT NULL,
    read boolean DEFAULT false,
    created_at timestamp with time zone DEFAULT '2023-01-13 16:06:46.453-06'::timestamp with time zone,
    updated_at timestamp with time zone DEFAULT '2023-01-13 16:06:46.453-06'::timestamp with time zone,
    read_at timestamp with time zone
);
 !   DROP TABLE public.reading_lists;
       public         heap    postgres    false    4            ?            1259    22060    reading_lists_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.reading_lists_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.reading_lists_id_seq;
       public          postgres    false    4    215            ?           0    0    reading_lists_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.reading_lists_id_seq OWNED BY public.reading_lists.id;
          public          postgres    false    214            ?            1259    18522    users    TABLE     ?   CREATE TABLE public.users (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    username character varying(255) NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL
);
    DROP TABLE public.users;
       public         heap    postgres    false    4            ?            1259    18521    users_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.users_id_seq;
       public          postgres    false    213    4            ?           0    0    users_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;
          public          postgres    false    212            ?           2604    37595    blog_contents id    DEFAULT     t   ALTER TABLE ONLY public.blog_contents ALTER COLUMN id SET DEFAULT nextval('public.blog_contents_id_seq'::regclass);
 ?   ALTER TABLE public.blog_contents ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    217    216    217            ?           2604    18515    blogs id    DEFAULT     d   ALTER TABLE ONLY public.blogs ALTER COLUMN id SET DEFAULT nextval('public.blogs_id_seq'::regclass);
 7   ALTER TABLE public.blogs ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    210    211    211            ?           2604    41928    comments id    DEFAULT     j   ALTER TABLE ONLY public.comments ALTER COLUMN id SET DEFAULT nextval('public.comments_id_seq'::regclass);
 :   ALTER TABLE public.comments ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    218    219    219            ?           2604    22064    reading_lists id    DEFAULT     t   ALTER TABLE ONLY public.reading_lists ALTER COLUMN id SET DEFAULT nextval('public.reading_lists_id_seq'::regclass);
 ?   ALTER TABLE public.reading_lists ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    215    214    215            ?           2604    18525    users id    DEFAULT     d   ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);
 7   ALTER TABLE public.users ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    212    213    213            x          0    37592    blog_contents 
   TABLE DATA           \   COPY public.blog_contents (id, content, image, created_at, updated_at, blog_id) FROM stdin;
    public          postgres    false    217   &?       r          0    18512    blogs 
   TABLE DATA           ?   COPY public.blogs (id, author, url, title, likes, created_at, updated_at, user_id, year, subtitle, happy, angry, sad) FROM stdin;
    public          postgres    false    211   C?       z          0    41925    comments 
   TABLE DATA           a   COPY public.comments (id, author, content, created_at, updated_at, blog_id, user_id) FROM stdin;
    public          postgres    false    219   ?       p          0    18506 
   migrations 
   TABLE DATA           *   COPY public.migrations (name) FROM stdin;
    public          postgres    false    209   7?       v          0    22061    reading_lists 
   TABLE DATA           d   COPY public.reading_lists (id, user_id, blog_id, read, created_at, updated_at, read_at) FROM stdin;
    public          postgres    false    215   k?       t          0    18522    users 
   TABLE DATA           K   COPY public.users (id, name, username, created_at, updated_at) FROM stdin;
    public          postgres    false    213   ??       ?           0    0    blog_contents_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.blog_contents_id_seq', 1, false);
          public          postgres    false    216            ?           0    0    blogs_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.blogs_id_seq', 5, true);
          public          postgres    false    210            ?           0    0    comments_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.comments_id_seq', 1, false);
          public          postgres    false    218            ?           0    0    reading_lists_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.reading_lists_id_seq', 3, true);
          public          postgres    false    214            ?           0    0    users_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.users_id_seq', 4, true);
          public          postgres    false    212            ?           2606    37599     blog_contents blog_contents_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.blog_contents
    ADD CONSTRAINT blog_contents_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.blog_contents DROP CONSTRAINT blog_contents_pkey;
       public            postgres    false    217            ?           2606    18520    blogs blogs_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.blogs
    ADD CONSTRAINT blogs_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.blogs DROP CONSTRAINT blogs_pkey;
       public            postgres    false    211            ?           2606    41932    comments comments_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.comments DROP CONSTRAINT comments_pkey;
       public            postgres    false    219            ?           2606    18510    migrations migrations_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (name);
 D   ALTER TABLE ONLY public.migrations DROP CONSTRAINT migrations_pkey;
       public            postgres    false    209            ?           2606    22069     reading_lists reading_lists_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.reading_lists
    ADD CONSTRAINT reading_lists_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.reading_lists DROP CONSTRAINT reading_lists_pkey;
       public            postgres    false    215            ?           2606    22071 /   reading_lists reading_lists_user_id_blog_id_key 
   CONSTRAINT     v   ALTER TABLE ONLY public.reading_lists
    ADD CONSTRAINT reading_lists_user_id_blog_id_key UNIQUE (user_id, blog_id);
 Y   ALTER TABLE ONLY public.reading_lists DROP CONSTRAINT reading_lists_user_id_blog_id_key;
       public            postgres    false    215    215            ?           2606    18529    users users_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public            postgres    false    213            ?           2606    43364    users users_username_key 
   CONSTRAINT     W   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);
 B   ALTER TABLE ONLY public.users DROP CONSTRAINT users_username_key;
       public            postgres    false    213            ?           2606    43546    users users_username_key1 
   CONSTRAINT     X   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key1 UNIQUE (username);
 C   ALTER TABLE ONLY public.users DROP CONSTRAINT users_username_key1;
       public            postgres    false    213            ?           2606    43336    users users_username_key10 
   CONSTRAINT     Y   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key10 UNIQUE (username);
 D   ALTER TABLE ONLY public.users DROP CONSTRAINT users_username_key10;
       public            postgres    false    213            ?           2606    43360    users users_username_key100 
   CONSTRAINT     Z   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key100 UNIQUE (username);
 E   ALTER TABLE ONLY public.users DROP CONSTRAINT users_username_key100;
       public            postgres    false    213            ?           2606    43344    users users_username_key101 
   CONSTRAINT     Z   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key101 UNIQUE (username);
 E   ALTER TABLE ONLY public.users DROP CONSTRAINT users_username_key101;
       public            postgres    false    213            ?           2606    43358    users users_username_key102 
   CONSTRAINT     Z   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key102 UNIQUE (username);
 E   ALTER TABLE ONLY public.users DROP CONSTRAINT users_username_key102;
       public            postgres    false    213            ?           2606    43356    users users_username_key103 
   CONSTRAINT     Z   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key103 UNIQUE (username);
 E   ALTER TABLE ONLY public.users DROP CONSTRAINT users_username_key103;
       public            postgres    false    213            ?           2606    43346    users users_username_key104 
   CONSTRAINT     Z   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key104 UNIQUE (username);
 E   ALTER TABLE ONLY public.users DROP CONSTRAINT users_username_key104;
       public            postgres    false    213            ?           2606    43348    users users_username_key105 
   CONSTRAINT     Z   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key105 UNIQUE (username);
 E   ALTER TABLE ONLY public.users DROP CONSTRAINT users_username_key105;
       public            postgres    false    213            ?           2606    43350    users users_username_key106 
   CONSTRAINT     Z   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key106 UNIQUE (username);
 E   ALTER TABLE ONLY public.users DROP CONSTRAINT users_username_key106;
       public            postgres    false    213            ?           2606    43352    users users_username_key107 
   CONSTRAINT     Z   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key107 UNIQUE (username);
 E   ALTER TABLE ONLY public.users DROP CONSTRAINT users_username_key107;
       public            postgres    false    213            ?           2606    43354    users users_username_key108 
   CONSTRAINT     Z   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key108 UNIQUE (username);
 E   ALTER TABLE ONLY public.users DROP CONSTRAINT users_username_key108;
       public            postgres    false    213            ?           2606    43576    users users_username_key109 
   CONSTRAINT     Z   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key109 UNIQUE (username);
 E   ALTER TABLE ONLY public.users DROP CONSTRAINT users_username_key109;
       public            postgres    false    213            ?           2606    43382    users users_username_key11 
   CONSTRAINT     Y   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key11 UNIQUE (username);
 D   ALTER TABLE ONLY public.users DROP CONSTRAINT users_username_key11;
       public            postgres    false    213            ?           2606    43578    users users_username_key110 
   CONSTRAINT     Z   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key110 UNIQUE (username);
 E   ALTER TABLE ONLY public.users DROP CONSTRAINT users_username_key110;
       public            postgres    false    213            ?           2606    43414    users users_username_key111 
   CONSTRAINT     Z   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key111 UNIQUE (username);
 E   ALTER TABLE ONLY public.users DROP CONSTRAINT users_username_key111;
       public            postgres    false    213            ?           2606    43404    users users_username_key112 
   CONSTRAINT     Z   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key112 UNIQUE (username);
 E   ALTER TABLE ONLY public.users DROP CONSTRAINT users_username_key112;
       public            postgres    false    213            ?           2606    43406    users users_username_key113 
   CONSTRAINT     Z   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key113 UNIQUE (username);
 E   ALTER TABLE ONLY public.users DROP CONSTRAINT users_username_key113;
       public            postgres    false    213            ?           2606    43408    users users_username_key114 
   CONSTRAINT     Z   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key114 UNIQUE (username);
 E   ALTER TABLE ONLY public.users DROP CONSTRAINT users_username_key114;
       public            postgres    false    213            ?           2606    43410    users users_username_key115 
   CONSTRAINT     Z   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key115 UNIQUE (username);
 E   ALTER TABLE ONLY public.users DROP CONSTRAINT users_username_key115;
       public            postgres    false    213            ?           2606    43412    users users_username_key116 
   CONSTRAINT     Z   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key116 UNIQUE (username);
 E   ALTER TABLE ONLY public.users DROP CONSTRAINT users_username_key116;
       public            postgres    false    213            ?           2606    43462    users users_username_key117 
   CONSTRAINT     Z   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key117 UNIQUE (username);
 E   ALTER TABLE ONLY public.users DROP CONSTRAINT users_username_key117;
       public            postgres    false    213            ?           2606    43504    users users_username_key118 
   CONSTRAINT     Z   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key118 UNIQUE (username);
 E   ALTER TABLE ONLY public.users DROP CONSTRAINT users_username_key118;
       public            postgres    false    213            ?           2606    43502    users users_username_key119 
   CONSTRAINT     Z   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key119 UNIQUE (username);
 E   ALTER TABLE ONLY public.users DROP CONSTRAINT users_username_key119;
       public            postgres    false    213            ?           2606    43384    users users_username_key12 
   CONSTRAINT     Y   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key12 UNIQUE (username);
 D   ALTER TABLE ONLY public.users DROP CONSTRAINT users_username_key12;
       public            postgres    false    213            ?           2606    43464    users users_username_key120 
   CONSTRAINT     Z   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key120 UNIQUE (username);
 E   ALTER TABLE ONLY public.users DROP CONSTRAINT users_username_key120;
       public            postgres    false    213            ?           2606    43466    users users_username_key121 
   CONSTRAINT     Z   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key121 UNIQUE (username);
 E   ALTER TABLE ONLY public.users DROP CONSTRAINT users_username_key121;
       public            postgres    false    213            ?           2606    43468    users users_username_key122 
   CONSTRAINT     Z   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key122 UNIQUE (username);
 E   ALTER TABLE ONLY public.users DROP CONSTRAINT users_username_key122;
       public            postgres    false    213            ?           2606    43500    users users_username_key123 
   CONSTRAINT     Z   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key123 UNIQUE (username);
 E   ALTER TABLE ONLY public.users DROP CONSTRAINT users_username_key123;
       public            postgres    false    213            ?           2606    43470    users users_username_key124 
   CONSTRAINT     Z   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key124 UNIQUE (username);
 E   ALTER TABLE ONLY public.users DROP CONSTRAINT users_username_key124;
       public            postgres    false    213            ?           2606    43472    users users_username_key125 
   CONSTRAINT     Z   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key125 UNIQUE (username);
 E   ALTER TABLE ONLY public.users DROP CONSTRAINT users_username_key125;
       public            postgres    false    213            ?           2606    43498    users users_username_key126 
   CONSTRAINT     Z   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key126 UNIQUE (username);
 E   ALTER TABLE ONLY public.users DROP CONSTRAINT users_username_key126;
       public            postgres    false    213            ?           2606    43434    users users_username_key127 
   CONSTRAINT     Z   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key127 UNIQUE (username);
 E   ALTER TABLE ONLY public.users DROP CONSTRAINT users_username_key127;
       public            postgres    false    213            ?           2606    43426    users users_username_key128 
   CONSTRAINT     Z   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key128 UNIQUE (username);
 E   ALTER TABLE ONLY public.users DROP CONSTRAINT users_username_key128;
       public            postgres    false    213            ?           2606    43428    users users_username_key129 
   CONSTRAINT     Z   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key129 UNIQUE (username);
 E   ALTER TABLE ONLY public.users DROP CONSTRAINT users_username_key129;
       public            postgres    false    213            ?           2606    43386    users users_username_key13 
   CONSTRAINT     Y   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key13 UNIQUE (username);
 D   ALTER TABLE ONLY public.users DROP CONSTRAINT users_username_key13;
       public            postgres    false    213            ?           2606    43430    users users_username_key130 
   CONSTRAINT     Z   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key130 UNIQUE (username);
 E   ALTER TABLE ONLY public.users DROP CONSTRAINT users_username_key130;
       public            postgres    false    213            ?           2606    43432    users users_username_key131 
   CONSTRAINT     Z   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key131 UNIQUE (username);
 E   ALTER TABLE ONLY public.users DROP CONSTRAINT users_username_key131;
       public            postgres    false    213            ?           2606    43496    users users_username_key132 
   CONSTRAINT     Z   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key132 UNIQUE (username);
 E   ALTER TABLE ONLY public.users DROP CONSTRAINT users_username_key132;
       public            postgres    false    213            ?           2606    43474    users users_username_key133 
   CONSTRAINT     Z   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key133 UNIQUE (username);
 E   ALTER TABLE ONLY public.users DROP CONSTRAINT users_username_key133;
       public            postgres    false    213                        2606    43494    users users_username_key134 
   CONSTRAINT     Z   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key134 UNIQUE (username);
 E   ALTER TABLE ONLY public.users DROP CONSTRAINT users_username_key134;
       public            postgres    false    213                       2606    43476    users users_username_key135 
   CONSTRAINT     Z   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key135 UNIQUE (username);
 E   ALTER TABLE ONLY public.users DROP CONSTRAINT users_username_key135;
       public            postgres    false    213                       2606    43478    users users_username_key136 
   CONSTRAINT     Z   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key136 UNIQUE (username);
 E   ALTER TABLE ONLY public.users DROP CONSTRAINT users_username_key136;
       public            postgres    false    213                       2606    43492    users users_username_key137 
   CONSTRAINT     Z   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key137 UNIQUE (username);
 E   ALTER TABLE ONLY public.users DROP CONSTRAINT users_username_key137;
       public            postgres    false    213                       2606    43480    users users_username_key138 
   CONSTRAINT     Z   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key138 UNIQUE (username);
 E   ALTER TABLE ONLY public.users DROP CONSTRAINT users_username_key138;
       public            postgres    false    213            
           2606    43490    users users_username_key139 
   CONSTRAINT     Z   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key139 UNIQUE (username);
 E   ALTER TABLE ONLY public.users DROP CONSTRAINT users_username_key139;
       public            postgres    false    213                       2606    43388    users users_username_key14 
   CONSTRAINT     Y   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key14 UNIQUE (username);
 D   ALTER TABLE ONLY public.users DROP CONSTRAINT users_username_key14;
       public            postgres    false    213                       2606    43488    users users_username_key140 
   CONSTRAINT     Z   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key140 UNIQUE (username);
 E   ALTER TABLE ONLY public.users DROP CONSTRAINT users_username_key140;
       public            postgres    false    213                       2606    43482    users users_username_key141 
   CONSTRAINT     Z   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key141 UNIQUE (username);
 E   ALTER TABLE ONLY public.users DROP CONSTRAINT users_username_key141;
       public            postgres    false    213                       2606    43484    users users_username_key142 
   CONSTRAINT     Z   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key142 UNIQUE (username);
 E   ALTER TABLE ONLY public.users DROP CONSTRAINT users_username_key142;
       public            postgres    false    213                       2606    43486    users users_username_key143 
   CONSTRAINT     Z   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key143 UNIQUE (username);
 E   ALTER TABLE ONLY public.users DROP CONSTRAINT users_username_key143;
       public            postgres    false    213                       2606    43588    users users_username_key144 
   CONSTRAINT     Z   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key144 UNIQUE (username);
 E   ALTER TABLE ONLY public.users DROP CONSTRAINT users_username_key144;
       public            postgres    false    213                       2606    43590    users users_username_key145 
   CONSTRAINT     Z   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key145 UNIQUE (username);
 E   ALTER TABLE ONLY public.users DROP CONSTRAINT users_username_key145;
       public            postgres    false    213                       2606    43298    users users_username_key146 
   CONSTRAINT     Z   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key146 UNIQUE (username);
 E   ALTER TABLE ONLY public.users DROP CONSTRAINT users_username_key146;
       public            postgres    false    213                       2606    43592    users users_username_key147 
   CONSTRAINT     Z   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key147 UNIQUE (username);
 E   ALTER TABLE ONLY public.users DROP CONSTRAINT users_username_key147;
       public            postgres    false    213                       2606    43334    users users_username_key15 
   CONSTRAINT     Y   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key15 UNIQUE (username);
 D   ALTER TABLE ONLY public.users DROP CONSTRAINT users_username_key15;
       public            postgres    false    213                        2606    43390    users users_username_key16 
   CONSTRAINT     Y   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key16 UNIQUE (username);
 D   ALTER TABLE ONLY public.users DROP CONSTRAINT users_username_key16;
       public            postgres    false    213            "           2606    43398    users users_username_key17 
   CONSTRAINT     Y   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key17 UNIQUE (username);
 D   ALTER TABLE ONLY public.users DROP CONSTRAINT users_username_key17;
       public            postgres    false    213            $           2606    43400    users users_username_key18 
   CONSTRAINT     Y   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key18 UNIQUE (username);
 D   ALTER TABLE ONLY public.users DROP CONSTRAINT users_username_key18;
       public            postgres    false    213            &           2606    43586    users users_username_key19 
   CONSTRAINT     Y   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key19 UNIQUE (username);
 D   ALTER TABLE ONLY public.users DROP CONSTRAINT users_username_key19;
       public            postgres    false    213            (           2606    43548    users users_username_key2 
   CONSTRAINT     X   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key2 UNIQUE (username);
 C   ALTER TABLE ONLY public.users DROP CONSTRAINT users_username_key2;
       public            postgres    false    213            *           2606    43442    users users_username_key20 
   CONSTRAINT     Y   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key20 UNIQUE (username);
 D   ALTER TABLE ONLY public.users DROP CONSTRAINT users_username_key20;
       public            postgres    false    213            ,           2606    43332    users users_username_key21 
   CONSTRAINT     Y   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key21 UNIQUE (username);
 D   ALTER TABLE ONLY public.users DROP CONSTRAINT users_username_key21;
       public            postgres    false    213            .           2606    43444    users users_username_key22 
   CONSTRAINT     Y   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key22 UNIQUE (username);
 D   ALTER TABLE ONLY public.users DROP CONSTRAINT users_username_key22;
       public            postgres    false    213            0           2606    43448    users users_username_key23 
   CONSTRAINT     Y   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key23 UNIQUE (username);
 D   ALTER TABLE ONLY public.users DROP CONSTRAINT users_username_key23;
       public            postgres    false    213            2           2606    43450    users users_username_key24 
   CONSTRAINT     Y   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key24 UNIQUE (username);
 D   ALTER TABLE ONLY public.users DROP CONSTRAINT users_username_key24;
       public            postgres    false    213            4           2606    43452    users users_username_key25 
   CONSTRAINT     Y   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key25 UNIQUE (username);
 D   ALTER TABLE ONLY public.users DROP CONSTRAINT users_username_key25;
       public            postgres    false    213            6           2606    43330    users users_username_key26 
   CONSTRAINT     Y   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key26 UNIQUE (username);
 D   ALTER TABLE ONLY public.users DROP CONSTRAINT users_username_key26;
       public            postgres    false    213            8           2606    43454    users users_username_key27 
   CONSTRAINT     Y   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key27 UNIQUE (username);
 D   ALTER TABLE ONLY public.users DROP CONSTRAINT users_username_key27;
       public            postgres    false    213            :           2606    43456    users users_username_key28 
   CONSTRAINT     Y   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key28 UNIQUE (username);
 D   ALTER TABLE ONLY public.users DROP CONSTRAINT users_username_key28;
       public            postgres    false    213            <           2606    43512    users users_username_key29 
   CONSTRAINT     Y   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key29 UNIQUE (username);
 D   ALTER TABLE ONLY public.users DROP CONSTRAINT users_username_key29;
       public            postgres    false    213            >           2606    43550    users users_username_key3 
   CONSTRAINT     X   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key3 UNIQUE (username);
 C   ALTER TABLE ONLY public.users DROP CONSTRAINT users_username_key3;
       public            postgres    false    213            @           2606    43328    users users_username_key30 
   CONSTRAINT     Y   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key30 UNIQUE (username);
 D   ALTER TABLE ONLY public.users DROP CONSTRAINT users_username_key30;
       public            postgres    false    213            B           2606    43300    users users_username_key31 
   CONSTRAINT     Y   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key31 UNIQUE (username);
 D   ALTER TABLE ONLY public.users DROP CONSTRAINT users_username_key31;
       public            postgres    false    213            D           2606    43516    users users_username_key32 
   CONSTRAINT     Y   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key32 UNIQUE (username);
 D   ALTER TABLE ONLY public.users DROP CONSTRAINT users_username_key32;
       public            postgres    false    213            F           2606    43302    users users_username_key33 
   CONSTRAINT     Y   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key33 UNIQUE (username);
 D   ALTER TABLE ONLY public.users DROP CONSTRAINT users_username_key33;
       public            postgres    false    213            H           2606    43304    users users_username_key34 
   CONSTRAINT     Y   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key34 UNIQUE (username);
 D   ALTER TABLE ONLY public.users DROP CONSTRAINT users_username_key34;
       public            postgres    false    213            J           2606    43514    users users_username_key35 
   CONSTRAINT     Y   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key35 UNIQUE (username);
 D   ALTER TABLE ONLY public.users DROP CONSTRAINT users_username_key35;
       public            postgres    false    213            L           2606    43544    users users_username_key36 
   CONSTRAINT     Y   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key36 UNIQUE (username);
 D   ALTER TABLE ONLY public.users DROP CONSTRAINT users_username_key36;
       public            postgres    false    213            N           2606    43380    users users_username_key37 
   CONSTRAINT     Y   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key37 UNIQUE (username);
 D   ALTER TABLE ONLY public.users DROP CONSTRAINT users_username_key37;
       public            postgres    false    213            P           2606    43538    users users_username_key38 
   CONSTRAINT     Y   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key38 UNIQUE (username);
 D   ALTER TABLE ONLY public.users DROP CONSTRAINT users_username_key38;
       public            postgres    false    213            R           2606    43366    users users_username_key39 
   CONSTRAINT     Y   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key39 UNIQUE (username);
 D   ALTER TABLE ONLY public.users DROP CONSTRAINT users_username_key39;
       public            postgres    false    213            T           2606    43552    users users_username_key4 
   CONSTRAINT     X   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key4 UNIQUE (username);
 C   ALTER TABLE ONLY public.users DROP CONSTRAINT users_username_key4;
       public            postgres    false    213            V           2606    43368    users users_username_key40 
   CONSTRAINT     Y   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key40 UNIQUE (username);
 D   ALTER TABLE ONLY public.users DROP CONSTRAINT users_username_key40;
       public            postgres    false    213            X           2606    43370    users users_username_key41 
   CONSTRAINT     Y   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key41 UNIQUE (username);
 D   ALTER TABLE ONLY public.users DROP CONSTRAINT users_username_key41;
       public            postgres    false    213            Z           2606    43372    users users_username_key42 
   CONSTRAINT     Y   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key42 UNIQUE (username);
 D   ALTER TABLE ONLY public.users DROP CONSTRAINT users_username_key42;
       public            postgres    false    213            \           2606    43524    users users_username_key43 
   CONSTRAINT     Y   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key43 UNIQUE (username);
 D   ALTER TABLE ONLY public.users DROP CONSTRAINT users_username_key43;
       public            postgres    false    213            ^           2606    43536    users users_username_key44 
   CONSTRAINT     Y   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key44 UNIQUE (username);
 D   ALTER TABLE ONLY public.users DROP CONSTRAINT users_username_key44;
       public            postgres    false    213            `           2606    43526    users users_username_key45 
   CONSTRAINT     Y   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key45 UNIQUE (username);
 D   ALTER TABLE ONLY public.users DROP CONSTRAINT users_username_key45;
       public            postgres    false    213            b           2606    43528    users users_username_key46 
   CONSTRAINT     Y   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key46 UNIQUE (username);
 D   ALTER TABLE ONLY public.users DROP CONSTRAINT users_username_key46;
       public            postgres    false    213            d           2606    43530    users users_username_key47 
   CONSTRAINT     Y   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key47 UNIQUE (username);
 D   ALTER TABLE ONLY public.users DROP CONSTRAINT users_username_key47;
       public            postgres    false    213            f           2606    43532    users users_username_key48 
   CONSTRAINT     Y   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key48 UNIQUE (username);
 D   ALTER TABLE ONLY public.users DROP CONSTRAINT users_username_key48;
       public            postgres    false    213            h           2606    43534    users users_username_key49 
   CONSTRAINT     Y   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key49 UNIQUE (username);
 D   ALTER TABLE ONLY public.users DROP CONSTRAINT users_username_key49;
       public            postgres    false    213            j           2606    43362    users users_username_key5 
   CONSTRAINT     X   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key5 UNIQUE (username);
 C   ALTER TABLE ONLY public.users DROP CONSTRAINT users_username_key5;
       public            postgres    false    213            l           2606    43402    users users_username_key50 
   CONSTRAINT     Y   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key50 UNIQUE (username);
 D   ALTER TABLE ONLY public.users DROP CONSTRAINT users_username_key50;
       public            postgres    false    213            n           2606    43580    users users_username_key51 
   CONSTRAINT     Y   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key51 UNIQUE (username);
 D   ALTER TABLE ONLY public.users DROP CONSTRAINT users_username_key51;
       public            postgres    false    213            p           2606    43542    users users_username_key52 
   CONSTRAINT     Y   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key52 UNIQUE (username);
 D   ALTER TABLE ONLY public.users DROP CONSTRAINT users_username_key52;
       public            postgres    false    213            r           2606    43540    users users_username_key53 
   CONSTRAINT     Y   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key53 UNIQUE (username);
 D   ALTER TABLE ONLY public.users DROP CONSTRAINT users_username_key53;
       public            postgres    false    213            t           2606    43338    users users_username_key54 
   CONSTRAINT     Y   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key54 UNIQUE (username);
 D   ALTER TABLE ONLY public.users DROP CONSTRAINT users_username_key54;
       public            postgres    false    213            v           2606    43340    users users_username_key55 
   CONSTRAINT     Y   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key55 UNIQUE (username);
 D   ALTER TABLE ONLY public.users DROP CONSTRAINT users_username_key55;
       public            postgres    false    213            x           2606    43574    users users_username_key56 
   CONSTRAINT     Y   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key56 UNIQUE (username);
 D   ALTER TABLE ONLY public.users DROP CONSTRAINT users_username_key56;
       public            postgres    false    213            z           2606    43306    users users_username_key57 
   CONSTRAINT     Y   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key57 UNIQUE (username);
 D   ALTER TABLE ONLY public.users DROP CONSTRAINT users_username_key57;
       public            postgres    false    213            |           2606    43556    users users_username_key58 
   CONSTRAINT     Y   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key58 UNIQUE (username);
 D   ALTER TABLE ONLY public.users DROP CONSTRAINT users_username_key58;
       public            postgres    false    213            ~           2606    43558    users users_username_key59 
   CONSTRAINT     Y   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key59 UNIQUE (username);
 D   ALTER TABLE ONLY public.users DROP CONSTRAINT users_username_key59;
       public            postgres    false    213            ?           2606    43554    users users_username_key6 
   CONSTRAINT     X   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key6 UNIQUE (username);
 C   ALTER TABLE ONLY public.users DROP CONSTRAINT users_username_key6;
       public            postgres    false    213            ?           2606    43560    users users_username_key60 
   CONSTRAINT     Y   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key60 UNIQUE (username);
 D   ALTER TABLE ONLY public.users DROP CONSTRAINT users_username_key60;
       public            postgres    false    213            ?           2606    43562    users users_username_key61 
   CONSTRAINT     Y   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key61 UNIQUE (username);
 D   ALTER TABLE ONLY public.users DROP CONSTRAINT users_username_key61;
       public            postgres    false    213            ?           2606    43572    users users_username_key62 
   CONSTRAINT     Y   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key62 UNIQUE (username);
 D   ALTER TABLE ONLY public.users DROP CONSTRAINT users_username_key62;
       public            postgres    false    213            ?           2606    43564    users users_username_key63 
   CONSTRAINT     Y   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key63 UNIQUE (username);
 D   ALTER TABLE ONLY public.users DROP CONSTRAINT users_username_key63;
       public            postgres    false    213            ?           2606    43566    users users_username_key64 
   CONSTRAINT     Y   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key64 UNIQUE (username);
 D   ALTER TABLE ONLY public.users DROP CONSTRAINT users_username_key64;
       public            postgres    false    213            ?           2606    43568    users users_username_key65 
   CONSTRAINT     Y   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key65 UNIQUE (username);
 D   ALTER TABLE ONLY public.users DROP CONSTRAINT users_username_key65;
       public            postgres    false    213            ?           2606    43570    users users_username_key66 
   CONSTRAINT     Y   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key66 UNIQUE (username);
 D   ALTER TABLE ONLY public.users DROP CONSTRAINT users_username_key66;
       public            postgres    false    213            ?           2606    43324    users users_username_key67 
   CONSTRAINT     Y   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key67 UNIQUE (username);
 D   ALTER TABLE ONLY public.users DROP CONSTRAINT users_username_key67;
       public            postgres    false    213            ?           2606    43326    users users_username_key68 
   CONSTRAINT     Y   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key68 UNIQUE (username);
 D   ALTER TABLE ONLY public.users DROP CONSTRAINT users_username_key68;
       public            postgres    false    213            ?           2606    43446    users users_username_key69 
   CONSTRAINT     Y   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key69 UNIQUE (username);
 D   ALTER TABLE ONLY public.users DROP CONSTRAINT users_username_key69;
       public            postgres    false    213            ?           2606    43458    users users_username_key7 
   CONSTRAINT     X   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key7 UNIQUE (username);
 C   ALTER TABLE ONLY public.users DROP CONSTRAINT users_username_key7;
       public            postgres    false    213            ?           2606    43308    users users_username_key70 
   CONSTRAINT     Y   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key70 UNIQUE (username);
 D   ALTER TABLE ONLY public.users DROP CONSTRAINT users_username_key70;
       public            postgres    false    213            ?           2606    43510    users users_username_key71 
   CONSTRAINT     Y   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key71 UNIQUE (username);
 D   ALTER TABLE ONLY public.users DROP CONSTRAINT users_username_key71;
       public            postgres    false    213            ?           2606    43310    users users_username_key72 
   CONSTRAINT     Y   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key72 UNIQUE (username);
 D   ALTER TABLE ONLY public.users DROP CONSTRAINT users_username_key72;
       public            postgres    false    213            ?           2606    43460    users users_username_key73 
   CONSTRAINT     Y   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key73 UNIQUE (username);
 D   ALTER TABLE ONLY public.users DROP CONSTRAINT users_username_key73;
       public            postgres    false    213            ?           2606    43506    users users_username_key74 
   CONSTRAINT     Y   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key74 UNIQUE (username);
 D   ALTER TABLE ONLY public.users DROP CONSTRAINT users_username_key74;
       public            postgres    false    213            ?           2606    43508    users users_username_key75 
   CONSTRAINT     Y   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key75 UNIQUE (username);
 D   ALTER TABLE ONLY public.users DROP CONSTRAINT users_username_key75;
       public            postgres    false    213            ?           2606    43392    users users_username_key76 
   CONSTRAINT     Y   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key76 UNIQUE (username);
 D   ALTER TABLE ONLY public.users DROP CONSTRAINT users_username_key76;
       public            postgres    false    213            ?           2606    43394    users users_username_key77 
   CONSTRAINT     Y   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key77 UNIQUE (username);
 D   ALTER TABLE ONLY public.users DROP CONSTRAINT users_username_key77;
       public            postgres    false    213            ?           2606    43396    users users_username_key78 
   CONSTRAINT     Y   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key78 UNIQUE (username);
 D   ALTER TABLE ONLY public.users DROP CONSTRAINT users_username_key78;
       public            postgres    false    213            ?           2606    43440    users users_username_key79 
   CONSTRAINT     Y   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key79 UNIQUE (username);
 D   ALTER TABLE ONLY public.users DROP CONSTRAINT users_username_key79;
       public            postgres    false    213            ?           2606    43376    users users_username_key8 
   CONSTRAINT     X   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key8 UNIQUE (username);
 C   ALTER TABLE ONLY public.users DROP CONSTRAINT users_username_key8;
       public            postgres    false    213            ?           2606    43436    users users_username_key80 
   CONSTRAINT     Y   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key80 UNIQUE (username);
 D   ALTER TABLE ONLY public.users DROP CONSTRAINT users_username_key80;
       public            postgres    false    213            ?           2606    43438    users users_username_key81 
   CONSTRAINT     Y   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key81 UNIQUE (username);
 D   ALTER TABLE ONLY public.users DROP CONSTRAINT users_username_key81;
       public            postgres    false    213            ?           2606    43424    users users_username_key82 
   CONSTRAINT     Y   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key82 UNIQUE (username);
 D   ALTER TABLE ONLY public.users DROP CONSTRAINT users_username_key82;
       public            postgres    false    213            ?           2606    43416    users users_username_key83 
   CONSTRAINT     Y   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key83 UNIQUE (username);
 D   ALTER TABLE ONLY public.users DROP CONSTRAINT users_username_key83;
       public            postgres    false    213            ?           2606    43418    users users_username_key84 
   CONSTRAINT     Y   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key84 UNIQUE (username);
 D   ALTER TABLE ONLY public.users DROP CONSTRAINT users_username_key84;
       public            postgres    false    213            ?           2606    43420    users users_username_key85 
   CONSTRAINT     Y   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key85 UNIQUE (username);
 D   ALTER TABLE ONLY public.users DROP CONSTRAINT users_username_key85;
       public            postgres    false    213            ?           2606    43422    users users_username_key86 
   CONSTRAINT     Y   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key86 UNIQUE (username);
 D   ALTER TABLE ONLY public.users DROP CONSTRAINT users_username_key86;
       public            postgres    false    213            ?           2606    43582    users users_username_key87 
   CONSTRAINT     Y   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key87 UNIQUE (username);
 D   ALTER TABLE ONLY public.users DROP CONSTRAINT users_username_key87;
       public            postgres    false    213            ?           2606    43584    users users_username_key88 
   CONSTRAINT     Y   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key88 UNIQUE (username);
 D   ALTER TABLE ONLY public.users DROP CONSTRAINT users_username_key88;
       public            postgres    false    213            ?           2606    43522    users users_username_key89 
   CONSTRAINT     Y   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key89 UNIQUE (username);
 D   ALTER TABLE ONLY public.users DROP CONSTRAINT users_username_key89;
       public            postgres    false    213            ?           2606    43378    users users_username_key9 
   CONSTRAINT     X   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key9 UNIQUE (username);
 C   ALTER TABLE ONLY public.users DROP CONSTRAINT users_username_key9;
       public            postgres    false    213            ?           2606    43520    users users_username_key90 
   CONSTRAINT     Y   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key90 UNIQUE (username);
 D   ALTER TABLE ONLY public.users DROP CONSTRAINT users_username_key90;
       public            postgres    false    213            ?           2606    43374    users users_username_key91 
   CONSTRAINT     Y   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key91 UNIQUE (username);
 D   ALTER TABLE ONLY public.users DROP CONSTRAINT users_username_key91;
       public            postgres    false    213            ?           2606    43312    users users_username_key92 
   CONSTRAINT     Y   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key92 UNIQUE (username);
 D   ALTER TABLE ONLY public.users DROP CONSTRAINT users_username_key92;
       public            postgres    false    213            ?           2606    43518    users users_username_key93 
   CONSTRAINT     Y   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key93 UNIQUE (username);
 D   ALTER TABLE ONLY public.users DROP CONSTRAINT users_username_key93;
       public            postgres    false    213            ?           2606    43314    users users_username_key94 
   CONSTRAINT     Y   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key94 UNIQUE (username);
 D   ALTER TABLE ONLY public.users DROP CONSTRAINT users_username_key94;
       public            postgres    false    213            ?           2606    43316    users users_username_key95 
   CONSTRAINT     Y   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key95 UNIQUE (username);
 D   ALTER TABLE ONLY public.users DROP CONSTRAINT users_username_key95;
       public            postgres    false    213            ?           2606    43318    users users_username_key96 
   CONSTRAINT     Y   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key96 UNIQUE (username);
 D   ALTER TABLE ONLY public.users DROP CONSTRAINT users_username_key96;
       public            postgres    false    213            ?           2606    43320    users users_username_key97 
   CONSTRAINT     Y   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key97 UNIQUE (username);
 D   ALTER TABLE ONLY public.users DROP CONSTRAINT users_username_key97;
       public            postgres    false    213            ?           2606    43322    users users_username_key98 
   CONSTRAINT     Y   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key98 UNIQUE (username);
 D   ALTER TABLE ONLY public.users DROP CONSTRAINT users_username_key98;
       public            postgres    false    213            ?           2606    43342    users users_username_key99 
   CONSTRAINT     Y   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key99 UNIQUE (username);
 D   ALTER TABLE ONLY public.users DROP CONSTRAINT users_username_key99;
       public            postgres    false    213            ?           2606    43276 (   blog_contents blog_contents_blog_id_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public.blog_contents
    ADD CONSTRAINT blog_contents_blog_id_fkey FOREIGN KEY (blog_id) REFERENCES public.blogs(id) ON UPDATE CASCADE ON DELETE SET NULL;
 R   ALTER TABLE ONLY public.blog_contents DROP CONSTRAINT blog_contents_blog_id_fkey;
       public          postgres    false    211    3244    217            ?           2606    43598    blogs blogs_user_id_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public.blogs
    ADD CONSTRAINT blogs_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE SET NULL;
 B   ALTER TABLE ONLY public.blogs DROP CONSTRAINT blogs_user_id_fkey;
       public          postgres    false    3246    213    211            ?           2606    43281    comments comments_blog_id_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_blog_id_fkey FOREIGN KEY (blog_id) REFERENCES public.blogs(id) ON UPDATE CASCADE ON DELETE SET NULL;
 H   ALTER TABLE ONLY public.comments DROP CONSTRAINT comments_blog_id_fkey;
       public          postgres    false    219    3244    211            ?           2606    43593    comments comments_user_id_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE SET NULL;
 H   ALTER TABLE ONLY public.comments DROP CONSTRAINT comments_user_id_fkey;
       public          postgres    false    219    3246    213            ?           2606    43286 (   reading_lists reading_lists_blog_id_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public.reading_lists
    ADD CONSTRAINT reading_lists_blog_id_fkey FOREIGN KEY (blog_id) REFERENCES public.blogs(id) ON UPDATE CASCADE ON DELETE CASCADE;
 R   ALTER TABLE ONLY public.reading_lists DROP CONSTRAINT reading_lists_blog_id_fkey;
       public          postgres    false    3244    215    211            ?           2606    43267 (   reading_lists reading_lists_user_id_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public.reading_lists
    ADD CONSTRAINT reading_lists_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE CASCADE;
 R   ALTER TABLE ONLY public.reading_lists DROP CONSTRAINT reading_lists_user_id_fkey;
       public          postgres    false    213    3246    215            x      x?????? ? ?      r   ?   x??ѻ
? ??Y???"^S?#t??Es?V?!oߤY?4?A??'2t??s#????k?wh??<??m?ô?][???S.2?2?+???Q"?????Q??j[l???0?#???(v,?%MG(???0Z??a?"?????cY?4FĀ?!XSͨg??_K?9#???*?-??Zp-??/ږ??N0?o????      z      x?????? ? ?      p   $   x?32026040?70??*?2?s???P?=... ?
?      v   j   x????? ??s;ؔW?N??	??B??&<6???@FAa??E? ?}?R??<I?d??????? ׾U?t? OJU????H???????7z?&?|[)      t   ?   x?}?K
?0??q??l?ps?3???Y??D??Wn1???W
?b???S?@???hCts`?iڷ??FY??0M@%?U]?LI?z????Ʌ??6?g?????C?˼??D2Y`?I?'?Y\?EC?h??K[??eKT?? ?I?????I?,9?z?J?     