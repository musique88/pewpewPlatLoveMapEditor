function debug()
  love.graphics.print(mousePos.x,0,0)
  love.graphics.print(mousePos.y,100,0)
  love.graphics.print(state,0,12)
  love.graphics.print(#rectangles,100,12)
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

function rectangleO:new(x,y,w,h)
  local newRectangle = {x=x, y=y, w=w, h=h, state="active"}
  setmetatable(newRectangle,rectangleO)
  return newRectangle
end

function rectangleO:update()
  if self.state=="active" then
    self.w=mousePos.x-self.x
    self.h=mousePos.y-self.y
  end
end

function rectangleO:setPassive()
  self.state="passive"
  table.insert(rectangles,self)
end

function rectangleO:draw()
  love.graphics.rectangle("fill", self.x, self.y, self.w, self.h)
end
--rectangle/
