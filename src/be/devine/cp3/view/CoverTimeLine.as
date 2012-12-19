package be.devine.cp3.view
{
import be.devine.cp3.model.AppModel;
import be.devine.cp3.vo.BookVO;

import starling.display.Sprite;
import starling.events.Touch;
import starling.events.TouchEvent;
import starling.textures.Texture;
import starling.textures.TextureAtlas;

    public class CoverTimeLine extends Sprite
    {
        [Embed(source="/assets/xml/sprite.xml", mimeType="application/octet-stream")]
        public static const ButtonXml:Class;

        [Embed(source="/assets/images/sprite.png")]
        public static const ButtonTexture:Class;

        private var appmodel:AppModel,
                    buttonPrev:Button,
                    buttonNext:Button,
                    _posTimeline:uint,
                    bookCoverContainer:Sprite;

        public function CoverTimeLine()
        {
            this.appmodel = AppModel.getInstance();

            _posTimeline = 0;
            bookCoverContainer = new Sprite();
            addChild(bookCoverContainer);

            appmodel.covers = new Vector.<BookCover>();
            var yPos:uint = 0;
            for each(var bookVO:BookVO in appmodel.bookVOS)
            {
                var bookCover:BookCover = new BookCover(bookVO);
                appmodel.covers.push(bookCover);
                bookCoverContainer.addChild(bookCover);
                bookCover.y = yPos;
                bookCover.addEventListener(TouchEvent.TOUCH, coverSelectedHandler);
                yPos = bookCover.y + 225 + 10;
            }
            appmodel.selectedCover = appmodel.covers[0];

            var texture:Texture = Texture.fromBitmap(new ButtonTexture);
            var xml:XML = XML(new ButtonXml());
            var textureAtlas:TextureAtlas = new TextureAtlas(texture, xml);

            buttonPrev = new Button(textureAtlas,"arrow_left.png");

            buttonPrev.y = 0;
            buttonPrev.x = -20;
            buttonPrev.rotation = Math.PI * .5;
            buttonPrev.addEventListener(TouchEvent.TOUCH, showPrevCover);
            addChild(buttonPrev);

            buttonNext = new Button(textureAtlas,"arrow_right.png");
            buttonNext.x = -20;
            buttonNext.y = 20;
            buttonNext.rotation = Math.PI * .5;
            buttonNext.addEventListener(TouchEvent.TOUCH, showNextCover);
            addChild(buttonNext);
            checkNextPrevious();

        }

        private function coverSelectedHandler(event:TouchEvent):void
        {
            var touch:Touch = event.getTouch(stage);

            if(touch && touch.phase == "began")
            {
                var selectedCover:BookCover = event.currentTarget as BookCover;

                if(selectedCover != appmodel.selectedCover)
                {
                    appmodel.selectedCover = selectedCover;
                    posTimeline = appmodel.covers.indexOf(selectedCover, 0);
                    checkNextPrevious();
                }
            }
        }

        public function showNextCover(event:TouchEvent):void
        {
            var touch:Touch = event.getTouch(stage);

            if(touch && touch.phase == "began")
            {
                appmodel.nextCover();

                if(_posTimeline <= appmodel.covers.length)
                {
                    _posTimeline ++;
                    updateCoverTimeline();

                }
                checkNextPrevious();
            }
        }

        public function showPrevCover(event:TouchEvent):void
        {
            var touch:Touch = event.getTouch(stage);

            if(touch && touch.phase == "began")
            {
                appmodel.prevCover();
                if(_posTimeline != 0)
                {
                    _posTimeline --;
                    updateCoverTimeline();
                }
                checkNextPrevious();
            }
        }

        public function set posTimeline(value:uint):void
        {
            if(_posTimeline != value)
            {
                _posTimeline = value;
                updateCoverTimeline();
            }
        }

        public function updateCoverTimeline():void
        {
            bookCoverContainer.y = -(_posTimeline*235)
        }

        public function checkNextPrevious():void
        {
            _posTimeline >= appmodel.covers.length -1 ? buttonNext.visible = false : buttonNext.visible = true;
            _posTimeline == 0 ? buttonPrev.visible = false : buttonPrev.visible = true;
        }
    }
}
