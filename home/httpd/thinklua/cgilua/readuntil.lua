local strsub, strfind, strlen = string.sub, string.find, string.len
module (...)
function iterate (inp)
local current = ""
return function (del, out)
local dellen = strlen(del)
local i, e
while true do
i, e = strfind(current, del, 1, 1)
if i then break end
local new = inp()
if not new then break end
do
local endcurrent = strsub(current, -dellen+1)
local border = endcurrent .. strsub(new, 1, dellen-1)
if strlen(current) < dellen or strlen(new) < dellen or
strfind(border, del, 1, 1) then
current = strsub(current, 1, -dellen)
new = endcurrent .. new
end
end
out(current)
current = new
end
out(strsub(current, 1, (i or 0) - 1))
current = strsub(current, (e or strlen(current)) + 1)
return (i ~= nil)
end
end
