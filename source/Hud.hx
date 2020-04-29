import flixel.util.FlxColor;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.ui.FlxButton;
import flixel.text.FlxText;
import flixel.group.FlxGroup.FlxTypedGroup;

class Hud extends FlxTypedGroup<FlxSprite> {

    private var scoreText:FlxText;
    private var bestText:FlxText;
    private var pauseButton:FlxButton;
    private var parent:PlayState;

    public function new(parent:PlayState) {
        super();

        this.parent = parent;

        scoreText = new FlxText(FlxG.width * 0.5, FlxG.height * 0.2, 0, "", 32);
        scoreText.setBorderStyle(FlxTextBorderStyle.SHADOW, FlxColor.BLACK, 4);
        bestText = new FlxText(0, 0, 0, "", 16);
        pauseButton = new FlxButton(0, 0, "pause", pauseClick);

        updateScore(0);
        updateBestScore(0);

        add(scoreText);
        add(bestText);
        add(pauseButton);
    }

    public function updateScore(score:Int) {
        scoreText.text = Std.string(score);
        scoreText.setPosition((FlxG.width - scoreText.width) * 0.5, scoreText.y);
    }

    public function updateBestScore(score:Int) {
        bestText.text = "Best: " + score;
        bestText.setPosition(FlxG.width - bestText.width, 0);
    }

    public function show() {
        visible = true;
    }

    public function hide() {
        visible = false;
    }

    private function pauseClick() {
        trace("substate changed");
    }
}