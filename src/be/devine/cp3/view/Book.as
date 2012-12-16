/**
 * Created with IntelliJ IDEA.
 * User: TatsBookPro
 * Date: 14/12/12
 * Time: 08:59
 * To change this template use File | Settings | File Templates.
 */
package be.devine.cp3.view {
import be.devine.cp3.factory.view.ImageFactory;
import be.devine.cp3.factory.view.TextFieldFactory;
import be.devine.cp3.model.AppModel;
import be.devine.cp3.vo.BookVO;
import be.devine.cp3.vo.ImageElementVO;
import be.devine.cp3.vo.TextElementVO;

import starling.display.Quad;


import starling.display.Sprite;

public class Book extends Sprite{

    private var appModel:AppModel;
    public var  bookVo:BookVO;

    public function Book(bookVo:BookVO) {
        this.bookVo = bookVo;
        appModel = AppModel.getInstance();





        var titleTextElementVO:TextElementVO = new TextElementVO();
        titleTextElementVO.text = bookVo.title;
        titleTextElementVO.textType = "h1-white";

        var title:TextElement = new TextElement(titleTextElementVO);
        addChild(title);
        trace( bookVo.title);

        var descriptionTextElementVO:TextElementVO = new TextElementVO();
        descriptionTextElementVO.text = bookVo.description;
        descriptionTextElementVO.textType = "p-normal-white";

        var description:TextElement = new TextElement(descriptionTextElementVO);
        addChild(description);

        var imageElementVO:ImageElementVO = new ImageElementVO();
        imageElementVO.style = "cover";
        imageElementVO.url = bookVo.cover;

        var cover:ImageElement = new ImageElement(imageElementVO);
        addChild(cover);
        cover.x = 25;
        cover.y = 25;
        title.x = 300;
        description.x = 300;
        description.y = title.y + title.height + 20;




    }
}
}
