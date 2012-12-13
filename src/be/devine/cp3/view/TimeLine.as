/**
 * Created with IntelliJ IDEA.
 * User: Ducaluk
 * Date: 12/12/12
 * Time: 19:39
 * To change this template use File | Settings | File Templates.
 */
package be.devine.cp3.view
{
import be.devine.cp3.model.AppModel;
import be.devine.cp3.view.Page;

import flash.events.Event;

import starling.display.DisplayObject;

import starling.display.Quad;
import starling.display.Sprite;
import starling.events.Event;
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


            //_buttonContainer.addChild(buttonPrev);



            var q:Quad = new Quad( 700,  180, 0xdd464e);
            addChild(q);


            buttonPrev = new Button(textureAtlas,"arrow_left.png");
            buttonPrev.addEventListener(TouchEvent.TOUCH,previous);
            buttonPrev.y = this.height/2;
            buttonPrev.x = 10;
            addChild(buttonPrev);

            buttonNext = new Button(textureAtlas,"arrow_right.png");
            buttonNext.addEventListener(TouchEvent.TOUCH,next);
            buttonNext.addEventListener(TouchEvent.TOUCH, showTimeLine);
            buttonNext.x = this.width - 10 - buttonNext.width;
            buttonNext.y = this.height/2;
            addChild(buttonNext);

            for each(var thumbnailPreview:Page in appmodel.thumbnailPages)
            {
                var thumbnail:Thumbnail = new Thumbnail(thumbnailPreview);
                thumbnail.addEventListener(TouchEvent.TOUCH, TouchEventHandler);
                thumbnail.addEventListener(TouchEvent.TOUCH, showTimeLine);
                arrThumbnails.push(thumbnail);
                // addChild(thumbnail);
            }


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

            //addChild(thumbnailContainer);

            var xPos:uint = 0;
            for(var i:uint = 0; i<6;i++)
            {

               // var thumbnail:Thumbnail = arrThumbnails[appmodel.currentPage + i];
                var thumbnail:Thumbnail = arrThumbnails[_posTimeline + i];
                if(thumbnail != null)
                {
                    thumbnail.x = xPos;

                    _thumbnailContainer.addChild(thumbnail);
                    if (arrThumbnails.indexOf(thumbnail)%2 == 1){
                        trace ("spread")
                        xPos += thumbnail.width +  20;
                    }else {
                        xPos += thumbnail.width;
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
            trace(touch.phase);
            trace("kliklik");

            var pageNumber:uint = arrThumbnails.indexOf(event.currentTarget as Thumbnail);
            if(pageNumber != appmodel.currentPage)
            {
                appmodel.gotoPage(pageNumber);
            }


        }





        /*if(touch.phase == "ended");
        {
            trace("kliklik");
            //appmodel.gotoPage(arrThumbnails.indexOf(event.currentTarget as Thumbnail))
        }     */
    }

    private function previous(event:TouchEvent):void
    {
        trace(_posTimeline);
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
        trace(_posTimeline);

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

        trace (_posTimeline, arrThumbnails.length/2 )
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

    public function get thumbnailContainer():Sprite {
        return _thumbnailContainer;
    }

    public function set thumbnailContainer(value:Sprite):void {
        _thumbnailContainer = value;
    }



    private function showTimeLine(event:TouchEvent):void
    {

        event.getTouch(event.target as DisplayObject, TouchPhase.HOVER) ?  this.visible = true :  appmodel.showTimeline  = false;

        var touch:Touch = event.getTouch(stage);
        if(touch.phase == "began")
        {
            appmodel.showTimeline = true

        }
    }

    private function timeLineHandler(event:flash.events.Event):void {

        if (appmodel.showTimeline == true){
            this.visible = true;
        }else {
            this.visible = false;
        }


    }
}
}
