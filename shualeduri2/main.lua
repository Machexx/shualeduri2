push = require 'push'
Class = require 'class'

require 'Player'
require 'Ball'

WINDOW_WIDTH = 720
WINDOW_HEIGHT = 720

VIRTUAL_WIDTH = 243
VIRTUAL_HEIGHT = 243

PLAYER_SPEED = 4

gameState = 'title'

function love.load()
	love.graphics.setDefaultFilter('nearest', 'nearest')
	
	love.window.setTitle('Shualeduri2')
	
	math.randomseed(os.time())
	
	
	mediumFont = love.graphics.newFont('font.ttf', 10)
	largeFont = love.graphics.newFont('font.ttf', 20)
	
	love.graphics.setFont(mediumFont)
	
	push:setupScreen(VIRTUAL_WIDTH, VIRTUAL_HEIGHT, WINDOW_WIDTH, WINDOW_HEIGHT, {
		fullscreen = false,
		resizable = false,
		vsync = true
	})
	
	sounds = {
		['hit'] = love.audio.newSource('sounds/hit.wav', 'static'),
		['lose'] = love.audio.newSource('sounds/score.wav', 'static')
	}
	
	player1 = Player(VIRTUAL_WIDTH / 2 - 2, VIRTUAL_HEIGHT / 2 - 2)
	
	
	ball1 = Ball(VIRTUAL_WIDTH / 2 - 2, 10)
	ball2 = Ball(VIRTUAL_WIDTH / 2 - 2, VIRTUAL_HEIGHT - 20)
	ball3 = Ball(10, VIRTUAL_HEIGHT / 2 -2)
	ball4 = Ball(VIRTUAL_WIDTH - 20 , VIRTUAL_HEIGHT / 2 -2)
end


function love.keypressed(key)
	if key == 'escape' then
		love.event.quit()
	end
	
	if key == 'enter' or key == 'return' then
		if gameState == 'title' then
			gameState = 'play'
		elseif gameState == 'lose' then
			gameState = 'title'
		end
	end
end

function love.update(dt)
	
	if gameState == 'play' then
		ball1.dx = math.random(-200, 200)
		ball1.dy = math.random(-50, -70)

		ball2.dx = math.random(-200, 200)
		ball2.dy = math.random(-50, -70)

		ball3.dx = math.random(-200, 200)
		ball3.dy = math.random(-50, -70)

		ball4.dx = math.random(-200, 200)
		ball4.dy = math.random(-50, -70)
		
		
	elseif gameState == 'play' then
		if ball1:collides(player1) then
			gamestate = 'lose'
			
			sounds['lose']:play()
			
			player1 = Player(VIRTUAL_WIDTH / 2 - 2, VIRTUAL_HEIGHT / 2 - 2)
			ball1 = Ball(VIRTUAL_WIDTH / 2 - 2, 10)
		
		end

		if ball2:collides(player1) then
			gamestate = 'lose'
			
			sounds['lose']:play()
			
			player1 = Player(VIRTUAL_WIDTH / 2 - 2, VIRTUAL_HEIGHT / 2 - 2)
			ball2 = Ball(VIRTUAL_WIDTH / 2 - 2, 10)
		
		end

		if ball3:collides(player1) then
			gamestate = 'lose'
			
			
			
			player1 = Player(VIRTUAL_WIDTH / 2 - 2, VIRTUAL_HEIGHT / 2 - 2)
			ball3 = Ball(VIRTUAL_WIDTH / 2 - 2, 10)
		
		end

		if ball4:collides(player1) then
			gamestate = 'lose'
			
			
			
			player1 = Player(VIRTUAL_WIDTH / 2 - 2, VIRTUAL_HEIGHT / 2 - 2)
			ball4 = Ball(VIRTUAL_WIDTH / 2 - 2, 10)
		
		end
	
		ball1:update(dt)
		ball2:update(dt)
		ball3:update(dt)
		ball4:update(dt)
	
	end
	
	
	



	if love.keyboard.isDown('w') then
		player1.y = math.max(player1.y - PLAYER_SPEED, 0)
	elseif  love.keyboard.isDown('s') then
		player1.y = math.min(player1.y + PLAYER_SPEED, VIRTUAL_HEIGHT - player1.height)
	end
		
	if love.keyboard.isDown('d') then
		player1.x = math.min(player1.x + PLAYER_SPEED, VIRTUAL_WIDTH - player1.width)
	elseif  love.keyboard.isDown('a') then
		player1.x = math.max(player1.x - PLAYER_SPEED, 0)
	end
end	

function love.draw()
	push:start()
	
	love.graphics.clear(40/255, 40/255, 50/255, 255/255)
	
	
	if gameState == 'title' then
		love.graphics.setFont(mediumFont)
		love.graphics.printf('Welcome To My Game', 0, 20, VIRTUAL_WIDTH, 'center')
		love.graphics.printf('Press Enter!', 0, 32, VIRTUAL_WIDTH, 'center')
	elseif gameState == 'lose' then
		love.graphics.setFont(mediumFont)
		love.graphics.printf('You Lost', 0, 10, VIRTUAL_WIDTH, 'center')
	end
	
	player1:render()
	
	ball1:render()
	ball2:render()
	ball3:render()
	ball4:render()
	
	push:finish()
end