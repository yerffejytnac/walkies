CREATE TABLE "public"."gps_track" ("id" varchar NOT NULL DEFAULT nanoid(), "created_at" timestamptz NOT NULL DEFAULT now(), "updated_at" timestamptz NOT NULL DEFAULT now(), PRIMARY KEY ("id") );
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
CREATE TRIGGER "set_public_gps_track_updated_at"
BEFORE UPDATE ON "public"."gps_track"
FOR EACH ROW
EXECUTE PROCEDURE "public"."set_current_timestamp_updated_at"();
COMMENT ON TRIGGER "set_public_gps_track_updated_at" ON "public"."gps_track" 
IS 'trigger to set value of column "updated_at" to current timestamp on row update';
