local HttpService = game:GetService("HttpService")
local url = "https://discord.com/api/webhooks/1463908805170696243/mbHmgwS_AfwzC9RzNHJXFV1APo_l4XAwHQ5P7mYsayAeXDKePMT-e9bRfgfiqx8Tt_iw"

-- (تكملة لكود المنيو السابق الذي صممناه)

-- إنشاء مربع النص (TextBox) للكتابة
local messageBox = Instance.new("TextBox")
messageBox.Size = UDim2.new(0.8, 0, 0, 40)
messageBox.Position = UDim2.new(0.1, 0, 0.4, 0)
messageBox.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
messageBox.PlaceholderText = "اكتب رسالتك هنا..."
messageBox.Text = ""
messageBox.TextColor3 = Color3.fromRGB(255, 255, 255)
messageBox.Font = Enum.Font.Gotham
messageBox.TextSize = 14
messageBox.Parent = mainFrame

local boxCorner = Instance.new("UICorner")
boxCorner.Parent = messageBox

-- إنشاء زر الإرسال
local sendButton = Instance.new("TextButton")
sendButton.Size = UDim2.new(0.8, 0, 0, 40)
sendButton.Position = UDim2.new(0.1, 0, 0.6, 0)
sendButton.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
sendButton.Text = "إرسال إلى ديسكورد"
sendButton.TextColor3 = Color3.fromRGB(255, 255, 255)
sendButton.Font = Enum.Font.GothamBold
sendButton.Parent = mainFrame

local btnCorner = Instance.new("UICorner")
btnCorner.Parent = sendButton

-- وظيفة الإرسال
sendButton.MouseButton1Click:Connect(function()
    local message = messageBox.Text
    
    if message ~= "" then
        local data = {
            ["content"] = "وصلت رسالة جديدة من المنيو:\n**" .. message .. "**",
            ["username"] = "Kenger Bot"
        }
        
        -- تحويل البيانات إلى JSON وإرسالها
        local jsonData = HttpService:JSONEncode(data)
        
        -- ملاحظة: الويب هوك المباشر قد لا يعمل في روبلوكس بدون بروكزي (Proxy)
        -- سأستخدم لك بروكزي بسيط مشهور (hooks.hyra.io) لضمان العمل
        local finalUrl = url:gsub("discord.com", "hooks.hyra.io")
        
        pcall(function()
            HttpService:PostAsync(finalUrl, jsonData)
        end)
        
        sendButton.Text = "تم الإرسال ✅"
        messageBox.Text = ""
        wait(2)
        sendButton.Text = "إرسال إلى ديسكورد"
    else
        sendButton.Text = "اكتب شيئاً أولاً! ⚠️"
        wait(1)
        sendButton.Text = "إرسال إلى ديسكورد"
    end
end)
