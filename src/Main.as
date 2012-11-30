package
{

    import be.devine.cp3.ibook.IBook;
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

            _starling = new Starling(IBook,stage);
            _starling.start();
        }
    }
}
