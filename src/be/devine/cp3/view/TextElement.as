package be.devine.cp3.view
{
    import be.devine.cp3.factory.view.TextFieldFactory;
    import be.devine.cp3.vo.TextElementVO;

    import starling.text.TextField;

    public class TextElement extends Element
    {
        public function TextElement(textElementVO:TextElementVO)
        {
            super(textElementVO);
            var textField:TextField = TextFieldFactory.createTextField({
                text: textElementVO.text,
                fontFormat: textElementVO.textType
            });
            addChild(textField);
        }
    }
}
