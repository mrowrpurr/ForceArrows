scriptName ForceArrow_Effect extends ActiveMagicEffect  

Spell property VoiceUnrelentingForce1 auto
Spell property VoiceUnrelentingForce2 auto
Spell property VoiceUnrelentingForce3 auto

event OnEffectStart(Actor target, Actor caster)
    Actor player = Game.GetPlayer()

    float direction
    if player.GetAngleZ() > 180
        direction = player.GetAngleZ() - 180
    else
        direction = player.GetAngleZ() + 180
    endIf

    int distanceFromTarget = 256

    float xOffset = (distanceFromTarget) * -Math.cos(player.GetAngleZ());
    float yOffset = (distanceFromTarget) * -Math.sin(player.GetAngleZ())

    Form invisibleActorBase = Game.GetForm(0x13BBF) ; Nazeem

    Actor invisibleActor = target.PlaceAtMe(invisibleActorBase) as Actor
    invisibleActor.SetAngle(player.GetAngleX(), player.GetAngleY(), direction)

    invisibleActor.MoveTo(target, afXOffset = yOffset, afYOffset = xOffset)

    VoiceUnrelentingForce1.Cast(invisibleActor, target)
    Utility.Wait(0.4)
    VoiceUnrelentingForce2.Cast(invisibleActor, target)
    Utility.Wait(0.4)
    VoiceUnrelentingForce3.Cast(invisibleActor, target)

    ; invisibleActor.Delete()
endEvent
