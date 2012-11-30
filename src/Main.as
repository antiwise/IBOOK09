package
{

    import be.devine.cp3.ibook.IBook;

import flash.display.Screen;
import flash.display.Sprite;
    import flash.display.StageAlign;
    import flash.display.StageScaleMode;
    import starling.core.Starling;

    [SWF(frameRate=60)]


    public class Main extends Sprite
    {
        private var _iBook:IBook;

        private var _starling:Starling

        public function Main()
        {
            stage.align = StageAlign.TOP_LEFT;
            stage.scaleMode = StageScaleMode.NO_SCALE;

            stage.nativeWindow.visible = true;
            stage.nativeWindow.width = 1024;
            stage.nativeWindow.height = 768;
            stage.nativeWindow.title = "Dot Magazine";

            stage.nativeWindow.x = (Screen.mainScreen.bounds.width - 1024)*0.5;
            stage.nativeWindow.y = (Screen.mainScreen.bounds.height - 768)*0.5;

            _starling = new Starling(IBook,stage);
            _starling.start();
        }
    }
}
