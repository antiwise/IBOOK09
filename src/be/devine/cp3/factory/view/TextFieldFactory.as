package be.devine.cp3.factory.view
{


    import starling.text.TextField;
    import starling.utils.HAlign;
    import starling.utils.VAlign;

    public class TextFieldFactory
    {
        public static function createTextField(config:Object):TextField
        {
            switch (config.fontFormat)
            {
                case "h1":
                    var starlingTextFieldh1:starling.text.TextField = new starling.text.TextField
                            (460,50,config.text,"Helvetica-bold",41,0x182C49,false);

                    starlingTextFieldh1.hAlign = HAlign.LEFT;
                    starlingTextFieldh1.vAlign = VAlign.TOP;
                    starlingTextFieldh1.width = 460;
                    starlingTextFieldh1.height = starlingTextFieldh1.textBounds.height + 30;
                        trace(starlingTextFieldh1.textBounds.height)
                    return(starlingTextFieldh1);

                case "h2":
                    var starlingTextFieldh2:starling.text.TextField = new starling.text.TextField
                            (210,100,config.text,"Helvetica-bold",30,0xdd464e,false);
                    starlingTextFieldh2.hAlign = HAlign.LEFT;
                    starlingTextFieldh2.vAlign = VAlign.TOP;
                        trace(starlingTextFieldh2.textBounds )
                    starlingTextFieldh2.height = starlingTextFieldh2.textBounds.height + 20;

                    return(starlingTextFieldh2);

                case "h3":
                    var starlingTextFieldh3:starling.text.TextField = new starling.text.TextField
                            (480,50,config.text,"Bitter-Bold",20,0x182c49,false);
                    starlingTextFieldh3.hAlign = HAlign.LEFT;
                    starlingTextFieldh3.vAlign = VAlign.TOP;
                    starlingTextFieldh3.height = starlingTextFieldh3.textBounds.height +20;
                    return(starlingTextFieldh3);

                case "p-italic":
                    var starlingTextFieldh3:starling.text.TextField = new starling.text.TextField
                            (210,50,config.text,"Bitter-Italic",13,0x182c49,false);
                    starlingTextFieldh3.hAlign = HAlign.LEFT;
                    starlingTextFieldh3.vAlign = VAlign.TOP;
                    starlingTextFieldh3.height = starlingTextFieldh3.textBounds.height + 20;
                    return(starlingTextFieldh3);

                case "p-normal":
                    var starlingTextFieldh3:starling.text.TextField = new starling.text.TextField
                            (210,50,config.text,"Bitter-Bold",13,0x182c49,false);
                    starlingTextFieldh3.hAlign = HAlign.LEFT;
                    starlingTextFieldh3.vAlign = VAlign.TOP;
                    starlingTextFieldh3.height = starlingTextFieldh3.textBounds.height + 20;
                    return(starlingTextFieldh3);
            }

        return null;
        }
    }
}
