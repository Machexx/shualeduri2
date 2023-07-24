Ball = Class{}

function Ball:init(x, y)
	self.x = x
	self.y = y
	
	self.width = 10
	self.height = 10
	
	self.dx = 0
	self.dy = 0
end

function Ball:collides(player)
	if self.x > player.x + player.width or player.x > self.x + self.width then
		return false
	end
	
	if self.y > player.y + player.height or player.y > self.y + self.height then
		return false
	end
	
	sounds['hit']:play()
	return true
end

function Ball:reset()
	self.x = VIRTUAL_WIDTH / 2 - self.width / 2
	self.y = VIRTUAL_HEIGHT / 2 - self.height / 2
	
	self.dx = 0
	self.dy = 0
end

function Ball:update(dt)
	self.x = self.x + self.dx * dt
	self.y = self.y + self.dy * dt

	if self.x <= 0 then
		sounds['hit']:play()
		self.x = 0
		self.dx = -self.dx
	end

	if self.x >= VIRTUAL_WIDTH - 8 then
		sounds['hit']:play()
		self.x = VIRTUAL_WIDTH - 8
		self.dx = -self.dx
	end

	if self.y <= 0 then
		sounds['hit']:play()
		self.y = 0
		self.dy = -self.dy
	end
end

function Ball:render()
	love.graphics.rectangle('fill', self.x, self.y, self.width, self.height)
	love.graphics.setColor(255/255, 0/255, 0/255, 255/255)
end
