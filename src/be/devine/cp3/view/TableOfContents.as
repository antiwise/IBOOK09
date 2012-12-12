/**
 * Created with IntelliJ IDEA.
 * User: Ducaluk
 * Date: 12/12/12
 * Time: 07:28
 * To change this template use File | Settings | File Templates.
 */
package be.devine.cp3.view
{
import be.devine.cp3.factory.view.TextFieldFactory;
import be.devine.cp3.model.AppModel;
import be.devine.cp3.vo.ColumnElementVO;
import be.devine.cp3.vo.ElementVO;
import be.devine.cp3.vo.PageVO;
import be.devine.cp3.vo.TextElementVO;

import flashx.textLayout.elements.TabElement;

import starling.display.Sprite;

public class TableOfContents extends Sprite
    {
        private var _appModel:AppModel,
                    arrH1:Array,
                    arrH2:Array,
                    arrH3:Array;

        public function TableOfContents()
        {
            _appModel = AppModel.getInstance();
            arrH1 = new Array();
            arrH2 = new Array();
            arrH3 = new Array();

            for each(var pageVO:PageVO in _appModel.pageVOS)
            {
                for each(var elementVO:ElementVO in pageVO.elements)
                {

                    if(elementVO.type == "column")
                    {
                        var columnVO:ColumnElementVO = elementVO as ColumnElementVO;

                        for each(var textElementVO:TextElementVO in columnVO.textElements)
                        {
                            switch (textElementVO.textType)
                            {
                                case "h1":
                                    arrH1.push(textElementVO.text);
                                    break;
                                case "h2":
                                    arrH2.push(textElementVO.text);
                                    break;
                                case "h3":
                                    arrH3.push(textElementVO.text);
                                    break;
                            }
                        }
                    }
                }
            }
            for each(var texti:TextElementVO in arrH1)
            {
                /*trace(tex);
                var tex:TextElement = new TextElement(texti);
                addChild(tex); */
                //addChild(TextFieldFactory.createTextField({}))
            }
        }
}
}







