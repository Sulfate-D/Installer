
-- Replace this with your actual websocket implementation if needed
local ws = WebSocket and WebSocket.connect("wss://1a0e-2601-156-8282-2260-44e2-304f-5dc9-27b3.ngrok-free.app")

-- Your key to send for verification


-- Message event
ws.OnMessage:Connect(function(msg)
    if msg == "key accepted" then
        print("✅ Key verified: we are so back")
    elseif msg == "key rejected" then
        print("❌ Invalid key")
        ws:Close()
    else
        print("Received:", msg)
    end
end)

-- Send the key immediately
ws:Send(yourKey)

-- Optional: Send other messages after delay
task.delay(2, function()
    ws:Send("Hello from Roblox client!")
end)
