/**
 * Created with IntelliJ IDEA.
 * User: TatsBookPro
 * Date: 14/12/12
 * Time: 09:43
 * To change this template use File | Settings | File Templates.
 */
package be.devine.cp3.view {
import be.devine.cp3.model.AppModel;
import be.devine.cp3.vo.BookVO;

import flash.events.Event;

import starling.display.Sprite;
import starling.events.Event;
import starling.events.Touch;
import starling.events.TouchEvent;

public class BookPreview extends Sprite{

    private var appModel:AppModel,
            book:Book,
            _bookClicked:Book;

    public static const BOOK_CLICKED:String = "_bookClicked";

    public function BookPreview() {

        appModel = AppModel.getInstance();
        var xPos:uint = 20;
        appModel.books = new Array();
        for each(var bookVO:BookVO in appModel.bookVOS)
        {
            book = new Book(bookVO);
            appModel.books.push(book);

            trace ("maak boek aan");

            addChild(book);
            book.x = xPos;
            xPos += book.width + 30;
            book.useHandCursor = true;
            book.addEventListener(TouchEvent.TOUCH, bookClickedHandler)
        }

        appModel.addEventListener(AppModel.BOOKPREVIEW_CHANGED, showHideBookPreview);
    }

    private function bookClickedHandler(event:TouchEvent):void {

        var touch:Touch = event.getTouch(stage);
        var book:Book = event.currentTarget as Book;
        trace(book.bookVo.edition);
        _bookClicked = book;

        if(touch.phase == "began")
        {
            dispatchEvent(new starling.events.Event(BOOK_CLICKED))
        }

    }

    public function get bookClicked():Book {
        return _bookClicked;
    }

    public function set bookClicked(value:Book):void {
        _bookClicked = value;
    }

    private function showHideBookPreview(event:flash.events.Event):void {
        if (appModel.showBookPreview)
        {
            this.visible = true;
        }
        else
        {
            this.visible = false;
        }
    }
}
}
