package be.devine.cp3.view
{
import be.devine.cp3.vo.ElementVO;
    import starling.display.Sprite;

    public class Element extends Sprite
    {
        protected var _elementVO:ElementVO;

        public function Element(elementVO:ElementVO)
        {
            _elementVO = elementVO;
        }
    }
}