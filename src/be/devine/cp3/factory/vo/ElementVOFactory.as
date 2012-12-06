package be.devine.cp3.factory.vo
{
import be.devine.cp3.vo.ElementVO;
import be.devine.cp3.vo.ImageElementVO;
import be.devine.cp3.vo.TextElementVO;

    public class ElementVOFactory
        {
            public static function createElementVOFromXML(elementXML:XML):ElementVO
            {
                switch("" + elementXML.@type)
                {
                    case "text": return createTextElementVO(elementXML);
                    case "image": return createImageElementVO(elementXML);
                }
                return null;
            }

            public static function createImageElementVO(elementXML:XML):ImageElementVO
            {
                trace("[ELEMENTVOFACTORY] create imageElementVO");
                var imageElementVO:ImageElementVO = new ImageElementVO();
                imageElementVO.type = "image";
                imageElementVO.style = elementXML.@style;
                imageElementVO.url = elementXML.text();

                return imageElementVO;
            }

            public static function createTextElementVO(elementXML:XML):TextElementVO
            {
                trace("[ELEMENTVOFACTORY] create textElementVO");
                var textElementVO:TextElementVO = new TextElementVO();
                textElementVO.type = "text";
                textElementVO.text = elementXML.text();
                textElementVO.textType = elementXML.@size;

                return textElementVO;
            }

        }
}
