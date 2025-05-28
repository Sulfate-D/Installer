-- Create the input UI
local Players = game:GetService("Players")
local player = Players.LocalPlayer
local gui = Instance.new("ScreenGui")
local frame = Instance.new("Frame")
local textBox = Instance.new("TextBox")
local submit = Instance.new("TextButton")

-- UI Setup
gui.Name = "KeyVerificationUI"
gui.Parent = player:WaitForChild("PlayerGui")

frame.Size = UDim2.new(0, 300, 0, 150)
frame.Position = UDim2.new(0.5, -150, 0.5, -75)
frame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
frame.Parent = gui

textBox.Size = UDim2.new(0, 260, 0, 40)
textBox.Position = UDim2.new(0, 20, 0, 20)
textBox.PlaceholderText = "Enter your verification key"
textBox.ClearTextOnFocus = false
textBox.Parent = frame

submit.Size = UDim2.new(0, 260, 0, 40)
submit.Position = UDim2.new(0, 20, 0, 80)
submit.Text = "Verify Key"
submit.Parent = frame

-- Verification function
local function verifyKey(key)
    if not WebSocket then
        warn("WebSocket not available")
        return false
    end

    local ws = WebSocket.connect("wss://rabbit-enjoyed-commonly.ngrok-free.app")
    local verified = false
    local timeout = false

    -- Set timeout
    task.delay(5, function()
        if not verified then
            timeout = true
            ws:Close()
        end
    end)

    ws.OnMessage:Connect(function(msg)
        if msg == "key accepted" then
            verified = true
            print("✅ Key verified!")
            -- Run your secure code here
            print("hi") -- Replace with your secure code
        elseif msg == "key rejected" then
            ws:Close()
        end
    end)

    ws:Send(key)

    -- Wait for response
    repeat task.wait() until verified or timeout

    return verified
end

-- Submit button action
submit.MouseButton1Click:Connect(function()
    local key = textBox.Text
    if #key > 0 then
        local success = verifyKey(key)
        if success then
            frame.Visible = false
            -- You can add additional success UI here
        else
            textBox.Text = ""
            textBox.PlaceholderText = "Invalid key, please try again"
        end
    end
end)
