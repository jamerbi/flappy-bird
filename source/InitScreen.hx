import flixel.FlxG;
import flixel.util.FlxColor;
import flixel.text.FlxText;
import flixel.group.FlxGroup.FlxTypedGroup;

class InitScreen extends FlxTypedGroup<FlxText> {
    
    var title:FlxText;
    var best:FlxText;
    var mess:FlxText;

    public function new() {
        super();

        title = new FlxText(0, 0, 0, "Flappy Bird", 24);
        title.setBorderStyle(FlxTextBorderStyle.OUTLINE, FlxColor.BLACK, 2);
        title.setPosition((FlxG.width - title.width) * 0.5, FlxG.height * 0.3);
        best = new FlxText(0, 0, "Best: 0", 32);
        best.setBorderStyle(FlxTextBorderStyle.SHADOW, FlxColor.BLACK, 4);
        best.setPosition((FlxG.width - best.width) * 0.5, FlxG.height * 0.5);
        mess = new FlxText(0, 0, "Presiona [Espacio]", 16);
        mess.setBorderStyle(FlxTextBorderStyle.OUTLINE, FlxColor.BLACK, 2);
        mess.setPosition((FlxG.width - mess.width) * 0.5, FlxG.height * 0.7);

        add(title);
        add(best);
        add(mess);
    }

    public function updateScore(score:Int) {
        best.text = "Best: " + score;
        best.setPosition((FlxG.width - best.width) * 0.5, FlxG.height * 0.5);
    }
}