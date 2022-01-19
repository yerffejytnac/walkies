CREATE FUNCTION create_point_from_coords() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    NEW.geom := ST_SetSRID(ST_MakePoint(NEW.longitude, NEW.latitude),4326);
    
    RETURN NEW;
END;
$$;

CREATE TRIGGER create_point_from_coords_trigger BEFORE INSERT OR UPDATE ON gps_point FOR EACH ROW EXECUTE FUNCTION create_point_from_coords();
