-- | --------------------------------------------------------------- | --
-- | Lua conversion of original macro with improvements to functions | --
-- | Purpose: To heal the player and party members                   | --
-- | Date: 2/15/2024                                                 | --
-- | Authors: Sean Hyde, Adam Brucker                                | --
-- | --------------------------------------------------------------- | --

local mq = require('mq')
print("STARTING MACRO")
print("Loading spells")

mq.memspell(1, "Minor Healing")
mq.delay(50)
mq.memspell(2, "Strengthen")
mq.delay(50)

-- Main loop
function main()
    print("Starting main loop")

    while (true) do

        checkTankHP()

        checkTankBuff()

        checkHealerStats()  

        mq.delay(2000)

    end
end







function checkTankBuff()
    if mq.TLO.Target.Buff["Strengthen"].ID == 0 and not mq.TLO.Target.Moving then
        mq.cast("Strengthen")
    end

end


function checkHealerStats()
    -- If this is true we want to sit the healer down and regen health and mana
    if mq.Me.PctHPs < 20 or mq.Me.PctMana < 20 then
        while mq.Me.PctHPs < 100 or mq.Me.PctMana < 100 do
            if mq.Me.Standing then
                mq.echo("Sitting because I am standing.")
                mq.sit()
            end
            mq.echo("Resting until my hitpoints (" .. mq.Me.PctHPs .. "%) and mana (" .. mq.Me.PctMana .. "%) are at 100%.")
            mq.delay(6)
        end
    end
end


function healTank()
    print("Healing Tank")
    local i

    -- Target the tank
    for i = 1, mq.Group do
        mq.target(mq.Group.Member[i].CleanName)

        -- Cast healing spell
        mq.cast("Minor Healing")
    end
end

function checkTankHP()
    print("checking tank HP")
    local i = 1

    -- Check if tank's HP is below 60%
    while mq.Group.Member[i].PctHPs < 60 do
        mq.echo("tank HP is below 60%")
        mq.echo("casting heal on tank")
        healTank()
    end
end



function buffTank()
    print("checking Tank buffs")

    -- Check and buff missing beneficial stat buffs
    if not mq.Target.Buff["Strengthen"].ID then
        print("Casting Strengthen")
        mq.cast("Strengthen")
    end
end

main()

