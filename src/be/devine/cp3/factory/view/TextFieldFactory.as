/**
 * Created with IntelliJ IDEA.
 * User: TatsBookPro
 * Date: 3/12/12
 * Time: 11:56
 * To change this template use File | Settings | File Templates.
 */
package be.devine.cp3.factory.view
{
import starling.text.TextField;
import starling.utils.HAlign;
import starling.utils.VAlign;

public class TextFieldFactory
{
    public static function createTextField(config:Object):TextField
    {
        var starlingTextField:starling.text.TextField = new starling.text.TextField
                (480,50,config.text,config.fontName,config.size,config.color,false);
        starlingTextField.hAlign = HAlign.LEFT;
        starlingTextField.vAlign = VAlign.TOP;
        return(starlingTextField);
    }
}
}
