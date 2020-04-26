import flixel.util.FlxColor;
import flixel.FlxG;
import flixel.text.FlxText;

class Score extends FlxText {
    
    public var score:Int = 0;
    public var canAdd:Bool = true;

    public function new(x:Float, y:Float) {
        super(x, y, 0, "", 32);
        setBorderStyle(FlxTextBorderStyle.SHADOW, FlxColor.BLACK, 4);
        resetScore();
    }

    public function resetScore() {
        score = 0;
        updateText();
    }

    public function addScore() {
        score++;
        canAdd = false;
        FlxG.sound.play(AssetPaths.point__ogg);
        updateText();
    }

    function updateText() {
        text = Std.string(score);
        x = (FlxG.width - width) * 0.5;
    }
}