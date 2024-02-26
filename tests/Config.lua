local DEBUG_OPTIONS = { OFF = 0, Fiu = 1, LUAU = 2, ALL = 3 }
local DEBUG_LEVEL = { PRINT = 1, WARN = 2, ALL = 3, IO_STREAM = 4}

local TEST_DIR = "tests"

return {
	TEST_DIR = TEST_DIR,
	TESTS = {
		Conformance = `{TEST_DIR}/Conformance`,
		Staging = `{TEST_DIR}/Staging`,
	},
	DEBUGGING = DEBUG_OPTIONS.ALL,
	DEBUGGING_LEVEL = DEBUG_LEVEL.WARN,
}