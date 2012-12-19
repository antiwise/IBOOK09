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
        private static var instance:AppModel;
        private var _bookVOS:Vector.<BookVO>,
                    _selectedBook:Book,
                    _books:Vector.<Book>,
                    _covers:Vector.<BookCover>,
                    _currentPage:uint = 0,
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

        public function nextPage():void
        {
            if(currentPage +2 < amountOfPages)
            {
                direction = "next";
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
            if(currentPage < pageNumber)
            {
                direction = "next";
            }
            else
            {
                direction = "prev";
            }

            currentPage = pageNumber;

            if(currentPage%2 != 0)
            {
                currentPage = currentPage -1;
            }
        }

        public function nextCover():void
        {
            if((covers.indexOf(selectedCover, 0)) +1 != covers.length)
            {
                var nextCover:uint = (covers.indexOf(selectedCover, 0)) +1;
                selectedCover = covers[nextCover];
            }
        }

        public function prevCover():void
        {
            if((covers.indexOf(selectedCover, 0)) != 0)
            {
                var prevCover:uint = (covers.indexOf(selectedCover, 0)) -1;
                selectedCover = covers[prevCover];
            }
        }

        /* GETTERS & SETTERS */

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

        public function get showBookPreview():Boolean
        {
            return _showBookPreview;
        }

        public function set showBookPreview(value:Boolean):void
        {
            if (value != _showBookPreview)
            {
                _showBookPreview = value;
                //_showBookPreview != _showPages;
                dispatchEvent(new Event(BOOKPREVIEW_CHANGED));
            }
        }

        public function get showPages():Boolean
        {
            return _showPages;
        }

        public function set showPages(value:Boolean):void
        {
            if (value != _showPages)
            {
                _showPages = value;
                //_showPages != _showBookPreview;
                dispatchEvent(new Event(SHOWPAGES_CHANGED));
            }
        }

        public function get currentPage():uint
        {
            return _currentPage;
        }

        public function set currentPage(value:uint):void
        {
            if(currentPage < amountOfPages && currentPage >= 0)
            {
                _currentPage = value;
                dispatchEvent(new Event(PAGE_CHANGED));
            }
        }

        public function get selectedCover():BookCover
        {
            return _selectedCover;
        }

        public function set selectedCover(value:BookCover):void
        {
            if(_selectedCover != value)
            {
                _selectedCover = value;
                dispatchEvent(new Event(SELECTEDCOVER_CHANGED));
            }
        }



        public function get bookVOS():Vector.<BookVO>
        {
            return _bookVOS;
        }

        public function set bookVOS(value:Vector.<BookVO>):void
        {
            if (_bookVOS != value)
            {
                _bookVOS = value;
            }
        }

        public function get selectedBook():Book
        {
            return _selectedBook;
        }

        public function set selectedBook(value:Book):void
        {
            if(_selectedBook != value)
            {
                _selectedBook = value;
            }
        }

        public function get books():Vector.<Book>
        {
            return _books;
        }

        public function set books(value:Vector.<Book>):void
        {
            if(_books != value)
            {
                _books = value;
            }
        }

        public function get covers():Vector.<BookCover>
        {
            return _covers;
        }

        public function set covers(value:Vector.<BookCover>):void
        {
            if(_covers != value)
            {
                _covers = value;
            }
        }
    }
}

internal class Enforcer{}
