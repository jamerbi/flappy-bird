import flixel.FlxG;
import flixel.system.FlxAssets.FlxGraphicAsset;

class Base extends Parallax {

    public function new(vel:Float, y:Float, img:FlxGraphicAsset) {
        super(vel, y, img);    
    }

    public function hasTouched(bird:Bird) {
        return FlxG.pixelPerfectOverlap(bird, spr1) || FlxG.pixelPerfectOverlap(bird, spr2);
    }
}