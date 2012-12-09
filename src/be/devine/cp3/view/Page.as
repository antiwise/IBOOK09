package be.devine.cp3.view
{
    import be.devine.cp3.factory.view.TextFieldFactory;
    import be.devine.cp3.model.AppModel;
import be.devine.cp3.vo.ColumnElementVO;
import be.devine.cp3.vo.ElementVO;
    import be.devine.cp3.vo.ImageElementVO;
    import be.devine.cp3.vo.PageVO;
    import be.devine.cp3.vo.TextElementVO;
    import flash.display.Loader;
    import starling.display.Sprite;
    import starling.text.TextField;

    public class Page extends Sprite
    {
        private var appModel:AppModel,
                    _pageVO:PageVO;

        public function Page(pageVO:PageVO)
        {

            this._pageVO = pageVO;

            appModel = AppModel.getInstance();


            var yPos:int = 0;

            for each(var elementVO:ElementVO in pageVO.elements)
            {
                var element:Element;
                var updatePositions:Boolean = true;

                switch(elementVO.type)
                {
                    case "image":
                        element = createImage(elementVO as ImageElementVO);
                        break;
                    case "text":
                        element = createText(elementVO as TextElementVO);
                        break;

                    case "column":
                        var vo:ColumnElementVO = elementVO as ColumnElementVO;
                        element =  createColumn(vo);
                        updatePositions = (vo.position !== "left");
                        break;
                }

                addChild(element);
                element.y = element.y + yPos;


                if (updatePositions) {
                    yPos = element.y + element.height;

                }
            }
        }

        private static function createColumn(columnElementVO:ColumnElementVO):Element {
            var columnElement:ColumnElement = new ColumnElement(columnElementVO);
            if(columnElementVO.position == "left"){
                columnElement.x = 25;
                columnElement.y = 20;
            }
            if(columnElementVO.position == "right"){
                columnElement.x = 275;
                columnElement.y = 20;
            }
            return columnElement;

        }

        private function createImage(imageElementVO:ImageElementVO):ImageElement
        {


            var imageElement:ImageElement = new ImageElement(imageElementVO);

            switch (_pageVO.template){

                case 1:
                    imageElement.x = 0;
                    imageElement.y = 0;
                    break;
                case 2:
                    break;
                case 3:
                    imageElement.x = 25;
                    imageElement.y = 25;
                    break;
                case 4:
                    imageElement.x = 25;
                    imageElement.y = 25;
                    break;
                case 5:
                    imageElement.y = 25;
                    imageElement.x = 25;
                    break;
                case 6:
                    if (imageElementVO.style == "portrait"){
                        imageElement.x = 25;
                        imageElement.y = 25;
                    }
                    if (imageElementVO.style == "wide"){
                        imageElement.x = 25;
                        imageElement.y = 20;
                    }
                    break;
                case 7:
                    imageElement.x = 25;
                    imageElement.y = 25;
                    break;

            }

            return imageElement;
        }

        private function createText(textElementVO:TextElementVO):TextElement
        {
            var textElement:TextElement = new TextElement(textElementVO);
            switch (_pageVO.template){

                case 2:
                    if (textElementVO.textType == "h1")
                    {
                        textElement.x = 25;
                    }
                    if (textElementVO.textType == "h2")
                    {
                        textElement.x = 25;
                        textElement.y = 20;
                    }

                    break;
                case 3:
                    if (textElementVO.textType == "h1")
                    {
                        textElement.x = 25;
                        textElement.y = 270;
                    }

                    break;
                case 4:
                    if (textElementVO.textType == "h1")
                    {
                        textElement.x = 25;
                        textElement.y = 270;
                    }
                    break;
                case 5:
                    break;
                case 6:
                    break;
                case 7:
                    if (textElementVO.textType == "h1")
                    {
                        textElement.x = 25;
                    }
                    break;
                case 8:
                    break;
            }


            return textElement;
        }
    }
}
