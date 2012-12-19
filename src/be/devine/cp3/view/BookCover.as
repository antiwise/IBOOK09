/**
 * Created with IntelliJ IDEA.
 * User: TatsBookPro
 * Date: 18/12/12
 * Time: 13:22
 * To change this template use File | Settings | File Templates.
 */
package be.devine.cp3.view {
import be.devine.cp3.model.AppModel;
import be.devine.cp3.vo.BookVO;
import be.devine.cp3.vo.ImageElementVO;

import starling.display.Sprite;

public class BookCover extends Sprite{

    private var thumbnail:Page,
            _bookVO:BookVO,
            appModel:AppModel;

    public function BookCover(bookVo:BookVO)
    {
        _bookVO = bookVo;
        this.appModel = AppModel.getInstance();

        var imageElementVO:ImageElementVO = new ImageElementVO();
        imageElementVO.style = "cover";
        imageElementVO.url = bookVo.cover;

        var cover:ImageElement = new ImageElement(imageElementVO);
        addChild(cover);
        cover.scaleX = cover.scaleY = .5;


        this.useHandCursor = true;

    }

    public function get bookVO():BookVO {
        return _bookVO;
    }

    public function set bookVO(value:BookVO):void {
        _bookVO = value;
    }


}
}
