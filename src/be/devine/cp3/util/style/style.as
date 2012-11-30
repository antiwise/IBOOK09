/**
 * Created with IntelliJ IDEA.
 * User: Ducaluk
 * Date: 30/11/12
 * Time: 12:03
 * To change this template use File | Settings | File Templates.
 */
package be.devine.cp3.util.style {
import starling.text.TextField;
import starling.utils.HAlign;
import starling.utils.VAlign;

public class Style
{
    public function Style()
    {}

    public static function makeTextfield(text:String,style:String):TextField
    {
        var starlingTextField:starling.text.TextField;
        switch(style)
        {
            case "h1":
                starlingTextField = new starling.text.TextField(480,50,text,"Bitter-Bold",41,0x182C49,false);
                break;
        }

        starlingTextField.hAlign = HAlign.LEFT;
        starlingTextField.vAlign = VAlign.TOP;
        return starlingTextField;

    }
}
}
