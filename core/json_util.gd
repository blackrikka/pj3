class_name JsonUtil
extends RefCounted

## JSON file helpers.


## Reads the file at `path` and parses it as JSON.
## Returns the parsed value, or null on failure (after push_error).
static func load_file(path: String) -> Variant:
	var file: FileAccess = FileAccess.open(path, FileAccess.READ)
	if file == null:
		push_error("JsonUtil: cannot open '%s' (error %d)" % [path, FileAccess.get_open_error()])
		return null

	var text: String = file.get_as_text()
	var parsed: Variant = JSON.parse_string(text)
	if parsed == null:
		push_error("JsonUtil: failed to parse JSON in '%s'" % path)
		return null
	return parsed
