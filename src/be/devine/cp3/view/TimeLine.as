package be.devine.cp3.view
{
    import be.devine.cp3.model.AppModel;
import be.devine.cp3.view.Thumbnail;
import be.devine.cp3.vo.PageVO;

import flash.events.Event;

import starling.display.DisplayObject;
import starling.display.Quad;
    import starling.display.Sprite;
    import starling.events.Touch;
    import starling.events.TouchEvent;
import starling.events.TouchPhase;
import starling.textures.Texture;
    import starling.textures.TextureAtlas;

    public class TimeLine extends Sprite
    {
        [Embed(source="/assets/xml/sprite.xml", mimeType="application/octet-stream")]
        public static const ButtonXml:Class;

        [Embed(source="/assets/images/sprite.png")]
        public static const ButtonTexture:Class;

        private var appmodel:AppModel,
                    amountOfThumbnails:uint,

                    _thumbnailContainer:Sprite,
                    _posTimeline:uint,
                    arrThumbnails:Array,
                    buttonPrev:Button,
                    buttonNext:Button;

        public static const THUMBNAIL_CLICKED:String = "ThumbnailClicked";

        public function TimeLine()
        {
            this.visible = false;
            this.appmodel = AppModel.getInstance();
            arrThumbnails = new Array();

            _thumbnailContainer = new Sprite();

            _posTimeline = 0;

            var texture:Texture = Texture.fromBitmap(new ButtonTexture);
            var xml:XML = XML(new ButtonXml());
            var textureAtlas:TextureAtlas = new TextureAtlas(texture, xml);

            var q:Quad = new Quad( 730,  180, 0xdd464e);
            addChild(q);

            buttonPrev = new Button(textureAtlas,"arrow_left.png");
            buttonPrev.addEventListener(TouchEvent.TOUCH,previous);
            buttonPrev.y = this.height/2;
            buttonPrev.x = 10;
            addChild(buttonPrev);

            buttonNext = new Button(textureAtlas,"arrow_right.png");
            buttonNext.addEventListener(TouchEvent.TOUCH,next);
            buttonNext.x = this.width - 10 - buttonNext.width;
            buttonNext.y = this.height/2;
            addChild(buttonNext);

            for each(var thumbnailPreview:PageVO in appmodel.selectedBook.bookVo.pages)
            {
                var thumbnail:Thumbnail = new Thumbnail(thumbnailPreview);
                arrThumbnails.push(thumbnail);
                thumbnail.addEventListener(TouchEvent.TOUCH, TouchEventHandler);
                thumbnail.addEventListener(TouchEvent.TOUCH, showTimeLine);
            }

            if(appmodel.amountOfPages < 6)
            {
                amountOfThumbnails = appmodel.amountOfPages;
            }
            else
            {
                amountOfThumbnails = 6;
            }


            updateThumbnails();

            this.addEventListener(TouchEvent.TOUCH, showTimeLine);
            appmodel.addEventListener(AppModel.TIMELINE_CHANGED, timeLineHandler);
        }

        public function updateThumbnails()
        {
            if(_thumbnailContainer.numChildren > 0)
            {
                removeChild(_thumbnailContainer);
            }

            _thumbnailContainer = new Sprite();


            var xPos:uint = 0;
            for(var i:uint = 0; i<amountOfThumbnails;i++)
            {
                var thumbnail:Thumbnail = arrThumbnails[_posTimeline + i];


                if(arrThumbnails[appmodel.currentPage] == arrThumbnails[_posTimeline + i] || arrThumbnails[appmodel.currentPage + 1] == arrThumbnails[_posTimeline + i]  )
                {
                    thumbnail.hoverEffect.visible = true;
                }
                else
                {
                    thumbnail.hoverEffect.visible = false;
                }

                if(thumbnail != null)
                {
                    thumbnail.x = xPos;


                    _thumbnailContainer.addChild(thumbnail);
                    if (arrThumbnails.indexOf(thumbnail)%2 == 1)
                    {
                        xPos += 91+20;
                    }else
                    {
                        xPos += 91;
                    }

                }

            }

            _thumbnailContainer.x = this.width/2 - _thumbnailContainer.width/2;
            _thumbnailContainer.y = this.height/2 - _thumbnailContainer.height/2;

            addChild(_thumbnailContainer);
            checkNextPrevious();
        }

        private function TouchEventHandler(event:TouchEvent):void
        {
            var touch:Touch = event.getTouch(stage);

            if(touch.phase == "began")
            {
                var pageNumber:uint = arrThumbnails.indexOf(event.currentTarget as Thumbnail);

                if (pageNumber%2 != 0)
                {
                    pageNumber = pageNumber -1;
                }

                if(pageNumber != appmodel.currentPage)
                {
                    appmodel.gotoPage(pageNumber);
                }
            }


        }

        private function previous(event:TouchEvent):void
        {
            var touch:Touch = event.getTouch(stage);

            if(touch.phase == "began")
            {
                if(_posTimeline != 0)
                {
                    _posTimeline -= 2;
                    updateThumbnails();
                }
            }
        }

        private function next(event:TouchEvent):void
        {
            var touch:Touch = event.getTouch(stage);

            if(touch.phase == "began")
            {
                if(_posTimeline <= appmodel.amountOfPages - 7)
                {
                    _posTimeline += 2;
                    updateThumbnails();
                }
            }
        }

        public function set posTimeline(value:uint):void
        {
            _posTimeline = value;
            updateThumbnails();
        }

        public function checkNextPrevious():void
        {
            if(_posTimeline >= arrThumbnails.length/2 )
            {
                buttonNext.visible = false;
            }
            else
            {
                buttonNext.visible = true;
            }
            if(_posTimeline == 0)
            {
                buttonPrev.visible = false;
            }
            else
            {
                buttonPrev.visible = true;
            }
        }

        public function get thumbnailContainer():Sprite
        {
            return _thumbnailContainer;
        }

        public function set thumbnailContainer(value:Sprite):void
        {
            _thumbnailContainer = value;
        }

        private function showTimeLine(event:TouchEvent):void
        {
            var touch:Touch = event.getTouch(stage);

            if(touch.phase == "hover")
            {
                appmodel.showTimeline = true;
            }
        }

        private function timeLineHandler(event:flash.events.Event):void
        {
            if (appmodel.showTimeline)
            {
                this.visible = true;
            }
            else
            {
                this.visible = false;
            }
        }
    }
}
