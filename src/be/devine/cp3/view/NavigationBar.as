package be.devine.cp3.view
{
    import be.devine.cp3.factory.view.TextFieldFactory;
    import be.devine.cp3.model.AppModel;
    import starling.display.Sprite;
    import starling.events.Touch;
    import starling.events.TouchEvent;

    public class NavigationBar extends Sprite
    {
        private var _appModel:AppModel,
                    previousTextfield:Sprite,
                    nextTextfield:Sprite;


            public function NavigationBar()
            {
               /* var bg:Quad = new Quad(1024,30,0x172c44);
                addChild(bg);  */

                _appModel = AppModel.getInstance();

                previousTextfield = TextFieldFactory.createTextField({
                    text: "previous",
                    fontFormat: "p-normal"
                });
                previousTextfield.useHandCursor = true;
                addChild(previousTextfield);
                previousTextfield.addEventListener(TouchEvent.TOUCH,previous);


                nextTextfield = TextFieldFactory.createTextField({
                    text: "next",
                    fontFormat: "p-normal"
                });
                nextTextfield.x = previousTextfield.width + 30;
                addChild(nextTextfield);
                nextTextfield.useHandCursor = true;
                nextTextfield.addEventListener(TouchEvent.TOUCH,next);
            }

        private function previous(event:TouchEvent):void
        {
            var touch:Touch = event.getTouch(stage);

            if(touch.phase == "began")
            {
                _appModel.previousPage();
            }
        }

        public function checkNextPrevious():void
        {
            if(_appModel.currentPage +2 >= _appModel.amountOfPages)
            {
                nextTextfield.visible = false;
            }
            else
            {
                nextTextfield.visible = true;
            }
            if(_appModel.currentPage == 0)
            {
                previousTextfield.visible = false;
            }
            else
            {
                previousTextfield.visible = true;
            }
        }

        private function next(event:TouchEvent):void
        {
            var touch:Touch = event.getTouch(stage);

            if(touch.phase == "began")
            {
                _appModel.nextPage();
            }
        }
    }
}
