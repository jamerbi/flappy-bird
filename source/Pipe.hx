import flixel.math.FlxRandom;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.group.FlxGroup.FlxTypedGroup;

class Pipe extends FlxTypedGroup<FlxSprite> {

    var backVel:Float;

    var top:FlxSprite;
    var bot:FlxSprite;
    var vel:Float;

    private var passed = false;
    private var rand(default, null):FlxRandom;
    private final space:Int = 100;

    public function new(vel:Float, x:Float) {
        super();

        this.vel = vel;
        backVel = vel;
        rand = new FlxRandom();

        top = new FlxSprite(x, 0, AssetPaths.pipe_green__png);
        top.angle = -180;

        bot = new FlxSprite(x, 0, AssetPaths.pipe_green__png);
        
        randomPos();

        add(top);
        add(bot);
    }

    override function update(elapsed:Float) {
        top.x -= vel * elapsed;

        if (top.x + top.width < 0) {
            top.x = FlxG.width;
            passed = false;
            randomPos();
        }

        bot.x = top.x;

        super.update(elapsed);
    }

    private function randomPos() {
        top.y = rand.int(50, 250) - top.height;
        bot.y = top.y + top.height + space;
    }

    public function hasPassed(bird:Bird):Bool {
        if (bird.x > top.x + top.width && !passed) {
            passed = true;
            return true;
        } 

        return false;
    }

    public function hasTouched(bird:Bird) {
        return FlxG.pixelPerfectOverlap(bird, top) || FlxG.pixelPerfectOverlap(bird, bot);
    }
}