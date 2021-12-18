package;

//import js.html.FileSystem;
import flixel.system.FlxSound;
import flixel.util.FlxTimer;
import flash.text.TextField;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.addons.display.FlxGridOverlay;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.math.FlxMath;
import flixel.tweens.FlxEase;
import flixel.addons.transition.FlxTransitionableState;
import flixel.tweens.FlxTween;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import lime.utils.Assets;

#if windows
import Sys;
import sys.FileSystem;
#end

#if windows
import Discord.DiscordClient;
#end

using StringTools;

class CreditState extends MusicBeatState
{

    var bg:FlxSprite;
    var creditsText:FlxSprite;
    var bgTop:FlxSprite;

    var creditsPage1:FlxTypedGroup<CreditIcon>;
    var textPage1:FlxTypedGroup<FlxSprite>;
    var arrowLeft:FlxSprite;
	var arrowRight:FlxSprite;

    var canDoStuff:Bool = false;
    var curPage:Int = 0;


    override function create()
        {

            super.create();
            FlxG.camera.zoom = 0.85;
            FlxG.mouse.visible = true;

            var bg:FlxSprite = new FlxSprite().loadGraphic(Paths.image('creds/bgcreds'));
            bg.antialiasing = true;
            bg.screenCenter();
            add(bg);

            bgTop = new FlxSprite().loadGraphic(Paths.image('creds/bgtop'));
            bgTop.antialiasing = true;
            bgTop.screenCenter();
            add(bgTop);

            creditsPage1 = new FlxTypedGroup<CreditIcon>();
		    add(creditsPage1);
        
		    textPage1 = new FlxTypedGroup<FlxSprite>();
		    add(textPage1);

            arrowRight = new FlxSprite(1300, 550).loadGraphic(Paths.image("creds/arrowRight"));
	    	arrowRight.antialiasing = true;
		    arrowRight.scale.set(0.6, 0.6);
	    	arrowRight.updateHitbox();
		    add(arrowRight);

            arrowLeft = new FlxSprite(-1000, 550).loadGraphic(Paths.image("creds/arrowLeft"));
            arrowLeft.antialiasing = true;
            arrowLeft.scale.set(0.6, 0.6);
            arrowLeft.updateHitbox();
            add(arrowLeft);

            creditsText = new FlxSprite(325, 800).loadGraphic(Paths.image("creds/credsText"));
		    creditsText.antialiasing = true;
            creditsText.screenCenter(X);
		    add(creditsText);


            for (i in 0...12) {
                var icon:CreditIcon = new CreditIcon();
                var text:FlxSprite = new FlxSprite();
                switch (i) {
                    case 0:
                        icon = new CreditIcon(55, 100, 'Avery2', 'https://twitter.com/averyavary');
                        text = new FlxSprite(200, 120).loadGraphic(Paths.image('creds/text/creditAvery'));
                    case 1:
                        icon = new CreditIcon(55, 225, 'Maple', 'https://twitter.com/mmmmmmmmmaple');
                        text = new FlxSprite(200, 240).loadGraphic(Paths.image('creds/text/creditMaple'));  
                    case 2:
                        icon = new CreditIcon(55, 340, 'Kazoo', 'https://twitter.com/KazoooTheCat');
                        text = new FlxSprite(200, 370).loadGraphic(Paths.image('creds/text/creditKazoo'));  
                    case 3:
                        icon = new CreditIcon(480, 100, 'Shey', 'https://twitter.com/typicalartie');
                        text = new FlxSprite(630, 120).loadGraphic(Paths.image('creds/text/creditShey'));
                    case 4:
                        icon = new CreditIcon(480, 225, 'Sprint', 'https://twitter.com/SDprint3D');
                        text = new FlxSprite(630, 240).loadGraphic(Paths.image('creds/text/creditSprint'));   
                    case 5:
                        icon = new CreditIcon(480, 355, 'ADS', 'https://twitter.com/averydoesstuf');
                        text = new FlxSprite(630, 370).loadGraphic(Paths.image('creds/text/creditADS'));      
                    case 6:
                        icon = new CreditIcon(870, 100, 'Xyle', 'https://twitter.com/Xyle_GD?s=09');
                        text = new FlxSprite(1000, 120).loadGraphic(Paths.image('creds/text/creditXyle'));
                    case 7:
                        icon = new CreditIcon(870, 215, 'Rock', 'https://twitter.com/Rockwizard55');
                        text = new FlxSprite(1000, 270).loadGraphic(Paths.image('creds/text/creditRock'));   
                    case 8:
                        icon = new CreditIcon(855, 355, 'Raging', 'https://twitter.com/ragingturtlelol');
                        text = new FlxSprite(1000, 390).loadGraphic(Paths.image('creds/text/creditRaging'));      
                    
                    
                }
                icon.x += FlxG.width * 2;
                text.x += FlxG.width * 2;
                icon.antialiasing = true;
                text.antialiasing = true;
                creditsPage1.add(icon);
                textPage1.add(text);
            }
            
            for (i in 0...12) {
                var icon:CreditIcon = new CreditIcon();
                var text:FlxSprite = new FlxSprite();
                switch (i) {
                    case 0:
                        icon = new CreditIcon(55, 100, 'Nylu', 'https://twitter.com/notnylu');
                        text = new FlxSprite(200, 120).loadGraphic(Paths.image('creds/text/creditNylu'));
                    case 1:
                        icon = new CreditIcon(55, 215, 'R3M', 'https://www.youtube.com/channel/UC4bAah1hK3zhptoFnKMTfcQ');
                        text = new FlxSprite(200, 240).loadGraphic(Paths.image('creds/text/creditRem'));  
                    case 2:
                        icon = new CreditIcon(55, 355, 'Ash', 'https://twitter.com/ash__i_guess_');
                        text = new FlxSprite(200, 370).loadGraphic(Paths.image('creds/text/creditAsh'));  
                    case 3:
                        icon = new CreditIcon(480, 100, 'Sink', 'https://twitter.com/sinksank_');
                        text = new FlxSprite(625, 140).loadGraphic(Paths.image('creds/text/creditSink'));
                    case 4:
                        icon = new CreditIcon(500, 225, 'Mike', 'https://twitter.com/cataclysmguy');
                        text = new FlxSprite(625, 260).loadGraphic(Paths.image('creds/text/creditMike'));   
                    case 5:
                        icon = new CreditIcon(470, 355, 'Darkswe', 'https://twitter.com/zDarkswe');
                        text = new FlxSprite(600, 390).loadGraphic(Paths.image('creds/text/creditDark'));      
                      case 6:
                        icon = new CreditIcon(870, 100, 'Fidy50', 'https://twitter.com/50Fidy');
                        text = new FlxSprite(1000, 120).loadGraphic(Paths.image('creds/text/creditFidy'));
                    case 7:
                        icon = new CreditIcon(870, 225, 'Bortouii', 'https://twitter.com/bortouii');
                        text = new FlxSprite(980, 240).loadGraphic(Paths.image('creds/text/creditBort'));   
                    case 8:
                        icon = new CreditIcon(890, 340, 'Torchiczk', 'https://twitter.com/TorchicZk');
                        text = new FlxSprite(1000, 370).loadGraphic(Paths.image('creds/text/creditTorch'));      
                    
                }
                icon.x += FlxG.width * 3;
                text.x += FlxG.width * 3;
                icon.antialiasing = true;
                text.antialiasing = true;
                creditsPage1.add(icon);
                textPage1.add(text);
            }
               
            for (i in 0...13) {
                var icon:CreditIcon = new CreditIcon();
                var text:FlxSprite = new FlxSprite();
                switch (i) {
                    case 0:
                        icon = new CreditIcon(55, 100, 'Visummum', 'https://www.youtube.com/channel/UCS8dxyW4AFyR7HvSPob7uFA');
                        text = new FlxSprite(200, 120).loadGraphic(Paths.image('creds/text/creditVis'));
                    case 1:
                        icon = new CreditIcon(55, 235, 'Sley', 'https://twitter.com/SleyGD');
                        text = new FlxSprite(200, 240).loadGraphic(Paths.image('creds/text/creditSley'));  
                    case 2:
                        icon = new CreditIcon(80, 355, 'Crybit', 'https://twitter.com/cry_bit');
                        text = new FlxSprite(200, 370).loadGraphic(Paths.image('creds/text/creditCry'));  
                    case 3:
                        icon = new CreditIcon(480, 100, 'Lav', 'https://twitter.com/OhSoVanilla64');
                        text = new FlxSprite(600, 120).loadGraphic(Paths.image('creds/text/creditLav'));
                    case 4:
                        icon = new CreditIcon(480, 225, 'Niffirg', 'https://twitter.com/n1ffirg');
                        text = new FlxSprite(600, 240).loadGraphic(Paths.image('creds/text/creditNiffirg'));   
                    case 5:
                        icon = new CreditIcon(480, 355, 'Biddle', 'https://twitter.com/Biddy312');
                        text = new FlxSprite(600, 370).loadGraphic(Paths.image('creds/text/creditBiddle'));      
                    case 6:
                        icon = new CreditIcon(885, 100, 'Dami', 'https://twitter.com/DamiNation2020');
                        text = new FlxSprite(1000, 120).loadGraphic(Paths.image('creds/text/creditDami'));
                    case 7:
                        icon = new CreditIcon(870, 225, 'Lillbirb', 'https://twitter.com/bortouii');
                        text = new FlxSprite(1000, 240).loadGraphic(Paths.image('creds/text/creditPooter'));   
                    case 8:
                        icon = new CreditIcon(870, 355, 'Dominus', 'https://twitter.com/Domiinuus');
                        text = new FlxSprite(1000, 370).loadGraphic(Paths.image('creds/text/creditDom'));
                    
                }
                icon.x += FlxG.width * 4;
                text.x += FlxG.width * 4;
                icon.antialiasing = true;
                text.antialiasing = true;
                creditsPage1.add(icon);
                textPage1.add(text);
            }

            for (i in 0...14) {
                var icon:CreditIcon = new CreditIcon();
                var text:FlxSprite = new FlxSprite();
                switch (i) {
                    case 0:
                        icon = new CreditIcon(-520, 0, 'LOL', 'https://twitter.com/500Devs');
                        icon.setGraphicSize(Std.int(icon.width * 0.3));
                    case 1:
                        text = new FlxSprite(665, 375).loadGraphic(Paths.image('creds/text/creditTwitter'));
                        text.setGraphicSize(Std.int(text.width * 0.9));
                    case 2:
                        icon = new CreditIcon(-1200, 100, 'Amor', 'https://twitter.com/AmorAltra');
                        text = new FlxSprite(150, 26).loadGraphic(Paths.image('creds/text/creditPiss'));
                    case 3:
                        icon = new CreditIcon(-1050, 75, 'Scorch', 'https://twitter.com/ScorchVx');
                    case 4:
                        icon = new CreditIcon(-900, 100, 'Krit', 'https://twitter.com/kr1t__');
                    case 5:
                        icon = new CreditIcon(-1200, 215, 'Mels', 'https://twitter.com/melX0exe');
                    case 6:
                        icon = new CreditIcon(-1050, 225, 'Flippy', 'https://twitter.com/FlippyTheReal');
                    case 7:
                        icon = new CreditIcon(-900, 235, 'Retro', 'https://twitter.com/RetroUpgrade'); 
                    case 8:
                        icon = new CreditIcon(-1200, 380, 'Radley', 'https://twitter.com/RadleyMCT'); 
                    case 9:
                        icon = new CreditIcon(-1050, 365, 'Astral', 'https://twitter.com/astr7l'); 
                    case 10:
                        icon = new CreditIcon(-900, 365, 'Kaiza', 'https://twitter.com/lysjbn');
                    case 11:
                        icon = new CreditIcon(-770, 100, 'Maya', 'https://twitter.com/vMayaa_');
                    case 12:
                        icon = new CreditIcon(-770, 245, 'Coms', 'https://twitter.com/Comgamingnz');
                    case 13:
                        icon = new CreditIcon(-770, 350, 'Speedz', 'https://twitter.com/YahBoiSpeedz');
    

                }
                icon.x += FlxG.width * 5;
                text.x += FlxG.width * 5;
                icon.antialiasing = true;
                text.antialiasing = true;
                creditsPage1.add(icon);
                textPage1.add(text);
            }

            FlxTween.tween(FlxG.camera, {zoom: 1.05}, 1.2, {
                ease: FlxEase.cubeOut,
                onComplete: function (twn:FlxTween) {
                    FlxTween.tween(FlxG.camera, {zoom: 1}, 0.2, {
                        ease: FlxEase.quadIn
                    });
                }
            });

            FlxTween.tween(arrowLeft, {x: 200}, 1, {
                ease: FlxEase.quadOut,
                startDelay: 1.2,
            });
    

            FlxTween.tween(creditsText, {y: 500}, 1, {
                ease: FlxEase.quadOut,
                startDelay: 1.3,
            });

            FlxTween.tween(arrowRight, {x: 1000}, 1, {
                ease: FlxEase.quadOut,
                startDelay: 1.4,
            });
    
            for (i in creditsPage1) {
                FlxTween.tween(i, {x: i.x - FlxG.width}, 0.6, {
                    ease: FlxEase.cubeOut,
                });
            }
    
            for (i in textPage1) {
                FlxTween.tween(i, {x: i.x - FlxG.width}, 0.6, {
                    ease: FlxEase.cubeOut,
                });
            }

           new FlxTimer().start(0.6, function(tmr:FlxTimer)
                {
                    for (i in 0...4) {
                        FlxTween.tween(creditsPage1.members[i], {x: creditsPage1.members[i].x - FlxG.width}, 1.4, {
                            ease: FlxEase.cubeOut,
                            //startDelay: 0.6,
                        });
            
                        FlxTween.tween(textPage1.members[i], {x: textPage1.members[i].x - FlxG.width}, 1.4, {
                            ease: FlxEase.cubeOut,
                            //startDelay: 0.6,
                        });
                    }
            
                    for (i in 4...8) {
                        FlxTween.tween(creditsPage1.members[i], {x: creditsPage1.members[i].x - FlxG.width}, 1.4, {
                            ease: FlxEase.cubeOut,
                            startDelay: 0.1,
                        });
            
                        FlxTween.tween(textPage1.members[i], {x: textPage1.members[i].x - FlxG.width}, 1.4, {
                            ease: FlxEase.cubeOut,
                            startDelay: 0.1,
                        });
                    }
                    for (i in 8...37) {
                        FlxTween.tween(creditsPage1.members[i], {x: creditsPage1.members[i].x - FlxG.width}, 1.4, {
                            ease: FlxEase.cubeOut,
                            startDelay: 0.2,
                        });
                    }
                    for (i in 8...42) {
                        FlxTween.tween(textPage1.members[i], {x: textPage1.members[i].x - FlxG.width}, 1.4, {
                            ease: FlxEase.cubeOut,
                            startDelay: 0.2,
                            onComplete: function(twn:FlxTween) {
                                canDoStuff = true;
                            }
                        });
                    }
                });

        }
        override function update(elapsed:Float)
            {
                if (canDoStuff) {
                    if (controls.LEFT_P) {
                        changePage(-1);
                    }
                    if (controls.RIGHT_P) {
                        changePage(1);
                    }
                    if (controls.BACK)
                        outTransition();
                }

                if (controls.BACK)
                    {
                        FlxG.switchState(new MainMenuState());
                    }
                    
                if (controls.RIGHT)
                    arrowRight.scale.set(0.92, 0.92);
                else
                    arrowRight.scale.set(0.95, 0.95);
        
                if (controls.LEFT)
                    arrowLeft.scale.set(0.92, 0.92);
                else
                    arrowLeft.scale.set(0.95, 0.95);
        
                if (FlxG.mouse.overlaps(arrowLeft)) {
                    arrowLeft.scale.set(1, 1);
                    if (FlxG.mouse.pressed)
                        arrowLeft.scale.set(0.92, 0.92);
                    if (FlxG.mouse.justPressed && canDoStuff)
                        changePage(-1);
                } else if (!controls.LEFT)
                    arrowLeft.scale.set(0.95, 0.95);
        
                if (FlxG.mouse.overlaps(arrowRight)) {
                    arrowRight.scale.set(1, 1);
                    if (FlxG.mouse.pressed)
                        arrowRight.scale.set(0.92, 0.92);
                    if (FlxG.mouse.justPressed && canDoStuff)
                        changePage(1);
                } else if (!controls.RIGHT)
                    arrowRight.scale.set(0.95, 0.95);
        
                for (i in creditsPage1) {
                    if (FlxG.mouse.overlaps(i)) {
                        i.scale.set(1.1, 1.1);
                        if (FlxG.mouse.justPressed) {
                            #if linux
                            Sys.command('/usr/bin/xdg-open', [i.link, "&"]);
                            #else
                            FlxG.openURL(i.link);
                            #end
                        }
                    } else {
                        i.scale.set(1, 1);
                    }
                }
            }
 
            function changePage(change:Int = 0):Void {
                canDoStuff = false;
                var prevPage = curPage;
                curPage += change;
                if (curPage < 0) {
                    curPage = 0;
                    canDoStuff = true;
                } else if (curPage > 3) {
                    curPage = 3;
                    canDoStuff = true;
                }
                if (prevPage != curPage) {
                    for (i in creditsPage1) {
                        FlxTween.tween(i, {x: i.x + FlxG.width * -change}, 1, {
                            ease: FlxEase.quadOut,
                        });
                    }
                    for (i in textPage1) {
                        FlxTween.tween(i, {x: i.x + FlxG.width * -change}, 1, {
                            ease: FlxEase.quadOut,
                            onComplete: function (twn:FlxTween) {
                                canDoStuff = true;
                            },
                        });
                    }
                }
            }

            function outTransition():Void {
                canDoStuff = false;
                FlxTween.tween(arrowLeft, {y: 973}, 1, {
                    ease: FlxEase.quadOut,
                });
        
                FlxTween.tween(creditsText, {y: 1005}, 1, {
                    ease: FlxEase.quadOut,
                    startDelay: 0.1,
                });
        
                FlxTween.tween(arrowRight, {y: 973}, 1, {
                    ease: FlxEase.quadOut,
                    startDelay: 0.2,
                });
        
        
                FlxTween.tween(FlxG.camera, {zoom: 0.8}, 0.6, {startDelay: 0.6});
        
                var imFuckingDumb:Int = 0;
                var dumb2:Int = 0;
                var dumb3:Int = 0;
                switch (curPage) {
                    case 0:
                        dumb3 = 24;
                        imFuckingDumb = 12;
                    case 1:
                        dumb3 = 37;
                        dumb2 = 12;
                        imFuckingDumb = 24;
                    case 2:
                        dumb2 = 24;
                        imFuckingDumb = 37;
                }
                //sorry :(
                for (i in creditsPage1)
                    i.alpha = 0;
                for (i in textPage1)
                    i.alpha = 0;
                if (curPage == 3) {
                    for (i in 37...42) {
                        textPage1.members[i].alpha = 1;
        
                        FlxTween.tween(textPage1.members[i], {x: textPage1.members[i].x - FlxG.width * 1.5}, 1.4, {
                            ease: FlxEase.cubeOut,
                            startDelay: 0.4,
                        });
                    }
                } else {
                    for (i in (4 * curPage)...imFuckingDumb) {
                        creditsPage1.members[i].alpha = 1;
                        textPage1.members[i].alpha = 1;
                        FlxTween.tween(creditsPage1.members[i], {x: creditsPage1.members[i].x - FlxG.width * 1.5}, 1.4, {
                            ease: FlxEase.cubeOut,
                            startDelay: 0.4,
                        });
        
                        FlxTween.tween(textPage1.members[i], {x: textPage1.members[i].x - FlxG.width * 1.5}, 1.4, {
                            ease: FlxEase.cubeOut,
                            startDelay: 0.4,
                        });
                    }
                }
                /*if (curPage > 0) {
                    for (i in (4 * (curPage - 1))...dumb2) {
                        creditsPage1.members[i].visible = false;
                        textPage1.members[i].visible = false;
                    }
                }
                if (curPage < 2) {
                    for (i in (4 * (curPage + 1))...dumb3) {
                        creditsPage1.members[i].visible = false;
                        textPage1.members[i].visible = false;
                    }
                }*/
            }
            override function beatHit()
            {
                super.beatHit();
                
            }
        }