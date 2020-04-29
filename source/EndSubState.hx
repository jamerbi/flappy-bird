import flixel.util.FlxColor;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.ui.FlxButton;
import flixel.text.FlxText;
import flixel.FlxSubState;

class EndSubState extends FlxSubState {
    
    var background:FlxSprite;
    var titleText:FlxText;
    var scoreText:FlxText;
    var bestText:FlxText;
    var okButton:FlxButton;

    var score:Score;

    public function new(score) {
        super();
        this.score = score;
    }

    override function create() {
        background = new FlxSprite(0, 0);
        background.makeGraphic(FlxG.width, FlxG.height, FlxColor.BLACK);
        background.alpha = 0.5;

        titleText = new FlxText(0, 0, 0, "Game Over", 24);
        titleText.setBorderStyle(FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
        titleText.setPosition((FlxG.width - titleText.width) * 0.5, FlxG.height * 0.3);

        bestText = new FlxText(0, 0, 0, "Best Score: " + score.load());
        bestText.setBorderStyle(FlxTextBorderStyle.SHADOW, FlxColor.RED, 4);
        bestText.setPosition((FlxG.width - titleText.width) * 0.5, FlxG.height * 0.5);

        scoreText = new FlxText(0, 0, 0, "Your Score: " + score.load());
        scoreText.setBorderStyle(FlxTextBorderStyle.SHADOW, FlxColor.RED, 4);
        scoreText.setPosition((FlxG.width - titleText.width) * 0.5, FlxG.height * 0.5);

        add(background);
        add(titleText);
    }
}