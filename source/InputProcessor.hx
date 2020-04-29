import flixel.FlxG;

class InputProcessor {
    public static function justPressed():Bool {
        #if mobile
        return FlxG.touches.getFirst().justPressed;
        #else
        return FlxG.mouse.justPressed;
        #end
    }
}