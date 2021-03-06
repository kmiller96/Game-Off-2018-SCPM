-- This is an example class of enemy
-- In this class the the enemy moves downwards with a given speed every frame update

Enemy = Entity:extend()

function Enemy:new(x,y,w,h,speed,canvas)
    Enemy.super.new(self, x,y,w,h )
    
    -- Metadata
    self.name = "Alien"
    self.image = love.graphics.newImage("graphics/player_example.png")
    self.max_x = canvas.width
    self.max_y = canvas.height

    -- The scale between the actual width and height of the player image and 
    -- The desired dimensions of the player entity
    self.scale_w = self.w/self.image:getWidth()
    self.scale_h = self.h/self.image:getHeight()

    -- The speed with which the object is moving 
    --  this value is multiplied by the frame rate to get the motion distance per screen update
    self.speed =speed
    
end

-- A simple drawing function
function Enemy:draw()
    love.graphics.draw(self.image,self.x ,self.y,0,self.scale_w,self.scale_h)
end

function Enemy:update(dt)
    local speed = self.speed
    local distance = speed * dt 
    local ux, uy = 0, 1 -- Unit vector to move downward
    self.move(self,ux,uy,distance)
end
