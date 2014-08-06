local Player = class("Player", function ()
	local sprite = display.display.newSprite("#player1-1-1.png")
	return sprite
	-- body
end)

function Player:ctor()

end

function Player:addAnimation()
	local animationNames = {"walk","attack","dead"}
	local animationFramNum = {4,4,4}

	for i=1,#animationNames do
		local frames = display.newFrames("player1-"..i.."-%d.png",1,animationFrameNum[i])
		local animation = display.newAnimation(frames, 0.2)
		display.setAnimationCache("player1-"..animationNames[i], animation)	

	end
end

function Player:walkTo(pos,callback)
	local function moveStop()
		transition.stopTarget(self)
	end

	local currentPos = CCPoint(CCNode.getPositionX(self),CCNode.getPositionY(self))
	local destPos = CCPoint(pos.x,pos.y)
	local posDiff = cc.PointDistance(currentPos,destPos)
	transition.playAnimationForever(self, display.getAnimationCache("player1-walk"))
	self:runAction(seq)
	return true
end

function Player:attack()
	transition.transition.playAnimationOnce(self, display.getAnimationCache("player1-attack"))
end

function Player:dead()
	transition.playAnimationOnce(self, display.getAnimationCache("player1-dead"))
end
	


return Player;