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

import starling.core.Starling;

import starling.display.Quad;

import starling.display.Sprite;
import starling.events.Event;
import starling.events.Touch;
import starling.events.TouchEvent;

public class BookPreview extends Sprite{

    private var appModel:AppModel,
            book:Book,
            _bookClicked:Book,
            coverTimeLine:CoverTimeLine;

    public static const BOOK_CLICKED:String = "_bookClicked";

    public function BookPreview() {

        var bgQuad = new Quad(1024, 768, 0x182C49);
        bgQuad.x = 0;
        bgQuad.y = 0;
        addChild(bgQuad)

        appModel = AppModel.getInstance();


        appModel.books = new Vector.<Book>();

        appModel.addEventListener(AppModel.BOOKPREVIEW_CHANGED, showHideBookPreview);
        appModel.addEventListener(AppModel.SELECTEDCOVER_CHANGED, coverChangedHandler);

        for each(var bookVO:BookVO in appModel.bookVOS)
        {
            book = new Book(bookVO);
            appModel.books.push(book);
            book.y = 20;
            book.useHandCursor = true;
            book.addEventListener(TouchEvent.TOUCH, bookClickedHandler)

            addChild(book);
            book.visible = false;

        }



        coverTimeLine = new CoverTimeLine();
        addChild(coverTimeLine);
        coverTimeLine.x = Starling.current.stage.stageWidth - 200;
        coverTimeLine.y = 25;

        updateBookPreview();

    }

    private function bookClickedHandler(event:TouchEvent):void {

        var touch:Touch = event.getTouch(stage);
        var book:Book = event.currentTarget as Book;
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

    private function coverChangedHandler(event:flash.events.Event):void {

        trace("selected cover" + appModel.selectedCover);
        updateBookPreview()

    }

    private function updateBookPreview():void{

        trace(book.bookVo.cover);
        trace(appModel.selectedCover.bookVO.cover);
        for each(book in appModel.books){
            if(book.bookVo.cover == appModel.selectedCover.bookVO.cover){
                book.visible = true;
            }else{
                book.visible = false;
            }
        }

    }
}
}
