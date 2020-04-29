package;

import flixel.text.FlxText;
import flixel.util.FlxColor;
import flixel.FlxSprite;
import flixel.FlxG;
import flixel.FlxState;

class PlayState extends FlxState {

	var vel:Float = 150;
	public var state:GameState = Init;

	var base:Parallax;
	var bird:Bird;
	var pipes:Pipe;

	var score:Score;
	var hud:Hud;

	var gameOver:FlxText;

	override public function create() {
		// background
		add(new FlxSprite(0, 0).makeGraphic(FlxG.width, FlxG.height, FlxColor.fromString("#5fcde4")));
		add(new Parallax(vel * 0.7, 315, AssetPaths.bg2__png));
		add(new Parallax(vel * 0.8, 340, AssetPaths.bg3__png));
		add(new Parallax(vel * 0.9, 368, AssetPaths.bg1__png));

		// entities
		base = new Parallax(vel, 400, AssetPaths.base__png);
		bird = new Bird(50, 200, vel);
		pipes = new Pipe(vel, FlxG.width);

		// hud
		score = new Score();
		hud = new Hud(this);
		hud.updateBestScore(score.load());
		hud.hide();

		add(pipes);
		add(base);
		add(bird);
		add(hud);

		gameOver = new FlxText(0, 0, "Game Over", 24);
		gameOver.setBorderStyle(FlxTextBorderStyle.OUTLINE, FlxColor.BLACK, 2);
		gameOver.setPosition((FlxG.width - gameOver.width) * 0.5, FlxG.height * 0.5);
		gameOver.visible = false;
		add(gameOver);

		forEachOfType(IStopable, function(m) m.stop());

		openSubState(new InitSubState(this));
	}

	override public function update(elapsed:Float) {
		super.update(elapsed);

		switch (state) {
			case Play:
				detectCollision();
				updateScore();
			case Finish:
				waitFinish();
			default:
				
		}
	}

	function detectCollision() {
		if (FlxG.pixelPerfectOverlap(bird, base.members[0]) || FlxG.pixelPerfectOverlap(bird, base.members[1]) 
			|| FlxG.pixelPerfectOverlap(bird, pipes.members[0]) || FlxG.pixelPerfectOverlap(bird, pipes.members[1]) 
			|| bird.y < 0) {
			FlxG.sound.play(AssetPaths.die__ogg);
			forEachOfType(IStopable, function (m) m.stop());
			score.save();
			gameOver.visible = true;
			state = Finish;
		}
	}

	function updateScore() {
		if (pipes.hasPassed(bird)) {
			hud.updateScore(++score.current);
		}
	}

	public function beginGame() {
		state = Play;
		forEachOfType(IStopable, function(m) m.play());
		hud.show();
	}

	function waitFinish() {
		if (InputProcessor.justPressed()) {
			create();
			state = Init;
		}
	}
}
