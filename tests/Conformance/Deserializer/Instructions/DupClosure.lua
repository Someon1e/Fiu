-- file was auto-generated by `fiu-tests`
--!ctx Luau

local ok, compileResult = Luau.compile([[
-- tests: LOP_DUPCLOSURE

-- test upvalues
local a = 1
local b = 2
local c = 3
function dupClosure()
	assert(a == 1, b == 2, c == 3)
	return a + b + c
end
assert(dupClosure() == 6)

-- test function given proto
function dupClosure2(a)
	local function nestClosure(a, b, c)
		return {a, b, c}
	end
	
	return "DUPCLOSURE", nestClosure(21, 22, 23)
end

local closure, result = dupClosure2(20)
assert(closure == "DUPCLOSURE")
assert(#result == 3 and result[1] == 21 and result[2] == 22 and result[3] == 23)

OK()
]], {
	optimizationLevel = 2,
	debugLevel = 2,
	coverageLevel = 0,
	vectorLib = nil,
	vectorCtor = nil,
	vectorType = nil
})

if not ok then
	error(`Failed to compile, error: {compileResult}`)
end

local encodedModule, constantList, stringList = [[
1; 4; 0 4 0 3 0 7 2 9 2 0 [] 1 [8,8,8,8,8,8,8,9,9,] {
	3 3 0 ? 1 1 0 ? ? ? ? ? ? ? ? ?; 3 3 0 ? 2 1 0 ? ? ? ? ? ? ? ? ?; 3 3 0 ? 3 1 0 ? ? ? ? ? ? ? ? ?; 68 3 0 ? 1 0 2 ? ? ? ? ? ? ? ? ?
	12 4 4 1073741824 0 ? ? 1 ? ? 1 ? ? ? 1 1; ~ 1073741824; 21 3 0 ? 0 4 1 ? ? ? ? ? ? ? ? ?; 4 4 0 ? 0 ? ? 6 ? ? ? ? ? ? ? ?
	22 2 0 ? 0 2 ? ? ? ? ? ? ? ? ? ?
}
1 7 3 0 0 15 6 8 0 0 [] 1 [16,16,16,16,16,16,16,16,] {
	53 2 0 3 3 0 ? ? ? ? ? ? ? ? ? 1; ~ 3; 6 2 0 ? 4 0 ? ? ? ? ? ? ? ? ? ?; 6 2 0 ? 5 1 ? ? ? ? ? ? ? ? ? ?
	6 2 0 ? 6 2 ? ? ? ? ? ? ? ? ? ?; 55 3 0 1 3 4 4 ? ? ? ? ? ? ? ? 1; ~ 1; 22 2 0 ? 3 2 ? ? ? ? ? ? ? ? ? ?
}
2 7 1 0 0 14 8 10 2 1 [2,] 1 [15,19,272,272,272,272,272,272,272,272,] {
	64 4 3 ? 1 ? ? 0 ? 1 ? ? ? ? ? ?; 5 4 3 ? 2 ? ? 1 ? 2 ? ? ? ? ? ?; 53 2 0 3 3 0 ? ? ? ? ? ? ? ? ? 1; ~ 3
	4 4 0 ? 4 ? ? 21 ? ? ? ? ? ? ? ?; 4 4 0 ? 5 ? ? 22 ? ? ? ? ? ? ? ?; 4 4 0 ? 6 ? ? 23 ? ? ? ? ? ? ? ?; 55 3 0 1 3 4 4 ? ? ? ? ? ? ? ? 1
	~ 1; 22 2 0 ? 2 3 ? ? ? ? ? ? ? ? ? ?
}
3 8 0 0 1 1 ? 61 14 2 [1,3,] 1 [1,4,5,6,7,7,7,7,7,7,11,11,11,11,11,11,11,11,11,11,11,14,14,14,22,22,22,22,23,23,23,23,23,23,23,23,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,26,26,26,27,] {
	65 1 0 ? 0 ? ? ? ? ? ? ? ? ? ? ?; 4 4 0 ? 0 ? ? 1 ? ? ? ? ? ? ? ?; 4 4 0 ? 1 ? ? 2 ? ? ? ? ? ? ? ?; 4 4 0 ? 2 ? ? 3 ? ? ? ? ? ? ? ?
	64 4 3 ? 3 ? ? 0 ? 1 ? ? ? ? ? ?; 70 2 0 ? 0 0 ? ? ? ? ? ? ? ? ? ?; 70 2 0 ? 0 1 ? ? ? ? ? ? ? ? ? ?; 70 2 0 ? 0 2 ? ? ? ? ? ? ? ? ? ?
	8 1 1 1 3 ? ? ? ? 2 ? ? ? ? ? 1; ~ 1; 7 1 1 1 5 ? ? ? ? 2 ? ? ? ? ? 1; ~ 1
	21 3 0 ? 5 1 2 ? ? ? ? ? ? ? ? ?; 79 4 6 2 5 ? ? 2 ? 3 ? ? ? 0 ? 1; ~ 2; 3 3 0 ? 4 0 1 ? ? ? ? ? ? ? ? ?
	3 3 0 ? 4 1 0 ? ? ? ? ? ? ? ? ?; 73 3 0 ? 1 4 2 ? ? ? ? ? ? ? ? ?; 12 4 4 1076887552 3 ? ? 4 ? ? 4 ? ? ? 1 1; ~ 1076887552
	21 3 0 ? 3 2 1 ? ? ? ? ? ? ? ? ?; 64 4 3 ? 3 ? ? 5 ? 6 ? ? ? ? ? ?; 8 1 1 6 3 ? ? ? ? 7 ? ? ? ? ? 1; ~ 6
	7 1 1 6 3 ? ? ? ? 7 ? ? ? ? ? 1; ~ 6; 4 4 0 ? 4 ? ? 20 ? ? ? ? ? ? ? ?; 21 3 0 ? 3 2 3 ? ? ? ? ? ? ? ? ?
	80 4 6 7 3 ? ? 2 ? 8 ? ? ? 0 ? 1; ~ 7; 3 3 0 ? 6 0 1 ? ? ? ? ? ? ? ? ?; 3 3 0 ? 6 1 0 ? ? ? ? ? ? ? ? ?
	73 3 0 ? 1 6 2 ? ? ? ? ? ? ? ? ?; 12 4 4 1076887552 5 ? ? 4 ? ? 4 ? ? ? 1 1; ~ 1076887552; 21 3 0 ? 5 2 1 ? ? ? ? ? ? ? ? ?
	3 3 0 ? 6 0 0 ? ? ? ? ? ? ? ? ?; 52 2 0 ? 7 4 ? ? ? ? ? ? ? ? ? ?; 79 4 6 2147483656 7 ? ? 14 ? 9 ? ? ? 1 ? 1; ~ 2147483656
	3 3 0 ? 6 0 0 ? ? ? ? ? ? ? ? ?; 17 3 0 ? 7 4 0 ? ? ? ? ? ? ? ? ?; 79 4 6 2147483657 7 ? ? 10 ? 10 ? ? ? 1 ? 1; ~ 2147483657
	3 3 0 ? 6 0 0 ? ? ? ? ? ? ? ? ?; 17 3 0 ? 7 4 1 ? ? ? ? ? ? ? ? ?; 79 4 6 2147483658 7 ? ? 6 ? 11 ? ? ? 1 ? 1; ~ 2147483658
	17 3 0 ? 7 4 2 ? ? ? ? ? ? ? ? ?; 79 4 6 11 7 ? ? 2 ? 12 ? ? ? 0 ? 1; ~ 11; 3 3 0 ? 6 0 1 ? ? ? ? ? ? ? ? ?
	3 3 0 ? 6 1 0 ? ? ? ? ? ? ? ? ?; 73 3 0 ? 1 6 2 ? ? ? ? ? ? ? ? ?; 12 4 4 1076887552 5 ? ? 4 ? ? 4 ? ? ? 1 1; ~ 1076887552
	21 3 0 ? 5 2 1 ? ? ? ? ? ? ? ? ?; 12 4 4 1086324736 5 ? ? 13 ? ? 13 ? ? ? 1 1; ~ 1086324736; 21 3 0 ? 5 1 1 ? ? ? ? ? ? ? ? ?
	22 2 0 ? 0 1 ? ? ? ? ? ? ? ? ? ?
}]], {
	{ "1",1073741824,},{ },{ 1,"7",},{ 0,"2",6,"1",1076887552,2,"8","7",3,21,22,23,"9",1086324736,},
}, {
	"\97\115\115\101\114\116","\100\117\112\67\108\111\115\117\114\101","\97","\98","\99","\110\101\115\116\67\108\111\115\117\114\101",
	"\68\85\80\67\76\79\83\85\82\69","\100\117\112\67\108\111\115\117\114\101\50","\79\75","\99\108\111\115\117\114\101",
	"\114\101\115\117\108\116",
}

assert(MATCH(
	Fiu.luau_deserialize(compileResult),
	FiuUtils.decodeModule(encodedModule, constantList, stringList)
))

OK()