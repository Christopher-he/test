-- emmy={}
-- ---@param path string
-- function emmy.fixPath(path)
-- 	return "/Users/mac/work/game_server_base/" + path
-- end
package.cpath = package.cpath .. ";/Users/mac/.vscode/extensions/tangzx.emmylua-0.3.37/debugger/emmy/mac/emmy_core.dylib"
local dbg = require("emmy_core")
dbg.tcpListen("localhost", 9966)
dbg.waitIDE()
dbg.breakHere()