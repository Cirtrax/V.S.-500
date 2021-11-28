package;

import flixel.FlxG;
import flixel.FlxSprite;

class HealthIcon extends FlxSprite
{
	/**
	 * Used for FreeplayState! If you use it elsewhere, prob gonna annoying
	 */
	public var sprTracker:FlxSprite;
	public var char:String;
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
		
		this.char = char;
		switch (char)
		{
<<<<<<< Updated upstream
=======
			case 'bf':
				loadGraphic(Paths.image('icons/bf'), true, 150, 150);
				animation.add('bf', [0, 1, 2], 0, false, isPlayer);
>>>>>>> Stashed changes
			case 'ct':
				loadGraphic(Paths.image('icons/ct'), true, 150, 150);
				animation.add('ct', [0, 1, 2], 0, false, isPlayer);
			case 'ct-angry':
				loadGraphic(Paths.image('icons/ct-angry'), true, 150, 150);
				animation.add('ct-angry', [0, 1, 2], 0, false, isPlayer);	
			case 'extremeCT':
				loadGraphic(Paths.image('icons/ct-extreme'), true, 150, 150);
				animation.add('extremeCT', [0, 1, 2], 0, false, isPlayer);	
			case 'extremeCTPissed':
				loadGraphic(Paths.image('icons/ct-extreme'), true, 150, 150);
<<<<<<< Updated upstream
				animation.add('extremeCTPissed', [0, 1, 2], 0, false, isPlayer);	
=======
				animation.add('extremeCTPissed', [0, 1, 2], 0, false, isPlayer);
			case 'extremeCTAnger':
				loadGraphic(Paths.image('icons/ct-extreme-angry'), true, 150, 150);
				animation.add('extremeCTAnger', [0, 1, 2], 0, false, isPlayer);	
>>>>>>> Stashed changes
			case 'passe':	
				loadGraphic(Paths.image('icons/passe'), true, 150, 150);
				animation.add('passe', [0, 1, 2], 0, false, isPlayer);
			case 'passeR':	
				loadGraphic(Paths.image('icons/passeR'), true, 150, 150);
				animation.add('passeR', [0, 1, 2], 0, false, isPlayer);
			case 'deces':	
				loadGraphic(Paths.image('icons/deces'), true, 150, 150);
				animation.add('deces', [0, 1, 2], 0, false, isPlayer);
<<<<<<< Updated upstream
				
			default:
				loadGraphic(Paths.image('iconGrid'), true, 150, 150);
				animation.add('bf', [0, 1, 0], 0, false, isPlayer);
=======
			case 'rubrub':	
				loadGraphic(Paths.image('icons/rubrub'), true, 150, 150);
				animation.add('rubrub', [0, 1, 2], 0, false, isPlayer);
					
			default:
				loadGraphic(Paths.image('iconGrid'), true, 150, 150);
				//animation.add('bf', [0, 1, 0], 0, false, isPlayer);
>>>>>>> Stashed changes
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
				animation.add('easy-demon', [35, 35], 0, false, isPlayer);
				animation.add('medium-demon', [36, 36], 0, false, isPlayer);
				animation.add('hard-demon', [37, 37], 0, false, isPlayer);
				animation.add('insane-demon', [38, 38], 0, false, isPlayer);
				animation.add('extreme-demon', [39, 39], 0, false, isPlayer);
				animation.add('extreme-demon-extreme', [40, 40], 0, false, isPlayer);
				/*animation.add('ct', [24, 25], 0, false, isPlayer);
				animation.add('ct-angry', [26, 27, 26], 0, false, isPlayer);
				animation.add('passe', [31, 32], 0, false, isPlayer);
				animation.add('passeR', [33, 34], 0, false, isPlayer);
				animation.add('deces', [33, 34], 0, false, isPlayer);*/

		}

		switch(char)
		{
			case 'bf-pixel' | 'senpai' | 'senpai-angry' | 'spirit' | 'gf-pixel':
				antialiasing = false;
		}
		animation.play(char);
		scrollFactor.set();
	}

	override function update(elapsed:Float)
	{
		super.update(elapsed);

		if (sprTracker != null)
			setPosition(sprTracker.x + sprTracker.width + 10, sprTracker.y - 30);
	}
}
