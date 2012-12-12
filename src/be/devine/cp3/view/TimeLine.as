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
                    thumbnailContainer:Sprite,
                    _posTimeline:uint,
                    arrThumbnails:Array;

        public static const THUMBNAIL_CLICKED:String = "ThumbnailClicked";


        public function TimeLine()
        {
            this.appmodel = AppModel.getInstance();
            arrThumbnails = new Array();

            thumbnailContainer = new Sprite();

            _posTimeline = 0;


            var texture:Texture = Texture.fromBitmap(new ButtonTexture);
            var xml:XML = XML(new ButtonXml());
            var textureAtlas:TextureAtlas = new TextureAtlas(texture, xml);



            //_buttonContainer.addChild(buttonPrev);



            var q:Quad = new Quad( 800,  150, 0xdd464e);
            addChild(q);


            var buttonPrev = new Button(textureAtlas,"arrow_left.png");
            buttonPrev.addEventListener(TouchEvent.TOUCH,previous);
            buttonPrev.y = this.height/2;
            buttonPrev.x = 10;
            addChild(buttonPrev);

            var buttonNext = new Button(textureAtlas,"arrow_right.png");
            buttonNext.addEventListener(TouchEvent.TOUCH,next);
            buttonNext.x = this.width - 10 - buttonNext.width;
            buttonNext.y = this.height/2;
            addChild(buttonNext);

            for each(var thumbnailPreview:Page in appmodel.thumbnailPages)
            {
                var thumbnail:Thumbnail = new Thumbnail(thumbnailPreview);
                thumbnail.addEventListener(TouchEvent.TOUCH, TouchEventHandler);
                arrThumbnails.push(thumbnail);
                // addChild(thumbnail);
            }
        }

        public function updateThumbnails()
        {
            if(thumbnailContainer.numChildren > 0)
            {
                removeChild(thumbnailContainer);

            }

            thumbnailContainer = new Sprite();

            //addChild(thumbnailContainer);

            var xPos:uint = 0;
            for(var i:uint = 0; i<5;i++)
            {

               // var thumbnail:Thumbnail = arrThumbnails[appmodel.currentPage + i];
                var thumbnail:Thumbnail = arrThumbnails[_posTimeline + i];
                if(thumbnail != null)
                {
                    thumbnail.x = xPos;
                    thumbnailContainer.addChild(thumbnail);
                    xPos +=  150;
                }

            }

            thumbnailContainer.x = this.width/2 - thumbnailContainer.width/2;
            thumbnailContainer.y = this.height/2 - thumbnailContainer.height/2;

                    addChild(thumbnailContainer);
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
        var touch:Touch = event.getTouch(stage);

        if(touch.phase == "began")
        {
            if(_posTimeline != 0)
            {
                _posTimeline--;
                updateThumbnails();
            }

        }
    }

    private function next(event:TouchEvent):void
    {
        var touch:Touch = event.getTouch(stage);

        if(touch.phase == "began")
        {
            if(_posTimeline <= appmodel.amountOfPages - 6)
            {
                _posTimeline++;
                updateThumbnails();
            }

        }
    }

    public function set posTimeline(value:uint):void
    {
        _posTimeline = value;
        updateThumbnails();
    }
}
}
