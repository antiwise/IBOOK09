package be.devine.cp3.service
{
    import be.devine.cp3.factory.vo.BookVOFactory;
    import be.devine.cp3.model.AppModel;
    import be.devine.cp3.vo.BookVO;
    import be.devine.cp3.vo.PageVO;
    import flash.events.Event;
    import flash.events.EventDispatcher;
    import flash.net.URLLoader;
    import flash.net.URLRequest;

    public class BookService extends EventDispatcher
    {
        private var _xmlLoader:URLLoader,
                    appModel:AppModel;
        public static const XML_LOADED:String = "xmlLoaded";

        public function BookService()
        {
            appModel = AppModel.getInstance();
        }

        public function loadBook():void
        {
            _xmlLoader = new URLLoader();
            _xmlLoader.addEventListener(Event.COMPLETE, xmlLoaderCompleteHandler);
            _xmlLoader.load(new URLRequest("assets/xml/book.xml"));
        }

        private function xmlLoaderCompleteHandler(event:Event):void
        {
            var booksXML:XML = new XML(event.target.data);

            appModel.bookVOS = new Vector.<BookVO>;
            appModel.pageVOS = new Vector.<PageVO>;

            for each (var bookXML:XML in booksXML.book)
            {
                appModel.bookVOS.push(BookVOFactory.createBookVOFromXML(bookXML));

            }

            dispatchEvent(new Event(XML_LOADED));
        }
    }
}
