package be.devine.cp3.ibook
{
    import be.devine.cp3.model.AppModel;
    import be.devine.cp3.service.BookService;
    import be.devine.cp3.view.Page;
    import be.devine.cp3.vo.PageVO;

    import flash.events.Event;

    import starling.display.Sprite;
    public class IBook extends Sprite
    {
        private var _appModel:AppModel,
                    bookService:BookService;

        public function IBook()
        {
           _appModel = AppModel.getInstance();

            bookService = new BookService();
            bookService.addEventListener(BookService.XML_LOADED, XMLLoadedHandler) ;
            bookService.loadBook();
        }

        private function XMLLoadedHandler(event:Event):void
        {
            // CREATE BOOK
            for each(var pageVO:PageVO in _appModel.pages)
            {
                var page:Page = new Page(pageVO);
                addChild(page);
            }
        }
    }
}
