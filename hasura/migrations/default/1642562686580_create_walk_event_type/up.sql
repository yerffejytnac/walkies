CREATE TABLE walk_event_type (
    value text PRIMARY KEY,
    description text
);

INSERT INTO walk_event_type (value, description) VALUES
    ('Start', ''),
    ('Stop', ''),
    ('Move', ''),
    ('Pee', ''),
    ('Poo', ''),
    ('Treat', '');
