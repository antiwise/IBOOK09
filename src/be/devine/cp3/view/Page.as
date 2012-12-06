package be.devine.cp3.view
{
    import be.devine.cp3.factory.view.TextFieldFactory;
    import be.devine.cp3.model.AppModel;
    import be.devine.cp3.vo.ElementVO;
    import be.devine.cp3.vo.ImageElementVO;
    import be.devine.cp3.vo.PageVO;
    import be.devine.cp3.vo.TextElementVO;
    import flash.display.Loader;
    import starling.display.Sprite;
    import starling.text.TextField;

    public class Page extends Sprite
    {
        private var _appModel:AppModel;
        private var _imageLoader:Loader;
        private var _imageLoader2:Loader;

        public function Page(pageVO:PageVO)
        {
            _appModel = AppModel.getInstance();

            for each(var element:ElementVO in pageVO.elements)
            {
                switch(element.type)
                {
                    case "image":
                        createImage(element as ImageElementVO);
                        break;
                    case "text":
                        createText(element as TextElementVO);
                        break;
                }
            }
        }

        private function createImage(imageElementVO:ImageElementVO)
        {
            var imageElement:ImageElement = new ImageElement(imageElementVO);

            // deze positie moet nog aangepast worden afhankelijk van de template
            addChild(imageElement);
        }

        private function createText(textElementVO:TextElementVO)
        {
            var textElement:TextElement = new TextElement(textElementVO);

            // deze positie moet nog aangepast worden afhankelijk van de template
            addChild(textElement);
        }
    }
}
