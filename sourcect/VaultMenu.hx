package;

import lime.system.System;
import openfl.Lib;
import lime.app.Application;
import flixel.addons.ui.FlxUIInputText;
import flixel.input.keyboard.FlxKey;
import sys.FileSystem;
import flixel.FlxObject;
import flixel.util.FlxTimer;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.system.FlxSound;
import flixel.util.FlxGradient;
#if desktop
import Discord.DiscordClient;
#end
import flash.text.TextField;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.addons.display.FlxGridOverlay;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.math.FlxMath;
import flixel.text.FlxText;
import flixel.addons.text.FlxTypeText;
import flixel.util.FlxColor;
import lime.utils.Assets;
import flixel.addons.display.FlxBackdrop;

using StringTools;

class VaultMenu extends MusicBeatState
{
    
    var input:FlxUIInputText;
    var textTyped:Bool = false;
    var inputLength:Int = 0;
    var inputLol:Alphabet;
    var inputLol2:Alphabet;
    var screenLock:Bool = false;
    var exitLock:Bool = false;
    var swagDialogue:FlxTypeText;
    var inputThisShit:Array<String>;
    var whenRight:Array<String>;
    var randomWhenWrong:Array<String>;
    public static var inputResult:String = "";

    var ashFemboy:FlxSprite;
    var cerbFemboy:FlxSprite;
    var doorFuck:FlxSprite;

    var michigunTribute:FlxSprite;

    var vaultInputButton:FlxSprite;
    var grimlockButton:FlxSprite;

    var inImage:Bool = false;


    override function create()
        {
            inputThisShit = 
            [
                'burning',
                'rubrub',
                'cirtrax',
                'bob',
                'boyfriend',
                'clubbete',
                'potbor',
                'sparky',
                'glubfub',
                'challenge',
                'thisislongonpurposejustforpeopletolookintothesourcecodeandpossiblyinputthisinlol', 
                'hi ash',
                'ohsovanilla',
                'bosip',
                'ron',
                'kazoo',
                'justifited',
                'sticky',
                'cj',
                'tankman',
                'table',
                'zim',
                'viprin',
                'maple',
                'ratemylvl',
                'sneed',
                'attempt 0',
                'doorstuck',
                'forbidden'
            ];
        
            whenRight = 
            [
                'RUBRUBRUBRUBRUBRUBRUB',
                'You mean Avery?',
                'I heard of them, they are cool!',
                'Who is that?',
                'Not her...',
                'He is kinda scary...',
                'They seem weird.',
                'They are annoying!',
                'What challenge?',
                'Did you expect anything from this...?',
                'hi ash'
            ];
        
            randomWhenWrong =
            [
                'No!',
                'That is wrong!',
                'Try again!',
                'WRONG!',
                'Maybe try harder!',
                'False!',
                'Nope!' //this shit doesnt work lol lets not worry about this
            ];

            FlxG.sound.playMusic(Paths.music('sounds/RS1', 'shared'), 0);
            FlxG.sound.music.fadeIn(3, 0, 0.6);

            var bg:FlxSprite = new FlxSprite().loadGraphic(Paths.image('vault/vault'));
			bg.scrollFactor.x = 0;
			bg.scrollFactor.y = 0;
			bg.setGraphicSize(Std.int(bg.width * 1));
			bg.updateHitbox();
			bg.screenCenter();
			bg.antialiasing = true;
			add(bg);

            grimlockButton = new FlxSprite().loadGraphic(Paths.image('vault/grimlock2'));
            //grimlockButton.setGraphicSize(Std.int(grimlockButton.width * 0.2));
            grimlockButton.screenCenter();
            grimlockButton.y += 150;
            grimlockButton.updateHitbox();
            grimlockButton.antialiasing = true;
            add(grimlockButton);


            input = new FlxUIInputText(10, 10, FlxG.width, '', 8);
            input.setFormat(Paths.font("vcr.ttf"), 50, FlxColor.WHITE);
            input.setGraphicSize(Std.int(input.height * 5));
            input.alignment = CENTER;
            //input.setBorderStyle(OUTLINE, 0xFF000000, 3, 1);
            input.screenCenter();
            input.scrollFactor.set();
            input.y -= 100;
            input.visible = false;
            add(input);
            input.maxLength = 30;
            input.lines = 3;

            vaultInputButton = new FlxSprite().loadGraphic(Paths.image('vault/inputbar'));
            vaultInputButton.screenCenter();
            vaultInputButton.setGraphicSize(Std.int(vaultInputButton.width * 1.2));
            vaultInputButton.y -= 110;
            vaultInputButton.x -= 50;
            vaultInputButton.alpha = 0.8;
            vaultInputButton.updateHitbox();
            add(vaultInputButton);


            ashFemboy = new FlxSprite().loadGraphic(Paths.image('vault/ashFemboy'));
            //ashFemboy.setGraphicSize(Std.int(ashFemboy.width * 3));
            ashFemboy.antialiasing = true;
            ashFemboy.screenCenter();
            ashFemboy.alpha = 0;
            add(ashFemboy);

            cerbFemboy = new FlxSprite().loadGraphic(Paths.image('vault/fembera'));
            cerbFemboy.setGraphicSize(Std.int(cerbFemboy.width * 0.8));
            cerbFemboy.antialiasing = true;
            cerbFemboy.screenCenter();
            cerbFemboy.alpha = 0;
            add(cerbFemboy);


            doorFuck = new FlxSprite().loadGraphic(Paths.image('vault/outtamyway'));
            doorFuck.antialiasing = true;
            doorFuck.screenCenter();
            doorFuck.alpha = 0;
            add(doorFuck);

            michigunTribute = new FlxSprite().loadGraphic(Paths.image('vault/michigun'));
            michigunTribute.antialiasing = true;
            michigunTribute.screenCenter();
            michigunTribute.alpha = 0;
            add(michigunTribute);

        }

        

        override function update(elapsed:Float)
            {

            if (FlxG.keys.justPressed.ENTER && inImage)
                {
                    LoadingState.loadAndSwitchState(new VaultMenu());
                }
               
                super.update(elapsed);
                FlxG.mouse.visible = true;
                
            if (FlxG.keys.justPressed.ESCAPE)
                {
                    FlxG.switchState(new MainMenuState());
                }
            if (FlxG.keys.justPressed.ANY)
                    {
                        if (textTyped == true)
                        {
                            remove (inputLol);
                            remove (inputLol2);
                        }
            
                        inputLength = input.text.length;
            
                        if (inputLength >= 81)
                        {
                        inputLol = new Alphabet(3, 50, (input.text.substr(0, 11).trim()), true);
                        inputLol.screenCenter();
                        inputLol.y = (inputLol.y - 300);
                        inputLol.scrollFactor.set();
                        add(inputLol);
                        textTyped = true;
            
                        inputLol2 = new Alphabet(3, 50, (input.text.substr(11).trim()), true);
                        inputLol2.screenCenter();
                        inputLol2.y = (inputLol2.y + 300);
                        inputLol2.scrollFactor.set();
                        add(inputLol2);
                        textTyped = true;
                        }
                        if (inputLength < 81)
                        {
                        inputLol2 = new Alphabet(3, 100, (input.text.toLowerCase()), true);
                        inputLol2.screenCenter();
                        inputLol2.y = (inputLol2.y - 100);
                        inputLol2.scrollFactor.set();
                        add(inputLol2);
                        textTyped = true;
                        }
                    }
              if (FlxG.keys.justPressed.ENTER && input.text != '')
                {    
                inputResult = input.text.toLowerCase();
                    switch (inputResult)
                        {
                        case 'burning':
                            daDialogueArray("The Chicken is on fire?! He's gonna be here soon!");
                            
                            new FlxTimer().start(2, function(tmr:FlxTimer)
                            {
                                PlayState.storyPlaylist = ['burnt-chicken'];
                                PlayState.isStoryMode = false;
                                PlayState.storyDifficulty = 2;
                                PlayState.SONG = Song.loadFromJson(StringTools.replace(PlayState.storyPlaylist[0]," ", "-").toLowerCase() + '-hard', StringTools.replace(PlayState.storyPlaylist[0]," ", "-").toLowerCase());
                                PlayState.storyWeek = 10;
                                PlayState.campaignScore = 0;
                                LoadingState.loadAndSwitchState(new PlayState(), true);
                            });
                        case 'rubrub':
                            daDialogueArray("RUBRUBRUBRUBRUBRUBRUB");
                        case 'cirtrax':
                            daDialogueArray("You mean Avery?");
                        case 'niffirg':
                            daDialogueArray("pubert");
                        case 'bob':
                            daDialogueArray("I heard of them, they are cool!");
                        case 'boyfriend':
                            daDialogueArray("Who is that?");
                        case 'clubbete':
                            daDialogueArray("Not her...");
                        case 'potbor':
                            daDialogueArray("He is kinda scary...");
                        case 'sparky':
                            daDialogueArray("They seem weird.");
                        case 'glubfub':
                            daDialogueArray("They are annoying!");
                        case 'challenge':
                            daDialogueArray("What challenge?"); 
                        case 'thisislongonpurposejustforpeopletolookintothesourcecodeandpossiblyinputthisinlol':
                            daDialogueArray("Did you expect anything from this...?");
                        case 'hi ash':
                            daDialogueArray("Hi Ash");
                            ashFemboy.alpha = 0.5;
							FlxTween.tween(ashFemboy, {alpha: 0}, 3, {ease: FlxEase.expoInOut});
                            FlxG.sound.play(Paths.sound('vineboom'));
                        case 'sink':
                            FlxG.sound.play(Paths.sound('tada'));
                        case 'troll':
                            fancyOpenURL("https://www.youtube.com/watch?v=PXqcHi2fkXI");
                        case 'fivehundreded':
                            daDialogueArray("Follow us\non Twitter!");
                            new FlxTimer().start(1.6, function(tmr:FlxTimer)
                                {
                                    fancyOpenURL("https://twitter.com/500Devs");      
                                });
                        case 'cerbera':
                            daDialogueArray("Holy Shit\nFemboy Cerbera");
                            cerbFemboy.alpha = 0.5;
							FlxTween.tween(cerbFemboy, {alpha: 0}, 3, {ease: FlxEase.expoInOut});
                            FlxG.sound.play(Paths.sound('vineboom'));
                        case 'doorstuck':
                            //daDialogueArray("can't make it, can't make it, the shit's stuck!, OUTTA MY WAY SON!");
                           
                            new FlxTimer().start(0.1, function(tmr:FlxTimer)
                                {
                                    FlxTween.tween(doorFuck, {alpha: 1}, 0.1, {ease: FlxEase.expoInOut});
                                    remove(inputLol2);
                                    remove(inputLol);
                                    remove(swagDialogue);
                                    FlxG.sound.play(Paths.sound('outtamyway'));
                                });
							new FlxTimer().start(6, function(tmr:FlxTimer)
                                {
                                    FlxTween.tween(doorFuck, {alpha: 0}, 0.2, {ease: FlxEase.expoInOut});
                                    add(inputLol2);
                                    add(inputLol);
                                    add(swagDialogue);
                                });
                           
                                //this is probably a bad idea but whatever
                                //not like its gameplay its just some shit here for a single event
                            
                        case 'michigun':
                            new FlxTimer().start(0.3, function(tmr:FlxTimer)
                                {
                                    remove(inputLol2);
                                    remove(inputLol);
                                    remove(swagDialogue);
                                    remove(grimlockButton);    
                                });
                           
                            new FlxTimer().start(0.1, function(tmr:FlxTimer)
                                {
                                    FlxTween.tween(michigunTribute, {alpha: 1}, 1, {ease: FlxEase.expoInOut});
                                    FlxG.sound.playMusic(Paths.music('sounds/silence', 'shared'));	
                                });

                            new FlxTimer().start(1.1, function(tmr:FlxTimer)
                                {
                                    inImage = true;       
                                });
                        case 'ohsovanilla':
                            daDialogueArray("Gay for ice cream");
                        case 'justifited':
                            daDialogueArray("You mean justified?");
                        case 'bosip':
                            daDialogueArray("Funky cool ship dude!"); 
                        case 'kazoo':
                            daDialogueArray("tge cat :)");
                        case 'ron':
                            daDialogueArray("Oh yeah, I have heard that ron is a bad guy to be honest."); 
                        case 'sticky':
                            daDialogueArray("Luckiest guy around!");
                        case 'cj':
                            daDialogueArray("The Stars are shining, hopefully nothing bad happens...");
                        case 'tankman':
                            daDialogueArray("Insert Cock Joke Here");
                        case 'table':
                            daDialogueArray("Did it break?!");
                        case 'zim':
                            daDialogueArray("You talkin about the artist, the word, or the cool alien from that one cartoon?"); 
                        case 'viprin':
                            daDialogueArray("More like Viprin and Paste!");
                        case 'maple':
                            daDialogueArray("Like the syrup?");
                        case 'pentacropolis':
                            daDialogueArray("11 minutes of bad gameplay");
                        case 'sneed':
                            daDialogueArray("Gucci loafers? My favorite!");
                        case 'flippy':
                            daDialogueArray("FC God!");
                        case 'gegcoin':
                            daDialogueArray("gegland best land");
                        case 'kolsan':
                            daDialogueArray("chubby gf for life");
                        case 'cotiles':
                            daDialogueArray("Did you know that cotiles speaks portuguese and not spanish?");
                        case 'ratemylvl':
                            daDialogueArray("But i'm not rubrub...");
                        case 'grimlock':
                                daDialogueArray("I am Grimlock. This is my chamber, stay a while!");
                        case 'ayup':
                                daDialogueArray('"the best friends i have around, thanks folks -avery"');
                        case 'chocola':
                                daDialogueArray('That is not funny.');
                        case 'attempt 0':
                            System.exit(0); // gamecrash lol
                        case 'forbidden':
                            daDialogueArray("You know too much.");
                            new FlxTimer().start(1.5, function(tmr:FlxTimer)
                                {
                                    System.exit(0);
                                });
                        default:
                            daDialogueArray("Incorrect, or nothing was typed!");
                        }
                }       

                if (FlxG.mouse.overlaps(grimlockButton)) 
                    {
                        grimlockButton.scale.set(1.2, 1.2);
                        if (FlxG.mouse.pressed)
                        grimlockButton.scale.set(0.95, 0.95);
                        if (FlxG.mouse.justPressed)
                            daDialogueArray("Don't click on me, Grimlock the mighty demon!");
                    }
                else
                    grimlockButton.scale.set(1, 1);


            }
            
         //daDialogueArray("");  
        function unlockText():Void
                {
                    screenLock = false;
                }
                function unlockExit():Void
                {
                    exitLock = false;
                }
               
        

        function dialogueArray(text:String = '')
            {
                swagDialogue = new FlxTypeText(240, 540, Std.int(FlxG.width * 0.6), text, 40);
                swagDialogue.font = 'VCR OSD Mono';
                swagDialogue.color = 0xFFFFFFFF;
                swagDialogue.alignment = CENTER;
                add(swagDialogue);
                swagDialogue.resetText(text);
                swagDialogue.screenCenter();
                swagDialogue.y -= 250;
                swagDialogue.start(0.03, true, false);
            }


        function daDialogueArray(text:String = "", ?Callback:Void->Void)
            {
                remove(swagDialogue);
                dialogueArray(text);
            }
        /*function getWrongShit(text:Array<String>)
            {
                if (inputResult != daDialogueArray)
                    if (FlxG.random.int(0, 7) == 50)
                    inputResult = randomWhenWrong;
            }*/
      

}