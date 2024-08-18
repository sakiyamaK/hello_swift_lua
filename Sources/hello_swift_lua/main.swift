import Foundation
import CLua

func main() {
  // Luaステートを作成
  let luaState = luaL_newstate()

  // 標準ライブラリを開く
  luaL_openlibs(luaState)

  // Luaスクリプトファイルのパスを取得
  let luaScriptPath = "Sources/hello_swift_lua/hello.lua"

  guard 
  // Luaスクリプトをロード
  luaL_loadfilex(luaState, luaScriptPath.cString(using: .utf8), nil) == LUA_OK,
  // Luaスクリプトを実行    
  lua_pcallk(luaState, (0), (LUA_MULTRET), (0), 0, nil) == LUA_OK
   else {
      // エラーメッセージを取得      
      if 
      let errorCChars = lua_tolstring(luaState, -1, nil),
      let errorMsg = String(cString: errorCChars, encoding: .utf8) {
          print("Lua Load Error: \(errorMsg)")
      }
    return
  }

  // Luaステートを閉じる
  lua_close(luaState)
}  

main()