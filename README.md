# love-texturepacker
====================================================================================

A custom exporter for TexturePacker (http://www.codeandweb.com/texturepacker) for use with the LÖVE game engine. With this exporter, you can use TexturePacker to vastly reduce the manual time to describe each sprite on a texture when using LÖVE's Quad with SpriteBatch. This exporter will create a lua file that loads your image and contains all the quads of each sprite.

By Stewart Bracken
http://stewart.bracken.bz

### Usage
1. Place the love2d-textureatlas/ directory into your TexturePacker custom exporters directory. Follow these directions if you don't know what I'm talking about: [link](https://www.codeandweb.com/texturepacker/documentation#customization)
2. Build your pack file in the typical way using TexturePacker. Use an Extrude value of 1 to follow the LÖVE dev's suggestion to reduce 'bleeding' when rotating the sprite. I also suggest setting Border padding, Shape Padding, and Inner Padding to at least 1.
3. After publishing, place both the generated lua and image file into your game's folder and require() the lua file.

### Example Usage:

function love.load()
	myAtlas = require("mytextureatlas")
	batch = love.graphics.newSpriteBatch( myAtlas.texture, 100, "stream" )
end

function love.draw()
	batch:clear()
	batch:bind()
		batch:add( myAtlas.quads['mySpriteName'], love.mouse.getX(), love.mouse.getY() )
	batch:unbind()
	love.graphics.draw(batch)
end


