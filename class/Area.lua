Area = {}
function Area:new(x,y,width,height,texture,color,startRandomPosition)
    local private = {}
    local self = {}
    private.x = x or 0
    private.y = y or 0
    private.width = width or 0
    private.height = height or 0
    private.movingObject = Logo:new(x,y,logoWidth,logoHeight,texture)
    self.color = color or tocolor(0,0,0)
    
    --Генерация позиции логотипа
    function private:generatePosition()
        --Минимальное значение - это наша стартовая позиция рабочего поля
        --Максимальное значение - это наша стартовая позиция рабочего поля + ширина/высота поля и вычитаем отсюда ширину/высоту логотипа(чтобы он не вылазил за рабочие пределы поля)

        private.movingObject.x = math.random(x,x+(width-logoWidth))
        private.movingObject.y = math.random(y,y+(height-logoHeight))
    end
    function private:updateObject()
        --Обновляем позиции
        private.movingObject.x = private.movingObject.x + private.movingObject.xOffset;
        private.movingObject.y = private.movingObject.y + private.movingObject.yOffset;


        --Проверка на горизонтальное касание
        if(private.movingObject.x + logoWidth >= (private.width + private.x) or private.movingObject.x <= private.x) then
            --Смена направления
            private.movingObject.xOffset = private.movingObject.xOffset * -1;
            --Генерация нового цвета
            private.movingObject.color = tocolor(math.random(255),math.random(255),math.random(255));
        end
        --Проверка на вертикальное касание
        if(private.movingObject.y + logoHeight >= (private.height + private.y) or private.movingObject.y <= private.y) then
            --Смена направления
            private.movingObject.yOffset = private.movingObject.yOffset * -1;
            --Генерация нового цвета
            private.movingObject.color = tocolor(math.random(255),math.random(255),math.random(255));
        end
    end
    --Функция которую мы будем вызывать в onClientRender
    function self:render()
        --Отрисовка рабочей площади
        dxDrawRectangle(private.x,private.y,private.width,private.height,self.color,postRender)
        --Обновление позиции/направления обьекта
        private:updateObject()
        --Отрисовка логотипа DVD
        private.movingObject:render()
    end
    --Если в аргументах startRandomPosition == true, тогда генерируем рандомную позицию для логотипа
    if startRandomPosition then
        private:generatePosition()
    end
    setmetatable(self,{})
    self.__index = self
    return self
end