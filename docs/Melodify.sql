CREATE TABLE "users" (
  "id" bigint PRIMARY KEY,
  "first_name" varchar(255),
  "last_name" varchar(255),
  "email" varchar(255),
  "password" varchar(255),
  "encrypted_password" varchar(255),
  "reset_password_token" varchar(255),
  "reset_password_sent_at" timestamp,
  "created_at" timestamp,
  "updated_at" timestamp
);

CREATE TABLE "exercises" (
  "id" bigint PRIMARY KEY,
  "title" varchar(255),
  "author_id" bigint,
  "created_at" timestamp,
  "updated_at" timestamp
);

CREATE TABLE "grades" (
  "id" bigint PRIMARY KEY,
  "grade" varchar(255),
  "user_id" bigint,
  "exercise_id" bigint,
  "created_at" timestamp,
  "updated_at" timestamp
);

CREATE TABLE "instruments" (
  "id" bigint PRIMARY KEY,
  "name" varchar(255),
  "image_id" bigint,
  "sound_id" bigint,
  "user_id" bigint,
  "created_at" timestamp,
  "updated_at" timestamp
);

CREATE TABLE "instrument_images" (
  "id" bigint PRIMARY KEY,
  "instrument_id" bigint,
  "image" varchar(255),
  "created_at" timestamp,
  "update_at" timestamp
);

CREATE TABLE "instrument_sounds" (
  "id" bigint PRIMARY KEY,
  "instrument_id" bigint,
  "sound" varchar(255),
  "created_at" timestamp,
  "update_at" timestamp
);

CREATE TABLE "exercise_instruments" (
  "id" bigint PRIMARY KEY,
  "exercise_id" bigint,
  "instrument_id" bigint
);

ALTER TABLE "grades" ADD FOREIGN KEY ("user_id") REFERENCES "users" ("id");

ALTER TABLE "exercises" ADD FOREIGN KEY ("author_id") REFERENCES "users" ("id");

ALTER TABLE "grades" ADD FOREIGN KEY ("exercise_id") REFERENCES "exercises" ("id");

ALTER TABLE "instrument_images" ADD FOREIGN KEY ("id") REFERENCES "instruments" ("id");

ALTER TABLE "instrument_sounds" ADD FOREIGN KEY ("id") REFERENCES "instruments" ("id");

ALTER TABLE "exercises" ADD FOREIGN KEY ("id") REFERENCES "exercise_instruments" ("id");

ALTER TABLE "instruments" ADD FOREIGN KEY ("id") REFERENCES "exercise_instruments" ("id");
