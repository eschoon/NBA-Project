-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/Tgeiol
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "Players" (
    "id" serial   NOT NULL,
    "name" VARCHAR   NOT NULL,
    "birth_date" DATE  ,
    CONSTRAINT "pk_Players" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "Player_data" (
    "id" INT   NOT NULL,
    "year_start" DATE ,
    "year_end" DATE  ,
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
    "id" serial   NOT NULL,
    "college" VARCHAR   ,
    CONSTRAINT "pk_Colleges" PRIMARY KEY (
        "college"
     )
);

CREATE TABLE "Teams" (
    "id" serial   NOT NULL,
    "team" VARCHAR   NOT NULL,
    CONSTRAINT "pk_Teams" PRIMARY KEY (
        "team"
     )
);

CREATE TABLE "SeasonStats" (
    "id" SERIAL   NOT NULL,
    "Player" VARCHAR   NOT NULL,
    "Year" INT   NOT NULL,
    "Team" VARCHAR   NOT NULL,
    "Age" INT   NOT NULL,
    "Position" VARCHAR   NOT NULL,
    "Tm" INT   ,
    "G" INT  NOT NULL,
    "GS" INT   ,
    "MP" INT   ,
    "FG" INT   NOT NULL,
    "FGA" INT   NOT NULL,
    "FG_percent" DECIMAL   NOT NULL,
    "3P" INT   ,
    "3PA" INT   ,
    "3P_percent" DECIMAL ,
    "2P" INT   NOT NULL,
    "2PA" INT   NOT NULL,
    "2P_percent" DECIMAL   NOT NULL,
    "eFG_percent" DECIMAL   NOT NULL,
    "FT" INT   NOT NULL,
    "FTA" INT   NOT NULL,
    "FT_percent" DECIMAL   NOT NULL,
    "ORB" INT   ,
    "DRB" INT   ,
    "TRB" INT   ,
    "AST" INT   NOT NULL,
    "STL" INT   ,
    "BLK" INT   ,
    "TOV" INT   ,
    "PF" INT   NOT NULL,
    "PTS" INT   NOT NULL
);

ALTER TABLE "Player_data" ADD CONSTRAINT "fk_Player_data_id" FOREIGN KEY("id")
REFERENCES "Players" ("id");

ALTER TABLE "Player_data" ADD CONSTRAINT "fk_Player_data_college" FOREIGN KEY("college")
REFERENCES "Colleges" ("college");

ALTER TABLE "SeasonStats" ADD CONSTRAINT "fk_SeasonStats_Player" FOREIGN KEY("Player")
REFERENCES "Players" ("name");

ALTER TABLE "SeasonStats" ADD CONSTRAINT "fk_SeasonStats_Team" FOREIGN KEY("Team")
REFERENCES "Teams" ("team");

ALTER TABLE "SeasonStats" ADD CONSTRAINT "fk_SeasonStats_Position" FOREIGN KEY("Position")
REFERENCES "Positions" ("position");

