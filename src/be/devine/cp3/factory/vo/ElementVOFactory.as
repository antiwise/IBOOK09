package be.devine.cp3.factory.vo
{
import be.devine.cp3.vo.ImageElementVO;

public class ElementVOFactory
    {
        public static function createElementVOFromXML(elementXML:XML)
        {
            //trace(elementXML.@type);

            switch("" + elementXML.@type)
            {
                case "image":
                    createImageElementVO(elementXML);
                    break;

            }
        }

        public static function createImageElementVO(elementXML:XML)
        {
            var elementVO:ImageElementVO = new ImageElementVO();
           // elementVO.url = elementXML.url
            //elementVO.
        }

    //TODO: createTextElementVO type + tekst meegeven
    //  var textElementVO:TextElementVO = new TextElementVO();
        // textElementVO.text = elementXML.text()
    }
}
