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
    var parent:PlayState;

    public function new(parent:PlayState) {
        super();
        this.parent = parent;
    }

    override function create() {
        background = new FlxSprite(0, 0);
        background.makeGraphic(FlxG.width, FlxG.height, FlxColor.BLACK);
        background.alpha = 0.5;

        titleText = new FlxText(0, 0, 0, "Game Over", 24);
        titleText.setBorderStyle(FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
        titleText.setPosition((FlxG.width - titleText.width) * 0.5, FlxG.height * 0.3);

        bestText = new FlxText(0, 0, 0, "Best Score: " + parent.score.load());
        bestText.setBorderStyle(FlxTextBorderStyle.SHADOW, FlxColor.RED, 4);
        bestText.setPosition((FlxG.width - titleText.width) * 0.5, FlxG.height * 0.5);

        scoreText = new FlxText(0, 0, 0, "Your Score: " + parent.score.current);
        scoreText.setBorderStyle(FlxTextBorderStyle.SHADOW, FlxColor.RED, 4);
        scoreText.setPosition((FlxG.width - titleText.width) * 0.5, FlxG.height * 0.6);

        okButton = new FlxButton(0, 0, "Ok", okClick);
        okButton.setPosition((FlxG.width - okButton.width) * 0.5, FlxG.height * 0.8);

        add(background);
        add(titleText);
        add(scoreText);
        add(bestText);
        add(okButton);

        init();
    }

    private function init() {
        parent.score.save();
        FlxG.sound.play(AssetPaths.die__ogg);
    }

    private function okClick() {

    }
}