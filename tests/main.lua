--main.lua
--Test love app for love-textureatlas
--By Stewart Bracken (http://stewart.bracken.bz)

local atlas

dtotal = 0

local mouse = {x=0, y=0}
local pigpos = {x=200, y=100}
local ladder = {}

function love.load()
	atlas = require("textureatlas")
	
	batch = love.graphics.newSpriteBatch( atlas.texture, 100, "stream" )
	
	ladder['w'], ladder['h'] = atlas:getDimensions('ladder')
end

function love.update(dt)
	dtotal = dtotal + dt
	
	mouse.x, mouse.y = love.mouse.getX(), love.mouse.getY()
	pigpos.x, pigpos.y = love.window.getWidth()/2+100*math.cos(dtotal), love.window.getHeight()/2+100*math.sin(dtotal)
end

function love.draw()
	batch:clear()
	batch:bind()
	if(love.mouse.isDown('l')) then
		batch:setColor(255,0,0,255)
	end
	batch:add( atlas.quads['key'], mouse.x, mouse.y )
	if(love.mouse.isDown('l')) then
		batch:setColor(255,255,255,255)
	end
	batch:add( atlas.quads['pig_96x104'], pigpos.x, pigpos.y, dtotal + mouse.x/love.window.getWidth()*math.pi*2 )
	for i=1, 10 do
		batch:add( atlas.quads['ladder'], 200, 200+i*ladder.h )
	end
	batch:unbind()
	
	love.graphics.draw(batch)
end
