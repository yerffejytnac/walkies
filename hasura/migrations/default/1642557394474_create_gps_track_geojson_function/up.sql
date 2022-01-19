CREATE OR REPLACE FUNCTION gps_track_geojson(gps_track_row gps_track)
 RETURNS text
 LANGUAGE sql
 STABLE
AS $function$
	SELECT
		ST_AsGeoJSON(ST_MakeLine(gps_point.geom ORDER BY gps_point.timestamp))
	FROM
		gps_point
	WHERE
		gps_point.gps_track_id = gps_track_row.id
$function$;
