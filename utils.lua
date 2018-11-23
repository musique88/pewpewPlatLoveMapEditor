function debug()
  love.graphics.print(mousePos.x,0,0)
  love.graphics.print(mousePos.y,100,0)
end

--/vectors
vectorO = {}
vectorO.__index = vectorO

function vectorO:new(x,y)
  local newVector = {x=x,y=y}
  setmetatable(vectorO,newVector)
  return newVector
end

--vectors/
--/rectangle
rectangleO = {}
rectangleO.__index = rectangleO

function rectangleO:new(x1,y1,x2,y2)
  local newRectangle = {x1=x1, y1=y1, x2=x2, y2=y2}
  setmetatable(rectangleO,newRectangle)
  return newRectangle
end

function rectangleO:draw()
  love.graphics.rectangle("fill", self.x1, self.y1, self.x2-self.x1, self.y2-self.y1)
end
--rectangle/
