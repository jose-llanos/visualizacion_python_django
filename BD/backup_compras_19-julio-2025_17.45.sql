PGDMP       .                }            compras    17.2 (Debian 17.2-1.pgdg120+1)    17.4     =           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                           false            >           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                           false            ?           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                           false            @           1262    16388    compras    DATABASE     r   CREATE DATABASE compras WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.utf8';
    DROP DATABASE compras;
                     postgres    false            �            1255    43033    rellenar_datos()    FUNCTION     �   CREATE FUNCTION public.rellenar_datos() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
declare
begin
	NEW.cuadrado := power(NEW.numero, 2);
	NEW.cubo := power(NEW.numero, 3);
	NEW.raiz := sqrt(NEW.numero);
	return NEW;
end;
$$;
 '   DROP FUNCTION public.rellenar_datos();
       public               postgres    false            �            1259    16389    ciudades    TABLE     �   CREATE TABLE public.ciudades (
    id_ciudad smallint NOT NULL,
    ciudad character varying(30) NOT NULL,
    estado character(1) NOT NULL
);
    DROP TABLE public.ciudades;
       public         heap r       postgres    false            A           0    0    TABLE ciudades    ACL     1   GRANT SELECT ON TABLE public.ciudades TO prueba;
          public               postgres    false    221            �            1259    16392    clientes    TABLE     I  CREATE TABLE public.clientes (
    id_cliente bigint NOT NULL,
    id_ciudad smallint NOT NULL,
    nombres character varying(50) NOT NULL,
    apellidos character varying(50) NOT NULL,
    direccion character varying(100),
    telefono character varying(10),
    email character varying(70),
    estado character(1) NOT NULL
);
    DROP TABLE public.clientes;
       public         heap r       postgres    false            B           0    0    TABLE clientes    ACL     1   GRANT SELECT ON TABLE public.clientes TO prueba;
          public               postgres    false    222            �            1259    16395    compras    TABLE     �   CREATE TABLE public.compras (
    id_compra integer NOT NULL,
    id_cliente bigint NOT NULL,
    id_ciudad smallint NOT NULL,
    subtotal numeric(10,2) NOT NULL,
    iva numeric(10,2),
    total numeric(10,2)
);
    DROP TABLE public.compras;
       public         heap r       postgres    false            C           0    0    TABLE compras    ACL     0   GRANT SELECT ON TABLE public.compras TO prueba;
          public               postgres    false    223            �            1259    43040    numeros    TABLE     �   CREATE TABLE public.numeros (
    numero integer NOT NULL,
    cuadrado numeric(10,2),
    cubo numeric(10,2),
    raiz numeric(10,2)
);
    DROP TABLE public.numeros;
       public         heap r       postgres    false            7          0    16389    ciudades 
   TABLE DATA           =   COPY public.ciudades (id_ciudad, ciudad, estado) FROM stdin;
    public               postgres    false    221   m       8          0    16392    clientes 
   TABLE DATA           q   COPY public.clientes (id_cliente, id_ciudad, nombres, apellidos, direccion, telefono, email, estado) FROM stdin;
    public               postgres    false    222   �       9          0    16395    compras 
   TABLE DATA           Y   COPY public.compras (id_compra, id_cliente, id_ciudad, subtotal, iva, total) FROM stdin;
    public               postgres    false    223   �       :          0    43040    numeros 
   TABLE DATA           ?   COPY public.numeros (numero, cuadrado, cubo, raiz) FROM stdin;
    public               postgres    false    224   B       �           2606    16399    ciudades ciudad_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY public.ciudades
    ADD CONSTRAINT ciudad_pkey PRIMARY KEY (id_ciudad);
 >   ALTER TABLE ONLY public.ciudades DROP CONSTRAINT ciudad_pkey;
       public                 postgres    false    221            �           2606    16401    clientes clientes_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.clientes
    ADD CONSTRAINT clientes_pkey PRIMARY KEY (id_cliente);
 @   ALTER TABLE ONLY public.clientes DROP CONSTRAINT clientes_pkey;
       public                 postgres    false    222            �           2606    16403    compras compras_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY public.compras
    ADD CONSTRAINT compras_pkey PRIMARY KEY (id_compra);
 >   ALTER TABLE ONLY public.compras DROP CONSTRAINT compras_pkey;
       public                 postgres    false    223            �           2606    43044    numeros numeros_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.numeros
    ADD CONSTRAINT numeros_pkey PRIMARY KEY (numero);
 >   ALTER TABLE ONLY public.numeros DROP CONSTRAINT numeros_pkey;
       public                 postgres    false    224            �           2620    43045    numeros rellenar_datos    TRIGGER        CREATE TRIGGER rellenar_datos BEFORE INSERT OR UPDATE ON public.numeros FOR EACH ROW EXECUTE FUNCTION public.rellenar_datos();
 /   DROP TRIGGER rellenar_datos ON public.numeros;
       public               postgres    false    225    224            �           2606    16404    clientes fk_clientes_ciudades    FK CONSTRAINT     �   ALTER TABLE ONLY public.clientes
    ADD CONSTRAINT fk_clientes_ciudades FOREIGN KEY (id_ciudad) REFERENCES public.ciudades(id_ciudad) NOT VALID;
 G   ALTER TABLE ONLY public.clientes DROP CONSTRAINT fk_clientes_ciudades;
       public               postgres    false    3227    221    222            �           2606    16409    compras fk_compras_ciudad    FK CONSTRAINT     �   ALTER TABLE ONLY public.compras
    ADD CONSTRAINT fk_compras_ciudad FOREIGN KEY (id_ciudad) REFERENCES public.ciudades(id_ciudad) NOT VALID;
 C   ALTER TABLE ONLY public.compras DROP CONSTRAINT fk_compras_ciudad;
       public               postgres    false    3227    223    221            �           2606    16414    compras fk_compras_clientes    FK CONSTRAINT     �   ALTER TABLE ONLY public.compras
    ADD CONSTRAINT fk_compras_clientes FOREIGN KEY (id_cliente) REFERENCES public.clientes(id_cliente) NOT VALID;
 E   ALTER TABLE ONLY public.compras DROP CONSTRAINT fk_compras_clientes;
       public               postgres    false    222    223    3229            7   S   x�3��K�,K�t�2�tO,�:�9�6�tN��2L8����K/�M9}SSRsr�)1�t�,H28�JS�@f��qqq ��<      8     x����n�0���+����8ή�D�]uS�n0rb�P��}M�V��/�w��r��zo����t��A\��@��9JPL�TR38�0�c��n��tXd"B�����w3榅�@	�Lk�X&'z�[����0f�6eg��{.�mxp{��0aňU*�H�%Br����AE�6��k��9�۱��xY�΁�+��(u������6���
�ֻ����~����Δ�\�|�f��	μw�e�7��.      9   O   x�m���0C�x���]��͏�R|𓞅����+�~��PׄL��}��J�3�صM8?�K�K~>�E��fX�      :   9   x�3�42�30�4�PFzF&\���`!�e�ib[@L��9-���!"��\1z\\\ ���     