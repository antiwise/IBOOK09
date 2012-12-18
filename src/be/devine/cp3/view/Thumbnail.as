package be.devine.cp3.view
{
    import be.devine.cp3.model.AppModel;

import flash.events.Event;

import starling.display.DisplayObject;
    import starling.display.Quad;
    import starling.display.Sprite;
    import starling.events.TouchEvent;
    import starling.events.TouchPhase;

    public class Thumbnail extends Sprite
    {
        private var thumbnail:Page,
                    _q:Quad,
                    _hoverEffect:Quad,
                    appModel:AppModel;

        public function Thumbnail(thumbnailPreview:Page)
        {
            this.appModel = AppModel.getInstance();
            this.thumbnail = thumbnailPreview;

            _q = new Quad(103,143,0xffffff);
            addChild(_q);


            /*
            var q:Quad = new Quad(100,143,0xffffff);
            addChild(q);
                          */
            thumbnail.scaleX = thumbnail.scaleY = 0.2;

            thumbnail.addEventListener(TouchEvent.TOUCH, showTimeLine);
            _q.addEventListener(TouchEvent.TOUCH, showTimeLine);

            addChild(thumbnail);

            this.useHandCursor = true;
            this.addEventListener(TouchEvent.TOUCH,touchEventHandler);

            _hoverEffect = new Quad(103,10, 0x182c49);
            _hoverEffect.y = 143;
            addChild(_hoverEffect);
            _hoverEffect.visible = false;

            trace(thumbnail.width);
            trace(thumbnail.height);

        }

        private function showTimeLine(event:TouchEvent):void
        {
            event.getTouch(event.target as DisplayObject, TouchPhase.HOVER) ?  appModel.showTimeline = true :  appModel.showTimeline  = false;
        }

        public function isActive()
        {
            /*var q:Quad = new Quad(thumbnail.width,3,0xffffff);
            q.y = this.y = this.height;
            addChild(q);    */
            q.color = 0x182c49;
        }

        public function isHide()
        {
            q.color = 0xffffff;
        }

        private function touchEventHandler(event:TouchEvent):void
        {
           // event.getTouch(event.target as DisplayObject, TouchPhase.HOVER) ?  showHoverEffect(); :  hideHoverEffect;
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

        public function set hoverEffect(value:Quad):void {
            _hoverEffect = value;
        }
    }
}
