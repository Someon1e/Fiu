-- This file is part of the Luau programming language and is licensed under MIT License; see LICENSE.txt for details
-- This file is based on Lua 5.x tests -- https://github.com/lua/lua/tree/master/testes
print('testing local variables plus some extra stuff')

do
  local i = 10
  do local i = 100; assert(i==100) end
  do local i = 1000; assert(i==1000) end
  assert(i == 10)
  if i ~= 10 then
    local i = 20
  else
    local i = 30
    assert(i == 30)
  end
end



f = nil

local f
x = 1

a = nil
loadstring('local a = {}')()
assert(type(a) ~= 'table')
function f (a)
  local _1, _2, _3, _4, _5
  local _6, _7, _8, _9, _10
  local x = 3
  local b = a
  local c,d = a,b
  if (d == b) then
    local x = 'q'
    x = b
    assert(x == 2)
  else
    assert(nil)
  end
  assert(x == 3)
  local f = 10
end

local b=10
local a; repeat local b; a,b=1,2; assert(a+1==b); until a+b==3


assert(x == 1)

f(2)
assert(type(f) == 'function')


-- testing globals ;-)
do
  local f = {}
  -- Originally `local _G = getfenv()` but enviroment is all over the place in FIU,
  -- and FIU doesnt manage env inside its own execution. Referencing is simplier
  -- perhaps a more Luau Like enviroment management in FIU could reduce complications in `TestRunner`
  local getfenv, assert = getfenv, assert;
  A=10;
  for i=1,10 do
    f[i] = function (x) A=A+1; return A, getfenv(x) end
  end
  assert(f[1]() == 11, "1")
  for i=1,10 do
    assert(setfenv(f[i], {A=i}) == f[i])
  end
  assert(f[3]() == 4 and A == 11, `{A}`)
  local a,b = f[8](1)
  assert(b.A == 9, "4")
  a,b = f[8](2)
  assert(b.A == 11, "5")   -- `real' global
  local g
  local function f () assert(setfenv(2, {a='10'}) == g) end
  g = function () f(); assert(getfenv(1).a == '10') end
  g(); assert(getfenv(g).a == '10')
end
-- test for global table of loaded chunks
local function foo (s)
  return loadstring(s)
end
assert(getfenv(foo("")) == getfenv())
local a = {loadstring = loadstring, setfenv = setfenv, getfenv = getfenv, assert = assert} 
setfenv(foo, a)
assert(getfenv(foo("")) == a)
local original = getfenv()
setfenv(1, a)  -- change global environment
assert(getfenv(foo("")) == a)
setfenv(1, original)


-- testing limits for special instructions

local a
local p = 4
for i=2,31 do
  for j=-3,3 do
    assert(loadstring(string.format([[local a=%s;a=a+
                                            %s;
                                      assert(a
                                      ==2^%s)]], j, p-j, i))) ()
    assert(loadstring(string.format([[local a=%s;
                                      a=a-%s;
                                      assert(a==-2^%s)]], -j, p-j, i))) ()
    assert(loadstring(string.format([[local a,b=0,%s;
                                      a=b-%s;
                                      assert(a==-2^%s)]], -j, p-j, i))) ()
  end
  p =2*p
end

print'+'

OK()
