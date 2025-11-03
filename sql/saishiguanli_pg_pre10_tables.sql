DROP TABLE IF EXISTS "announce";
CREATE TABLE "announce" (
"id" serial not null ,
  "memo" varchar(4000) not null,
  "creatorId" integer not null,
  "creatorName" varchar(65) not null,
  "createDate" timestamp without time zone default null,
  "modifyDate" timestamp without time zone default null,
  "isEnabled" integer default null,
  PRIMARY KEY ("id"))
;
DROP TABLE IF EXISTS "contest";
CREATE TABLE "contest" (
"cid" serial not null ,
  "title" varchar(64) default null,
  "level" varchar(64) default null,
  "tag" varchar(255) default null,
  "memo" varchar(64) default null,
  "length" varchar(64) default null,
  "creatorId" integer not null,
  "createDate" timestamp not null default current_timestamp,
  "modifyDate" timestamp without time zone default null,
  "startTime" timestamp without time zone default null,
  "endTime" timestamp without time zone default null,
  "isEnabled" integer not null,
  "type" varchar(64) not null,
  PRIMARY KEY ("cid"))
;
DROP TABLE IF EXISTS "contest_member";
CREATE TABLE "contest_member" (
  "contest_id" integer not null,
  "member_id" integer not null,
  "isEnabled" integer not null,
  PRIMARY KEY ("contest_id","member_id"))
;
DROP TABLE IF EXISTS "contest_team";
CREATE TABLE "contest_team" (
  "contest_id" integer not null,
  "team_id" integer not null,
  "isEnabled" integer not null,
  PRIMARY KEY ("contest_id","team_id"))
;
DROP TABLE IF EXISTS "member";
CREATE TABLE "member" (
  "id" integer not null,
  "gender" integer default null,
  "address" varchar(255) default null,
  "birth" timestamp without time zone default null,
  "email" varchar(64) default null,
  "phone" varchar(64) default null,
  "truename" varchar(64) default null,
  "school" varchar(64) default null,
  "image" varchar(255) default null,
  "age" integer default null,
  "height" numeric(11,2) DEFAULT NULL,
  "weight" numeric(11,2) DEFAULT NULL,
  "isEnabled" integer default null,
  PRIMARY KEY ("id"))
;
DROP TABLE IF EXISTS "permission";
CREATE TABLE "permission" (
"id" serial not null ,
  "name" varchar(30) default null,
  "pid" integer default null,
  "istype" integer default null,
  "descpt" varchar(64) default null,
  "code" varchar(20) default null,
  "page" varchar(50) default null,
  "insert_time" timestamp without time zone default null,
  "update_time" timestamp without time zone default null,
  PRIMARY KEY ("id"))
;
DROP TABLE IF EXISTS "rank";
CREATE TABLE "rank" (
"id" serial not null ,
  "ac_count" integer default null,
  "wr_count" integer default null,
  "re_count" integer default null,
  "total_count" integer default null,
  "time_count" numeric(64,0) DEFAULT NULL,
  PRIMARY KEY ("id"))
;
DROP TABLE IF EXISTS "rank_contest_member";
CREATE TABLE "rank_contest_member" (
  "rank_id" integer not null,
  "member_id" integer not null,
  "contest_id" integer not null,
  PRIMARY KEY ("member_id","rank_id","contest_id"))
;
DROP TABLE IF EXISTS "rank_contest_team";
CREATE TABLE "rank_contest_team" (
  "rank_id" integer not null,
  "team_id" integer not null,
  "contest_id" integer not null,
  PRIMARY KEY ("rank_id","team_id","contest_id"))
;
DROP TABLE IF EXISTS "role";
CREATE TABLE "role" (
"id" serial not null ,
  "role_name" varchar(30) default null,
  "descpt" varchar(50) default null,
  "code" varchar(20) default null,
  "insert_uid" integer default null,
  "insert_time" timestamp without time zone default null,
  "update_time" timestamp without time zone default null,
  PRIMARY KEY ("id"))
;
DROP TABLE IF EXISTS "role_permission";
CREATE TABLE "role_permission" (
"permit_id" serial not null ,
  "role_id" integer not null,
  PRIMARY KEY ("permit_id","role_id"))
;
DROP TABLE IF EXISTS "team";
CREATE TABLE "team" (
  "id" integer not null,
  "name" varchar(64) not null,
  "school" varchar(64) default null,
  "captain_id" integer default null,
  "createDate" timestamp not null default current_timestamp,
  "modifyDate" timestamp without time zone default null,
  "isEnabled" integer not null,
  PRIMARY KEY ("id"))
;
DROP TABLE IF EXISTS "team_member";
CREATE TABLE "team_member" (
  "team_id" integer not null,
  "member_id" integer not null,
  PRIMARY KEY ("team_id","member_id"))
;
DROP TABLE IF EXISTS "users";
CREATE TABLE "users" (
"id" serial not null ,
  "createDate" timestamp without time zone not null,
  "modifyDate" timestamp without time zone not null,
  "isEnabled" boolean not null,
  "isLocked" boolean not null,
  "lastLoginDate" timestamp without time zone default null,
  "lastLoginIp" varchar(255) default null,
  "lockDate" timestamp without time zone default null,
  "uname" varchar(64) not null,
  "encodePassword" varchar(64) not null,
  "role" varchar(64) default null,
  "type" varchar(64) default null,
  PRIMARY KEY ("id"))
;
DROP TABLE IF EXISTS "users_role";
CREATE TABLE "users_role" (
  "user_id" integer not null,
  "role_id" integer not null,
  PRIMARY KEY ("user_id","role_id"))
;
