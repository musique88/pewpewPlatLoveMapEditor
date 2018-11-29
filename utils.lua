function debug()
  love.graphics.setColor(1,1,1)
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

function rectangleO:new(x,y,w,h,type)
  local newRectangle = {x=x, y=y, w=w, h=h,type=type or "normal", state="active"}
  setmetatable(newRectangle,rectangleO)
  return newRectangle
end
function rectangleO:newPassive(x,y,w,h,type)
  local newRectangle = {x=x, y=y, w=w, h=h,type=type or "normal", state="passive"}
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
  self:normalizeRectangle()
end

function rectangleO:draw()
  if self.type == "normal" then
    love.graphics.setColor(1,0,0)
  elseif self.type == "bouncing" then
    love.graphics.setColor(0.5,0,0)
  end
  love.graphics.rectangle("fill", self.x, self.y, self.w, self.h)
end

function rectangleO:normalizeRectangle()
  if self.w < 0 then
    self.x = self.x + self.w
    self.w = -self.w
  end
  if self.h < 0 then
    self.y = self.y + self.h
    self.h = -self.h
  end
end
--rectangle/
