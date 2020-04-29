import flixel.util.FlxSave;
import flixel.util.FlxColor;
import flixel.FlxG;
import flixel.text.FlxText;

// class Score extends FlxText {
    
//     public var score:Int = 0;
//     public var canAdd:Bool = true;

//     public function new(x:Float, y:Float) {
//         super(x, y, 0, "", 32);
//         setBorderStyle(FlxTextBorderStyle.SHADOW, FlxColor.BLACK, 4);
//         resetScore();
//     }

//     public function resetScore() {
//         score = 0;
//         updateText();
//     }

//     public function addScore() {
//         score++;
//         canAdd = false;
//         FlxG.sound.play(AssetPaths.point__ogg);
//         updateText();
//     }

//     function updateText() {
//         text = Std.string(score);
//         x = (FlxG.width - width) * 0.5;
//     }
// }

class Score {
    
    inline static private var DATA = "BESTSCORE";

    public var current:Int;
    static public var memory:FlxSave;

    public function new() {
        current = 0;
        memory = new FlxSave();
    }

    public function reset() {
        if (memory.bind(DATA)) {
            memory.data.score = 0;
        }
    }

    public function save() {
        if (load() < current) {
            memory.data.score = current;
        }
    }

    public function load():Int {
        if (memory.bind(DATA)) {
            if (memory.data != null && memory.data.score != null) {
                return memory.data.score;
            }
        }

        return 0;
    }
}