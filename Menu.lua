Script - 
-- Get the local player
local player = game.Players.LocalPlayer

-- Wait for the player's character to load
local character = player.Character or player.CharacterAdded:Wait()

-- Get the PositionLabel from the parent of the script
local positionLabel = script.Parent

-- Function to update coordinates
local function updateCoordinates()
    local position = character:WaitForChild("HumanoidRootPart").Position
    positionLabel.Text = " " .. math.floor(position.X) .. ",  " .. math.floor(position.Y) .. ",  " .. math.floor(position.Z)
end

-- Update the PositionLabel text every second
updateCoordinates()
game:GetService("RunService").Heartbeat:Connect(function()
    updateCoordinates()
    wait(1)
end)
