package be.devine.cp3.ibook
{
    import be.devine.cp3.model.AppModel;
import be.devine.cp3.service.BookService;
import be.devine.cp3.view.Page;

import flash.events.Event;

import starling.display.Sprite;
import starling.text.TextField;
import starling.utils.HAlign;
import starling.utils.VAlign;

public class IBook extends Sprite
    {
        private var _appModel:AppModel,
                    bookService:BookService;

        public function IBook()
        {
           _appModel = AppModel.getInstance();

            bookService = new BookService();
            bookService.addEventListener(Event.COMPLETE, XMLLoadedHandler) ;
            bookService.loadBook();

        }

        private function XMLLoadedHandler(event:Event):void
        {
            var page:Page = new Page();
            addChild(page);
        }
    }
}
