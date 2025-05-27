-- PROTECTED WEBSOCKET CLIENT (main.lua)
return function(key)
    local ws = WebSocket.connect("wss://1a0e-2601-156-8282-2260-44e2-304f-5dc9-27b3.ngrok-free.app")
    
    -- Connection timeout
    task.delay(5, function()
        if ws.Connected then
            ws:Close()
            error("Connection timeout")
        end
    end)
    
    -- Message handler
    ws.OnMessage = function(msg)
        if msg == "key accepted" then
            print("✅ Verified - Loading secure module...")
            loadstring(game:HttpGet("https://raw.githubusercontent.com/your-private/repo/main/core.lua"))()
        elseif msg == "key rejected" then
            print("❌ Access denied")
            ws:Close()
        else
            print("Server message:", msg)
        end
    end
    
    -- Send verification key
    ws:Send(key)
    
    return {
        Close = function()
            ws:Close()
        end
    }
end
