/**
 * Created with IntelliJ IDEA.
 * User: TatsBookPro
 * Date: 14/12/12
 * Time: 08:59
 * To change this template use File | Settings | File Templates.
 */
package be.devine.cp3.view {
import be.devine.cp3.model.AppModel;
import be.devine.cp3.vo.BookVO;
import be.devine.cp3.vo.ImageElementVO;
import be.devine.cp3.vo.TextElementVO;

import starling.display.Quad;
import starling.display.Sprite;
import starling.textures.Texture;
import starling.textures.TextureAtlas;

public class Book extends Sprite{
    [Embed(source="/assets/xml/sprite.xml", mimeType="application/octet-stream")]
    public static const ButtonXml:Class;

    [Embed(source="/assets/images/sprite.png")]
    public static const ButtonTexture:Class;


    private var appModel:AppModel,
                readMe:Button,
            readMoreBackground:Quad;
    public var  bookVo:BookVO;

    public function Book(bookVo:BookVO) {
        this.bookVo = bookVo;
        appModel = AppModel.getInstance();



        var texture:Texture = Texture.fromBitmap(new ButtonTexture);
        var xml:XML = XML(new ButtonXml());
        var textureAtlas:TextureAtlas = new TextureAtlas(texture, xml);

        readMoreBackground = new Quad(230, 40, 0xdd464e);
        readMe = new Button(textureAtlas,"readme.png");
        addChild(readMoreBackground);
        addChild(readMe);



        var titleTextElementVO:TextElementVO = new TextElementVO();
        titleTextElementVO.text = bookVo.title;
        titleTextElementVO.textType = "h1-white";


        var title:TextElement = new TextElement(titleTextElementVO);
        addChild(title);


        var datumTextElementVO:TextElementVO = new TextElementVO();
        datumTextElementVO.text = bookVo.date;
        datumTextElementVO.textType = "p-normal-white";

        var datum:TextElement = new TextElement(datumTextElementVO);
        addChild(datum);

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
        title.x = readMoreBackground.x =  datum.x = description.x  = 380;
        title.y = 25;

        datum.y = title.y + title.height + 10;
        datum.x = 380;
        description.y = datum.y + datum.height + 20;
        readMoreBackground.y = description.y + description.height + 40;
        readMe.y = readMoreBackground.y + 10;
        readMe.x = 400;

        //TODO: hover effect op knop?





    }


}
}
