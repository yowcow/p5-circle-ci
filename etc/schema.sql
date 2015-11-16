create table if not exists user (
    id integer unsigned not null,
    name varchar(255) not null default '',
    primary key (id)
) engine=innodb default charset=utf8
;
