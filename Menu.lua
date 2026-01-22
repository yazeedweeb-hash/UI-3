-- إنشاء الشاشة الرئيسية
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "KengerMenu"
screenGui.Parent = game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui")

-- إنشاء الإطار الرئيسي (المينو)
local mainFrame = Instance.new("Frame")
mainFrame.Name = "MainFrame"
mainFrame.Size = UDim2.new(0, 300, 0, 400) -- العرض والارتفاع
mainFrame.Position = UDim2.new(0.5, -150, 0.5, -200) -- التمركز في المنتصف
mainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30) -- لون داكن احترافي
mainFrame.BorderSizePixel = 0
mainFrame.Parent = screenGui

-- إضافة زوايا دائرية (لجعل الشكل احترافي)
local uiCorner = Instance.new("UICorner")
uiCorner.CornerRadius = UDim.new(0, 10)
uiCorner.Parent = mainFrame

-- عنوان المينو
local titleLabel = Instance.new("TextLabel")
titleLabel.Size = UDim2.new(1, 0, 0, 50)
titleLabel.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
titleLabel.Text = "Kenger Hub Pro"
titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
titleLabel.TextSize = 20
titleLabel.Font = Enum.Font.GothamBold
titleLabel.Parent = mainFrame

local titleCorner = Instance.new("UICorner")
titleCorner.Parent = titleLabel

-- دالة لإنشاء أزرار بسهولة
local function createButton(name, position, color)
    local button = Instance.new("TextButton")
    button.Name = name
    button.Size = UDim2.new(0.8, 0, 0, 40)
    button.Position = position
    button.BackgroundColor3 = color
    button.Text = name
    button.TextColor3 = Color3.fromRGB(255, 255, 255)
    button.Font = Enum.Font.Gotham
    button.TextSize = 16
    button.AutoButtonColor = true
    button.Parent = mainFrame
    
    local btnCorner = Instance.new("UICorner")
    btnCorner.CornerRadius = UDim.new(0, 6)
    btnCorner.Parent = button
    
    -- إضافة تأثير عند الضغط (وهمي)
    button.MouseButton1Click:Connect(function()
        print("تم الضغط على: " .. name)
        button.Text = "تم التفعيل ✅"
        wait(1)
        button.Text = name
    end)
end

-- إضافة الأزرار
createButton("Auto Farm", UDim2.new(0.1, 0, 0.3, 0), Color3.fromRGB(0, 150, 255))
createButton("Speed Hack", UDim2.new(0.1, 0, 0.5, 0), Color3.fromRGB(255, 85, 85))
