extends SceneTree

## Headless test runner.
## Usage: godot --headless --path <project> --script res://tests/run_tests.gd
## Each test script must extend RefCounted and provide `func run() -> int`
## returning the number of failed checks.

const TEST_SCRIPTS: Array[GDScript] = [
	preload("res://tests/test_json_util.gd"),
]


func _init() -> void:
	var total_failures: int = 0
	for entry in TEST_SCRIPTS:
		var test_script: GDScript = entry
		var test: Object = test_script.new()
		var failures: int = test.call("run")
		print("%s: %d failure(s)" % [test_script.resource_path, failures])
		total_failures += failures

	print("TOTAL failures: %d" % total_failures)
	quit(1 if total_failures > 0 else 0)
