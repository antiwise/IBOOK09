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
                    var containerh1:starling.display.Sprite = new Sprite();
                    var starlingTextFieldh1:starling.text.TextField = new starling.text.TextField
                            (460,100,config.text,"Helvetica-bold",35,0x182C49,false);

                    starlingTextFieldh1.hAlign = HAlign.LEFT;
                    starlingTextFieldh1.vAlign = VAlign.TOP;
                    starlingTextFieldh1.width = 460;
                    starlingTextFieldh1.height = starlingTextFieldh1.textBounds.height + 10;
                    var q:Quad = new Quad( 100,  6, 0x182C49)
                        q.y = starlingTextFieldh1.height ;


                    containerh1.addChild(starlingTextFieldh1);
                    containerh1.addChild(q);

                    return(containerh1);

                case "h2":
                    var containerh2:starling.display.Sprite = new Sprite();
                    var starlingTextFieldh2:starling.text.TextField = new starling.text.TextField
                            (210,100,config.text,"Helvetica-bold",25,0xdd464e,false);
                    starlingTextFieldh2.hAlign = HAlign.LEFT;
                    starlingTextFieldh2.vAlign = VAlign.TOP;

                    starlingTextFieldh2.height = starlingTextFieldh2.textBounds.height + 20;
                    containerh2.addChild(starlingTextFieldh2);
                    return(containerh2);

                case "h3":
                    var containerh3:starling.display.Sprite = new Sprite();
                    var starlingTextFieldh3:starling.text.TextField = new starling.text.TextField
                            (210,50,config.text,"Bitter-Bold",20,0x182c49,false);
                    starlingTextFieldh3.hAlign = HAlign.LEFT;
                    starlingTextFieldh3.vAlign = VAlign.TOP;
                    starlingTextFieldh3.height = starlingTextFieldh3.textBounds.height +20;
                    containerh3.addChild(starlingTextFieldh3);
                    return(containerh3);

                case "p-italic":
                    var containerpItalic:starling.display.Sprite = new Sprite();
                    var starlingTextFieldpItalic:starling.text.TextField = new starling.text.TextField
                            (210,50,config.text,"Bitter-Italic",13,0x182c49,false);
                    starlingTextFieldpItalic.hAlign = HAlign.LEFT;
                    starlingTextFieldpItalic.vAlign = VAlign.TOP;
                    starlingTextFieldpItalic.height = starlingTextFieldpItalic.textBounds.height + 20;
                    containerpItalic.addChild(starlingTextFieldpItalic);
                    return(containerpItalic);

                case "p-normal":
                var containerPnormal:starling.display.Sprite = new Sprite();
                var starlingTextFieldPnormal:starling.text.TextField = new starling.text.TextField
                        (210,50,config.text,"Bitter-Bold",13,0x182c49,false);
                starlingTextFieldPnormal.hAlign = HAlign.LEFT;
                starlingTextFieldPnormal.vAlign = VAlign.TOP;
                starlingTextFieldPnormal.height = starlingTextFieldPnormal.textBounds.height + 20;
                    containerPnormal.addChild(starlingTextFieldPnormal);
                return(containerPnormal);

                case "p-normal-white":
                    var containerPWhite:starling.display.Sprite = new Sprite();
                    var starlingTextFieldPnormal:starling.text.TextField = new starling.text.TextField
                            (210,50,config.text,"Bitter-Bold",11,0xFFFFFF,false);
                    starlingTextFieldPnormal.hAlign = HAlign.LEFT;
                    starlingTextFieldPnormal.vAlign = VAlign.TOP;
                    starlingTextFieldPnormal.height = starlingTextFieldPnormal.textBounds.height + 20;
                    containerPWhite.addChild(starlingTextFieldPnormal);
                    return(containerPWhite);
            }

        return null;
        }
    }
}
