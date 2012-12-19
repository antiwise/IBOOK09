package be.devine.cp3.model
{
import be.devine.cp3.view.Book;
import be.devine.cp3.view.BookCover;
import be.devine.cp3.vo.BookVO;
import be.devine.cp3.vo.PageVO;

import flash.events.Event;
    import flash.events.EventDispatcher;

    public class AppModel extends EventDispatcher
    {
        //TODO: Public vars veranderen door getters en setters
        private static var instance:AppModel;
        public var pageVOS:Vector.<PageVO>,
                   pages:Array,
                   thumbnailPages:Array,
                   bookVOS:Vector.<BookVO>,
                   selectedBook:Book,
                   books:Vector.<Book>,
                   covers:Vector.<BookCover>;
        private var _currentPage:uint,
                _amountOfPages:uint,
                _direction:String = "next",
                _showTimeline:Boolean = false,
                _showBookPreview:Boolean = true,
                _showPages:Boolean = false,
                _selectedCover:BookCover;

        public static const PAGE_CHANGED:String = "PageChanged";
        public static const TIMELINE_CHANGED:String = "TimelineChanged";
        public static const BOOKPREVIEW_CHANGED:String = "BookPreviewChanged";
        public static const SHOWPAGES_CHANGED:String = "ShowPagesChanged";
        public static const SELECTEDCOVER_CHANGED:String = "SelectedCoverChanged";



        public function AppModel(e:Enforcer)
        {
            if(e == null)
            {
                throw new Error("Appmodel is a singleton");
            }
        }

        public static function getInstance():AppModel
        {
            if(instance == null)
            {
                instance = new AppModel(new Enforcer());
            }
            return instance;
        }

        public function get currentPage():uint
        {
            return _currentPage;
        }

        public function set currentPage(value:uint):void
        {
            _currentPage = value;
            dispatchEvent(new Event(PAGE_CHANGED));
        }

        public function nextPage():void
        {
            if(currentPage +2 != amountOfPages)
            { direction = "next";
                currentPage += 2;

            }
        }

        public function previousPage():void
        {
            if(currentPage != 0 )
            {
                direction = "prev";
                currentPage -= 2;
            }
        }

        public function gotoPage(pageNumber:uint):void
        {
            if (currentPage < pageNumber)
            {
                direction = "next";
            }
            else
            {
                direction = "prev";
            }

            currentPage = pageNumber;

            if (currentPage%2 != 0)
            {
                currentPage = currentPage -1;
            }
        }


        public function get amountOfPages():uint
        {
            return _amountOfPages;
        }

        public function set amountOfPages(value:uint):void
        {
            _amountOfPages = value;
        }

        public function get direction():String
        {
            return _direction;
        }

        public function set direction(value:String):void
        {
            _direction = value;
        }


        public function get showTimeline():Boolean
        {
            return _showTimeline;
        }

        public function set showTimeline(value:Boolean):void
        {
            if (value != _showTimeline)
            {
                _showTimeline = value;
                dispatchEvent(new Event(TIMELINE_CHANGED));
            }
        }

        public function get showBookPreview():Boolean {
            return _showBookPreview;
        }

        public function set showBookPreview(value:Boolean):void {
            //trace("showBooKPreview " + value);
            if (value != _showBookPreview)
            {
                _showBookPreview = value;
                _showBookPreview != _showPages;
                dispatchEvent(new Event(BOOKPREVIEW_CHANGED));
            }
        }

        public function get showPages():Boolean {
            return _showPages;
        }

        public function set showPages(value:Boolean):void {
            //trace("showpages " + value);
            if (value != _showPages)
            {
               // trace ("in appmodel: showpages")
                _showPages = value;
                _showPages != _showBookPreview;
                dispatchEvent(new Event(SHOWPAGES_CHANGED));



            }
        }

        public function get selectedCover():BookCover {
            return _selectedCover;
        }

        public function set selectedCover(value:BookCover):void {
            if(_selectedCover != value){
                _selectedCover = value
                dispatchEvent(new Event(SELECTEDCOVER_CHANGED));
            }
        }
    }
}

internal class Enforcer{};
