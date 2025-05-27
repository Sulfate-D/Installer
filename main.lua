--! https://raw.githubusercontent.com/your-username/repo/main/secure_ws.lua
local function ConnectWebSocket(key)
    if not WebSocket then 
        error("WebSocket not available") 
    end

    local ws = WebSocket.connect("wss://1a0e-2601-156-8282-2260-44e2-304f-5dc9-27b3.ngrok-free.app")
    
    ws:Send(key) -- Send the key for verification

    ws.OnMessage = function(msg)
        if msg == "key accepted" then
            print("✅ Verified! Loading secure code...")
            -- Load the actual protected script
            loadstring(game:HttpGet("https://raw.githubusercontent.com/your-private/repo/main/main.lua"))()
        else
            print("❌ Invalid key")
            ws:Close()
        end
    end

    -- Timeout after 5 seconds
    task.delay(5, function()
        if ws.Connected then
            ws:Close()
            print("⌛ Connection timeout")
        end
    end)
end

return ConnectWebSocket
