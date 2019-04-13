require("Class")
require("Collision")

require("Player")
require("Knife")

function love.load()
    love.mouse.setVisible(false)

    --enlarges pixel art correctly
    love.graphics.setDefaultFilter("nearest", "nearest", 1)

    scale = 5

    WW = love.graphics.getWidth()
    WH = love.graphics.getHeight()

    player = Player()

    bg = love.graphics.newImage("bg.png")
    bgY = 0

    knives = {}
    for i = 1, 12 do
        table.insert(knives, Knife())
    end

    playing = false

    playImage = love.graphics.newImage("start.png")

    timer = 0
    font = love.graphics.newFont(60)
    timerText = love.graphics.newText(font, math.floor(timer))

    sound = love.audio.newSource("loop.wav", "stream")
    sound:setLooping(true)
    love.audio.play(sound)
end

function love.draw()
    if playing then
        love.graphics.draw(bg, 0, bgY, 0, scale, scale)
        love.graphics.draw(timerText, 0, 0)
        player:draw()
        for index, knife in ipairs(knives) do
            knife:draw()
        end
    else
        love.graphics.draw(playImage, 0, 0, 0, scale, scale)
    end
end

function love.update(dt)
    if love.keyboard.isDown("escape") then love.event.quit() end
    if playing then
        timer = timer + dt
        timerText = love.graphics.newText(font, math.floor(timer))
        player:update(dt)
        bgY = bgY - 400 * dt
        if bgY < - 500 then bgY = 0 end
        for index, knife in ipairs(knives) do
            knife:update(dt)
        end
        if timer > 20 then
            playing = false
            playImage = love.graphics.newImage("win.png")
            sound:stop()
        end
    end
    if love.keyboard.isDown("space") and not playing then
        playing = true
        player = Player()

        bg = love.graphics.newImage("bg.png")
        bgY = 0

        knives = {}
        for i = 1, 12 do
            table.insert(knives, Knife())
        end
        timer = 0
        love.audio.play(sound)
    end
end
