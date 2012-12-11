package be.devine.cp3.view
{
    import be.devine.cp3.factory.view.TextFieldFactory;
    import be.devine.cp3.model.AppModel;

import starling.core.Starling;

import starling.display.Quad;
import starling.display.Sprite;
    import starling.events.Touch;
    import starling.events.TouchEvent;

import starling.display.Sprite;

public class NavigationBar extends Sprite
    {
        private var _appModel:AppModel,
                    previousTextfield:Sprite,
                    nextTextfield:Sprite,
                pageNumberTextfield:Sprite;


            public function NavigationBar()
            {

                var bg:Quad = new Quad(1024,50,0x182c49);
                addChild(bg);

                _appModel = AppModel.getInstance();

                previousTextfield = TextFieldFactory.createTextField({
                    text: "previous",
                    fontFormat: "p-normal-white"
                });
                previousTextfield.useHandCursor = true;
                addChild(previousTextfield);
                previousTextfield.addEventListener(TouchEvent.TOUCH,previous);


                nextTextfield = TextFieldFactory.createTextField({
                    text: "next",
                    fontFormat: "p-normal-white"
                });




                nextTextfield.x = previousTextfield.width + 30;
                addChild(nextTextfield);
                nextTextfield.useHandCursor = true;
                nextTextfield.addEventListener(TouchEvent.TOUCH,next);

                setPageNumber();
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


        public function setPageNumber():void{


            if (pageNumberTextfield != null){
                this.removeChild(pageNumberTextfield);
            }

                var pageLeft:uint = _appModel.currentPage + 1
                var pageRight:uint = _appModel.currentPage + 2;
               pageNumberTextfield = TextFieldFactory.createTextField({
                text: "Page  " + pageLeft.toString() + " - " + pageRight.toString() ,
                fontFormat: "p-normal-white"
            });

            trace("in navbar, pagenumber " + _appModel.currentPage);

            pageNumberTextfield.x = Starling.current.stage.stageWidth - 100;
            addChild(pageNumberTextfield);

        }

    }
}
