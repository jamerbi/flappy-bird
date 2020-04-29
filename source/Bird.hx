import flixel.input.keyboard.FlxKey;
import flixel.FlxG;
import flixel.FlxSprite;

class Bird extends FlxSprite {

    private var canMove:Bool;
    private var vel:Float;

    public function new(x:Float, y:Float, vel:Float) {
        super(x, y);
        this.vel = vel;

        loadGraphic(AssetPaths.redbird__png, true, 34, 24);
        animation.add('wing', [1, 0, 1, 2], 16, false);

        acceleration.y = vel * 3;
        angularAcceleration = vel * 1.5;
        canMove = true;
    }

    override function update(elapsed:Float) {
        if (angle > 45) angle = 45;
        if (angle < -45) angle = -45;

        if (InputProcessor.justPressed() && canMove) {
            velocity.y = -(vel * 1.7);
            angularVelocity = -vel;
            animation.play('wing', true);
            FlxG.sound.play(AssetPaths.wing__ogg);
        }

        super.update(elapsed);
    }
}