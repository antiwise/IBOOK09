package be.devine.cp3.view
{
import be.devine.cp3.model.AppModel;
import be.devine.cp3.vo.ImageElementVO;
import be.devine.cp3.vo.PageVO;

import flash.events.Event;

import starling.display.DisplayObject;
import starling.display.Quad;
import starling.display.Sprite;
import starling.events.TouchEvent;
import starling.events.TouchPhase;

public class Thumbnail extends Sprite
{
    private var _q:Quad,
            _hoverEffect:Quad,
            appModel:AppModel;

    public function Thumbnail(thumbnailPreview:PageVO)
    {
        this.appModel = AppModel.getInstance();
       var thumbnail:PageVO = thumbnailPreview;

        var imageElementVO:ImageElementVO = new ImageElementVO();
        imageElementVO.style = "thumbnail";
        imageElementVO.url = thumbnailPreview.cover;

        var cover:ImageElement = new ImageElement(imageElementVO);
        addChild(cover);

        this.useHandCursor = true;

        cover.addEventListener(TouchEvent.TOUCH, showTimeLine);

        _hoverEffect = new Quad(91,10, 0x182c49);
        _hoverEffect.y = 128;
        addChild(_hoverEffect);
        _hoverEffect.visible = false;
    }

    private function showTimeLine(event:TouchEvent):void
    {
        event.getTouch(event.target as DisplayObject, TouchPhase.HOVER) ?  appModel.showTimeline = true :  appModel.showTimeline  = false;
    }

    public function get q():Quad {
        return _q;
    }

    public function set q(value:Quad):void {
        _q = value;
    }

    public function get hoverEffect():Quad {
        return _hoverEffect;
    }


}
}
