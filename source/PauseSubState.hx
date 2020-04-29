import flixel.util.FlxColor;
import flixel.FlxSprite;
import flixel.FlxG;
import flixel.ui.FlxButton;
import flixel.FlxSubState;

class PauseSubState extends FlxSubState {

    private var background:FlxSprite;
    private var playButton:FlxButton;

    override function create() {
        background = new FlxSprite(0, 0);
        background.makeGraphic(FlxG.width, FlxG.height, FlxColor.BLACK);
        background.alpha = 0.5;

        playButton = new FlxButton(0, 0, "", playClick);
        playButton.loadGraphic(AssetPaths.play_button__png, true, 64, 64);
        playButton.setPosition((FlxG.width - playButton.width) * 0.5, FlxG.height * 0.5);

        add(background);
        add(playButton);
    }

    private function playClick() {
        close();
    }
}