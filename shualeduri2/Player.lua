Player = Class{}

function Player:init(x, y)
	self.x = x
	self.y = y
	
	self.width = 15
	self.height = 15

	self.dx = 0
	self.dy = 0
end

function Player:render()
	love.graphics.rectangle('fill', self.x, self.y, self.width, self.height)
end
