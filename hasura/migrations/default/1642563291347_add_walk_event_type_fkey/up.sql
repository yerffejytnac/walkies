ALTER TABLE walk_event ADD CONSTRAINT
    walk_event_type_fkey FOREIGN KEY (walk_event_type) REFERENCES walk_event_type;
