CREATE OR REPLACE FUNCTION nanoid(size integer DEFAULT 12)
 RETURNS text
 LANGUAGE plpgsql
 STABLE
AS $function$
DECLARE
  id text := '';
  idx int := 0;
  alphabet char(62) := '0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz';
  bytes bytea := gen_random_bytes(size);
  byte int;
  pos int;
BEGIN
  WHILE idx < size LOOP
    byte := get_byte(bytes, idx);
    pos := (byte & 61) + 1; -- + 1 because substr starts at 1 for some reason
    id := id || substr(alphabet, pos, 1);
    idx = idx + 1;
  END LOOP;
  RETURN id;
END
$function$;
