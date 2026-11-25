extends RefCounted

## Smoke test for JsonUtil. Returns the number of failed checks.
## Uses preload instead of the class_name global so it also works
## in a headless --script run before the global class cache exists.

const JsonUtilScript: GDScript = preload("res://core/json_util.gd")


func run() -> int:
	var failures: int = 0

	# A path that does not exist must yield null (push_error output is expected).
	var missing: Variant = JsonUtilScript.load_file("res://tests/__missing_file__.json")
	if missing != null:
		push_error("test_json_util: expected null for missing file")
		failures += 1

	return failures
