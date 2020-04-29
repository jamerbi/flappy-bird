import flixel.FlxG;

class InputProcessor {
    public static function justPressed():Bool {
        var input:Bool;

        #if desktop
        input = FlxG.mouse.justPressed;
        #end

        #if mobile
        input = FlxG.touches.getFirst().justPressed;
        #end

        return input;
    }
}