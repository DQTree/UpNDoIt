begin transaction;

create schema if not exists undi;

create table if not exists undi.user
(
    id       int generated always as identity primary key,
    username varchar(24) unique                                                                                                                                   not null,
    email    text check (email ~
                         '^[a-zA-Z0-9.!#$%&''*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$') not null not null not null
);

create table if not exists undi.tasks
(
    id          serial,
    created_by  int,
    created_at  timestamptz,
    modified_at timestamptz default null,
    title       varchar(32) not null,
    public      bool default false,
    description varchar(512),
    foreign key (created_by) references undi.user (id)
);

end;