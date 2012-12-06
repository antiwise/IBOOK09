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
                    var container:starling.display.Sprite = new Sprite();
                    var starlingTextFieldh1:starling.text.TextField = new starling.text.TextField
                            (460,100,config.text,"Helvetica-bold",41,0x182C49,false);

                    starlingTextFieldh1.hAlign = HAlign.LEFT;
                    starlingTextFieldh1.vAlign = VAlign.TOP;
                    starlingTextFieldh1.width = 460;
                    starlingTextFieldh1.height = starlingTextFieldh1.textBounds.height + 10;
                    var q:Quad = new Quad( 100,  8, 0x182C49)
                        q.y = starlingTextFieldh1.height ;


                    container.addChild(starlingTextFieldh1);
                    container.addChild(q);

                    return(container);

                case "h2":
                    var container:starling.display.Sprite = new Sprite();
                    var starlingTextFieldh2:starling.text.TextField = new starling.text.TextField
                            (210,100,config.text,"Helvetica-bold",30,0xdd464e,false);
                    starlingTextFieldh2.hAlign = HAlign.LEFT;
                    starlingTextFieldh2.vAlign = VAlign.TOP;

                    starlingTextFieldh2.height = starlingTextFieldh2.textBounds.height + 20;
                    container.addChild(starlingTextFieldh2);
                    return(container);

                case "h3":
                    var container:starling.display.Sprite = new Sprite();
                    var starlingTextFieldh3:starling.text.TextField = new starling.text.TextField
                            (210,50,config.text,"Bitter-Bold",20,0x182c49,false);
                    starlingTextFieldh3.hAlign = HAlign.LEFT;
                    starlingTextFieldh3.vAlign = VAlign.TOP;
                    starlingTextFieldh3.height = starlingTextFieldh3.textBounds.height +20;
                    container.addChild(starlingTextFieldh3);
                    return(container);

                case "p-italic":
                    var container:starling.display.Sprite = new Sprite();
                    var starlingTextFieldpItalic:starling.text.TextField = new starling.text.TextField
                            (210,50,config.text,"Bitter-Italic",13,0x182c49,false);
                    starlingTextFieldpItalic.hAlign = HAlign.LEFT;
                    starlingTextFieldpItalic.vAlign = VAlign.TOP;
                    starlingTextFieldpItalic.height = starlingTextFieldpItalic.textBounds.height + 20;
                    container.addChild(starlingTextFieldpItalic);
                    return(container);

                case "p-normal":
                    var container:starling.display.Sprite = new Sprite();
                    var starlingTextFieldPnormal:starling.text.TextField = new starling.text.TextField
                            (210,50,config.text,"Bitter-Bold",13,0x182c49,false);
                    starlingTextFieldPnormal.hAlign = HAlign.LEFT;
                    starlingTextFieldPnormal.vAlign = VAlign.TOP;
                    starlingTextFieldPnormal.height = starlingTextFieldPnormal.textBounds.height + 20;
                    container.addChild(starlingTextFieldPnormal);
                    return(container);
            }

        return null;
        }
    }
}
