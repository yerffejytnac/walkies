CREATE TRIGGER create_walk_event_geom_trigger BEFORE INSERT OR UPDATE ON walk_event FOR EACH ROW EXECUTE FUNCTION create_point_from_coords();
