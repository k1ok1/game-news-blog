DELETE FROM platform WHERE name = 'Play Station VR';
UPDATE platform SET name = 'Xbox' WHERE name = 'Xbox 360';

CREATE TABLE game_requirements (
    id SERIAL PRIMARY KEY NOT NULL,
    operation_system VARCHAR DEFAULT '',
    cpu VARCHAR DEFAULT '',
    memory VARCHAR DEFAULT '',
    gpu VARCHAR DEFAULT '',
    storage VARCHAR DEFAULT ''
);

INSERT INTO game_requirements (operation_system, cpu, memory, gpu, storage) VALUES
    ('Windows® 7/Vista/XP', 'Intel® Core™ 2 Duo E6600 или AMD Phenom™ X3 8750', '2 GB ОЗУ', 'Видеокарта с 256 МБ памяти, совместимая с DirectX 9 с поддержкой Pixel Shader 3.0', '15 GB'),
    ('Windows 7', 'Процессор Intel Core Duo 2 ГГц', '2 GB ОЗУ', 'ATI Radeon HD 2400 / NVIDIA 8600M', '15 GB');

ALTER TABLE games ADD COLUMN description TEXT DEFAULT '';

UPDATE games SET description = 'Counter-Strike: Global Offensive (CS:GO) расширяет границы ураганной командной игры, представленной ещё 19 лет назад. CS:GO включает в себя новые карты, персонажей, оружие и режимы игры, а также улучшает классическую составляющую CS (de_dust2 и т. п.). «Counter-Strike удивила всю игровую индустрию, когда ничем не примечательная модификация стала одним из самых популярных шутеров в мире почти сразу после выпуска в августе 1999 года, — говорит Даг Ломбарди из Valve. — Уже на протяжении 12 лет она продолжает быть одной из самых популярных игр в мире и возглавляет киберспортивные соревнования, а по всему миру продано более 25 миллионов игр этой серии. CS:GO обещает расширить границы заслужившего известность игрового процесса и предложить его игрокам не только на ПК, но и на консолях следующего поколения и компьютерах Mac».' WHERE id = 1;
UPDATE games SET description = 'Ежедневно миллионы игроков по всему миру сражаются от лица одного из более сотни героев Dota 2, и даже после тысячи часов в ней есть чему научиться. Благодаря регулярным обновлениям игра живёт своей жизнью: геймплей, возможности и герои постоянно преображаются. Игра может похвастаться бесконечным разнообразием героев, способностей и предметов, благодаря чему каждый матч уникален. Любой герой может исполнять множество ролей, и для каждой нужды найдутся подходящие предметы. Здесь вас ничто не ограничивает — вы сами выбираете, какой стратегии следовать. Равные соревновательные возможности — главная гордость игры. Чтобы все находились в одинаковом положении, её основа — в частности, обширный список героев — доступна каждому игроку. Если хотите, вы можете коллекционировать предметы, видоизменяющие как героев, так и мир вокруг них, но всё необходимое для вашего первого матча уже есть в игре. Dota 2 многогранна, и она не стоит на месте, но вступить в игру никогда не поздно. Научитесь основам в матче против ботов. Опробуйте возможности героев. А затем вступайте в битву с игроками вашего уровня и поведения: об этом позаботится система подбора игры.' WHERE id = 2;

ALTER TABLE games ADD COLUMN game_requirement_id INT REFERENCES game_requirements (id);

UPDATE games SET game_requirement_id = 1 WHERE id = 1;
UPDATE games SET game_requirement_id = 2 WHERE id = 2;