-- Generated with TexturePacker (http://www.codeandweb.com/texturepacker)
-- with a custom export by Stewart Bracken (http://stewart.bracken.bz)
--
-- $TexturePacker:SmartUpdate:c95799b8a6b79a83fefea54466c5f193:64c9840771d2bda5ea43e32480d64c2e:cdafe3cdc7ec2aaa4152c402edb1b819$
--
--[[------------------------------------------------------------------------
-- Example Usage --

function love.load()
	myAtlas = require("textureatlas")
	batch = love.graphics.newSpriteBatch( myAtlas.texture, 100, "stream" )
end
function love.draw()
	batch:clear()
	batch:bind()
		batch:add( myAtlas.quads['mySpriteName'], love.mouse.getX(), love.mouse.getY() )
	batch:unbind()
end

--]]------------------------------------------------------------------------

local TextureAtlas = {}
local Quads = {}
local Texture = love.graphics.newImage( "textureatlas.png" )

Quads["key"] = love.graphics.newQuad(103, 87, 30, 16, 298, 112 )
Quads["ladder"] = love.graphics.newQuad(179, 79, 26, 30, 298, 112 )
Quads["pig_32x40"] = love.graphics.newQuad(247, 63, 32, 40, 298, 112 )
Quads["pig_48x56"] = love.graphics.newQuad(247, 3, 48, 56, 298, 112 )
Quads["pig_64x72"] = love.graphics.newQuad(179, 3, 64, 72, 298, 112 )
Quads["pig_72x80"] = love.graphics.newQuad(103, 3, 72, 80, 298, 112 )
Quads["pig_96x104"] = love.graphics.newQuad(3, 3, 96, 104, 298, 112 )

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
