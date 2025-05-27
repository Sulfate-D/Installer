--! Protected Loader (put this in your GitHub raw file)
local function SecureWebSocketClient(key)
    -- Obfuscated connection details
    local ws = WebSocket.connect("wss://1a0e-2601-156-8282-2260-44e2-304f-5dc9-27b3.ngrok-free.app")
    
    -- Key verification
    ws:Send(key)
    
    ws.OnMessage = function(msg)
        if msg == "key accepted" then
            print("✅ Authorized")
            -- Load secure code from a DIFFERENT GitHub URL
            loadstring(game:HttpGet("https://raw.githubusercontent.com/your-private/repo/main/secure_code.lua"))()
        else
            print("❌ Access denied")
            ws:Close()
        end
    end
    
    -- Auto-close if no response in 5 seconds
    task.delay(5, function()
        if ws.Connected then ws:Close() end
    end)
end

return SecureWebSocketClient
