/**
 * Created with IntelliJ IDEA.
 * User: TatsBookPro
 * Date: 11/12/12
 * Time: 21:46
 * To change this template use File | Settings | File Templates.
 */
package be.devine.cp3.view {
import be.devine.cp3.extensions.ClippedSprite;
import be.devine.cp3.model.AppModel;

import flash.geom.Rectangle;

import starling.core.Starling;
import starling.display.DisplayObject;
import starling.display.Quad;
import starling.display.Sprite;
import starling.events.Touch;
import starling.events.TouchEvent;
import starling.events.TouchPhase;

public class ThumbnailSlider extends Sprite {
    private var  appModel:AppModel,
            thumbnailContainerHolder:Sprite,
            thumbnailContainer:Sprite;


    public function ThumbnailSlider() {

        trace ("[ThumbnailSlider] in constructor")
        appModel = AppModel.getInstance();

        thumbnailContainerHolder = new Sprite();
        thumbnailContainerHolder.addEventListener(TouchEvent.TOUCH, showThumbnails);
        this.addEventListener(TouchEvent.TOUCH, showThumbnails);
        thumbnails();
    }



    public function thumbnails():void{

        addChild(thumbnailContainerHolder);
        thumbnailContainerHolder.visible = false;

        thumbnailContainer = new Sprite();
        thumbnailContainerHolder.addChild(thumbnailContainer);
        var q:Quad = new Quad( 800,  150, 0xdd464e)

        thumbnailContainerHolder.addChild(q);


        var xPos:Number = 10;
        var spriteArray:Array = new Array();
        for each(var thumbpage:Page in appModel.thumbnailPages)
        {
            trace ("[ThumbnailSlider] thumbs maken")
            var thumbnailSprite:Sprite = new Sprite();
            thumbnailContainerHolder.addChild(thumbnailSprite);
            var q:Quad = new Quad( 80,  110, 0xFFFFFF)
            thumbnailSprite.y = 10;
            thumbnailSprite.x = xPos;
            thumbnailSprite
            spriteArray.push(thumbnailSprite);
            thumbnailSprite.addChild(q);
            thumbnailSprite.addChild(thumbpage);
            thumbpage.scaleX = thumbpage.scaleY = .12;
            thumbpage.x = 10;
            thumbpage.y = 10;
            thumbpage.useHandCursor = true;
            var pageNumber:uint = appModel.thumbnailPages.indexOf(thumbpage);





            // TODO: dit zou eigenlijk op de thumbnailsprite moeten, maar dan weet ik niet hoe je het pagenumber ophaalt
            thumbpage.addEventListener(TouchEvent.TOUCH,thumbnailClicked);
            thumbnailSprite.x = xPos;

            // TODO: active thumbnail aanduiden


            if (spriteArray.indexOf(thumbnailSprite)%2 == 1){
                xPos += thumbnailSprite.width +  20;
            }else {
                xPos += thumbnailSprite.width;
            }

        }

        var sprite:ClippedSprite = new ClippedSprite();
        thumbnailContainerHolder.addChild(sprite);

        // the sprite works like you're used to
        sprite.addChild(thumbnailContainer);
        //sprite.addChild(anotherObject);

        // set the mask rectangle in stage coordinates
        sprite.clipRect = new Rectangle(10, 10, 600, 150);


    }
    public function showThumbnails(e:TouchEvent):void{

        e.getTouch(e.target as DisplayObject, TouchPhase.HOVER) ?  thumbnailContainerHolder.visible = true:  thumbnailContainerHolder.visible = false;



    }

    private function thumbnailClicked(event:TouchEvent):void
    {
        var pageNumber:uint = appModel.thumbnailPages.indexOf(event.currentTarget as Page);

        var touch:Touch = event.getTouch(stage);

        if(touch.phase == "ended")
        {
            trace ("we hebben geklikt");
            appModel.gotoPage(pageNumber);
        }
    }
}
}
