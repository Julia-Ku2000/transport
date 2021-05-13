create table m_users
(
    id bigserial not null
        constraint m_users_pk
            primary key,
    username varchar(200) not null,
    surname varchar(200) not null,
    patronymic varchar(200) not null,
    email varchar(100) not null,
    password varchar(200) not null,
    active boolean default true not null,
    passport_series_number varchar(9) not null,
    date_of_birth date not null,
    registration_address varchar(300) not null
);

alter table m_users owner to t_admin;

create unique index m_users_id_uindex
	on m_users (id);

create unique index m_users_email_uindex
	on m_users (email);

create table m_roles
(
    id bigserial not null
        constraint m_roles_pk
            primary key,
    user_id bigint not null
        constraint m_roles_m_users_id_fk
            references m_users
            on update cascade on delete cascade,
    role_name varchar(20) not null
);

alter table m_roles owner to t_admin;

create unique index m_roles_id_uindex
	on m_roles (id);

create table m_routes
(
    id bigserial not null
        constraint m_routes_pk
            primary key,
    date_of_setup_route date not null,
    last_change_date date not null,
    user_id bigint not null
        constraint m_routes_m_users_id_fk
            references m_users,
    confirmed boolean default false not null,
    type_of_transport varchar(700) not null,
    remark varchar(500),
    start_point varchar(200),
    direction varchar(200),
    endpoint varchar(200),
    number_of_stops varchar(200)
);

alter table m_routes owner to t_admin;

create unique index m_routes_id_uindex
	on m_routes (id);

create table m_transport_registration_forms
(
    id bigserial not null
        constraint m_transport_registration_forms_id_uindex_2
            primary key,
    car_license_plate varchar(100) not null,
    car_brand varchar(100) not null,
    win_number varchar(200) not null,
    user_id bigint not null
        constraint m_transport_registration_forms_m_users_id_fk
            references m_users,
    date_of_conclusion date not null,
    length_of_a_contract date,
    confirmed boolean default false not null,
    driver_license_number varchar(100) not null,
    date_of_first_trip date not null,
    remark varchar(500)
);

alter table m_transport_registration_forms owner to t_admin;

create unique index m_transport_registration_forms_id_uindex
	on m_transport_registration_forms (id);

create table m_drivers
(
    id bigserial not null
        constraint m_drivers_pk
            primary key,
    date_of_conclusion date not null,
    length_of_a_contract date not null,
    user_id bigint not null
        constraint m_drivers_m_users_id_fk
            references m_users,
    no_experience boolean default false,
    experience_from_one_to_three boolean default false not null,
    full_name varchar(500) not null,
    experience_more_than_three boolean default false not null,
    confirmed boolean default false not null,
    remark varchar(500),
    driver_license_number varchar(200)
);

alter table m_drivers owner to t_admin;

create unique index m_drivers_id_uindex
	on m_drivers (id);

