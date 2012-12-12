package be.devine.cp3.ibook
{
import be.devine.cp3.extensions.ClippedSprite;
import be.devine.cp3.extensions.PixelMaskDisplayObject;
import be.devine.cp3.model.AppModel;
    import be.devine.cp3.service.BookService;
import be.devine.cp3.view.NavigationBar;
import be.devine.cp3.view.Page;
    import be.devine.cp3.vo.PageVO;

import flash.display.Shape;
import flash.display.StageDisplayState;
import flash.geom.Rectangle;
import flash.ui.Keyboard;

import starling.animation.Transitions;

import starling.animation.Tween;

import starling.display.Sprite;

import flash.events.Event;

import starling.core.Starling;
import starling.display.DisplayObject;
import starling.display.Quad;

import starling.display.Sprite;
import starling.events.KeyboardEvent;
import starling.events.ResizeEvent;
import starling.events.Touch;
import starling.events.TouchEvent;
import starling.events.TouchPhase;

[SWF(frameRate=60,  backgroundColor="#e9eaeb", width="1024", height="768")]

public class IBook extends Sprite
    {
        private var appModel:AppModel,
                    bookService:BookService,
                    pageContainer:Sprite,
                    navigationBar:NavigationBar,
                    thumbnailContainerHolder:Sprite,
                    thumbnailContainer:Sprite,
                    bgQuad:Quad;



        public function IBook()
        {
           appModel = AppModel.getInstance();
           // Starling.current.viewPort = new Rectangle(0, 0, 1024, 768);
            bgQuad = new Quad(1024, 768, 0xe9eaeb);
            addChild(bgQuad)

            Starling.current.stage.addEventListener(KeyboardEvent.KEY_DOWN, keyboardHandler)
            Starling.current.nativeStage.addEventListener(ResizeEvent.RESIZE,resizeHandler)

            bookService = new BookService();
            bookService.addEventListener(BookService.XML_LOADED, XMLLoadedHandler) ;
            bookService.loadBook();

            navigationBar = new NavigationBar();
            navigationBar.y = 718;
            navigationBar.addEventListener(TouchEvent.TOUCH, showThumbnails);

            addChild(navigationBar);


            thumbnailContainerHolder = new Sprite();

            thumbnailContainerHolder.addEventListener(TouchEvent.TOUCH, showThumbnails);



            pageContainer = new Sprite();
            addChild(pageContainer);



            appModel.addEventListener(AppModel.PAGE_CHANGED,pageChangedHandler);


            setChildIndex(navigationBar,numChildren-1);





        }

        private function XMLLoadedHandler(event:Event):void
        {
            // CREATE BOOK
            appModel.pages = new Array();
            appModel.thumbnailPages = new Array();

            var countPages:uint = 0;
            for each(var pageVO:PageVO in appModel.pageVOS)
            {
                var page:Page = new Page(pageVO);
                var thumbpage:Page = new Page(pageVO);
                appModel.pages.push(page);
                appModel.thumbnailPages.push(thumbpage)
                countPages++;
            }
            appModel.amountOfPages = countPages;
            appModel.currentPage = 0;
            thumbnails();

        }

    private function pageChangedHandler(event:Event):void
    {
        updatePageView();
        navigationBar.checkNextPrevious();
        navigationBar.setPageNumber();
    }

    private function updatePageView():void
    {
        trace ("direction is  " + appModel.direction);

        if (appModel.direction == "next"){
            if(pageContainer.numChildren > 0)
            {
                var tweenPageContainer:Tween = new Tween(pageContainer, .5, Transitions.EASE_IN);
                tweenPageContainer.animate("x", -1024);
                tweenPageContainer.onComplete = onTweenComplete;
                tweenPageContainer.onCompleteArgs = [pageContainer];
                Starling.juggler.add(tweenPageContainer)

            }
            pageContainer = new Sprite();
            addChild(pageContainer);

            var leftPage:Sprite =  appModel.pages[appModel.currentPage];
            var rightPage:Sprite = appModel.pages[appModel.currentPage+1];
            leftPage.x = 1024;
            pageContainer.addChild(leftPage);
            var tweenPageLeft:Tween = new Tween(leftPage, .5, Transitions.EASE_IN);
            tweenPageLeft.animate("x", 0);
            Starling.juggler.add(tweenPageLeft)

            if(rightPage != null)
            {
                rightPage.x = 1024 + 512;
                pageContainer.addChild(rightPage);
                var tweenPageRight:Tween = new Tween(rightPage, .5, Transitions.EASE_IN);
                tweenPageRight.animate("x", 512);
                Starling.juggler.add(tweenPageRight)
            }

        }else {
            if(pageContainer.numChildren > 0)
            {
                var tweenPageContainer:Tween = new Tween(pageContainer, .5, Transitions.EASE_IN);
                tweenPageContainer.animate("x", 1024);
                tweenPageContainer.onComplete = onTweenComplete;
                tweenPageContainer.onCompleteArgs = [pageContainer];
                Starling.juggler.add(tweenPageContainer)

            }
            pageContainer = new Sprite();
            addChild(pageContainer);

            var leftPage:Sprite =  appModel.pages[appModel.currentPage];
            var rightPage:Sprite = appModel.pages[appModel.currentPage+1];

            leftPage.x = -1024;
            pageContainer.addChild(leftPage);
            var tweenPageLeft:Tween = new Tween(leftPage, .5, Transitions.EASE_IN);
            tweenPageLeft.animate("x", 0);
            Starling.juggler.add(tweenPageLeft)

            if(rightPage != null)
            {
                rightPage.x = -512;
                pageContainer.addChild(rightPage);
                var tweenPageRight:Tween = new Tween(rightPage, .5, Transitions.EASE_IN);
                tweenPageRight.animate("x", 512);
                Starling.juggler.add(tweenPageRight)
            }

        }




        // EENMAAL RUNNEN EN DAN SHOW HIDE IPV OPNIEUW GENERENEN.
        thumbnails();


    }

    private function onTweenComplete(pageContainer:Sprite):void {
        removeChild(pageContainer);
    }


    public function thumbnails():void{

     addChild(thumbnailContainerHolder);

        thumbnailContainer = new Sprite();
        thumbnailContainerHolder.addChild(thumbnailContainer);
        var q:Quad = new Quad( 800,  150, 0xdd464e)
        thumbnailContainerHolder.addChild(q);
        thumbnailContainerHolder.y = Starling.current.stage.stageHeight;
        thumbnailContainerHolder.x = (Starling.current.stage.stageWidth - 800) * .5;

        var xPos:Number = 10;
        var spriteArray:Array = new Array();
        for each(var thumbpage:Page in appModel.thumbnailPages)
        {

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
        addChild(sprite);

    // the sprite works like you're used to
            sprite.addChild(thumbnailContainerHolder);
            //sprite.addChild(anotherObject);

    // set the mask rectangle in stage coordinates
            sprite.clipRect = new Rectangle(50, 550, 800, 150);


    }
    public function showThumbnails(e:TouchEvent):void{

        e.getTouch(e.target as DisplayObject, TouchPhase.HOVER) ?  thumbnailContainerHolder.y = Starling.current.stage.stageHeight - 178 :  thumbnailContainerHolder.y = Starling.current.stage.stageHeight;



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

    private function keyboardHandler(event:KeyboardEvent):void {

        trace (event.keyCode);
        switch (event.keyCode)
        {
            case Keyboard.LEFT:
                trace ("prev")
                    appModel.previousPage();
                break;
            case Keyboard.RIGHT:
                trace ("next")
                appModel.nextPage();
                break;
            case Keyboard.F:
                trace ("fullscreen")
                //appModel.nextPage();
                    if( Starling.current.nativeStage.displayState == StageDisplayState.FULL_SCREEN_INTERACTIVE){
                        Starling.current.nativeStage.displayState = StageDisplayState.NORMAL;

                    }else {
                        Starling.current.nativeStage.displayState = StageDisplayState.FULL_SCREEN_INTERACTIVE;

                    }

                break;

        }

    }


    private function resizeHandler(event:Event):void {

        var x = (Starling.current.nativeStage.stageWidth - Starling.current.stage.stageWidth) >> 1;
        var y = (Starling.current.nativeStage.stageHeight - Starling.current.stage.stageHeight) >> 1;
        var currentStageHeight = Starling.current.stage.stageHeight;
        var currentStageWidth = Starling.current.stage.stageWidth;

        Starling.current.viewPort = new Rectangle(x, y, currentStageWidth, currentStageHeight);
        bgQuad.width = currentStageWidth;
        bgQuad.height = currentStageHeight;

    }
}
}
