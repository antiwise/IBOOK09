package be.devine.cp3.view
{
import be.devine.cp3.vo.ColumnElementVO;
import be.devine.cp3.vo.TextElementVO;

    public class ColumnElement extends Element
    {
        public function ColumnElement(columnElementVO:ColumnElementVO)
        {
            super(columnElementVO);

            var yPos:uint = 0;
            for each (var textElementVO:TextElementVO in columnElementVO.textElements)
            {
                var textElement:TextElement = new TextElement(textElementVO);
                textElement.y = yPos;
                addChild(textElement);
                yPos += textElement.height;
            }
        }
    }
}
