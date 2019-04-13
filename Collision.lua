Shape = class(
    function(self, x, y, width, height)
        self.x = x
        self.y = y
        self.width = width
        self.height = height
    end
)

function Shape:isColliding(obj2)
    if self.x + self.width > obj2.x and self.x < obj2.x + obj2.width and
    self.y + self.height > obj2.y and self.y < obj2.y + obj2.height then
        return true
    end
    return false
end

function Shape:move(xv, yv, dt)
    self.x = self.x + xv * dt
    self.y = self.y + yv * dt
end
