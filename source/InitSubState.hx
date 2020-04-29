import openfl.Lib;
import flixel.tweens.FlxEase;
import flixel.FlxSprite;
import flixel.tweens.FlxTween;
import flixel.util.FlxColor;
import flixel.text.FlxText;
import flixel.FlxG;
import flixel.ui.FlxButton;
import flixel.FlxSubState;

class InitSubState extends FlxSubState {

    var startButton:FlxButton;
    var titleText:FlxText;
    var background:FlxSprite;
    var scoreText:FlxText;

    public var parent:PlayState;

    public function new(parent:PlayState) {
        super();
        this.parent = parent;
    }

    override function create() {
        parent.persistentUpdate = true;

        background = new FlxSprite(0, 0);
        background.makeGraphic(FlxG.width, FlxG.height, FlxColor.BLACK);
        background.alpha = 0.5;

        startButton = new FlxButton(0, 0, "Start", startClick);
        startButton.setPosition((FlxG.width - startButton.width) * 0.5, FlxG.height * 0.7);

        titleText = new FlxText(0, 0, 0, "FlappyBird", 16);
        titleText.setBorderStyle(FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
        titleText.setPosition((FlxG.width - titleText.width) * 0.5, FlxG.height * 0.4);

        scoreText = new FlxText(0, 0, 0, "Best Score: " + new Score().load(), 16);
        scoreText.setPosition((FlxG.width - scoreText.width) * 0.5, FlxG.height * 0.5);
        
        add(background);
        add(titleText);
        add(startButton);
        add(scoreText);
    }

    private function startClick() {
        FlxTween.tween(background, {alpha: 0}, 2, {ease: FlxEase.expoIn, onComplete: function (tween) {
            parent.hud.show();
            close();       
        }});
    }
}