--[[
    ScoreState Class
    Author: Colton Ogden
    cogden@cs50.harvard.edu

    A simple state used to display the player's score before they
    transition back into the play state. Transitioned to from the
    PlayState when they collide with a Pipe.
]]

ScoreState = Class{__includes = BaseState}

bronze = love.graphics.newImage('bronze.png')
silver = love.graphics.newImage('silver.png')
gold = love.graphics.newImage('gold.png')

--[[
    When we enter the score state, we expect to receive the score
    from the play state so we know what to render to the State.
]]
function ScoreState:enter(params)
    self.score = params.score
end

function ScoreState:update(dt)
    -- go back to play if enter is pressed
    if love.keyboard.wasPressed('enter') or love.keyboard.wasPressed('return') then
        gStateMachine:change('countdown')
    end
end

function ScoreState:render()
    -- simply render the score to the middle of the screen
    love.graphics.setFont(flappyFont)
    
    if self.score > -1 and self.score < 5 then
    love.graphics.printf('Oof! You lost!', 0, 64, VIRTUAL_WIDTH, 'center')
    love.graphics.setFont(mediumFont)
    love.graphics.printf('Score: ' .. tostring(self.score), 0, 100, VIRTUAL_WIDTH, 'center')
    love.graphics.printf('Press Enter to Play Again!', 0, 160, VIRTUAL_WIDTH, 'center')

    elseif self.score > 4 and self.score < 11 then
        love.graphics.setFont(mediumFont)
        love.graphics.printf('Good Flapping!', 0, 64, VIRTUAL_WIDTH, 'center')
        love.graphics.draw(bronze, VIRTUAL_WIDTH / 3 + 38, VIRTUAL_HEIGHT / 3 + 20)
        love.graphics.printf('You earned a Bronze Trophy!', 0, 234, VIRTUAL_WIDTH, 'center')

        elseif self.score > 10 and self.score <21 then
            love.graphics.setFont(mediumFont)
            love.graphics.printf('Great Flying!', 0, 64, VIRTUAL_WIDTH, 'center')
            love.graphics.draw(silver, VIRTUAL_WIDTH / 3 + 38, VIRTUAL_HEIGHT / 3 + 20)
            love.graphics.printf('You earned a Silver Trophy!', 0, 234, VIRTUAL_WIDTH, 'center')
            elseif self.score > 20 then
                love.graphics.setFont(mediumFont)
                love.graphics.printf('You are a natural flyer!', 0, 64, VIRTUAL_WIDTH, 'center')
                love.graphics.draw(gold, VIRTUAL_WIDTH / 3 + 38, VIRTUAL_HEIGHT / 3 + 20)
                love.graphics.printf('You earned a Gold Trophy!', 0, 234, VIRTUAL_WIDTH, 'center') 
    end
    
end