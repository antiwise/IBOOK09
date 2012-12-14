package
{

    import be.devine.cp3.ibook.IBook;

import flash.desktop.NativeApplication;

import flash.display.Screen;
import flash.display.Sprite;
import flash.display.StageAlign;
import flash.display.StageScaleMode;
import flash.events.TimerEvent;
import flash.text.Font;
import flash.text.TextField;
import flash.text.TextFieldAutoSize;
import flash.text.TextFormat;
import flash.utils.Timer;
import flash.utils.setInterval;


import starling.core.Starling;
import starling.display.Image;
import starling.textures.Texture;
import starling.textures.TextureAtlas;

    [SWF(frameRate=60,  backgroundColor="#dd464e", width="1024", height="768")]

    public class Main extends Sprite
    {
        [Embed(source='assets/fonts/Bitter-Bold/Bitter-Bold.ttf', fontName="Bitter-Bold", mimeType="application/x-font-truetype", embedAsCFF=false)]
        private static const BitterBold:Class;
        [Embed(source='assets/fonts/Bitter-Italic/Bitter-Italic.ttf', fontName="Bitter-Italic", mimeType="application/x-font-truetype", embedAsCFF=false)]
        private static const BitterItalic:Class;

        private var _iBook:IBook,
               helveticaNeueContainer:HelveticaNeueContainer,
                _starling:Starling,
               preloader:Preloader,
                myDelay:Timer;

        public function Main()
        {
            stage.align = StageAlign.TOP_LEFT;
            stage.scaleMode = StageScaleMode.NO_SCALE;

            preloader = new Preloader();

            var fonts:Array = Font.enumerateFonts();
            for each(var f:Font in fonts)
            {
                trace(f.fontName, f.fontStyle, f.fontType);
            }

            stage.nativeWindow.visible = true;
            stage.nativeWindow.width = 1024;
            stage.nativeWindow.height = 768;
            stage.nativeWindow.title = "Dot Magazine";

            stage.nativeWindow.x = (Screen.mainScreen.bounds.width - 1024)*0.5;
            stage.nativeWindow.y = (Screen.mainScreen.bounds.height - 768)*0.5;

            _starling = new Starling(IBook,stage);

            //myDelay = new Timer(7500);
            myDelay = new Timer(1);
            myDelay.addEventListener(TimerEvent.TIMER, startStarling);
            myDelay.start();

            addChild(preloader);
        }

        private function startStarling(event:TimerEvent):void
        {
            removeChild(preloader);
            myDelay.removeEventListener(TimerEvent.TIMER, startStarling);
            _starling.start();
        }
    }
}
