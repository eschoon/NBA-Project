-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/?state=h1on9jgxby5i&code=4%2FjwGH0syTcNBpFFTQpT0BSOxUz2-gzXch7kFq0p8H6HY_U7GTGA1vu9VIyxYbl-vy8YcoUh2O6wmxBjLg7v2zFgI&scope=email+profile+openid+https%3A%2F%2Fwww.googleapis.com%2Fauth%2Fuserinfo.profile+https%3A%2F%2Fwww.googleapis.com%2Fauth%2Fuserinfo.email&authuser=0&session_state=518875b8ba1ffcf61ac1944f07a4da18f2c0ac86..6931&prompt=consent#/d/Tgeiol
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "Players" (
    "id" serial   NOT NULL,
    "name" VARCHAR   NOT NULL,
    "year_start" DATE   NOT NULL,
    "year_end" DATE   NOT NULL,
    CONSTRAINT "pk_Players" PRIMARY KEY (
        "name"
     )
);

CREATE TABLE "Player_data" (
    "id" serial   NOT NULL,
    "name" VARCHAR   NOT NULL,
    "birth_date" DATE   ,
    "college" VARCHAR   ,
    "height_feet" INT   ,
    "height_inches" INT   ,
    "weight" INT   
);

CREATE TABLE "Positions" (
    "id" serial   NOT NULL,
    "position" VARCHAR   ,
    CONSTRAINT "pk_Positions" PRIMARY KEY (
        "position"
     )
);

CREATE TABLE "Colleges" (
    "id" serial   ,
    "college" VARCHAR   ,
    CONSTRAINT "pk_Colleges" PRIMARY KEY (
        "college"
     )
);

CREATE TABLE "Teams" (
    "id" serial   NOT NULL,
    "team" VARCHAR   ,
    CONSTRAINT "pk_Teams" PRIMARY KEY (
        "team"
     )
);

CREATE TABLE "SeasonStats" (
    "id" SERIAL   NOT NULL,
    "Player" VARCHAR   NOT NULL,
    "Year" DATE   NOT NULL,
    "Team" VARCHAR   NOT NULL,
    "Age" INT   NOT NULL,
    "Position" VARCHAR   NOT NULL,
    "G" INT   ,
    "GS" INT   ,
    "MP" INT   ,
    "FG" INT   NOT NULL,
    "FGA" INT   NOT NULL,
    "FG%" DECIMAL   NOT NULL,
    "3P" INT   ,
    "3PA" INT   ,
    "3P%" DECIMAL   ,
    "2P" INT   ,
    "2PA" INT   ,
    "2P%" DECIMAL   ,
    "eFG%" DECIMAL   ,
    "FT" INT   NOT NULL,
    "FTA" INT   NOT NULL,
    "FT%" DECIMAL   NOT NULL,
    "ORB" INT   NOT NULL,
    "DRB" INT   NOT NULL,
    "TRB" INT   NOT NULL,
    "AST" INT   NOT NULL,
    "STL" INT   NOT NULL,
    "BLK" INT   NOT NULL,
    "TOV" INT   NOT NULL,
    "PF" INT   NOT NULL,
    "PTS" INT   NOT NULL
);

ALTER TABLE "Player_data" ADD CONSTRAINT "fk_Player_data_name" FOREIGN KEY("name")
REFERENCES "Players" ("name");

ALTER TABLE "Player_data" ADD CONSTRAINT "fk_Player_data_college" FOREIGN KEY("college")
REFERENCES "Colleges" ("college");

ALTER TABLE "SeasonStats" ADD CONSTRAINT "fk_SeasonStats_Player" FOREIGN KEY("Player")
REFERENCES "Players" ("name");

ALTER TABLE "SeasonStats" ADD CONSTRAINT "fk_SeasonStats_Team" FOREIGN KEY("Team")
REFERENCES "Teams" ("team");

ALTER TABLE "SeasonStats" ADD CONSTRAINT "fk_SeasonStats_Position" FOREIGN KEY("Position")
REFERENCES "Positions" ("position");

