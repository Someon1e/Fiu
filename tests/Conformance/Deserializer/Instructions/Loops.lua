-- file was auto-generated by `fiu-tests`
--!ctx Luau

local ok, compileResult = Luau.compile([[
-- tests: LOP_FORGPREP, LOP_FORGLOOP, LOP_FORNPREP, LOP_FORNLOOP, LOP_FORGPREP_INEXT, LOP_FORGPREP_NEXT

-- FORGLOOP
-- FORGPREP
local t = {1,2,3,4,5,6,7,8,9,10}
local c = 0

assert(#t == 10, "Table was not created correctly")

-- : Function #1
do
	-- LOP_FORGPREP_INEXT
	for i, v in ipairs(t) do
		c += v
	end
end
assert(c == 55, "FORGLOOP did not loop correctly #1")

-- : Function #2
c = 0
do
	-- LOP_FORGPREP_NEXT
	for i, v in pairs(t) do
		c += v * 2
	end
end
assert(c == 110, "FORGLOOP did not loop correctly #2")

-- : Generalized Iteration #1
c = 0
do
	for i, v in t do
		c += v * 3
	end
end
assert(c == 165, "FORGLOOP did not loop correctly #3")

-- : Generalized Iteration #2
c = 0
do
	for i, v in {a = 1, b = 2, c = 3} do
		c += v + 4
	end
end
assert(c == 18, "FORGLOOP did not loop correctly #4")

-- : Generalized Iteration #3
local x = ''
do
	for i, v in {1, 2, 3, nil, 5} do
		x ..= tostring(v)
	end
end
assert(x == "1235", "FORGLOOP did not loop correctly #5")

-- : Table Metatable Call
c = 0
do
	local m1 = setmetatable({}, {
		__call = function(_, _, i)
			if i >= 10 then
				return
			end
			return i + 1
		end
	})
	for i in m1, nil, 0 do
		c += t[i] * 4
	end
end
assert(c == 220, "FORGLOOP did not loop correctly #6")

-- : Userdata Metatable Call
c = 0
do
	local p = newproxy(true)
	local m = getmetatable(p)
	m.__call = function(_, _, i)
		if i >= 10 then
			return
		end
		return i + 1
	end
	for i in p, nil, 0 do
		c += t[i] * 5
	end
end
assert(c == 275, "FORGLOOP did not loop correctly #7")

-- : Table Metatable Iteration
c = 0
do
	local m = setmetatable({}, {
		__iter = function(self, i, v)
			return next, t
		end
	})
	for i, v in m do
		c += v * 6
	end
end
assert(c == 330, "FORGLOOP did not loop correctly #8")

-- : Userdata Metatable Iteration
c = 0
do
	local p = newproxy(true)
	local m = getmetatable(p)
	m.__iter = function(self, i, v)
		return next, t
	end
	for i, v in p do
		c += v * 7
	end
end
assert(c == 385, "FORGLOOP did not loop correctly #9")

-- FORNLOOP
-- FORNPREP
c = 0
for i = 1, 10 do
	c += t[i] * 8
end
assert(c == 440, "FORNLOOP did not loop correctly #1")

c = 0
for i = 5, 1, -1 do
	c -= i
end
assert(c == -15, "FORNLOOP did not loop correctly #2")

OK();
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
1; 5; 0 4 3 0 0 60 1 6 1 0 [] 1 [61,61,61,62,64,64,] {
	4 4 0 ? 3 ? ? 10 ? ? ? ? ? ? ? ?; 31 4 0 2 3 ? ? 2 ? ? ? ? ? ? ? 1; ~ 2; 22 2 0 ? 0 1 ? ? ? ? ? ? ? ? ? ?
	39 3 2 ? 3 2 0 ? ? 1 ? ? ? ? ? ?; 22 2 0 ? 3 2 ? ? ? ? ? ? ? ? ? ?
}
1 4 3 0 0 78 ? 6 1 0 [] 1 [79,79,79,80,82,82,] {
	4 4 0 ? 3 ? ? 10 ? ? ? ? ? ? ? ?; 31 4 0 2 3 ? ? 2 ? ? ? ? ? ? ? 1; ~ 2; 22 2 0 ? 0 1 ? ? ? ? ? ? ? ? ? ?
	39 3 2 ? 3 2 0 ? ? 1 ? ? ? ? ? ?; 22 2 0 ? 3 2 ? ? ? ? ? ? ? ? ? ?
}
2 5 3 1 0 94 5 4 2 0 [] 1 [95,95,95,95,] {
	12 4 4 1073741824 3 ? ? 1 ? ? 1 ? ? ? 1 1; ~ 1073741824; 9 2 0 ? 4 0 ? ? ? ? ? ? ? ? ? ?; 22 2 0 ? 3 3 ? ? ? ? ? ? ? ? ? ?
}
3 5 3 1 0 109 ? 4 2 0 [] 1 [110,110,110,110,] {
	12 4 4 1073741824 3 ? ? 1 ? ? 1 ? ? ? 1 1; ~ 1073741824; 9 2 0 ? 4 0 ? ? ? ? ? ? ? ? ? ?; 22 2 0 ? 3 3 ? ? ? ? ? ? ? ? ? ?
}
4 12 0 0 1 1 ? 331 61 4 [1,2,3,4,] 1 [1,5,5,5,5,5,5,5,5,5,5,5,5,5,5,6,8,8,8,8,8,8,8,8,8,8,8,13,13,13,13,13,14,269,269,273,273,273,273,273,273,273,273,273,273,276,279,279,279,279,279,280,280,535,535,539,539,539,539,539,539,539,539,539,539,542,544,544,544,544,545,545,800,800,804,804,804,804,804,804,804,804,804,804,807,809,809,809,809,809,809,809,809,809,809,809,809,809,810,810,1065,1065,1069,1069,1069,1069,1069,1069,1069,1069,1069,1069,1072,1074,1074,1074,1074,1074,1074,1074,1074,1074,1074,1074,1074,1075,1075,1075,1075,1075,1075,1075,1330,1330,1334,1334,1334,1334,1334,1334,1334,1334,1334,1334,1337,1339,1339,1339,1340,1340,1340,1340,1340,1595,1595,1595,1603,1603,1603,1603,1604,1604,1604,1859,1859,1863,1863,1863,1863,1863,1863,1863,1863,1863,1863,1866,1868,1868,1868,1868,1869,1869,1869,1869,1869,1870,1870,1870,1876,1876,1876,1876,1877,1877,1877,2132,2132,2136,2136,2136,2136,2136,2136,2136,2136,2136,2136,2139,2141,2141,2141,2142,2142,2142,2142,2142,2142,2397,2397,2397,2402,2402,2402,2402,2403,2403,2658,2658,2662,2662,2662,2662,2662,2662,2662,2662,2662,2662,2665,2667,2667,2667,2667,2668,2668,2668,2668,2668,2669,2669,2669,2669,2672,2672,2672,2672,2673,2673,2928,2928,2932,2932,2932,2932,2932,2932,2932,2932,2932,2932,2936,2938,2938,2938,2938,2938,2938,2938,2938,2938,2938,2938,2938,2938,2938,2938,2938,2938,2938,2938,2938,2938,2938,2938,2938,2938,2938,2938,2938,2938,2938,2940,2940,2940,2940,2940,2940,2940,2940,2940,2940,2942,2944,2944,2944,2944,2944,2946,2946,2946,2946,2946,2946,2946,2946,2946,2946,2948,2948,2948,2949,] {
	65 1 0 ? 0 ? ? ? ? ? ? ? ? ? ? ?; 53 2 0 10 0 0 ? ? ? ? ? ? ? ? ? 1; ~ 10; 4 4 0 ? 1 ? ? 1 ? ? ? ? ? ? ? ?
	4 4 0 ? 2 ? ? 2 ? ? ? ? ? ? ? ?; 4 4 0 ? 3 ? ? 3 ? ? ? ? ? ? ? ?; 4 4 0 ? 4 ? ? 4 ? ? ? ? ? ? ? ?; 4 4 0 ? 5 ? ? 5 ? ? ? ? ? ? ? ?
	4 4 0 ? 6 ? ? 6 ? ? ? ? ? ? ? ?; 4 4 0 ? 7 ? ? 7 ? ? ? ? ? ? ? ?; 4 4 0 ? 8 ? ? 8 ? ? ? ? ? ? ? ?; 4 4 0 ? 9 ? ? 9 ? ? ? ? ? ? ? ?
	4 4 0 ? 10 ? ? 10 ? ? ? ? ? ? ? ?; 55 3 0 1 0 1 11 ? ? ? ? ? ? ? ? 1; ~ 1; 4 4 0 ? 1 ? ? 0 ? ? ? ? ? ? ? ?
	52 2 0 ? 4 0 ? ? ? ? ? ? ? ? ? ?; 79 4 6 0 4 ? ? 2 ? 1 ? ? ? 0 ? 1; ~ 0; 3 3 0 ? 3 0 1 ? ? ? ? ? ? ? ? ?
	3 3 0 ? 3 1 0 ? ? ? ? ? ? ? ? ?; 75 3 1 1 1 3 4 ? ? 2 ? ? ? ? ? 1; ~ 1; 5 4 3 ? 4 ? ? 1 ? 2 ? ? ? ? ? ?
	12 4 4 1075838976 2 ? ? 3 ? ? 3 ? ? ? 1 1; ~ 1075838976; 21 3 0 ? 2 3 1 ? ? ? ? ? ? ? ? ?; 12 4 4 1077936128 2 ? ? 5 ? ? 5 ? ? ? 1 1
	~ 1077936128; 6 2 0 ? 3 0 ? ? ? ? ? ? ? ? ? ?; 21 3 0 ? 2 2 4 ? ? ? ? ? ? ? ? ?; 59 4 0 ? 2 ? ? 1 ? ? ? ? ? ? ? ?
	33 3 0 ? 1 1 6 ? ? ? ? ? ? ? ? ?; 58 4 8 2147483650 2 ? ? -2 ? 11 ? ? ? ? ? 1; ~ 2147483650; 79 4 6 6 1 ? ? 2 ? 7 ? ? ? 0 ? 1
	~ 6; 3 3 0 ? 3 0 1 ? ? ? ? ? ? ? ? ?; 3 3 0 ? 3 1 0 ? ? ? ? ? ? ? ? ?; 75 3 1 7 1 3 4 ? ? 8 ? ? ? ? ? 1
	~ 7; 5 4 3 ? 4 ? ? 7 ? 8 ? ? ? ? ? ?; 12 4 4 1075838976 2 ? ? 3 ? ? 3 ? ? ? 1 1; ~ 1075838976
	21 3 0 ? 2 3 1 ? ? ? ? ? ? ? ? ?; 4 4 0 ? 1 ? ? 0 ? ? ? ? ? ? ? ?; 12 4 4 1082130432 2 ? ? 9 ? ? 9 ? ? ? 1 1; ~ 1082130432
	6 2 0 ? 3 0 ? ? ? ? ? ? ? ? ? ?; 21 3 0 ? 2 2 4 ? ? ? ? ? ? ? ? ?; 61 4 0 ? 2 ? ? 2 ? ? ? ? ? ? ? ?; 41 3 2 ? 7 6 10 ? ? 11 ? ? ? ? ? ?
	33 3 0 ? 1 1 7 ? ? ? ? ? ? ? ? ?; 58 4 8 2 2 ? ? -3 ? 11 ? ? ? ? ? 1; ~ 2; 79 4 6 11 1 ? ? 2 ? 12 ? ? ? 0 ? 1
	~ 11; 3 3 0 ? 3 0 1 ? ? ? ? ? ? ? ? ?; 3 3 0 ? 3 1 0 ? ? ? ? ? ? ? ? ?; 75 3 1 12 1 3 4 ? ? 13 ? ? ? ? ? 1
	~ 12; 5 4 3 ? 4 ? ? 12 ? 13 ? ? ? ? ? ?; 12 4 4 1075838976 2 ? ? 3 ? ? 3 ? ? ? 1 1; ~ 1075838976
	21 3 0 ? 2 3 1 ? ? ? ? ? ? ? ? ?; 4 4 0 ? 1 ? ? 0 ? ? ? ? ? ? ? ?; 6 2 0 ? 2 0 ? ? ? ? ? ? ? ? ? ?; 2 1 0 ? 3 ? ? ? ? ? ? ? ? ? ? ?
	2 1 0 ? 4 ? ? ? ? ? ? ? ? ? ? ?; 76 4 0 ? 2 ? ? 2 ? ? ? ? ? ? ? ?; 41 3 2 ? 7 6 13 ? ? 14 ? ? ? ? ? ?; 33 3 0 ? 1 1 7 ? ? ? ? ? ? ? ? ?
	58 4 8 2 2 ? ? -3 ? 11 ? ? ? ? ? 1; ~ 2; 79 4 6 14 1 ? ? 2 ? 15 ? ? ? 0 ? 1; ~ 14
	3 3 0 ? 3 0 1 ? ? ? ? ? ? ? ? ?; 3 3 0 ? 3 1 0 ? ? ? ? ? ? ? ? ?; 75 3 1 15 1 3 4 ? ? 16 ? ? ? ? ? 1; ~ 15
	5 4 3 ? 4 ? ? 15 ? 16 ? ? ? ? ? ?; 12 4 4 1075838976 2 ? ? 3 ? ? 3 ? ? ? 1 1; ~ 1075838976; 21 3 0 ? 2 3 1 ? ? ? ? ? ? ? ? ?
	4 4 0 ? 1 ? ? 0 ? ? ? ? ? ? ? ?; 54 4 3 ? 2 ? ? 19 ? 20 ? ? ? ? ? ?; 4 4 0 ? 5 ? ? 1 ? ? ? ? ? ? ? ?; 16 3 1 16 5 2 128 ? ? 17 ? ? ? ? ? 1
	~ 16; 4 4 0 ? 5 ? ? 2 ? ? ? ? ? ? ? ?; 16 3 1 17 5 2 131 ? ? 18 ? ? ? ? ? 1; ~ 17
	4 4 0 ? 5 ? ? 3 ? ? ? ? ? ? ? ?; 16 3 1 18 5 2 130 ? ? 19 ? ? ? ? ? 1; ~ 18; 2 1 0 ? 3 ? ? ? ? ? ? ? ? ? ? ?
	2 1 0 ? 4 ? ? ? ? ? ? ? ? ? ? ?; 76 4 0 ? 2 ? ? 2 ? ? ? ? ? ? ? ?; 39 3 2 ? 7 6 20 ? ? 21 ? ? ? ? ? ?; 33 3 0 ? 1 1 7 ? ? ? ? ? ? ? ? ?
	58 4 8 2 2 ? ? -3 ? 11 ? ? ? ? ? 1; ~ 2; 79 4 6 21 1 ? ? 2 ? 22 ? ? ? 0 ? 1; ~ 21
	3 3 0 ? 3 0 1 ? ? ? ? ? ? ? ? ?; 3 3 0 ? 3 1 0 ? ? ? ? ? ? ? ? ?; 75 3 1 22 1 3 4 ? ? 23 ? ? ? ? ? 1; ~ 22
	5 4 3 ? 4 ? ? 22 ? 23 ? ? ? ? ? ?; 12 4 4 1075838976 2 ? ? 3 ? ? 3 ? ? ? 1 1; ~ 1075838976; 21 3 0 ? 2 3 1 ? ? ? ? ? ? ? ? ?
	5 4 3 ? 2 ? ? 23 ? 24 ? ? ? ? ? ?; 53 2 0 5 3 0 ? ? ? ? ? ? ? ? ? 1; ~ 5; 4 4 0 ? 6 ? ? 1 ? ? ? ? ? ? ? ?
	4 4 0 ? 7 ? ? 2 ? ? ? ? ? ? ? ?; 4 4 0 ? 8 ? ? 3 ? ? ? ? ? ? ? ?; 2 1 0 ? 9 ? ? ? ? ? ? ? ? ? ? ?; 4 4 0 ? 10 ? ? 5 ? ? ? ? ? ? ? ?
	55 3 0 1 3 6 6 ? ? ? ? ? ? ? ? 1; ~ 1; 2 1 0 ? 4 ? ? ? ? ? ? ? ? ? ? ?; 2 1 0 ? 5 ? ? ? ? ? ? ? ? ? ? ?
	76 4 0 ? 3 ? ? 7 ? ? ? ? ? ? ? ?; 6 2 0 ? 8 2 ? ? ? ? ? ? ? ? ? ?; 73 3 0 ? 63 7 3 ? ? ? ? ? ? ? ? ?; 6 2 0 ? 10 7 ? ? ? ? ? ? ? ? ? ?
	12 4 4 1098907648 9 ? ? 25 ? ? 25 ? ? ? 1 1; ~ 1098907648; 21 3 0 ? 9 2 2 ? ? ? ? ? ? ? ? ?; 49 3 0 ? 2 8 9 ? ? ? ? ? ? ? ? ?
	58 4 8 2 3 ? ? -8 ? 11 ? ? ? ? ? 1; ~ 2; 80 4 6 26 2 ? ? 2 ? 27 ? ? ? 0 ? 1; ~ 26
	3 3 0 ? 4 0 1 ? ? ? ? ? ? ? ? ?; 3 3 0 ? 4 1 0 ? ? ? ? ? ? ? ? ?; 75 3 1 27 1 4 4 ? ? 28 ? ? ? ? ? 1; ~ 27
	5 4 3 ? 5 ? ? 27 ? 28 ? ? ? ? ? ?; 12 4 4 1075838976 3 ? ? 3 ? ? 3 ? ? ? 1 1; ~ 1075838976; 21 3 0 ? 3 3 1 ? ? ? ? ? ? ? ? ?
	4 4 0 ? 1 ? ? 0 ? ? ? ? ? ? ? ?; 53 2 0 0 4 0 ? ? ? ? ? ? ? ? ? 1; ~ 0; 54 4 3 ? 5 ? ? 29 ? 30 ? ? ? ? ? ?
	64 4 3 ? 6 ? ? 30 ? 31 ? ? ? ? ? ?; 16 3 1 28 6 5 239 ? ? 29 ? ? ? ? ? 1; ~ 28; 74 3 0 5 61 4 3 ? ? ? ? ? ? ? ? 1
	~ 5; 12 4 4 1106247680 3 ? ? 32 ? ? 32 ? ? ? 1 1; ~ 1106247680; 21 3 0 ? 3 3 2 ? ? ? ? ? ? ? ? ?
	6 2 0 ? 4 3 ? ? ? ? ? ? ? ? ? ?; 2 1 0 ? 5 ? ? ? ? ? ? ? ? ? ? ?; 4 4 0 ? 6 ? ? 0 ? ? ? ? ? ? ? ?; 76 4 0 ? 4 ? ? 3 ? ? ? ? ? ? ? ?
	13 3 0 ? 10 0 7 ? ? ? ? ? ? ? ? ?; 41 3 2 ? 9 10 20 ? ? 21 ? ? ? ? ? ?; 33 3 0 ? 1 1 9 ? ? ? ? ? ? ? ? ?; 58 4 8 1 4 ? ? -4 ? 40 ? ? ? ? ? 1
	~ 1; 79 4 6 33 1 ? ? 2 ? 34 ? ? ? 0 ? 1; ~ 33; 3 3 0 ? 4 0 1 ? ? ? ? ? ? ? ? ?
	3 3 0 ? 4 1 0 ? ? ? ? ? ? ? ? ?; 75 3 1 34 1 4 4 ? ? 35 ? ? ? ? ? 1; ~ 34; 5 4 3 ? 5 ? ? 34 ? 35 ? ? ? ? ? ?
	12 4 4 1075838976 3 ? ? 3 ? ? 3 ? ? ? 1 1; ~ 1075838976; 21 3 0 ? 3 3 1 ? ? ? ? ? ? ? ? ?; 4 4 0 ? 1 ? ? 0 ? ? ? ? ? ? ? ?
	12 4 4 1110441984 3 ? ? 36 ? ? 36 ? ? ? 1 1; ~ 1110441984; 3 3 0 ? 4 1 0 ? ? ? ? ? ? ? ? ?; 21 3 0 ? 3 2 2 ? ? ? ? ? ? ? ? ?
	73 3 0 ? 60 3 3 ? ? ? ? ? ? ? ? ?; 6 2 0 ? 5 3 ? ? ? ? ? ? ? ? ? ?; 12 4 4 1112539136 4 ? ? 38 ? ? 38 ? ? ? 1 1; ~ 1112539136
	21 3 0 ? 4 2 2 ? ? ? ? ? ? ? ? ?; 64 4 3 ? 5 ? ? 39 ? 40 ? ? ? ? ? ?; 16 3 1 28 5 4 239 ? ? 29 ? ? ? ? ? 1; ~ 28
	6 2 0 ? 5 3 ? ? ? ? ? ? ? ? ? ?; 2 1 0 ? 6 ? ? ? ? ? ? ? ? ? ? ?; 4 4 0 ? 7 ? ? 0 ? ? ? ? ? ? ? ?; 76 4 0 ? 5 ? ? 3 ? ? ? ? ? ? ? ?
	13 3 0 ? 11 0 8 ? ? ? ? ? ? ? ? ?; 41 3 2 ? 10 11 40 ? ? 41 ? ? ? ? ? ?; 33 3 0 ? 1 1 10 ? ? ? ? ? ? ? ? ?; 58 4 8 1 5 ? ? -4 ? 40 ? ? ? ? ? 1
	~ 1; 79 4 6 41 1 ? ? 2 ? 42 ? ? ? 0 ? 1; ~ 41; 3 3 0 ? 4 0 1 ? ? ? ? ? ? ? ? ?
	3 3 0 ? 4 1 0 ? ? ? ? ? ? ? ? ?; 75 3 1 42 1 4 4 ? ? 43 ? ? ? ? ? 1; ~ 42; 5 4 3 ? 5 ? ? 42 ? 43 ? ? ? ? ? ?
	12 4 4 1075838976 3 ? ? 3 ? ? 3 ? ? ? 1 1; ~ 1075838976; 21 3 0 ? 3 3 1 ? ? ? ? ? ? ? ? ?; 4 4 0 ? 1 ? ? 0 ? ? ? ? ? ? ? ?
	53 2 0 0 4 0 ? ? ? ? ? ? ? ? ? 1; ~ 0; 54 4 3 ? 5 ? ? 44 ? 45 ? ? ? ? ? ?; 64 4 3 ? 6 ? ? 45 ? 11 ? ? ? ? ? ?
	70 2 0 ? 0 0 ? ? ? ? ? ? ? ? ? ?; 16 3 1 43 6 5 76 ? ? 44 ? ? ? ? ? 1; ~ 43; 74 3 0 5 61 4 3 ? ? ? ? ? ? ? ? 1
	~ 5; 12 4 4 1106247680 3 ? ? 32 ? ? 32 ? ? ? 1 1; ~ 1106247680; 21 3 0 ? 3 3 2 ? ? ? ? ? ? ? ? ?
	6 2 0 ? 4 3 ? ? ? ? ? ? ? ? ? ?; 2 1 0 ? 5 ? ? ? ? ? ? ? ? ? ? ?; 2 1 0 ? 6 ? ? ? ? ? ? ? ? ? ? ?; 76 4 0 ? 4 ? ? 2 ? ? ? ? ? ? ? ?
	41 3 2 ? 9 8 46 ? ? 47 ? ? ? ? ? ?; 33 3 0 ? 1 1 9 ? ? ? ? ? ? ? ? ?; 58 4 8 2 4 ? ? -3 ? 11 ? ? ? ? ? 1; ~ 2
	79 4 6 47 1 ? ? 2 ? 48 ? ? ? 0 ? 1; ~ 47; 3 3 0 ? 4 0 1 ? ? ? ? ? ? ? ? ?; 3 3 0 ? 4 1 0 ? ? ? ? ? ? ? ? ?
	75 3 1 48 1 4 4 ? ? 49 ? ? ? ? ? 1; ~ 48; 5 4 3 ? 5 ? ? 48 ? 49 ? ? ? ? ? ?; 12 4 4 1075838976 3 ? ? 3 ? ? 3 ? ? ? 1 1
	~ 1075838976; 21 3 0 ? 3 3 1 ? ? ? ? ? ? ? ? ?; 4 4 0 ? 1 ? ? 0 ? ? ? ? ? ? ? ?; 12 4 4 1110441984 3 ? ? 36 ? ? 36 ? ? ? 1 1
	~ 1110441984; 3 3 0 ? 4 1 0 ? ? ? ? ? ? ? ? ?; 21 3 0 ? 3 2 2 ? ? ? ? ? ? ? ? ?; 73 3 0 ? 60 3 3 ? ? ? ? ? ? ? ? ?
	6 2 0 ? 5 3 ? ? ? ? ? ? ? ? ? ?; 12 4 4 1112539136 4 ? ? 38 ? ? 38 ? ? ? 1 1; ~ 1112539136; 21 3 0 ? 4 2 2 ? ? ? ? ? ? ? ? ?
	64 4 3 ? 5 ? ? 49 ? 14 ? ? ? ? ? ?; 70 2 0 ? 0 0 ? ? ? ? ? ? ? ? ? ?; 16 3 1 43 5 4 76 ? ? 44 ? ? ? ? ? 1; ~ 43
	6 2 0 ? 5 3 ? ? ? ? ? ? ? ? ? ?; 2 1 0 ? 6 ? ? ? ? ? ? ? ? ? ? ?; 2 1 0 ? 7 ? ? ? ? ? ? ? ? ? ? ?; 76 4 0 ? 5 ? ? 2 ? ? ? ? ? ? ? ?
	41 3 2 ? 10 9 50 ? ? 51 ? ? ? ? ? ?; 33 3 0 ? 1 1 10 ? ? ? ? ? ? ? ? ?; 58 4 8 2 5 ? ? -3 ? 11 ? ? ? ? ? 1; ~ 2
	79 4 6 51 1 ? ? 2 ? 52 ? ? ? 0 ? 1; ~ 51; 3 3 0 ? 4 0 1 ? ? ? ? ? ? ? ? ?; 3 3 0 ? 4 1 0 ? ? ? ? ? ? ? ? ?
	75 3 1 52 1 4 4 ? ? 53 ? ? ? ? ? 1; ~ 52; 5 4 3 ? 5 ? ? 52 ? 53 ? ? ? ? ? ?; 12 4 4 1075838976 3 ? ? 3 ? ? 3 ? ? ? 1 1
	~ 1075838976; 21 3 0 ? 3 3 1 ? ? ? ? ? ? ? ? ?; 4 4 0 ? 1 ? ? 0 ? ? ? ? ? ? ? ?; 17 3 0 ? 4 0 0 ? ? ? ? ? ? ? ? ?
	41 3 2 ? 3 4 53 ? ? 54 ? ? ? ? ? ?; 33 3 0 ? 1 1 3 ? ? ? ? ? ? ? ? ?; 17 3 0 ? 4 0 1 ? ? ? ? ? ? ? ? ?; 41 3 2 ? 3 4 53 ? ? 54 ? ? ? ? ? ?
	33 3 0 ? 1 1 3 ? ? ? ? ? ? ? ? ?; 17 3 0 ? 4 0 2 ? ? ? ? ? ? ? ? ?; 41 3 2 ? 3 4 53 ? ? 54 ? ? ? ? ? ?; 33 3 0 ? 1 1 3 ? ? ? ? ? ? ? ? ?
	17 3 0 ? 4 0 3 ? ? ? ? ? ? ? ? ?; 41 3 2 ? 3 4 53 ? ? 54 ? ? ? ? ? ?; 33 3 0 ? 1 1 3 ? ? ? ? ? ? ? ? ?; 17 3 0 ? 4 0 4 ? ? ? ? ? ? ? ? ?
	41 3 2 ? 3 4 53 ? ? 54 ? ? ? ? ? ?; 33 3 0 ? 1 1 3 ? ? ? ? ? ? ? ? ?; 17 3 0 ? 4 0 5 ? ? ? ? ? ? ? ? ?; 41 3 2 ? 3 4 53 ? ? 54 ? ? ? ? ? ?
	33 3 0 ? 1 1 3 ? ? ? ? ? ? ? ? ?; 17 3 0 ? 4 0 6 ? ? ? ? ? ? ? ? ?; 41 3 2 ? 3 4 53 ? ? 54 ? ? ? ? ? ?; 33 3 0 ? 1 1 3 ? ? ? ? ? ? ? ? ?
	17 3 0 ? 4 0 7 ? ? ? ? ? ? ? ? ?; 41 3 2 ? 3 4 53 ? ? 54 ? ? ? ? ? ?; 33 3 0 ? 1 1 3 ? ? ? ? ? ? ? ? ?; 17 3 0 ? 4 0 8 ? ? ? ? ? ? ? ? ?
	41 3 2 ? 3 4 53 ? ? 54 ? ? ? ? ? ?; 33 3 0 ? 1 1 3 ? ? ? ? ? ? ? ? ?; 17 3 0 ? 4 0 9 ? ? ? ? ? ? ? ? ?; 41 3 2 ? 3 4 53 ? ? 54 ? ? ? ? ? ?
	33 3 0 ? 1 1 3 ? ? ? ? ? ? ? ? ?; 79 4 6 54 1 ? ? 2 ? 55 ? ? ? 0 ? 1; ~ 54; 3 3 0 ? 4 0 1 ? ? ? ? ? ? ? ? ?
	3 3 0 ? 4 1 0 ? ? ? ? ? ? ? ? ?; 75 3 1 55 1 4 4 ? ? 56 ? ? ? ? ? 1; ~ 55; 5 4 3 ? 5 ? ? 55 ? 56 ? ? ? ? ? ?
	12 4 4 1075838976 3 ? ? 3 ? ? 3 ? ? ? 1 1; ~ 1075838976; 21 3 0 ? 3 3 1 ? ? ? ? ? ? ? ? ?; 4 4 0 ? 1 ? ? 0 ? ? ? ? ? ? ? ?
	40 3 2 ? 1 1 40 ? ? 41 ? ? ? ? ? ?; 40 3 2 ? 1 1 20 ? ? 21 ? ? ? ? ? ?; 40 3 2 ? 1 1 13 ? ? 14 ? ? ? ? ? ?; 40 3 2 ? 1 1 10 ? ? 11 ? ? ? ? ? ?
	40 3 2 ? 1 1 56 ? ? 40 ? ? ? ? ? ?; 79 4 6 57 1 ? ? 2 ? 58 ? ? ? 0 ? 1; ~ 57; 3 3 0 ? 4 0 1 ? ? ? ? ? ? ? ? ?
	3 3 0 ? 4 1 0 ? ? ? ? ? ? ? ? ?; 75 3 1 58 1 4 4 ? ? 59 ? ? ? ? ? 1; ~ 58; 5 4 3 ? 5 ? ? 58 ? 59 ? ? ? ? ? ?
	12 4 4 1075838976 3 ? ? 3 ? ? 3 ? ? ? 1 1; ~ 1075838976; 21 3 0 ? 3 3 1 ? ? ? ? ? ? ? ? ?; 12 4 4 1135607808 3 ? ? 60 ? ? 60 ? ? ? 1 1
	~ 1135607808; 21 3 0 ? 3 1 1 ? ? ? ? ? ? ? ? ?; 22 2 0 ? 0 1 ? ? ? ? ? ? ? ? ? ?
}]], {
	{ 1,},{ 1,},{ "4",1073741824,},{ "4",1073741824,},
	{ 10,"9","10",1075838976,"11",1077936128,55,"12","13",1082130432,
		2,110,"14",3,165,"15","16","17","18",{ 16,17,18,},4,18,"19","20","21",1098907648,
		"22","23","1",{ 28,},0,"24",1106247680,220,"26","27",1110441984,
		"28",1112539136,1,5,275,"31","5",{ 43,},2,6,330,"32",3,7,385,"33",
		8,440,"34",1,-15,"35","36",1135607808,
	},
}, {
	"\95\95\99\97\108\108","\95","\105","\110\101\120\116","\95\95\105\116\101\114","\116","\115\101\108\102","\118",
	"\84\97\98\108\101\32\119\97\115\32\110\111\116\32\99\114\101\97\116\101\100\32\99\111\114\114\101\99\116\108\121",
	"\97\115\115\101\114\116","\105\112\97\105\114\115","\70\79\82\71\76\79\79\80\32\100\105\100\32\110\111\116\32\108\111\111\112\32\99\111\114\114\101\99\116\108\121\32\35\49",
	"\112\97\105\114\115","\70\79\82\71\76\79\79\80\32\100\105\100\32\110\111\116\32\108\111\111\112\32\99\111\114\114\101\99\116\108\121\32\35\50",
	"\70\79\82\71\76\79\79\80\32\100\105\100\32\110\111\116\32\108\111\111\112\32\99\111\114\114\101\99\116\108\121\32\35\51",
	"\97","\98","\99","\70\79\82\71\76\79\79\80\32\100\105\100\32\110\111\116\32\108\111\111\112\32\99\111\114\114\101\99\116\108\121\32\35\52",
	"","\116\111\115\116\114\105\110\103","\49\50\51\53","\70\79\82\71\76\79\79\80\32\100\105\100\32\110\111\116\32\108\111\111\112\32\99\111\114\114\101\99\116\108\121\32\35\53",
	"\115\101\116\109\101\116\97\116\97\98\108\101","\109\49","\70\79\82\71\76\79\79\80\32\100\105\100\32\110\111\116\32\108\111\111\112\32\99\111\114\114\101\99\116\108\121\32\35\54",
	"\110\101\119\112\114\111\120\121","\103\101\116\109\101\116\97\116\97\98\108\101","\112","\109","\70\79\82\71\76\79\79\80\32\100\105\100\32\110\111\116\32\108\111\111\112\32\99\111\114\114\101\99\116\108\121\32\35\55",
	"\70\79\82\71\76\79\79\80\32\100\105\100\32\110\111\116\32\108\111\111\112\32\99\111\114\114\101\99\116\108\121\32\35\56",
	"\70\79\82\71\76\79\79\80\32\100\105\100\32\110\111\116\32\108\111\111\112\32\99\111\114\114\101\99\116\108\121\32\35\57",
	"\70\79\82\78\76\79\79\80\32\100\105\100\32\110\111\116\32\108\111\111\112\32\99\111\114\114\101\99\116\108\121\32\35\49",
	"\70\79\82\78\76\79\79\80\32\100\105\100\32\110\111\116\32\108\111\111\112\32\99\111\114\114\101\99\116\108\121\32\35\50",
	"\79\75","\120",
}

assert(MATCH(
	Fiu.luau_deserialize(compileResult),
	FiuUtils.decodeModule(encodedModule, constantList, stringList)
))

OK()