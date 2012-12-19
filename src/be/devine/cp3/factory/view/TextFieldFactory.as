package be.devine.cp3.factory.view
{
import starling.display.Quad;
import starling.display.Sprite;
import starling.text.TextField;
import starling.utils.HAlign;
import starling.utils.VAlign;

    public class TextFieldFactory
    {
        public static function createTextField(config:Object):Sprite
        {
            switch (config.fontFormat)
            {
                case "h1":
                    var containerh1:Sprite = setTextfieldSettings(460,100,config.text,"Helvetica",35,0x182C49,false);
                    var qh1:Quad = new Quad( 100,  6, 0x182C49);
                    qh1.y = containerh1.height ;
                    containerh1.addChild(qh1);
                    return(containerh1);

                case "h1-white":
                    var containerh1white:Sprite = setTextfieldSettings(512,100,config.text,"Helvetica",60,0xFFFFFF,false);
                    var qh1White:Quad = new Quad( 100,  6, 0xFFFFFF);
                    qh1White.y = containerh1white.height ;
                    containerh1white.addChild(qh1White);
                    return(containerh1white);

                case "h2":
                    var containerh2:starling.display.Sprite = setTextfieldSettings(210,100,config.text,"Helvetica",25,0xdd464e,false);
                    return(containerh2);

                case "h3":
                    var containerh3:starling.display.Sprite = setTextfieldSettings(210,50,config.text,"Bitter-Bold",20,0x182c49,false);
                    return(containerh3);

                case "p-italic":
                    var containerpItalic:starling.display.Sprite =  setTextfieldSettings  (210,50,config.text,"Bitter-Italic",13,0x182c49,false);
                    return(containerpItalic);

                case "p-normal":
                    var containerPnormal:starling.display.Sprite = setTextfieldSettings(210,50,config.text,"Bitter-Bold",13,0x182c49,false);
                    return(containerPnormal);

                case "p-normal-white":
                    var containerPWhite:starling.display.Sprite = setTextfieldSettings(210,50,config.text,"Bitter-Bold",11,0xFFFFFF,false);
                    return(containerPWhite);
            }

            return null;
        }

        public static function setTextfieldSettings(width:uint, height:uint, text:String, font:String, size:uint, color:Number,fontstyle:Boolean ):Sprite{

            var container:starling.display.Sprite = new Sprite();

            var starlingTextField:starling.text.TextField = new starling.text.TextField
                    (width, height, text, font, size,  color,  fontstyle);
            starlingTextField.hAlign = HAlign.LEFT;
            starlingTextField.vAlign = VAlign.TOP;
            starlingTextField.height = starlingTextField.textBounds.height + 10;

            container.addChild(starlingTextField);

            return(container);

        }
    }
}
