/**
 * Created with IntelliJ IDEA.
 * User: TatsBookPro
 * Date: 14/12/12
 * Time: 08:59
 * To change this template use File | Settings | File Templates.
 */
package be.devine.cp3.view {
import be.devine.cp3.factory.view.TextFieldFactory;
import be.devine.cp3.model.AppModel;
import be.devine.cp3.vo.BookVO;


import starling.display.Sprite;

public class Book extends Sprite{

    private var appModel:AppModel;
    public var  bookVo:BookVO;

    public function Book(bookVo:BookVO) {
        this.bookVo = bookVo;
        appModel = AppModel.getInstance();

        var title:starling.display.Sprite = TextFieldFactory.createTextField({
            text: bookVo.title,
            fontFormat: "h1"
        });

        addChild(title);

        trace ("book");
    }
}
}
