package;

import openfl.Lib;
import flixel.FlxGame;
import openfl.display.Sprite;

class Main extends Sprite
{
	public function new()
	{
		super();
		var scale = Lib.current.stage.stageWidth / 288;
		addChild(new FlxGame(288, 512, PlayState, scale, 60, 60, true));
	}
}
