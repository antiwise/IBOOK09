package
{

import be.devine.cp3.model.AppModel;

import flash.display.Sprite;
    import flash.text.TextField;

    public class IBOOK09 extends Sprite
    {
        private var _appModel:AppModel;

        public function IBOOK09()
        {
            var textField:TextField = new TextField();
            textField.text = "Hello, World";
            addChild(textField);

            _appModel = new AppModel();

        }
    }
}
