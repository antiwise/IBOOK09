package be.devine.cp3.model
{
import flash.events.Event;
import flash.events.EventDispatcher;

    public class AppModel extends EventDispatcher
    {
        private static var instance:AppModel;
        public var pageVOS:Array;
        public var pages:Array;
        private var _currentPage:uint;
        private var _amountOfPages:uint;

        public static const PAGE_CHANGED:String = "PageChanged";



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

        public function get currentPage():uint {
            return _currentPage;
        }

        public function set currentPage(value:uint):void {
            _currentPage = value;
            dispatchEvent(new Event(PAGE_CHANGED));
        }

        public function nextPage():void
        {
            if(currentPage +2 != amountOfPages)
            {
                currentPage += 2;
            }

        }

        public function previousPage():void
        {
            if(currentPage != 0 )
            {
                currentPage -= 2;
            }
        }

        public function get amountOfPages():uint {
            return _amountOfPages;
        }

        public function set amountOfPages(value:uint):void {
            _amountOfPages = value;
        }
    }
}

internal class Enforcer{};
