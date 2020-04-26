package;

import flixel.input.keyboard.FlxKey;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import flixel.FlxSprite;
import flixel.FlxG;
import flixel.FlxState;

class PlayState extends FlxState {

	var vel:Float = 150;
	var state:GameState = Init;

	var base:Parallax;
	var bird:Bird;
	var pipes:Pipe;
	var score:Score;
	var initScreen:InitScreen;
	var saveData:SaveData;
	var gameOver:FlxText;

	override public function create() {
		saveData = new SaveData();
		saveData.loadBestScore();

		add(new FlxSprite(0, 0).makeGraphic(FlxG.width, FlxG.height, FlxColor.fromString("#5fcde4")));
		add(new Parallax(vel * 0.7, 315, AssetPaths.bg2__png));
		add(new Parallax(vel * 0.8, 340, AssetPaths.bg3__png));
		add(new Parallax(vel * 0.9, 368, AssetPaths.bg1__png));

		base = new Parallax(vel, 400, AssetPaths.base__png);
		bird = new Bird(50, 200, vel);
		pipes = new Pipe(vel, FlxG.width);
		score = new Score(FlxG.width * 0.5, FlxG.height * 0.2);
		score.visible = false;

		add(pipes);
		add(base);
		add(bird);
		add(score);

		initScreen = new InitScreen();
		initScreen.updateScore(saveData.bestScore);
		add(initScreen);

		gameOver = new FlxText(0, 0, "Game Over", 24);
		gameOver.setBorderStyle(FlxTextBorderStyle.OUTLINE, FlxColor.BLACK, 2);
		gameOver.setPosition((FlxG.width - gameOver.width) * 0.5, FlxG.height * 0.5);
		gameOver.visible = false;
		add(gameOver);

		forEachOfType(IStopable, function(m) m.stop());
	}

	override public function update(elapsed:Float) {
		super.update(elapsed);

		switch (state) {
			case Init:
				waitInit();
			case Play:
				detectCollision();
				updateScore();
			case Finish:
				waitFinish();
			default:
				trace("default");
		}
	}

	override function destroy() {
		super.destroy();
	}

	function detectCollision() {
		if (FlxG.pixelPerfectOverlap(bird, base.members[0]) || FlxG.pixelPerfectOverlap(bird, base.members[1]) 
			|| FlxG.pixelPerfectOverlap(bird, pipes.members[0]) || FlxG.pixelPerfectOverlap(bird, pipes.members[1]) 
			|| bird.y < 0) {
			FlxG.sound.play(AssetPaths.die__ogg);
			forEachOfType(IStopable, function (m) m.stop());
			saveData.saveBestScore(score.score);
			gameOver.visible = true;
			state = Finish;
		}
	}

	function updateScore() {
		if (pipes.members[0].x + pipes.members[0].width < bird.x && score.canAdd) score.addScore();
		if (pipes.members[0].x == FlxG.width) score.canAdd = true;
	}

	function waitInit() {
		if (FlxG.keys.anyJustPressed([FlxKey.SPACE])) {
			state = Play;
			forEachOfType(IStopable, function(m) m.play());
			initScreen.forEach(function (m) m.visible = false);
			score.visible = true;
		}
	}

	function waitFinish() {
		if (FlxG.keys.anyJustPressed([FlxKey.SPACE])) {
			create();
			state = Init;
		}
	}
}
