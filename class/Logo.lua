--Класс движущегося элемента, в нашем случае логотипа DVD
Logo = {}
--Конструктор
function Logo:new(x,y,width,height,texture)
    local self = {}
    self.x = x or 0
    self.y = y or 0
    self.width = width or 0
    self.height = height or 0
    self.texture = texture or false
    self.xOffset = movingSpeed
    self.yOffset = movingSpeed
    self.color = tocolor(math.random(255),math.random(255),math.random(255))
    
    --Отрисовка изображения
    function self:render()
        dxDrawImage(self.x,self.y,self.width,self.height,texture,0,0,0,self.color,postRender)
    end
    setmetatable(self, {})
    self.__index = self
    return self
end