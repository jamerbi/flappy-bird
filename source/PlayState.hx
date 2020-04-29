package;

import flixel.text.FlxText;
import flixel.util.FlxColor;
import flixel.FlxSprite;
import flixel.FlxG;
import flixel.FlxState;

class PlayState extends FlxState {

	public var score:Score;
	public var hud:Hud;

	inline static var vel:Float = 150;

	var base:Base;
	var bird:Bird;
	var pipes:Pipe;

	override public function create() {
		// background
		add(new FlxSprite(0, 0).makeGraphic(FlxG.width, FlxG.height, FlxColor.fromString("#5fcde4")));
		add(new Parallax(vel * 0.7, 315, AssetPaths.bg2__png));
		add(new Parallax(vel * 0.8, 340, AssetPaths.bg3__png));
		add(new Parallax(vel * 0.9, 368, AssetPaths.bg1__png));

		// entities
		base = new Base(vel, 400, AssetPaths.base__png);
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

		openSubState(new InitSubState(this));
	}

	override public function update(elapsed:Float) {
		super.update(elapsed);

		if (pipes.hasPassed(bird)) 
			hud.updateScore(++score.current);
		if (pipes.hasTouched(bird) || base.hasTouched(bird) || bird.y < 0) 
			openSubState(new EndSubState(this));
	}
}
