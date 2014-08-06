
local Player = import("..roles.Player")

local MainScene = class("MainScene", function()
    return display.newScene("MainScene")
end)

function MainScene:ctor()
    -- ui.newTTFLabel({text = "Hello, World", size = 64, align = ui.TEXT_ALIGN_CENTER})
    --     :pos(display.cx, display.cy)
    --     :addTo(self)

    local background = display.newSprite("img/background.png",display.cx,display.cy)
	self:addChild(background)

	self.player = Player.new()
	self.player:setPosition(display.left+self.player:getContentSize().display.width/2,display.cy)
	self:addChild(self.player)

end

function MainScene:onEnter()
end

function MainScene:onExit()
end

return MainScene
