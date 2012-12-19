package be.devine.cp3.ibook
{
import be.devine.cp3.model.AppModel;
import be.devine.cp3.service.BookService;
import be.devine.cp3.view.Book;
import be.devine.cp3.view.BookPreview;
import be.devine.cp3.view.NavigationBar;
import be.devine.cp3.view.Page;
import be.devine.cp3.view.TimeLine;
import be.devine.cp3.vo.BookVO;
import be.devine.cp3.vo.PageVO;
import be.devine.cp3.vo.PageVO;
import flash.display.StageDisplayState;
import flash.geom.Rectangle;
import flash.ui.Keyboard;
import flash.utils.Timer;
import starling.animation.Transitions;
import starling.animation.Tween;
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
            timeLine:TimeLine,
            bgQuad:Quad,
            bookPreview:BookPreview;

    public function IBook()
    {
        appModel = AppModel.getInstance();

        bgQuad = new Quad(1024, 768, 0xe9eaeb);
        addChild(bgQuad)



        Starling.current.nativeStage.addEventListener(ResizeEvent.RESIZE,resizeHandler);

        bookService = new BookService();
        bookService.addEventListener(BookService.XML_LOADED, XMLLoadedHandler) ;
        bookService.loadBook();



        appModel.addEventListener(AppModel.BOOKPREVIEW_CHANGED, bookPreviewChangedHandler);



        pageContainer = new Sprite();

        addChild(pageContainer);

        appModel.addEventListener(AppModel.PAGE_CHANGED,pageChangedHandler);
        appModel.addEventListener(AppModel.SHOWPAGES_CHANGED, showHidePages);


    }

    private function XMLLoadedHandler(event:Event):void
    {
        bookPreview = new BookPreview();
        bookPreview.visible = true;
        addChild(bookPreview);
        bookPreview.addEventListener(BookPreview.BOOK_CLICKED, bookClickedHandler);


    }

    private function pageChangedHandler(event:Event):void
    {

        updatePageView();

        navigationBar.checkNextPrevious();
        navigationBar.setPageNumber();

        setChildIndex(navigationBar,numChildren-1);
        timeLine.posTimeline = appModel.currentPage;
         timeLine.updateThumbnails();


        setChildIndex(timeLine,numChildren-1);
    }

    private function createTween(direction):void
    {
        //if


    }

    private function updatePageView():void
    {
        if(pageContainer.numChildren > 0)
        {
            var tweenPageContainer:Tween = new Tween(pageContainer, .5, Transitions.EASE_IN);
            appModel.direction == "next" ?   tweenPageContainer.animate("x", -1024) : tweenPageContainer.animate("x", 1024);
            tweenPageContainer.onComplete = onTweenComplete;
            tweenPageContainer.onCompleteArgs = [pageContainer];
            Starling.juggler.add(tweenPageContainer);
        }

        pageContainer = new Sprite();
        addChild(pageContainer);

        var leftPageVO:PageVO = appModel.selectedBook.bookVo.pages[appModel.currentPage];
        var leftPage:Page = new Page(leftPageVO);

        if(appModel.currentPage + 1 < appModel.amountOfPages)
        {
            var rightPageVO:PageVO = appModel.selectedBook.bookVo.pages[appModel.currentPage +1];
            var rightPage:Page = new Page(rightPageVO);
        }

        appModel.direction == "next" ? leftPage.x = 1024 : leftPage.x = -1024;
        pageContainer.addChild(leftPage);
        var tweenPageLeft:Tween = new Tween(leftPage, .5, Transitions.EASE_IN);
        tweenPageLeft.animate("x", 0);
        Starling.juggler.add(tweenPageLeft);

        if(rightPage != null)
        {
            appModel.direction == "next" ? rightPage.x = 1024 + 512 : rightPage.x = -512;
            pageContainer.addChild(rightPage);
            var tweenPageRight:Tween = new Tween(rightPage, .5, Transitions.EASE_IN);
            tweenPageRight.animate("x", 512);
            Starling.juggler.add(tweenPageRight);
        }
        pageContainer.addEventListener(TouchEvent.TOUCH,TouchEventHandler);
    }

    private function onTweenComplete(pageContainer:Sprite):void
    {
        removeChild(pageContainer, true);
    }

    private function keyboardHandler(event:KeyboardEvent):void
    {
        switch (event.keyCode)
        {
            case Keyboard.LEFT:
                appModel.previousPage();
                break;
            case Keyboard.RIGHT:
            case Keyboard.SPACE:
                appModel.nextPage();
                break;
            case Keyboard.F:
                if(Starling.current.nativeStage.displayState == StageDisplayState.FULL_SCREEN_INTERACTIVE)
                {
                    Starling.current.nativeStage.displayState = StageDisplayState.NORMAL;
                }
                else
                {
                    Starling.current.nativeStage.displayState = StageDisplayState.FULL_SCREEN_INTERACTIVE;
                }
                break;
        }
    }


    private function resizeHandler(event:Event):void
    {
        var x = (Starling.current.nativeStage.stageWidth - Starling.current.stage.stageWidth) >> 1;
        var y = (Starling.current.nativeStage.stageHeight - Starling.current.stage.stageHeight) >> 1;
        var currentStageHeight = Starling.current.stage.stageHeight;
        var currentStageWidth = Starling.current.stage.stageWidth;

        Starling.current.viewPort = new Rectangle(x, y, currentStageWidth, currentStageHeight);
        bgQuad.width = currentStageWidth;
        bgQuad.height = currentStageHeight;
    }

    private function showTimeLine(event:TouchEvent):void
    {
        if (event.getTouch(event.target as DisplayObject, TouchPhase.HOVER))
        {
            appModel.showTimeline = true

        }
    }

    private function TouchEventHandler(event:TouchEvent):void
    {
        var touch:Touch = event.getTouch(stage);

        if(touch.phase == "hover")
        {
            appModel.showTimeline = false;

        }

    }

    private function bookClickedHandler(event:starling.events.Event):void
    {
       /* addChild(navigationBar);
        setChildIndex(navigationBar,numChildren-1);  */
        appModel.selectedBook = bookPreview.bookClicked;

        var countPages:uint = 0;

        appModel.showBookPreview = false;
        appModel.showPages = true;


        for each(var pageVO:PageVO in appModel.selectedBook.bookVo.pages )
        {
            countPages++;
        }
        appModel.amountOfPages = countPages;



        navigationBar = new NavigationBar();
        navigationBar.y = 718;
        navigationBar.addEventListener(TouchEvent.TOUCH, showTimeLine);
        addChild(navigationBar);

        timeLine= new TimeLine();
        timeLine.x = Starling.current.stage.stageWidth/2 - timeLine.width/2;
        timeLine.y = Starling.current.stage.stageHeight - timeLine.height - 27;
        addChild(timeLine);


        appModel.currentPage = 0;

        trace("[IBook]" + appModel.currentPage);

        Starling.current.stage.addEventListener(KeyboardEvent.KEY_DOWN, keyboardHandler);
    }

    private function showHidePages(event:Event):void
    {
        if( appModel.showPages == false)
        {
            if (pageContainer != null)
            {
                pageContainer.removeChildren();
                appModel.showBookPreview = true;
            }
            if(timeLine != null)
            {
                removeChild(timeLine);
            }
            if(navigationBar != null)
            {
                removeChild(navigationBar);
            }
        }
    }

    private function bookPreviewChangedHandler(event:Event):void
    {
        if(appModel.showBookPreview)
        {
            setChildIndex(bookPreview,numChildren-1);
            Starling.current.stage.removeEventListener(KeyboardEvent.KEY_DOWN, keyboardHandler);

        }
        else
        {
            Starling.current.stage.addEventListener(KeyboardEvent.KEY_DOWN, keyboardHandler);
        }
    }
}

}
