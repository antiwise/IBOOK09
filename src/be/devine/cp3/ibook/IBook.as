package be.devine.cp3.ibook
{
    import be.devine.cp3.model.AppModel;
    import be.devine.cp3.service.BookService;
import be.devine.cp3.view.NavigationBar;
import be.devine.cp3.view.Page;
    import be.devine.cp3.vo.PageVO;

    import flash.events.Event;
import flash.events.KeyboardEvent;

import mx.core.SpriteAsset;

import starling.display.Sprite;
import starling.events.KeyboardEvent;

public class IBook extends Sprite
    {
        private var _appModel:AppModel,
                    bookService:BookService,
                    pageContainer:Sprite,
                    navigationBar:NavigationBar;


        public function IBook()
        {
           _appModel = AppModel.getInstance();

            bookService = new BookService();
            bookService.addEventListener(BookService.XML_LOADED, XMLLoadedHandler) ;
            bookService.loadBook();

            navigationBar = new NavigationBar();
            navigationBar.y = 718;
            addChild(navigationBar);

            pageContainer = new Sprite();
            addChild(pageContainer);

            _appModel.addEventListener(AppModel.PAGE_CHANGED,pageChangedHandler);

            setChildIndex(navigationBar,numChildren-1);

        }

        private function XMLLoadedHandler(event:Event):void
        {
            // CREATE BOOK
            _appModel.pages = new Array();

            var countPages:uint = 0;
            for each(var pageVO:PageVO in _appModel.pageVOS)
            {
                var page:Page = new Page(pageVO);
                _appModel.pages.push(page);
                countPages++;
            }
            _appModel.amountOfPages = countPages;
            _appModel.currentPage = 0;
        }

    private function pageChangedHandler(event:Event):void
    {
        updatePageView();
        navigationBar.checkNextPrevious();
    }

    private function updatePageView():void
    {
        if(pageContainer.numChildren > 0)
        {
            removeChild(pageContainer);
            pageContainer = new Sprite();
            addChild(pageContainer);
        }

        var leftPage:Sprite =  _appModel.pages[_appModel.currentPage];
        var rightPage:Sprite = _appModel.pages[_appModel.currentPage+1];
        leftPage.x = 0;

        pageContainer.addChild(leftPage);

        if(rightPage != null)
        {
            rightPage.x = 512;
            pageContainer.addChild(rightPage);
        }




    }
}
}
