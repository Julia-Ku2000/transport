INSERT INTO public.m_users (id, username, surname, patronymic, email, password, active, passport_series_number, date_of_birth, registration_address) VALUES (1, 'admin', 'admin', 'admin', 'admin@gmail.com', '123456', true, 'ab3634345', '2020-12-09', 'admin 45-75');
INSERT INTO public.m_roles (id, user_id, role_name) VALUES (1, 1, 'ROLE_ADMIN');
