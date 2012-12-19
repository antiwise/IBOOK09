package be.devine.cp3.view
{
import be.devine.cp3.model.AppModel;
import be.devine.cp3.vo.BookVO;
import be.devine.cp3.vo.ImageElementVO;

import starling.display.Sprite;

    public class BookCover extends Sprite
    {
        private var _bookVO:BookVO;

        public function BookCover(bookVo:BookVO)
        {
            _bookVO = bookVo;

            var imageElementVO:ImageElementVO = new ImageElementVO();
            imageElementVO.style = "cover";
            imageElementVO.url = bookVo.cover;

            var cover:ImageElement = new ImageElement(imageElementVO);
            addChild(cover);
            cover.scaleX = cover.scaleY = .5;

            this.useHandCursor = true;
        }

        public function get bookVO():BookVO
        {
            return _bookVO;
        }
    }
}
