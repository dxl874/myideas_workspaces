create or replace database  color_workspaces;

use color_workspaces;

-- Do we need the normalized image value curve stored?
create or replace table scenes (id int not null auto_increment primary key, app_id uuid not null unique key default(uuid()),
description varchar(255),
variant_type int,
scene_type int,
bg_image_url varchar(2083),
width int,
height int,
created datetime default current_timestamp);

create or replace table scene_types (id int not null auto_increment primary key , description varchar(32));

create or replace table variant_types (id int not null auto_increment primary key, description varchar(32));

create or replace table palettes (id int not null auto_increment primary key, scene_id int not null, color_id varchar(16) not null);

-- shadows and highlights required?
create or replace table surfaces (id int not null auto_increment primary key, surface_type int, surface_url varchar(2083) not null, scene_id int not null);

create or replace table surface_types (id int not null auto_increment primary key , description varchar(32));

-- populate tables

-- insert scene types
insert into scene_types (description) values ('custom');
insert into scene_types (description) values ('stock');
insert into scene_types(description) values ('palette');
insert into scene_types(description) values ('fast_mask');
insert into scene_types(description) values ('real_color');

-- insert variant types
insert into variant_types (description) values ('day');
insert into variant_types (description) values ('night');
insert into variant_types (description) values ('golden_hour');
insert into variant_types (description) values ('main');

-- this table is pretty soft and more of a future state
insert into surface_types (description) values ('matte');
insert into surface_types (description) values ('semi-gloss');
insert into surface_types (description) values ('gloss');
insert into surface_types (description) values ('satin');
insert into surface_types (description) values ('translucent');

-- add dummy data

insert into scenes (description, variant_type, scene_type, bg_image_url, width, height)
value ('Ron\'s magic room',
        4,
        1,
        'https://sherwin.scene7.com/is/image/sw?src=ir(swRender/hd_livingroom6_day?wid=1311)&qlt=92',
        1200,
        725) returning app_id;

insert into surfaces (surface_type, surface_url, scene_id)
values (1,
        'https://sherwin.scene7.com/is/image/sw?src=ir(swRender/hd_livingroom6_day?wid=1280&req=object&opac=100&fmt=png8&object=wall&color=000000)&fmt=png8&bgColor=FFFFFF&op_invert=1',
        last_insert_id()),
       (1,
        'https://sherwin.scene7.com/is/image/sw?src=ir(swRender/hd_livingroom6_day?wid=1280&req=object&opac=100&fmt=png8&object=accent&color=000000)&fmt=png8&bgColor=FFFFFF&op_invert=1',
        last_insert_id());


insert into scenes (description, variant_type) values ('Brendan amazing colors', 3) returning app_id;
insert into palettes (scene_id, color_id) values (last_insert_id(), 'SW6840'), (last_insert_id(), 'SW6071'), (last_insert_id(), 'SW9069');

insert into scenes (description, variant_type) values ('Cody\'s mystical paints' , 3) returning app_id;
insert into palettes (scene_id, color_id) values (last_insert_id(), 'SW9064'), (last_insert_id(), 'SW6764');

insert into scenes (description, variant_type) values ('Dan\'s wizarding walls' , 3) returning app_id;
insert into palettes (scene_id, color_id)
values (last_insert_id(), 'SW6767'),
       (last_insert_id(), 'SW6515'),
       (last_insert_id(), 'SW6004'),
       (last_insert_id(), 'SW7106'),
       (last_insert_id(), 'SW6035');










