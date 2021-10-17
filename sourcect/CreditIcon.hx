package;

import flixel.FlxSprite;

class CreditIcon extends FlxSprite
{
	/**
	 * Used for FreeplayState! If you use it elsewhere, prob gonna annoying
	 */
	public var link:String;

	public function new(xPos:Float = 0, yPos:Float = 0, icon:String = 'Avery', ?daLink:String = '')
	{
		super(xPos, yPos);
		link = daLink;
		loadGraphic(Paths.image('creds/icons/icon' + icon));
	}
}