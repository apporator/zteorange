local function getUsersBeKicked( ... )
local sessmgr = require("user_mgr.session_mgr")
local sess_id = sessmgr.GetCurrentSessID()
local Right = session_get(sess_id, "login_right")
if Right == nil then return {} end
if Right == 3 then Right = 4 end
return sessmgr.filterSession({key="login_right",value=Right,cmp=">="})
end
local userMgrAttrTable = {
{attr="needAuth", value="ALL", opts={dftUser="1"}, func=nil},
{attr="userLevel", value="0", func=nil},
{attr="fromLANorWAN", value="ALL"},
{attr="authType", value="form", func=nil},
{attr="autofillUsername", value=0, opts={disableUsername=false}},
{attr="autofillPassword", value=0, opts={disablePassword=false}},
{attr="loginPolicy", value="preempt", opts={beKickedUsers=getUsersBeKicked}},
{attr="chpwdMode", value="optional", opts={typeofOptional="repeat-until"}},
{attr="sessMax", value=100},
{attr="userMax", value=1},
{attr="lockTimeout", value=60},
{attr="lockMaxTime", value=3},
{attr="checkUserMaxBySameRight", value=0},
{attr="CustomLoginCheck", value=1, func=nil},
}
return userMgrAttrTable
