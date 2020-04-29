import flixel.FlxSprite;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.system.FlxAssets.FlxGraphicAsset;

class Parallax extends FlxTypedGroup<FlxSprite> {

    var vel:Float;
    var backVel:Float;

    private var spr1:FlxSprite;
    private var spr2:FlxSprite;

    public function new(vel:Float, y:Float, img:FlxGraphicAsset) {
        super();
        
        this.vel = vel;
        backVel = vel;

        spr1 = new FlxSprite(0, y, img);
        spr2 = new FlxSprite(spr1.width, y, img);

        add(spr1);
        add(spr2);
    }

    override function update(elapsed:Float) {
        spr1.x -= vel * elapsed;
        spr2.x -= vel * elapsed;

        if (spr1.x + spr1.width < 0) spr1.x = spr2.x + spr2.width;
        if (spr2.x + spr2.width < 0) spr2.x = spr1.x + spr1.width;

        super.update(elapsed);
    }
}