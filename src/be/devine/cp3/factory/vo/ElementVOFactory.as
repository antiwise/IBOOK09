package be.devine.cp3.factory.vo
{
import be.devine.cp3.vo.ColumnElementVO;
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
                case "column": return createColumnElementVO(elementXML);
            }
            return null;
        }

        public static function createColumnElementVO(elementXML:XML):ColumnElementVO
        {
            var columnElementVO:ColumnElementVO = new ColumnElementVO();
            columnElementVO.position = elementXML.@position;
            columnElementVO.type = "column";

            for each (var xml:XML in elementXML.element)
            {
                columnElementVO.textElements.push(createTextElementVO(xml));
            }

            return columnElementVO;
        }

        public static function createImageElementVO(elementXML:XML):ImageElementVO
        {
            var imageElementVO:ImageElementVO = new ImageElementVO();
            imageElementVO.type = "image";
            imageElementVO.style = elementXML.@style;
            imageElementVO.url = elementXML.text();

            return imageElementVO;
        }

        public static function createTextElementVO(elementXML:XML):TextElementVO
        {
            var textElementVO:TextElementVO = new TextElementVO();
            textElementVO.type = "text";
            textElementVO.text = elementXML.text();
            textElementVO.textType = elementXML.@textType;

            return textElementVO;
        }
    }
}
