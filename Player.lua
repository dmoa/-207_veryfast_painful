Player = class(
    Shape,
    function(self)
        self.image = love.graphics.newImage("player.png")
        Shape.init(self, 50, 150, self.image:getWidth() * scale, self.image:getHeight() * scale)
        self.xv = 1000
    end
)

function Player:draw()
    love.graphics.draw(self.image, self.x, self.y, 0, scale, scale)
end

function Player:update(dt)
    if love.keyboard.isDown("a") then self:move(-self.xv, 0, dt) end
    if love.keyboard.isDown("d") then self:move(self.xv, 0, dt) end
    if self.x < 0 then self.x = 0 end
    if self.x + self.width > WW then self.x = WW - self.width end
end
