
screenW, screenH = guiGetScreenSize()
--Создание текстуры
logo = dxCreateTexture("assets/logo.png","argb",true,"clamp")
--Таблица в которой хранятся наши обьекты полей
local areasTable = {
    Area:new(0,0,screenW/2,screenH,logo,backgroundColor,true),
    Area:new(screenW/2,0,screenW/2,screenH,logo,backgroundColor,true),
}


addEventHandler("onClientRender",root,function() 
    for k,v in ipairs(areasTable) do 
        --Отрисовка каждого элемента
        v:render()
    end
end)