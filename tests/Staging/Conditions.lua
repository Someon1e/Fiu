local a = 5
if a then 
	print("IF", a)
end 
if not a then 
	print("NOTIF", a)
end
if a == math.floor(1) then 
	a += 1 
	print("EQ", a) 
else 
end
if a ~= math.floor(1) then 
	a += 1 
	print("NEQ", a) 
end
if a >= math.floor(1) then
 	a += 1 
 	print("GTE", a) 
 end
if a > math.floor(1) then 
	a += 1 
	print("GT", a) 
end
if a < math.floor(1) then 
	a += 1 
	print("LT", a) 
end
if a <= math.floor(1) then 
	a += 1 
	print("LTE", a) 
end
