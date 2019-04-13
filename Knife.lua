Knife = class(
    Shape,
    function(self)
        self.image = love.graphics.newImage("knife.png")
        Shape.init(self, 50, 150, self.image:getWidth() * scale, self.image:getHeight() * scale)
        self.x = love.math.random(0, WW - self.width)
        self.y = WH + love.math.random(300)
        self.yv = -400
    end
)

function Knife:draw()
    love.graphics.draw(self.image, self.x, self.y, 0, scale, scale)
end

function Knife:update(dt)
    self:move(0, self.yv, dt)
    if self.y + self.height < 0 then
        self.x = love.math.random(0, WW - self.width)
        self.y = WH + love.math.random(300)
    end
    if self:isColliding(player) then
        playing = false
        sound:stop()
    end
end
