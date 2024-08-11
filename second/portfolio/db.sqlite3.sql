PRAGMA foreign_keys = off;
BEGIN TRANSACTION;

-- �������: auth_group
CREATE TABLE IF NOT EXISTS "auth_group" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "name" varchar(150) NOT NULL UNIQUE);

-- �������: auth_group_permissions
CREATE TABLE IF NOT EXISTS "auth_group_permissions" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "group_id" integer NOT NULL REFERENCES "auth_group" ("id") DEFERRABLE INITIALLY DEFERRED, "permission_id" integer NOT NULL REFERENCES "auth_permission" ("id") DEFERRABLE INITIALLY DEFERRED);

-- �������: auth_permission
CREATE TABLE IF NOT EXISTS "auth_permission" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "content_type_id" integer NOT NULL REFERENCES "django_content_type" ("id") DEFERRABLE INITIALLY DEFERRED, "codename" varchar(100) NOT NULL, "name" varchar(255) NOT NULL);
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (1, 1, 'add_logentry', 'Can add log entry');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (2, 1, 'change_logentry', 'Can change log entry');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (3, 1, 'delete_logentry', 'Can delete log entry');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (4, 1, 'view_logentry', 'Can view log entry');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (5, 2, 'add_permission', 'Can add permission');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (6, 2, 'change_permission', 'Can change permission');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (7, 2, 'delete_permission', 'Can delete permission');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (8, 2, 'view_permission', 'Can view permission');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (9, 3, 'add_group', 'Can add group');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (10, 3, 'change_group', 'Can change group');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (11, 3, 'delete_group', 'Can delete group');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (12, 3, 'view_group', 'Can view group');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (13, 4, 'add_user', 'Can add user');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (14, 4, 'change_user', 'Can change user');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (15, 4, 'delete_user', 'Can delete user');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (16, 4, 'view_user', 'Can view user');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (17, 5, 'add_contenttype', 'Can add content type');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (18, 5, 'change_contenttype', 'Can change content type');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (19, 5, 'delete_contenttype', 'Can delete content type');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (20, 5, 'view_contenttype', 'Can view content type');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (21, 6, 'add_session', 'Can add session');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (22, 6, 'change_session', 'Can change session');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (23, 6, 'delete_session', 'Can delete session');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (24, 6, 'view_session', 'Can view session');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (25, 7, 'add_skills', 'Can add skills');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (26, 7, 'change_skills', 'Can change skills');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (27, 7, 'delete_skills', 'Can delete skills');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (28, 7, 'view_skills', 'Can view skills');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (29, 8, 'add_blog', 'Can add blog');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (30, 8, 'change_blog', 'Can change blog');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (31, 8, 'delete_blog', 'Can delete blog');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (32, 8, 'view_blog', 'Can view blog');

-- �������: auth_user
CREATE TABLE IF NOT EXISTS "auth_user" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "password" varchar(128) NOT NULL, "last_login" datetime NULL, "is_superuser" bool NOT NULL, "username" varchar(150) NOT NULL UNIQUE, "last_name" varchar(150) NOT NULL, "email" varchar(254) NOT NULL, "is_staff" bool NOT NULL, "is_active" bool NOT NULL, "date_joined" datetime NOT NULL, "first_name" varchar(150) NOT NULL);
INSERT INTO auth_user (id, password, last_login, is_superuser, username, last_name, email, is_staff, is_active, date_joined, first_name) VALUES (1, 'pbkdf2_sha256$720000$yqhPddbd9p5m5UcJW8cJBU$eqpkVRhKfJntkCSAtrV4ZKT86coK3SHszAPg92x0P6w=', '2024-07-20 13:17:48.596984', 1, 'admin', '', 'admin@localhost', 1, 1, '2024-07-20 13:17:03.132060', '');

-- �������: auth_user_groups
CREATE TABLE IF NOT EXISTS "auth_user_groups" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "user_id" integer NOT NULL REFERENCES "auth_user" ("id") DEFERRABLE INITIALLY DEFERRED, "group_id" integer NOT NULL REFERENCES "auth_group" ("id") DEFERRABLE INITIALLY DEFERRED);

-- �������: auth_user_user_permissions
CREATE TABLE IF NOT EXISTS "auth_user_user_permissions" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "user_id" integer NOT NULL REFERENCES "auth_user" ("id") DEFERRABLE INITIALLY DEFERRED, "permission_id" integer NOT NULL REFERENCES "auth_permission" ("id") DEFERRABLE INITIALLY DEFERRED);

-- �������: blog_blog
CREATE TABLE IF NOT EXISTS "blog_blog" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "title" varchar(200) NOT NULL, "description" text NOT NULL, "date" date NOT NULL);
INSERT INTO blog_blog (id, title, description, date) VALUES (1, '¸����� �� HTML5', '<p>XHTML ������ �������� ��� �������� � ������������� ���������� ������ ������ ��������� ����� ���������� �������� � ����� �������, �� ��������� � HTML ����������. ������ �� ������ ��� ��������� �� ��� ������� XHTML �������� ������� � ��� �� ������������� ����������� ��������. � ���������, ��� ������� ������� ��� ������������ ����� � ������������, ��� ��������� ����������, ����������� �������� ��������������� � ��������, �� ������� ��������� ��������� ���� � ����� �������. �������, ����� ���� ������� ����� �������� ����� ��������� ������� � ��������, ��������, Adobe Flash ������������� �����, Google Gears ��������� ��������� ���� ������ � ������ �������� � ������� ������. ���� ���������������� JavaScript ��������� ����������� ����������� ���������� ���� � ��������� ������� �� ��������. �� ��� ��� ���������� ����� ����������� ����������� � ������� ����� ������������� �������������, ��� ���� ��� ����� �� ��������, ��� Flash �� iPhone � iPad, ������ �� �� ����� � JavaScript. ������������ ��������� ���������, �������� ������� ����� ����������� ������ ���-���������� �� �����������, �.�. ��������������� ���������� ����� � �����, � ����� ��������������� ������. ������ ����� � XHTML ���.</p>



<p>W3 Consortium, ����������� ������������ HTML � XHTML, ����� �������� ��� XHTML 2.0, � ������� ��������� ���������� ���������� ������ �� ����������. � ���������� ���� ������ �������� ������������ � �� ��������. ������������� ��������� ����� ����� ������������ ��������� Safari, Firefox � Opera �������� ���� ����������� ����������� WHATWG (Web Hypertext Application Technology Working Group, ������� ������ �� ���������� �������������� ���������� ���������), ������� ���������� ������� �����. ���� W3C, ����������� ����������� ������������� � ������ ���-������������� ����������� � ����� ����� �������� ��������� HTML5.</p>



<p>������� ��������, ���, �������� �� �������� ��������, HTML5 �� �������� ������������ HTML4 ��� XHTML. ������ ���� ��� � ����� ����� Web Applications 1.0, ������� � ������������� ����� ������ �������� ������������� � �������� �� ���� HTML.</p>



<p>���������� �������� HTML5 ��� �� ��������, �� ����������� �������� ��� ����� �������� � ��� ��������. ����, ��� �� ����������� ��� ��� HTML5? ��� ��������� ��� �����������.</p>



<ul>

	<li>��������� ���������� � ����������� �������������� ������������ �� ����� � ������������� ���� ���������� ��� ���������� �������� ��� ��������, ������ ����������� ���������, �����������, ���� � ������ ������.</li>

<li>��������������� ������������.</li>

<li>��������������� �����������.</li>

<li>��������� ��������� � ��������� ������ ��������� ���������� �� ��������� ���������� � ���������� � ��� �����.</li>

<li>������� ���������� � ����������� ������ ������� JavaScript � �������� � ������� ������.</li>

<li>����������� ���������� � ��������, ������� ����� �������� ��� ���������� ���������.</li>

<li>��������� � ������ ���� canvas � ������� JavaScript ����� �������� ������, �����, ��������� ��������� � ���������������� ������� �� ����.</li>

<li>����� �������� ����: ��� ����, �������, ������, �����, ������ ����� � ��.</li>

</ul>

<p>����� ���� ������������ � HTML5 �������� ����� ���� ��� �������� ���������, ��������� ���������� ���� � �������������� ��������� ������. ��� ������ ���-������� � ������ ������� ���������� ������, ��� ���������� � ��� ��������� �������� �� HTML5.</p>', '2024-06-10');
INSERT INTO blog_blog (id, title, description, date) VALUES (2, '������� ����������������', '<p>����� �� ����� � �� ��������, ��� ����� ����������������� � ��� ����� ����������. ������ ��� ������������, ������ ��� ����� �� ���� � ������ ��� ����� �����.</p>



<p>������� � ������������ � �������� � �� ��� � �������������� ������������ ������� �����������: ����������������� � ��� ��������� ������ ���������� ��� ����������. � ��, ����������� ������� ������ �����, ����������� ������� ��������� ����������, ��������� ���� � ������� �����������, ������� ������������ � ������� ��� ������������� � ���������� ��������� � ����� �������.</p>



<p>��������� �������� ������� ���������������� � ����������� ������� ���������� ��������� � ������� ���������, ������� �������� ��� ��������� �������� ���������������� ����� ������.

(���������� ������ ��������� �������� �������� � ��������� ������� � ��������.)</p>



<h4>�������� �����:</h4>

<ul>

<li>�� ��� �������������� �� �� 100 ��� ����� ���� ��������� ������, ��� �������� �� �����, �� ����� ����� ������ �������� ������� ������ �������.</li>

<li>� ����� �� ����� 100 ��� ������ ������ ���?</li>

<li>����� ���� ���������������� ����� �������� �� ��� �����: ����� ����� ��������������� ����������, ������� ������ ���� ������, � ������� �����, �������, � ��������, ����� ���� ������ � �������� ���� ��������������� ����������. � ������, ��� ��������������� ��������� � ��� ����� ������ ������, �������� �� ��������� ����� � ������������ �����������. �� ��������� ����� ��������.</li>

<li>����� ���������������� � ��� �� ����������, � ������ ������ �� �������������� �������. � ������� ����������� ������� ��������� ��� ����������.</li>

<li>���� ������ ���� ����������, ����� 100 ��� ���������� ������ � 74 ������������ ��� �������.</li>

<li>������� ������������� ����������� ����� ������ � ��� ������������������. � ����������� ������������������ � ������� ��� ����� ��������� ��������������� ����� ���������.</li>

<li>����� �� ���������� �� ��������?</li>

<li>����� �� ���������� �� ����� ��� ���������������� ���� ������?</li>

<li>����� ��� ��� ������������ ������� ����� ����, �� ������� ����� ���������� � � ������������ �������� ��������� ������, ���������� ������������ ���������� ������ ���������. �� ������� ����, ��� ��� ����� ������� � ����������� ��������. ��� ������, ��� �� ����� ����, �� ������� ����� ���������������.</li>

<li>����������� �� ����� ������������� � ���������� ����� ��� ���.</li>

<li>������ ������ �������� ��������� ����, ������� ����� ������������� ��� ������������� ����� ��� ���.</li>

<li>���� �� �� �������� ���� ���������������� ��������, ����� �� �� ������������ ���?</li>', '2024-07-25');
INSERT INTO blog_blog (id, title, description, date) VALUES (3, '99,9 % ���������� � ��� ���������� ����������', '<p>��� �� ��� �� ������� �� ������ CRM, ����� ���� �������� ������ ������ ��������� ������ ������������� ������ �� ����� ������� ����� ����������� �������������� �������������. ���� ������ ���� � ���, ��� �� ���������� ����������� ������� ��������� �� 10 ����� ����� �������� 2500 ������ ������� ������������� ������. ��, � ���� �������, ����� ����������� ����� ������������� �� ������������� ��������������, � ������ ��� ��� ����������� ������� ������� ������� � ������� �� �������� ����������.</p>



<p>������������ ������ ������ ����� ��, ��� ��� ��� ������� ����������� ������� � Excel � ���� ������ � ���������� ���������� ��� ������� ������� � ������ ������������ �������� �� �������, ������� ��� ������� ������� �����������. ����� ���� ���� ����������� � ������������� ���������, ������� �������� ��� � ������� � ��� ��� ���� �������� ���������: ������� �� ����������� ��������� ������, � ����� ������� � ������� ������� ��������� ��� ���� ������ � ���������, ��� ��������� �� �� � ������ ������������� � �������� �� �������������, ������� ��������������� �����. ��� ���� ������ � ��������� ������� ��� �� ������ �� �����-�� ������������� ������������. ���� ��������� �����������-�������� � ������������ ��� ����������� � ������� ������� ���, ������� � ������� ������������. </p>



<p>������������� ��������� ���� ������ ���������� ������������ �������� � �������������� ������� �������� �� �� ������. � ����� ��� ������������ �������� � ������ ������������ �� ������������ ������� ������� ���� � ������� ���� � ������ ����� ����� ������ �� ��������. ��������� �������� ��������� � ��, ��� � �������� ��������� ���� �������� ������������� ������� ���������� � �������� ��������� ��� ��������������� � ������������� ������������� ��� ����� �������������� ����������� �������������.</p>



<p>�������� �������� ���������, ��������������� ������������� � ����� ������� �������������. ��� ��� ��������� ��� ������ ���� � ���������, ��� �������������� ��������������� IT ��� ������ ��������. � �������������� ��� ������� � �������� ����� ��� ��������� ���� ��������� � ������ ��������� ���������� � ��������� ��� ���� ��������.</p>



<p>� �����, ������� ����� �� ������, �� ������������ ����� ������ � ��������, ��� ����������� �� ����� ����� � �������� ������� �������������. ������ ����������� ���������� �������� ��, �������, ��������� ��� ������ � ���� ��� ����� � ��������. ����� ���������� ������ ������ �� 12 ����� � �����, �� ������ ���� �� �������� � ����� ��������� ����� �������.</p>



<p>���� ��� ������ � ��������, � �� ���������� � ������ ������� � ������� �������. ��� ����� ��� ��� �� ����� ������� � ������� ������ ���������� ������ �� ����� �� ��������� �������, ������� ������ ��������� ������� � ���� �� ��� �������� �� ������� ��������� ������.</p>  



<p>� ��� �������� �������, � � ����� ������� ���� ��������� ������� ����������� ����� ��� ������ �� ������� ������������ �������� �������. ��� ���, ��� ��������� ���� ��������� ����� ������� � ����������� ������ �� �������� ������, ��������� ���� � ����� ������ ����� �� ������ � ������ �� �����������.</p>



<p>�� �������� ������� ��� ������� ������ ������ � ������ ������� ������� ������������ �� ����. � ���������� �������� ����������� � ������������ IT-������, ������������ ��������� ��� ����� ������� �������. ����������� � ���, � �����, ��� ������� �� ����� ���� �������� ������������ �������. ��� �������� �� � �������� �������� �������� �� �������� ����� � �� ����� ����������, �����, ��� ��� ���� ����, �� ����� � ������. ������� ��� ���������: �������������� ���� � ��������� ��� ������.</p>



<p>����� ����� ��� ������� ��������� ���� ����� � ������, �� ������� ��������� ������ ���������� Excel, ��������� ���� � Microsoft Access � ������� ��� ��� ������. ������, �������������� �� ��������, ���� ������������ �� ��������� ����� ����� �����. �������� �, �� ������ ���� �� ��������� ��������. ����������� ��������� IT-�������������, ������, ���, ���� ����� ����� ������� ������, �� ����� ��������� ������ � ������ ���� �������.</p>



<p>�� ���� ��� �������� ������ �����, �� ���������, �������� ���� � ��� ������������� � ������� ��� ���� ������ ������. ���������� ���������� ���� ���������� ������ ������ ���� ����� ��� �������������.</p>



<p>������� �����, ���� �������, ��� ����������� ���������� ������� ����� ���� ���� ������� � ��������� ������ � �������: � ����� ��� ������� � ������ �� �������� ������ � �������� �� ������ ��������� � ������������ ������ ������������� ������-�������������� �������.</p>



<p>� �� �� ��� ��� ������, ��� ��� ������ � ������ �������� � ��� ������� � �������� �����, �� ������� ���� ������ �� ��������. ��� ��, �� ���� �������� � ����� �������: �99,9% ��������� ���������� � ��� ���������� ����������. ����� �� �� ������ � ��� ������ �� ������� �� � ������, ������ ������� ��� ������� � ������ � �������� ���� �� 100%.</p>', '2024-06-15');
INSERT INTO blog_blog (id, title, description, date) VALUES (4, '����� ����� �������������� ������������', '<p>������������. � ������� � �������� CardSec �, � ���������, �� ���������� ���, ��� �������� ����� �������� ���������� � ������� �� �������������� ������������ � �������� ��� ������.</p>



<p>������� �������� �������� � ��� ��� ����, ����� �������� ���������� �� �������������� ������������, ����������� ��� ���������� �����-�� ������� ������ ��� ��������� ����������, � ����������� ���������� �� ������ � ����, ��� ����������� �� ������������ ����� ����������� ������ ��� ��������� ��������� � ����������� �������. � ��������� ������� � ��� �������� � ��������, ����� ������� �� ����� � ����� ������������� ����������, �� � ��� ����������� �� �� �� ����� ������� �����-���� ������ ��� ���� ���.</p>



<p>�������� ��� �������� ��������� ��� ������ �������, � ���� �������� ���������� ���������� � �����������.</p>



<p>����� ����, ��� ��������� ����� ������������ ������������ ������������ ���������� �������� ������������ � � ��� ������������ ������ ������ ������������ � ����������� ��� �������� ����� �� �����.</p>



<p>��� ����, ����� �� ������� � ����� ������� ��������, ����� ��������� � ����� ������, ��� ������������ ����������� �� ������������ ����� ���� ��� ������ ������������, � ����� ��������� � ������� ��� ����� ������. � ��������� ��� ������ ��� ������������ roadmap �������� � ����������� ��������� ������ �������.</p>



<h4>���������</h4>



<ul>

<li>�� ���� ��� ������� �� � ������� ��� ����� ������</li>

<li>����� ���������� ����, ��� ���� ��� ���������</li>

<li>�������: ��������������� ����� �� ����� � �����. ��� ��������� roadmap, � ����� ������ � ��������� ����� ���������������</li>

<li>�� �����: ����� ���-���-���. ��� ����� ��� ������������</li>

</ul>', '2024-07-01');
INSERT INTO blog_blog (id, title, description, date) VALUES (5, '��� ����� JavaScript. ������� �������� � �����������', '<p>������� ���� �� JavaScript, ����� ������ �������� ������������ ������������� ������ ����������. � ������ ������ �� ������� ������������ �� ����.</p>



<p><b>��� ����� JavaScript</b> � ��� ���������������� ���� ���������������� (��������� �����, �������������� �������� ��������� ������������� ���� �� ������ � ����� ����������� � ����������������), ���� �������� �����, ��������� ���������� �� JavaScript �������� ��� ��� ��� � ��������, ������������� ���������������. ������ ���� ����� ��������� �����������, ����������� ������������� ������������ ���������, ������ ������� JavaScript ������������ ��� �������� ���-������ � ���������� �������������, ������������ �������. ���� ������������� �������, ������� ��� ���������� ������ �� ����������� ������, ��������� ��������, ��������, ����������� ����, ��������� ������� � ��������� ������ ���������� ������� � ��� ��� ����������� �� JavaScript, � ��� �� ����� ������� ����� ������������ ������ ����������. ��, ���������� ���� JavaScript ��� ��� � �������������� ��� ���������� ��������, ���������������, ������������� �������� �� web-���������, ������� � ���� ������ � ������� ������ � HTML � CSS, � ������� ��� ���� ����� �� ���� ������� ������ �� frontend ����������. ��, JavaScript, ���-�� ����� ��������� ���������� � ��������� ���������� ��� ��������� ������������ ������. � ��� ����� ���������� � ������, JavaScript ����� ��������� ��������� ����� web-����������, ����� ������� �������� ���� ��� ����������� ��������� ���� ����������������.</p>



<p>� ��������� ����� JavaScript ���������� ����������� � ����������������, ��������� ���������� ��������������� ���������� ��� �������� ����������� ��������-�������� � ���������� ��� ��������� ������, ��������� � ����������. ����� �������, ��� JavaScript � ��� ���� �������� � ������� ������� ������������� ���� �������� �� �������� ������� �����������. ���� ��������� ����������� ������� �����. ���� �� ��� ������� ���������������� � ������ ����� �� ����� JavaScript � ������, �� ��� ����� ������� � ��������� �� ���� ������.</p>



<p>���������� ��������� ����� �������������� ������, ������� ������� �������, ������ ���� JavaScript. ����� �����, ��� �� ������������ � ��������. ���������� � ������ �myVariable�, �myvariable� � �MYVariable� ����� ��������������� ��� ��� ��������� �������. ����� ����, ���������� �������, ����� ��� ������� � �������, ������������, ���� ��� �� �������� ������ ������ ������ � �� ��������� � �������.</p>



<h4>���������� � �����������. </h4>

<p>� ����������� ���� JavaScript, ��� � � ������ ��������������� ������ ����������������, ����� �������� ���������� � �����������. �������� ������� �� ���� ����������. ���������� � ��� �������, ������� �������� ��������, ��� ������. ���� ������������ ������� ����������, ����������� �������� ���������� ����������� � ������ ��������. alert("�������."); ����� � ������� � ����� ���������� �������� JavaScript, ��� ��� ����� �������, ������� ����, ��� ����� ��������� �����������. �������� ��������� JavaScript ����� ������ ����� �������� � ����� �������, �� ������ ��������� ��������� ���������� ������ ���������� ������ � �������. � ����������� JavaScript ����� � ������� �������� ��������� �� ������������. ����������� �������� ��������������� (��������������) ����������� ������������ ����. ���� JavaScript ��������� ��������� �����������, ������� ����� �������������� ��� ���������� ��������, ��� ��� �� ������ �������� ����������� � ����������� � ����� ����. ��� �������� �������, ���� � ������� ��� ����� ������������� ������ �����������.</p>



<h4>���������� ��� ������� ������������� ������������. </h4>

<p>��� ������������ ������������ ����������� ��� ����� (//) � ������ ������. ������������ ����������� ����� ��������� �� ����� ������ � �����������, ���� �� ������������� ����� ���. ��� �� ����������� ���������, ��� ��� ����� ������ ���������� ��� ������� �� ���. // ��� ������������ �����������. ������������� ����������� ���������� ��� �� ���������, ������� ��� ���������� � CSS. ���, ��� ��������� ����� ��������� /**/, ������������ ���������. �� ����� ������������, ����� ���������������� ������� � ���� ��������� �������� ��� ������ ������ � ����. /* ��� ������������� �����������. ���, ��� ��������� ����� ����� �������� ��������, ����� ��������� �������������� ��� ���������� ��������. ����� ��� ����������� ���������� ���������. */ ������������ ����������� ������ ��� ���������� ������� ��������� � �������� ������������ ����, � ����� ������������ ����������� �������������� ��� ���������� ������� �������, ����������� ������ ������� ���������� ������ ��������� JavaScript.</p>



<h4>����� � JavaScript. </h4>

<p>������ ������, ����� ���������� �������� �� ���� ��������� � ������� � � ������ ��������� ��������, �� �� ������� ���������� ��� �������� � ������ � ����������� ������ ��� � �����. ����� �� ������ ������������ �������� �����. ����� ��������� ����� �������� � ��������� �������� ������. ������, � ��� ���� �����, � ������� �� ���� �� ����� �� ������ ���������� ������. ���� �� ���������� DOM ��� ���� ������� ����� ������ �� ��������, ��� ����������� ������ ��� ������� �������� ����� ������. �������, ����� ��������� ������ ��������, ����������� � ���� ������� ����������, �� ����� ��� ����� ����� �������, � ��� ��������� ����������� � ������. ���� �� ���������� ���� ��� �������� ������� ��������, ��� �� �������� �������� ��������, ���������� �� ����, ������� ����� ��������� �� �������� ��� ������� � ���. ����� ��������� ��������� �������� � ������� �������� � �������, ���������� �� ������� ����� �������.</p>



<h4>�������������� JavaScript. </h4>

<p>� ���������� ������������� JavaScript ��������������� ������ �� �������� ������� �� ������ ��� ��������� ���� JavaScript. � ��������� ��������� ��������� ��������������, ��������������� JavaScript� ��������� ���������: "���� ��� ��������� ������ ��������� ���, ����� �� ������ ����� ���������, ���������� �� ����, ������� ����� ����������� � �� �����������. ��� ���������� ���� ���� ������ ������������� ��������� �������� ��������������� �����, � ������� �����������, ��� ������� ����������� ���������� �������, �������� �����, �������, �������, ���������� � ������ ��� �������� ������������ ����.</p>', '2024-07-27');

-- �������: django_admin_log
CREATE TABLE IF NOT EXISTS "django_admin_log" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "object_id" text NULL, "object_repr" varchar(200) NOT NULL, "action_flag" smallint unsigned NOT NULL CHECK ("action_flag" >= 0), "change_message" text NOT NULL, "content_type_id" integer NULL REFERENCES "django_content_type" ("id") DEFERRABLE INITIALLY DEFERRED, "user_id" integer NOT NULL REFERENCES "auth_user" ("id") DEFERRABLE INITIALLY DEFERRED, "action_time" datetime NOT NULL);
INSERT INTO django_admin_log (id, object_id, object_repr, action_flag, change_message, content_type_id, user_id, action_time) VALUES (1, '1', 'Skills object (1)', 1, '[{"added": {}}]', 7, 1, '2024-07-20 13:29:29.804985');
INSERT INTO django_admin_log (id, object_id, object_repr, action_flag, change_message, content_type_id, user_id, action_time) VALUES (2, '1', 'Skills object (1)', 2, '[{"changed": {"fields": ["Image"]}}]', 7, 1, '2024-07-27 03:45:42.069268');
INSERT INTO django_admin_log (id, object_id, object_repr, action_flag, change_message, content_type_id, user_id, action_time) VALUES (3, '1', 'Skills object (1)', 2, '[{"changed": {"fields": ["Image"]}}]', 7, 1, '2024-07-27 03:50:19.290314');
INSERT INTO django_admin_log (id, object_id, object_repr, action_flag, change_message, content_type_id, user_id, action_time) VALUES (4, '2', 'Skills object (2)', 1, '[{"added": {}}]', 7, 1, '2024-07-27 03:51:42.890318');
INSERT INTO django_admin_log (id, object_id, object_repr, action_flag, change_message, content_type_id, user_id, action_time) VALUES (5, '3', 'Skills object (3)', 1, '[{"added": {}}]', 7, 1, '2024-07-27 03:52:26.271992');
INSERT INTO django_admin_log (id, object_id, object_repr, action_flag, change_message, content_type_id, user_id, action_time) VALUES (6, '1', 'Blog object (1)', 1, '[{"added": {}}]', 8, 1, '2024-07-27 06:26:51.638110');
INSERT INTO django_admin_log (id, object_id, object_repr, action_flag, change_message, content_type_id, user_id, action_time) VALUES (7, '2', 'Blog object (2)', 1, '[{"added": {}}]', 8, 1, '2024-07-27 06:27:12.291480');
INSERT INTO django_admin_log (id, object_id, object_repr, action_flag, change_message, content_type_id, user_id, action_time) VALUES (8, '2', 'Blog object (2)', 2, '[{"changed": {"fields": ["Date"]}}]', 8, 1, '2024-07-27 06:27:25.841000');
INSERT INTO django_admin_log (id, object_id, object_repr, action_flag, change_message, content_type_id, user_id, action_time) VALUES (9, '1', 'Blog object (1)', 2, '[]', 8, 1, '2024-07-27 06:27:28.693020');
INSERT INTO django_admin_log (id, object_id, object_repr, action_flag, change_message, content_type_id, user_id, action_time) VALUES (10, '2', 'Blog object (2)', 2, '[]', 8, 1, '2024-07-27 06:27:30.857192');
INSERT INTO django_admin_log (id, object_id, object_repr, action_flag, change_message, content_type_id, user_id, action_time) VALUES (11, '1', 'Blog object (1)', 2, '[{"changed": {"fields": ["Date"]}}]', 8, 1, '2024-07-27 06:27:36.924435');
INSERT INTO django_admin_log (id, object_id, object_repr, action_flag, change_message, content_type_id, user_id, action_time) VALUES (12, '3', '99,9 % ���������� � ��� ���������� ����������', 1, '[{"added": {}}]', 8, 1, '2024-07-27 06:36:03.798835');
INSERT INTO django_admin_log (id, object_id, object_repr, action_flag, change_message, content_type_id, user_id, action_time) VALUES (13, '4', '����� ����� �������������� ������������', 1, '[{"added": {}}]', 8, 1, '2024-07-27 06:36:30.332957');
INSERT INTO django_admin_log (id, object_id, object_repr, action_flag, change_message, content_type_id, user_id, action_time) VALUES (14, '5', '��� ����� JavaScript. ������� �������� � �����������', 1, '[{"added": {}}]', 8, 1, '2024-07-27 06:36:47.173021');

-- �������: django_content_type
CREATE TABLE IF NOT EXISTS "django_content_type" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "app_label" varchar(100) NOT NULL, "model" varchar(100) NOT NULL);
INSERT INTO django_content_type (id, app_label, model) VALUES (1, 'admin', 'logentry');
INSERT INTO django_content_type (id, app_label, model) VALUES (2, 'auth', 'permission');
INSERT INTO django_content_type (id, app_label, model) VALUES (3, 'auth', 'group');
INSERT INTO django_content_type (id, app_label, model) VALUES (4, 'auth', 'user');
INSERT INTO django_content_type (id, app_label, model) VALUES (5, 'contenttypes', 'contenttype');
INSERT INTO django_content_type (id, app_label, model) VALUES (6, 'sessions', 'session');
INSERT INTO django_content_type (id, app_label, model) VALUES (7, 'skills', 'skills');
INSERT INTO django_content_type (id, app_label, model) VALUES (8, 'blog', 'blog');

-- �������: django_migrations
CREATE TABLE IF NOT EXISTS "django_migrations" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "app" varchar(255) NOT NULL, "name" varchar(255) NOT NULL, "applied" datetime NOT NULL);
INSERT INTO django_migrations (id, app, name, applied) VALUES (1, 'contenttypes', '0001_initial', '2024-07-20 13:02:32.302230');
INSERT INTO django_migrations (id, app, name, applied) VALUES (2, 'auth', '0001_initial', '2024-07-20 13:02:32.315233');
INSERT INTO django_migrations (id, app, name, applied) VALUES (3, 'admin', '0001_initial', '2024-07-20 13:02:32.323233');
INSERT INTO django_migrations (id, app, name, applied) VALUES (4, 'admin', '0002_logentry_remove_auto_add', '2024-07-20 13:02:32.332237');
INSERT INTO django_migrations (id, app, name, applied) VALUES (5, 'admin', '0003_logentry_add_action_flag_choices', '2024-07-20 13:02:32.337239');
INSERT INTO django_migrations (id, app, name, applied) VALUES (6, 'contenttypes', '0002_remove_content_type_name', '2024-07-20 13:02:32.349245');
INSERT INTO django_migrations (id, app, name, applied) VALUES (7, 'auth', '0002_alter_permission_name_max_length', '2024-07-20 13:02:32.357246');
INSERT INTO django_migrations (id, app, name, applied) VALUES (8, 'auth', '0003_alter_user_email_max_length', '2024-07-20 13:02:32.364088');
INSERT INTO django_migrations (id, app, name, applied) VALUES (9, 'auth', '0004_alter_user_username_opts', '2024-07-20 13:02:32.369088');
INSERT INTO django_migrations (id, app, name, applied) VALUES (10, 'auth', '0005_alter_user_last_login_null', '2024-07-20 13:02:32.377090');
INSERT INTO django_migrations (id, app, name, applied) VALUES (11, 'auth', '0006_require_contenttypes_0002', '2024-07-20 13:02:32.379091');
INSERT INTO django_migrations (id, app, name, applied) VALUES (12, 'auth', '0007_alter_validators_add_error_messages', '2024-07-20 13:02:32.384092');
INSERT INTO django_migrations (id, app, name, applied) VALUES (13, 'auth', '0008_alter_user_username_max_length', '2024-07-20 13:02:32.392094');
INSERT INTO django_migrations (id, app, name, applied) VALUES (14, 'auth', '0009_alter_user_last_name_max_length', '2024-07-20 13:02:32.398771');
INSERT INTO django_migrations (id, app, name, applied) VALUES (15, 'auth', '0010_alter_group_name_max_length', '2024-07-20 13:02:32.406766');
INSERT INTO django_migrations (id, app, name, applied) VALUES (16, 'auth', '0011_update_proxy_permissions', '2024-07-20 13:02:32.411766');
INSERT INTO django_migrations (id, app, name, applied) VALUES (17, 'auth', '0012_alter_user_first_name_max_length', '2024-07-20 13:02:32.419768');
INSERT INTO django_migrations (id, app, name, applied) VALUES (18, 'sessions', '0001_initial', '2024-07-20 13:02:32.424603');
INSERT INTO django_migrations (id, app, name, applied) VALUES (19, 'skills', '0001_initial', '2024-07-20 13:02:32.427604');
INSERT INTO django_migrations (id, app, name, applied) VALUES (20, 'blog', '0001_initial', '2024-07-27 06:25:32.620935');

-- �������: django_session
CREATE TABLE IF NOT EXISTS "django_session" ("session_key" varchar(40) NOT NULL PRIMARY KEY, "session_data" text NOT NULL, "expire_date" datetime NOT NULL);
INSERT INTO django_session (session_key, session_data, expire_date) VALUES ('yfe8mo64xlqu6timejazt0u8ohmrhgwb', '.eJxVjEEOwiAQRe_C2hCgTECX7j0DGWYGqRqalHbVeHdt0oVu_3vvbyrhutS0dpnTyOqirDr9bhnpKW0H_MB2nzRNbZnHrHdFH7Tr28Tyuh7u30HFXr91JFPQOiiAkYdQ2JB4S5aMO0dxAHnIVCKL9yzsBvLArghLAEAIpN4fARk47Q:1sV9y8:ABWPIALAa-xjBd50mUgbJnLXRmMeaQs3R49VFjFpZZo', '2024-08-03 13:17:48.600985');

-- �������: skills_skills
CREATE TABLE IF NOT EXISTS "skills_skills" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "title" varchar(100) NOT NULL, "description" varchar(250) NOT NULL, "image" varchar(100) NOT NULL, "url" varchar(200) NOT NULL);
INSERT INTO skills_skills (id, title, description, image, url) VALUES (1, 'JavaScript', '��� ����������� ������������ ���� ����������������, ������� ����������� � HTML ���������, � ����� ���������� ������������ ��������������� �� ���-������.', 'skills/images/js.jpg', 'https://learn.javascript.ru/');
INSERT INTO skills_skills (id, title, description, image, url) VALUES (2, 'HTML/CSS', '������������������� ���� �������� ���������� �� ��������� �������. ����������� ���-������� �������� �������� �������� �� ����� HTML. CSS - ���������� ���� �������� �������� ���� ���������.', 'skills/images/html_css.jpg', 'http://htmlbook.ru/');
INSERT INTO skills_skills (id, title, description, image, url) VALUES (3, 'Python', 'Python ������������ ��� �������� ������������ � ��������� ����������, ��� ��������� � ������ � ������� ������� ����������, ��� ���������� web-������ � ������ ������������� ��������, ���������� � �������� ��������.', 'skills/images/python.jpg', 'https://www.python.org/');

-- ������: auth_group_permissions_group_id_b120cbf9
CREATE INDEX IF NOT EXISTS "auth_group_permissions_group_id_b120cbf9" ON "auth_group_permissions" ("group_id");

-- ������: auth_group_permissions_group_id_permission_id_0cd325b0_uniq
CREATE UNIQUE INDEX IF NOT EXISTS "auth_group_permissions_group_id_permission_id_0cd325b0_uniq" ON "auth_group_permissions" ("group_id", "permission_id");

-- ������: auth_group_permissions_permission_id_84c5c92e
CREATE INDEX IF NOT EXISTS "auth_group_permissions_permission_id_84c5c92e" ON "auth_group_permissions" ("permission_id");

-- ������: auth_permission_content_type_id_2f476e4b
CREATE INDEX IF NOT EXISTS "auth_permission_content_type_id_2f476e4b" ON "auth_permission" ("content_type_id");

-- ������: auth_permission_content_type_id_codename_01ab375a_uniq
CREATE UNIQUE INDEX IF NOT EXISTS "auth_permission_content_type_id_codename_01ab375a_uniq" ON "auth_permission" ("content_type_id", "codename");

-- ������: auth_user_groups_group_id_97559544
CREATE INDEX IF NOT EXISTS "auth_user_groups_group_id_97559544" ON "auth_user_groups" ("group_id");

-- ������: auth_user_groups_user_id_6a12ed8b
CREATE INDEX IF NOT EXISTS "auth_user_groups_user_id_6a12ed8b" ON "auth_user_groups" ("user_id");

-- ������: auth_user_groups_user_id_group_id_94350c0c_uniq
CREATE UNIQUE INDEX IF NOT EXISTS "auth_user_groups_user_id_group_id_94350c0c_uniq" ON "auth_user_groups" ("user_id", "group_id");

-- ������: auth_user_user_permissions_permission_id_1fbb5f2c
CREATE INDEX IF NOT EXISTS "auth_user_user_permissions_permission_id_1fbb5f2c" ON "auth_user_user_permissions" ("permission_id");

-- ������: auth_user_user_permissions_user_id_a95ead1b
CREATE INDEX IF NOT EXISTS "auth_user_user_permissions_user_id_a95ead1b" ON "auth_user_user_permissions" ("user_id");

-- ������: auth_user_user_permissions_user_id_permission_id_14a6b632_uniq
CREATE UNIQUE INDEX IF NOT EXISTS "auth_user_user_permissions_user_id_permission_id_14a6b632_uniq" ON "auth_user_user_permissions" ("user_id", "permission_id");

-- ������: django_admin_log_content_type_id_c4bce8eb
CREATE INDEX IF NOT EXISTS "django_admin_log_content_type_id_c4bce8eb" ON "django_admin_log" ("content_type_id");

-- ������: django_admin_log_user_id_c564eba6
CREATE INDEX IF NOT EXISTS "django_admin_log_user_id_c564eba6" ON "django_admin_log" ("user_id");

-- ������: django_content_type_app_label_model_76bd3d3b_uniq
CREATE UNIQUE INDEX IF NOT EXISTS "django_content_type_app_label_model_76bd3d3b_uniq" ON "django_content_type" ("app_label", "model");

-- ������: django_session_expire_date_a5c62663
CREATE INDEX IF NOT EXISTS "django_session_expire_date_a5c62663" ON "django_session" ("expire_date");

COMMIT TRANSACTION;
PRAGMA foreign_keys = on;
