package;

import flixel.FlxG;
import flixel.FlxSprite;

class HealthIcon extends FlxSprite
{
	/**
	 * Used for FreeplayState! If you use it elsewhere, prob gonna annoying
	 */
	public var sprTracker:FlxSprite;

	public function new(char:String = 'bf', isPlayer:Bool = false)
	{
		super();

		if(FlxG.save.data.antialiasing)
			{
				antialiasing = true;
			}
		if (char == 'sm')
		{
			loadGraphic(Paths.image("stepmania-icon"));
			return;
		}
		loadGraphic(Paths.image('iconGrid'), true, 150, 150);
		animation.add('bf', [0, 1], 0, false, isPlayer);
		animation.add('bf-car', [0, 1], 0, false, isPlayer);
		animation.add('bf-christmas', [0, 1], 0, false, isPlayer);
		animation.add('bf-pixel', [21, 21], 0, false, isPlayer);
		animation.add('spooky', [2, 3], 0, false, isPlayer);
		animation.add('pico', [4, 5], 0, false, isPlayer);
		animation.add('mom', [6, 7], 0, false, isPlayer);
		animation.add('mom-car', [6, 7], 0, false, isPlayer);
		animation.add('tankman', [8, 9], 0, false, isPlayer);
		animation.add('face', [10, 11], 0, false, isPlayer);
		animation.add('dad', [12, 13], 0, false, isPlayer);
		animation.add('senpai', [22, 22], 0, false, isPlayer);
		animation.add('senpai-angry', [22, 22], 0, false, isPlayer);
		animation.add('spirit', [23, 23], 0, false, isPlayer);
		animation.add('bf-old', [14, 15], 0, false, isPlayer);
		animation.add('gf', [16], 0, false, isPlayer);
		animation.add('gf-christmas', [16], 0, false, isPlayer);
		animation.add('gf-pixel', [16], 0, false, isPlayer);
		animation.add('parents-christmas', [17, 18], 0, false, isPlayer);
		animation.add('monster', [19, 20], 0, false, isPlayer);
		animation.add('monster-christmas', [19, 20], 0, false, isPlayer);
		animation.add('ct', [24, 25], 0, false, isPlayer);
		animation.add('ct-angry', [26, 27], 0, false, isPlayer);
		animation.add('auto', [28, 28], 0, false, isPlayer);
		animation.add('easy', [29, 29], 0, false, isPlayer);
 		animation.add('normal', [30, 30], 0, false, isPlayer);
		animation.add('hard', [31, 31], 0, false, isPlayer);
		animation.add('harder', [32, 32], 0, false, isPlayer);
		animation.add('insane', [33, 33], 0, false, isPlayer);
		animation.add('easy-demon', [34, 34], 0, false, isPlayer);
		animation.add('medium-demon', [35, 35], 0, false, isPlayer);
		animation.add('hard-demon', [36, 36], 0, false, isPlayer);
		animation.add('insane-demon', [37, 37], 0, false, isPlayer);
		animation.add('extreme-demon', [38, 38], 0, false, isPlayer);
		animation.play(char);

		switch(char)
		{
			case 'bf-pixel' | 'senpai' | 'senpai-angry' | 'spirit' | 'gf-pixel':
				antialiasing = false;
		}

		scrollFactor.set();
	}

	override function update(elapsed:Float)
	{
		super.update(elapsed);

		if (sprTracker != null)
			setPosition(sprTracker.x + sprTracker.width + 10, sprTracker.y - 30);
	}
}
