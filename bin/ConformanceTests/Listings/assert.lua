--[====[Generated by CreateTests.lua]====]
return function()
	return [[Function 0 (??):
REMARK builtin assert/1
    4: if pcall(assert, false) or pcall(function() assert(false) end) then
LOADB R1 0
FASTCALL1 1 R1 L0
GETIMPORT R0 1 [assert]
CALL R0 1 0
L0: RETURN R0 0

Function 1 (ecall):
    9:   local ok, err = pcall(fn, ...)
GETIMPORT R1 1 [pcall]
MOVE R2 R0
GETVARARGS R3 -1
CALL R1 -1 2
REMARK builtin assert/1
   10:   assert(not ok)
NOT R4 R1
FASTCALL1 1 R4 L0
GETIMPORT R3 3 [assert]
CALL R3 1 0
   11:   return err:sub(err:find(": ") + 2, #err)
L0: LOADK R8 K5 [': ']
NAMECALL R6 R2 K6 ['find']
CALL R6 2 1
ADDK R5 R6 K4 [2]
LENGTH R6 R2
NAMECALL R3 R2 K7 ['sub']
CALL R3 3 -1
RETURN R3 -1

Function 2 (??):
REMARK builtin assert/0
   23: assert(ecall(function() assert() end) == "missing argument #1")
FASTCALL 1 L0
GETIMPORT R0 1 [assert]
CALL R0 0 0
L0: RETURN R0 0

Function 3 (??):
REMARK builtin assert/1
   24: assert(ecall(function() assert(nil) end) == "assertion failed!")
LOADNIL R1
FASTCALL1 1 R1 L0
GETIMPORT R0 1 [assert]
CALL R0 1 0
L0: RETURN R0 0

Function 4 (??):
REMARK builtin assert/1
   25: assert(ecall(function() assert(false) end) == "assertion failed!")
LOADB R1 0
FASTCALL1 1 R1 L0
GETIMPORT R0 1 [assert]
CALL R0 1 0
L0: RETURN R0 0

Function 5 (??):
REMARK builtin assert/2
   28: assert(ecall(function() assert(nil, "epic fail") end) == "epic fail")
LOADNIL R1
FASTCALL2K 1 R1 K0 L0 ['epic fail']
LOADK R2 K0 ['epic fail']
GETIMPORT R0 2 [assert]
CALL R0 2 0
L0: RETURN R0 0

Function 6 (??):
    2: print("testing asserts") -- someone has to
GETIMPORT R0 1 [print]
LOADK R1 K2 ['testing asserts']
CALL R0 1 0
    4: if pcall(assert, false) or pcall(function() assert(false) end) then
GETIMPORT R0 4 [pcall]
GETIMPORT R1 6 [assert]
LOADB R2 0
CALL R0 2 1
JUMPIF R0 L0
GETIMPORT R0 4 [pcall]
DUPCLOSURE R1 K7 []
CALL R0 1 1
JUMPIFNOT R0 L1
    5:   error('catastrophic assertion failure') -- surely error() can't be broken
L0: GETIMPORT R0 9 [error]
LOADK R1 K10 ['catastrophic assertion failure']
CALL R0 1 0
    8: local function ecall(fn, ...)
L1: DUPCLOSURE R0 K11 ['ecall']
REMARK builtin assert/1
   15: assert(1)
LOADN R2 1
FASTCALL1 1 R2 L2
GETIMPORT R1 6 [assert]
CALL R1 1 0
REMARK builtin assert/1
   16: assert(true)
L2: LOADB R2 1
FASTCALL1 1 R2 L3
GETIMPORT R1 6 [assert]
CALL R1 1 0
REMARK builtin assert/1
REMARK builtin assert/1
   19: assert(assert(1) == 1)
L3: LOADN R4 1
FASTCALL1 1 R4 L4
GETIMPORT R3 6 [assert]
CALL R3 1 1
L4: JUMPXEQKN R3 K12 L5 [1]
LOADB R2 0 +1
L5: LOADB R2 1
L6: FASTCALL1 1 R2 L7
GETIMPORT R1 6 [assert]
CALL R1 1 0
REMARK builtin assert/1
REMARK builtin type/1+
REMARK builtin assert/1
REMARK allocation: table hash 0
   20: assert(type(assert({})) == 'table')
L7: NEWTABLE R5 0 0
FASTCALL1 1 R5 L8
GETIMPORT R4 6 [assert]
CALL R4 1 -1
L8: FASTCALL 40 L9
GETIMPORT R3 14 [type]
CALL R3 -1 1
L9: JUMPXEQKS R3 K15 L10 ['table']
LOADB R2 0 +1
L10: LOADB R2 1
L11: FASTCALL1 1 R2 L12
GETIMPORT R1 6 [assert]
CALL R1 1 0
REMARK builtin assert/1
   23: assert(ecall(function() assert() end) == "missing argument #1")
L12: MOVE R3 R0
DUPCLOSURE R4 K16 []
CALL R3 1 1
JUMPXEQKS R3 K17 L13 ['missing argument #1']
LOADB R2 0 +1
L13: LOADB R2 1
L14: FASTCALL1 1 R2 L15
GETIMPORT R1 6 [assert]
CALL R1 1 0
REMARK builtin assert/1
   24: assert(ecall(function() assert(nil) end) == "assertion failed!")
L15: MOVE R3 R0
DUPCLOSURE R4 K18 []
CALL R3 1 1
JUMPXEQKS R3 K19 L16 ['assertion failed!']
LOADB R2 0 +1
L16: LOADB R2 1
L17: FASTCALL1 1 R2 L18
GETIMPORT R1 6 [assert]
CALL R1 1 0
REMARK builtin assert/1
   25: assert(ecall(function() assert(false) end) == "assertion failed!")
L18: MOVE R3 R0
DUPCLOSURE R4 K20 []
CALL R3 1 1
JUMPXEQKS R3 K19 L19 ['assertion failed!']
LOADB R2 0 +1
L19: LOADB R2 1
L20: FASTCALL1 1 R2 L21
GETIMPORT R1 6 [assert]
CALL R1 1 0
REMARK builtin assert/1
   28: assert(ecall(function() assert(nil, "epic fail") end) == "epic fail")
L21: MOVE R3 R0
DUPCLOSURE R4 K21 []
CALL R3 1 1
JUMPXEQKS R3 K22 L22 ['epic fail']
LOADB R2 0 +1
L22: LOADB R2 1
L23: FASTCALL1 1 R2 L24
GETIMPORT R1 6 [assert]
CALL R1 1 0
REMARK builtin assert/1
   31: assert(select('#', assert(1, 2, 3)) == 3)
L24: GETIMPORT R3 24 [select]
LOADK R4 K25 ['#']
REMARK builtin assert/3
LOADN R6 1
LOADN R7 2
LOADN R8 3
FASTCALL 1 L25
GETIMPORT R5 6 [assert]
CALL R5 3 -1
L25: CALL R3 -1 1
JUMPXEQKN R3 K26 L26 [3]
LOADB R2 0 +1
L26: LOADB R2 1
L27: FASTCALL1 1 R2 L28
GETIMPORT R1 6 [assert]
CALL R1 1 0
REMARK builtin assert/1
   32: assert(table.concat(table.pack(assert(1, 2, 3)), "") == "123")
L28: GETIMPORT R3 28 [table.concat]
GETIMPORT R4 30 [table.pack]
REMARK builtin assert/3
LOADN R6 1
LOADN R7 2
LOADN R8 3
FASTCALL 1 L29
GETIMPORT R5 6 [assert]
CALL R5 3 -1
L29: CALL R4 -1 1
LOADK R5 K31 ['']
CALL R3 2 1
JUMPXEQKS R3 K32 L30 ['123']
LOADB R2 0 +1
L30: LOADB R2 1
L31: FASTCALL1 1 R2 L32
GETIMPORT R1 6 [assert]
CALL R1 1 0
   34: print('OK')
L32: GETIMPORT R1 1 [print]
LOADK R2 K33 ['OK']
CALL R1 1 0
   35: 
RETURN R0 0

]]
end