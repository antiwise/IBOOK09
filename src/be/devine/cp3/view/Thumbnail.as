package be.devine.cp3.view
{
    import be.devine.cp3.model.AppModel;
    import starling.display.DisplayObject;
    import starling.display.Quad;
    import starling.display.Sprite;
    import starling.events.TouchEvent;
    import starling.events.TouchPhase;

    public class Thumbnail extends Sprite
    {
        private var thumbnail:Page,
                    appModel:AppModel;

        public function Thumbnail(thumbnailPreview:Page)
        {
            this.appModel = AppModel.getInstance();
            this.thumbnail = thumbnailPreview;

            var q:Quad = new Quad(100,143,0xffffff);
            addChild(q);

            thumbnail.scaleX = thumbnail.scaleY = 0.2;

            thumbnail.addEventListener(TouchEvent.TOUCH, showTimeLine);
            q.addEventListener(TouchEvent.TOUCH, showTimeLine);

            addChild(thumbnail);
        }

        private function showTimeLine(event:TouchEvent):void
        {
            event.getTouch(event.target as DisplayObject, TouchPhase.HOVER) ?  appModel.showTimeline = true :  appModel.showTimeline  = false;
        }
    }
}
