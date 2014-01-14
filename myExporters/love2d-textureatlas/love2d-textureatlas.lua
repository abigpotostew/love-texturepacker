-- Generated with TexturePacker (http://www.codeandweb.com/texturepacker)
-- with a custom export by Stewart Bracken (http://stewart.bracken.bz)
--
-- {{smartUpdateKey}}
--
--[[------------------------------------------------------------------------
-- Example Usage --

function love.load()
	myAtlas = require("{{texture.trimmedName}}")
	batch = love.graphics.newSpriteBatch( myAtlas.texture, 100, "stream" )
end
function love.draw()
	batch:clear()
	batch:bind()
		batch:add( myAtlas.quads['mySpriteName'], love.mouse.getX(), love.mouse.getY() )
	batch:unbind()
	love.graphics.draw(batch)
end

--]]------------------------------------------------------------------------

local TextureAtlas = {}
local Quads = {}
local Texture = love.graphics.newImage( "{{texture.fullName}}" )
{% for sprite in allSprites %}
Quads["{{sprite.trimmedName}}"] = love.graphics.newQuad({{sprite.frameRect.x}}, {{sprite.frameRect.y}}, {{sprite.frameRect.width}}, {{sprite.frameRect.height}}, {{texture.size.width}}, {{texture.size.height}} ){% endfor %}

function TextureAtlas:getDimensions(quadName)
	local quad = self.quads[quadName]
	if not quad then
		return nil 
	end
	local x, y, w, h = quad:getViewport()
    return w, h
end

TextureAtlas.quads = Quads
TextureAtlas.texture = Texture

return TextureAtlas
