CREATE TABLE "public"."walk_event" ("id" varchar NOT NULL DEFAULT nanoid(), "walk_id" varchar NOT NULL, "walk_event_type" text NOT NULL DEFAULT 'Move', "latitude" float8 NOT NULL, "longitude" float8 NOT NULL, "speed" float8, "heading" float8, "altitude" float8, "accuracy" float8, "timestamp" timestamptz NOT NULL DEFAULT now(), "created_at" timestamptz NOT NULL DEFAULT now(), "updated_at" timestamptz NOT NULL DEFAULT now(), PRIMARY KEY ("id") , FOREIGN KEY ("walk_id") REFERENCES "public"."walk"("id") ON UPDATE cascade ON DELETE cascade);
CREATE OR REPLACE FUNCTION "public"."set_current_timestamp_updated_at"()
RETURNS TRIGGER AS $$
DECLARE
  _new record;
BEGIN
  _new := NEW;
  _new."updated_at" = NOW();
  RETURN _new;
END;
$$ LANGUAGE plpgsql;
CREATE TRIGGER "set_public_walk_event_updated_at"
BEFORE UPDATE ON "public"."walk_event"
FOR EACH ROW
EXECUTE PROCEDURE "public"."set_current_timestamp_updated_at"();
COMMENT ON TRIGGER "set_public_walk_event_updated_at" ON "public"."walk_event" 
IS 'trigger to set value of column "updated_at" to current timestamp on row update';
