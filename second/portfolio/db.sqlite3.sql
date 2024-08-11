PRAGMA foreign_keys = off;
BEGIN TRANSACTION;

-- Таблица: auth_group
CREATE TABLE IF NOT EXISTS "auth_group" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "name" varchar(150) NOT NULL UNIQUE);

-- Таблица: auth_group_permissions
CREATE TABLE IF NOT EXISTS "auth_group_permissions" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "group_id" integer NOT NULL REFERENCES "auth_group" ("id") DEFERRABLE INITIALLY DEFERRED, "permission_id" integer NOT NULL REFERENCES "auth_permission" ("id") DEFERRABLE INITIALLY DEFERRED);

-- Таблица: auth_permission
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

-- Таблица: auth_user
CREATE TABLE IF NOT EXISTS "auth_user" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "password" varchar(128) NOT NULL, "last_login" datetime NULL, "is_superuser" bool NOT NULL, "username" varchar(150) NOT NULL UNIQUE, "last_name" varchar(150) NOT NULL, "email" varchar(254) NOT NULL, "is_staff" bool NOT NULL, "is_active" bool NOT NULL, "date_joined" datetime NOT NULL, "first_name" varchar(150) NOT NULL);
INSERT INTO auth_user (id, password, last_login, is_superuser, username, last_name, email, is_staff, is_active, date_joined, first_name) VALUES (1, 'pbkdf2_sha256$720000$yqhPddbd9p5m5UcJW8cJBU$eqpkVRhKfJntkCSAtrV4ZKT86coK3SHszAPg92x0P6w=', '2024-07-20 13:17:48.596984', 1, 'admin', '', 'admin@localhost', 1, 1, '2024-07-20 13:17:03.132060', '');

-- Таблица: auth_user_groups
CREATE TABLE IF NOT EXISTS "auth_user_groups" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "user_id" integer NOT NULL REFERENCES "auth_user" ("id") DEFERRABLE INITIALLY DEFERRED, "group_id" integer NOT NULL REFERENCES "auth_group" ("id") DEFERRABLE INITIALLY DEFERRED);

-- Таблица: auth_user_user_permissions
CREATE TABLE IF NOT EXISTS "auth_user_user_permissions" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "user_id" integer NOT NULL REFERENCES "auth_user" ("id") DEFERRABLE INITIALLY DEFERRED, "permission_id" integer NOT NULL REFERENCES "auth_permission" ("id") DEFERRABLE INITIALLY DEFERRED);

-- Таблица: blog_blog
CREATE TABLE IF NOT EXISTS "blog_blog" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "title" varchar(200) NOT NULL, "description" text NOT NULL, "date" date NOT NULL);
INSERT INTO blog_blog (id, title, description, date) VALUES (1, 'Вёрстка на HTML5', '<p>XHTML хорошо подходит для обучения и вырабатывания правильной манеры вёрстки благодаря своим формальным правилам и более жёсткому, по сравнению с HTML синтаксису. Однако за десять лет прошедших со дня выпуска XHTML морально устарел и уже не соответствует современным условиям. В частности, нет штатных средств для проигрывания аудио и видеороликов, нет поддержки геолокации, возможности рисовать непосредственно в браузере, не хватает некоторых элементов форм и много другого. Конечно, часть этих проблем давно решается через сторонние плагины к браузеру, например, Adobe Flash воспроизводит видео, Google Gears реализует локальные базы данных и запуск скриптов в фоновом режиме. Язык программирования JavaScript позволяет реализовать недостающий функционал форм и различные эффекты на странице. Но все эти технологии имеют определённые ограничения — плагины нужно устанавливать дополнительно, при этом они могут не работать, как Flash на iPhone и iPad, далеко не всё умеет и JavaScript. Популярность мобильных устройств, развитие каналов связи переместило акцент веб-технологий на мультимедиа, т.е. воспроизведение потокового аудио и видео, а также соответствующих файлов. Ничего этого в XHTML нет.</p>



<p>W3 Consortium, разработчик спецификаций HTML и XHTML, начал работать над XHTML 2.0, в котором указанные недостатки предыдущей версии бы обходились. В результате этот проект оказался замороженным и не завершён. Обеспокоенные медленным ходом работ разработчики браузеров Safari, Firefox и Opera основали свою собственную организацию WHATWG (Web Hypertext Application Technology Working Group, Рабочая группа по разработке гипертекстовых приложений Интернета), которая подхватила упавшее знамя. Идеи W3C, современные потребности пользователей и мнения веб-разработчиков воплотились в новом языке разметки названном HTML5.</p>



<p>Следует понимать, что, несмотря на схожесть названий, HTML5 не является продолжением HTML4 или XHTML. Скорее речь идёт о новом языке Web Applications 1.0, который в маркетинговых целях назван знакомой аббревиатурой и построен на базе HTML.</p>



<p>Официально стандарт HTML5 ещё не завершён, но современные браузеры уже умеют частично с ним работать. Итак, что же интересного нам даёт HTML5? Вот некоторые его возможности.</p>



<ul>

	<li>Поддержка геолокации — определение местоположения пользователя на карте и использование этой информации для вычисления маршрута его движения, вывода близлежащих магазинов, кинотеатров, кафе и других данных.</li>

<li>Воспроизведение видеороликов.</li>

<li>Воспроизведение аудиофайлов.</li>

<li>Локальное хранилище — позволяет сайтам сохранять информацию на локальном компьютере и обращаться к ней позже.</li>

<li>Фоновые вычисления — стандартный способ запуска JavaScript в браузере в фоновом режиме.</li>

<li>Оффлайновые приложения — страницы, которые могут работать при отключении Интернета.</li>

<li>Рисование — внутри тега canvas с помощью JavaScript можно рисовать фигуры, линии, создавать градиенты и трансформировать объекты на лету.</li>

<li>Новые элементы форм: для даты, времени, поиска, чисел, выбора цвета и др.</li>

</ul>

<p>Кроме этих возможностей в HTML5 включены новые теги для разметки документа, выброшены устаревшие теги и модифицированы некоторые другие. Для вёрстки веб-страниц в первую очередь необходимо понять, что поменялось и как перевести страницу на HTML5.</p>', '2024-06-10');
INSERT INTO blog_blog (id, title, description, date) VALUES (2, 'Будущее программирования', '<p>Никто не знает и не понимает, что такое «программирование» и что такое «компьютер». Какими они задумывались, какими они могли бы быть и какими они могут стать.</p>



<p>Недавно я разговаривал с физтехом и он мне с железобетонной уверенностью выпалил определение: «Программирование — это написание четких инструкций для компьютера». Я же, пересмотрев десятки лекций Кнута, опубликовав десятки переводов Ликлайдера, Ванневара Буша и Дугласа Энгельбарта, немного призадумался о природе его догматичности и отсутствию «сомнений» в своей правоте.</p>



<p>Предлагаю обсудить будущее программирования и рассмотреть взгляды нескольких философов и парочки практиков, которые работают над созданием будущего программирования прямо сейчас.

(Дополняйте своими находками «ростков будущего» и ключевыми статями и лекциями.)</p>



<h4>Основные мысли:</h4>

<ul>

<li>Во что эволюционируют ЯП за 100 лет может быть интересно потому, что хотелось бы знать, на какую ветвь «древа эволюции» сделать ставку сегодня.</li>

<li>А будут ли через 100 лет вообще писать код?</li>

<li>Любой язык программирования можно поделить на две части: некий набор фундаментальных операторов, которые играют роль аксиом, и остаток языка, который, в принципе, может быть описан в терминах этих фундаментальных операторов. Я считаю, что фундаментальные операторы — это самый важный фактор, влияющий на выживание языка в долгосрочной перспективе. Всё остальное может меняться.</li>

<li>Языки программирования — это не технологии, а больше похожи на математическую нотацию. А нотации развиваются намного медленнее чем технологии.</li>

<li>Если закона Мура сохранится, через 100 лет компьютеры станут в 74 квинтиллиона раз быстрее.</li>

<li>Причина существования большинства типов данных — это производительность. С увеличением производительности в миллион раз может случиться фундаментальный сдвиг парадигмы.</li>

<li>Можно ли избавиться от массивов?</li>

<li>Можно ли избавиться от чисел как фундаментального типа данных?</li>

<li>Через сто лет программисты захотят такой язык, на котором можно оперативно и с минимальными усилиями набросать первую, невероятно неэффективно работающую версию программы. По крайней мере, так это можно описать в современных терминах. Они скажут, что им нужен язык, на котором легко программировать.</li>

<li>Параллелизм не будет распространен в программах через сто лет.</li>

<li>Сейчас вполне возможно изобрести язык, который будет привлекателен для пользователей через сто лет.</li>

<li>Если бы мы получили язык программирования будущего, стали бы мы использовать его?</li>', '2024-07-25');
INSERT INTO blog_blog (id, title, description, date) VALUES (3, '99,9 % результата — это отсутствие результата', '<p>Все на том же проекте по замене CRM, перед моей командой встала задача настройки правил маршрутизации заявок по очень сложной схеме определения ответственного подразделения. Суть задачи была в том, что от первичного справочника тематик обращений на 10 тысяч строк зависели 2500 тысячи тематик классификации заявки. Те, в свою очередь, имели определённую схему маршрутизации по ответственным подразделениям, а вместе все это накрывалось ролевой моделью доступа к заявкам по заданным параметрам.</p>



<p>Особенностью данной работы стало то, что все эти правила требовалось сводить в Excel в виде строки с множеством параметров для каждого правила и делать конкатенацию значений по шаблону, который был понятен системе потребителю. После чего файл передавался в подразделение заказчика, который загружал его в систему и там это файл проходил валидацию: сначала на целостность структуры правил, а затем коллеги с помощью скрипта создавали все типы заявок и проверяли, что оказались ли те в нужном подразделении и доступны ли пользователям, имеющим соответствующие права. При этом доступ к тестовому контуру нам не давали по каким-то «соображениям безопасности». Файл получился монструозно-огромным и обрабатывать его приходилось с помощью функций ВПР, скрипов и функции конкатенации. </p>



<p>Представители заказчика были крайне недовольны возникающими ошибками и необходимостью чистить тестовую БД от ошибок. В итоге это недовольство вылилось в прямое распоряжение от руководителя проекта сделать файл в целевом виде и только после этого выдать на загрузку. Сложности ситуации добавляло и то, что в процессе настройки этой выгрузки представители бизнеса находились в процессе осознания зон ответственности и перенастройки маршрутизации под новые функциональные обязанности подразделений.</p>



<p>Менялись тематики обращений, ответственность подразделений и права доступа пользователей. Все это вынуждало нас менять файл с правилами, что воспринималось представителями IT как ошибки загрузки. В предоставлении нам доступа в тестовую среду для отработки всех замечаний и выдачи конечного результата в очередной раз было отказано.</p>



<p>В итоге, порезав слона по частям, мы организовали серию встреч с бизнесом, где проходились по части строк и выверяли правила маршрутизации. Спустя определённое количество итераций мы, наконец, закончили эту работу и файл был готов к загрузке. После напряжённых недель работы по 12 часов в сутки, мы отдали файл на загрузку и очень гордились нашей работой.</p>



<p>Файл был принят к загрузке, и мы приступили к другим горящим и сложным задачам. Уже через два дня на общей встрече я получил крайне негативный фидбэк по файлу от менеджера проекта, который звучал следующим образом – файл не был загружен по причине множества ошибок.</p>  



<p>Я был публично отшлёпан, а в риски проекта была добавлена высокая вероятность срыва его сроков по причине неготовности настроек системы. При том, что настройка всей остальной части системы и выполненная задача по миграции данных, описанная выше в главе «Ешьте слона по частям» в расчёт не принималась.</p>



<p>На «статусе» проекта был приведён пример ошибки и больше никаких деталей представлено не было. Я отправился выяснять подробности к руководителю IT-службы, выполнявшего настройку вне рамок статуса проекта. Пообщавшись с ним, я узнал, что «пример» на самом деле оказался единственной ошибкой. Они получили ее в процессе загрузки примерно на середине файла и не стали продолжать, решив, что раз есть одна, то будут и другие. Вердикт был следующий: перепроверяйте файл и приносите без ошибок.</p>



<p>После этого моя команда проверила файл вдоль и поперёк, мы провели множество тестов средствами Excel, загрузили файл в Microsoft Access и провели там ряд тестов. Ошибка, представленная на «статусе», была единственной на несколько сотен тысяч строк. Исправив её, мы отдали файл на повторную загрузку. Недовольный начальник IT-подразделения, сказал, что, если опять будут найдены ошибки, то будет поставлен вопрос о штрафе всей команды.</p>



<p>На этот раз загрузка прошла чисто, мы выдохнули, передали файл в его подразделения и закрыли для себя данную задачу. Дальнейшее обновление этих параметров теперь должно было вести это подразделение.</p>



<p>Забегая вперёд, хочу сказать, что последующие обновления системы через этот файл привели к множеству ошибок и проблем: в итоге они привели к отказу от загрузки файлов и переходу на модель настройки и тестирования правил маршрутизации бизнес-пользователями системы.</p>



<p>Я же до сих пор считаю, что при работе с такими объёмами и без доступа к тестовой среде, мы сделали свою работу на «отлично». Все же, из этой ситуации я вынес правило: «99,9% процентов результата — это отсутствие результата». Чтобы вы не делали и как близко не подошли бы к успеху, всегда держите это правило в голове и доводите дело до 100%.</p>', '2024-06-15');
INSERT INTO blog_blog (id, title, description, date) VALUES (4, 'Зачем нужна информационная безопасность', '<p>Здравствуйте. Я работаю в компании CardSec и, в частности, мы занимаемся тем, что помогаем нашим клиентам готовиться к аудитам по информационной безопасности и проводим эти аудиты.</p>



<p>Нередко стартапы приходят к нам для того, чтобы получить сертификат по информационной безопасности, необходимый для заключения какой-то крупной сделки или получения инвестиций, и оказываются совершенно не готовы к тому, что мероприятия по безопасности могут существенно стоить или требовать изменений в архитектуре системы. В некоторых случаях – это приводит к ситуации, когда стартап не готов к таким дорогостоящим изменениям, но и без сертификата по ИБ не может сделать какой-либо важный для себя шаг.</p>



<p>Особенно эта проблема актуальна для финтех отрасли, в силу большего количества требований и регуляторов.</p>



<p>Кроме того, для некоторых видов деятельности соответствие определенным стандартам является обязательным – и без соответствия просто нельзя подключиться к процессингу или легально выйти на рынок.</p>



<p>Для того, чтобы не попасть в такую патовую ситуацию, лучше учитывать в своей работе, что соответствие требованиям по безопасности может рано или поздно понадобиться, в каких ситуациях и сколько это может стоить. И учитывать эти данные при формировании roadmap развития и определении экономики своего сервиса.</p>



<h4>Структура</h4>



<ul>

<li>Из чего это состоит ИБ и сколько это может стоить</li>

<li>Какие требования есть, для кого они актуальны</li>

<li>Лайфхак: соответствовать нужно не всему и сразу. Как выстроить roadmap, в какой момент и насколько нужно соответствовать</li>

<li>По шагам: делай раз-два-три. Что нужно для соответствия</li>

</ul>', '2024-07-01');
INSERT INTO blog_blog (id, title, description, date) VALUES (5, 'Что такое JavaScript. Краткое описание и возможности', '<p>Выбирая курс по JavaScript, очень многие учащиеся интересуются подробностями данной технологии. В данной статье мы вкратце рассказываем об этом.</p>



<p><b>Что такое JavaScript</b> – это интерпретируемый язык программирования (операторы языка, синтаксические элементы программы транслируются друг за другом и сразу выполняются – интерпретируются), если говорить проще, программа написанная на JavaScript читается так как она и написана, поступательно последовательно. Данный язык может создавать конструкции, позволяющие реализовывать динамические изменения, именно поэтому JavaScript используются при создании веб-сайтов в разработке интерактивных, динамических страниц. Весь анимированный контент, который нам приходится видеть на большинстве сайтов, различные слайдеры, карусели, всплывающие окна, параллакс эффекты и множество других интересных функций – все они реализованы на JavaScript, и это не самая большая часть возможностей данной технологии. Да, изначально язык JavaScript как раз и разрабатывался для добавления динамики, интерактивности, анимированных эффектов на web-страницах, работая в этом случае в плотной связке с HTML и CSS, и являясь при этом одним из трех базовых языков во frontend разработке. Но, JavaScript, так-же может создавать десктопные и мобильные приложения для различных операционных систем. И что самое интересное и важное, JavaScript может создавать серверную часть web-приложения, таким образом реализуя себя как полноценный серверный язык программирования.</p>



<p>В настоящее время JavaScript интенсивно развивается и совершенствуется, становясь глобальной технологической платформой для создания большинства интернет-проектов и приложений для различных систем, устройств и технологий. Можно сказать, что JavaScript – это язык будущего и поэтому следует сосредоточить свое внимание на изучении данного направления. Ниже приведены особенности данного языка. Если вы уже изучали программирование и решили пойти на курсы JavaScript в Москве, то вам будет полезно и интересно об этом узнать.</p>



<p>Существует несколько общих синтаксических правил, которые следует помнить, изучая язык JavaScript. Важно знать, что он чувствителен к регистру. Переменные с именем «myVariable», «myvariable» и «MYVariable» будут рассматриваться как три различных объекта. Кроме того, пробельные символы, такие как отступы и пробелы, игнорируются, если они не являются частью строки текста и не заключены в кавычки.</p>



<h4>Инструкции и комментарии. </h4>

<p>В программном коде JavaScript, как и в прочих высокоуровневых языках программирования, можно выделить инструкции и комментарии. Сценарий состоит из ряда инструкций. Инструкция — это команда, которая сообщает браузеру, что делать. Ниже представлена простая инструкция, указывающая браузеру отобразить уведомление с фразой «Спасибо». alert("Спасибо."); Точка с запятой в конце инструкции сообщает JavaScript, что это конец команды, подобно тому, как точка завершает предложение. Согласно стандарту JavaScript конец строки также приведет к концу команды, но лучшим вариантом считается завершение каждой инструкции точкой с запятой. В современном JavaScript точка с запятой является элементом не обязательным. Комментарии являются вспомогательным (необязательным) компонентом программного кода. Язык JavaScript позволяет оставлять комментарии, которые будут игнорироваться при выполнении сценария, так что вы можете оставить напоминания и разъяснения в своем коде. Это особенно полезно, если в будущем его будет редактировать другой разработчик.</p>



<h4>Существует два способа использования комментариев. </h4>

<p>Для однострочных комментариев используйте два слеша (//) в начале строки. Однострочный комментарии можно размещать на одной строке с инструкцией, если он располагается после нее. Его не обязательно закрывать, так как конец строки эффективно это сделает за вас. // Это однострочный комментарий. Многострочные комментарии используют тот же синтаксис, который вам встречался в CSS. Все, что находится между символами /**/, игнорируется браузером. Их можно использовать, чтобы «комментировать» заметки и даже фрагменты сценария при поиске ошибок в коде. /* Это многострочный комментарий. Все, что находится между этими наборами символов, будет полностью игнорироваться при выполнении сценария. Такой вид комментария необходимо закрывать. */ Однострочные комментарии удобны для добавления кратких пояснений к примерам программного кода, и часто используются начинающими программистами при выполнении простых заданий, позволяющих быстро увидеть результаты работы сценариев JavaScript.</p>



<h4>Циклы в JavaScript. </h4>

<p>Бывают случаи, когда необходимо пройтись по всем элементам в массиве и с каждым совершить действие, но не хочется выписывать все элементы в список и повторяться десять раз и более. Здесь на помощь программисту приходят циклы. Циклы позволяют легко работать с огромными наборами данных. Скажем, у нас есть форма, в которой ни одно из полей не должно оставаться пустым. Если мы используем DOM для всех случаев ввода текста на странице, она предоставит массив для каждого элемента ввода текста. Конечно, можно проверять каждое значение, сохраненное в этом массиве поочередно, но тогда код будет очень длинным, а его поддержка превратится в кошмар. Если мы используем цикл для проверки каждого значения, нам не придется изменять сценарий, независимо от того, сколько полей добавлены на страницу или удалены с нее. Циклы позволяют применить действие к каждому элементу в массиве, независимо от размера этого массива.</p>



<h4>Идиоматический JavaScript. </h4>

<p>В сообществе пользователей JavaScript предпринимаются усилия по созданию пособия по стилям для написания кода JavaScript. В документе «Принципы написания согласованного, идиоматического JavaScript» говорится следующее: "Весь код программы должен выглядеть так, будто он набран одним человеком, независимо от того, сколько людей участвовали в ее «разработке». Для достижения этой цели группа разработчиков составила Манифест идиоматического стиля, в котором описывается, как следует прописывать пробельные символы, переводы строк, кавычки, функции, переменные и прочее для создания «прекрасного кода».</p>', '2024-07-27');

-- Таблица: django_admin_log
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
INSERT INTO django_admin_log (id, object_id, object_repr, action_flag, change_message, content_type_id, user_id, action_time) VALUES (12, '3', '99,9 % результата — это отсутствие результата', 1, '[{"added": {}}]', 8, 1, '2024-07-27 06:36:03.798835');
INSERT INTO django_admin_log (id, object_id, object_repr, action_flag, change_message, content_type_id, user_id, action_time) VALUES (13, '4', 'Зачем нужна информационная безопасность', 1, '[{"added": {}}]', 8, 1, '2024-07-27 06:36:30.332957');
INSERT INTO django_admin_log (id, object_id, object_repr, action_flag, change_message, content_type_id, user_id, action_time) VALUES (14, '5', 'Что такое JavaScript. Краткое описание и возможности', 1, '[{"added": {}}]', 8, 1, '2024-07-27 06:36:47.173021');

-- Таблица: django_content_type
CREATE TABLE IF NOT EXISTS "django_content_type" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "app_label" varchar(100) NOT NULL, "model" varchar(100) NOT NULL);
INSERT INTO django_content_type (id, app_label, model) VALUES (1, 'admin', 'logentry');
INSERT INTO django_content_type (id, app_label, model) VALUES (2, 'auth', 'permission');
INSERT INTO django_content_type (id, app_label, model) VALUES (3, 'auth', 'group');
INSERT INTO django_content_type (id, app_label, model) VALUES (4, 'auth', 'user');
INSERT INTO django_content_type (id, app_label, model) VALUES (5, 'contenttypes', 'contenttype');
INSERT INTO django_content_type (id, app_label, model) VALUES (6, 'sessions', 'session');
INSERT INTO django_content_type (id, app_label, model) VALUES (7, 'skills', 'skills');
INSERT INTO django_content_type (id, app_label, model) VALUES (8, 'blog', 'blog');

-- Таблица: django_migrations
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

-- Таблица: django_session
CREATE TABLE IF NOT EXISTS "django_session" ("session_key" varchar(40) NOT NULL PRIMARY KEY, "session_data" text NOT NULL, "expire_date" datetime NOT NULL);
INSERT INTO django_session (session_key, session_data, expire_date) VALUES ('yfe8mo64xlqu6timejazt0u8ohmrhgwb', '.eJxVjEEOwiAQRe_C2hCgTECX7j0DGWYGqRqalHbVeHdt0oVu_3vvbyrhutS0dpnTyOqirDr9bhnpKW0H_MB2nzRNbZnHrHdFH7Tr28Tyuh7u30HFXr91JFPQOiiAkYdQ2JB4S5aMO0dxAHnIVCKL9yzsBvLArghLAEAIpN4fARk47Q:1sV9y8:ABWPIALAa-xjBd50mUgbJnLXRmMeaQs3R49VFjFpZZo', '2024-08-03 13:17:48.600985');

-- Таблица: skills_skills
CREATE TABLE IF NOT EXISTS "skills_skills" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "title" varchar(100) NOT NULL, "description" varchar(250) NOT NULL, "image" varchar(100) NOT NULL, "url" varchar(200) NOT NULL);
INSERT INTO skills_skills (id, title, description, image, url) VALUES (1, 'JavaScript', 'Это полноценный динамический язык программирования, который применяется к HTML документу, и может обеспечить динамическую интерактивность на веб-сайтах.', 'skills/images/js.jpg', 'https://learn.javascript.ru/');
INSERT INTO skills_skills (id, title, description, image, url) VALUES (2, 'HTML/CSS', 'Стандартизированный язык разметки документов во Всемирной паутине. Большинство веб-страниц содержат описание разметки на языке HTML. CSS - формальный язык описания внешнего вида документа.', 'skills/images/html_css.jpg', 'http://htmlbook.ru/');
INSERT INTO skills_skills (id, title, description, image, url) VALUES (3, 'Python', 'Python используется при создании компьютерных и мобильных приложений, его применяют в работе с большим объемом информации, при разработке web-сайтов и других разнообразных проектов, используют в машинном обучении.', 'skills/images/python.jpg', 'https://www.python.org/');

-- Индекс: auth_group_permissions_group_id_b120cbf9
CREATE INDEX IF NOT EXISTS "auth_group_permissions_group_id_b120cbf9" ON "auth_group_permissions" ("group_id");

-- Индекс: auth_group_permissions_group_id_permission_id_0cd325b0_uniq
CREATE UNIQUE INDEX IF NOT EXISTS "auth_group_permissions_group_id_permission_id_0cd325b0_uniq" ON "auth_group_permissions" ("group_id", "permission_id");

-- Индекс: auth_group_permissions_permission_id_84c5c92e
CREATE INDEX IF NOT EXISTS "auth_group_permissions_permission_id_84c5c92e" ON "auth_group_permissions" ("permission_id");

-- Индекс: auth_permission_content_type_id_2f476e4b
CREATE INDEX IF NOT EXISTS "auth_permission_content_type_id_2f476e4b" ON "auth_permission" ("content_type_id");

-- Индекс: auth_permission_content_type_id_codename_01ab375a_uniq
CREATE UNIQUE INDEX IF NOT EXISTS "auth_permission_content_type_id_codename_01ab375a_uniq" ON "auth_permission" ("content_type_id", "codename");

-- Индекс: auth_user_groups_group_id_97559544
CREATE INDEX IF NOT EXISTS "auth_user_groups_group_id_97559544" ON "auth_user_groups" ("group_id");

-- Индекс: auth_user_groups_user_id_6a12ed8b
CREATE INDEX IF NOT EXISTS "auth_user_groups_user_id_6a12ed8b" ON "auth_user_groups" ("user_id");

-- Индекс: auth_user_groups_user_id_group_id_94350c0c_uniq
CREATE UNIQUE INDEX IF NOT EXISTS "auth_user_groups_user_id_group_id_94350c0c_uniq" ON "auth_user_groups" ("user_id", "group_id");

-- Индекс: auth_user_user_permissions_permission_id_1fbb5f2c
CREATE INDEX IF NOT EXISTS "auth_user_user_permissions_permission_id_1fbb5f2c" ON "auth_user_user_permissions" ("permission_id");

-- Индекс: auth_user_user_permissions_user_id_a95ead1b
CREATE INDEX IF NOT EXISTS "auth_user_user_permissions_user_id_a95ead1b" ON "auth_user_user_permissions" ("user_id");

-- Индекс: auth_user_user_permissions_user_id_permission_id_14a6b632_uniq
CREATE UNIQUE INDEX IF NOT EXISTS "auth_user_user_permissions_user_id_permission_id_14a6b632_uniq" ON "auth_user_user_permissions" ("user_id", "permission_id");

-- Индекс: django_admin_log_content_type_id_c4bce8eb
CREATE INDEX IF NOT EXISTS "django_admin_log_content_type_id_c4bce8eb" ON "django_admin_log" ("content_type_id");

-- Индекс: django_admin_log_user_id_c564eba6
CREATE INDEX IF NOT EXISTS "django_admin_log_user_id_c564eba6" ON "django_admin_log" ("user_id");

-- Индекс: django_content_type_app_label_model_76bd3d3b_uniq
CREATE UNIQUE INDEX IF NOT EXISTS "django_content_type_app_label_model_76bd3d3b_uniq" ON "django_content_type" ("app_label", "model");

-- Индекс: django_session_expire_date_a5c62663
CREATE INDEX IF NOT EXISTS "django_session_expire_date_a5c62663" ON "django_session" ("expire_date");

COMMIT TRANSACTION;
PRAGMA foreign_keys = on;
