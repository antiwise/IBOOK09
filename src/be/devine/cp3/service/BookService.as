/**
 * Created with IntelliJ IDEA.
 * User: TatsBookPro
 * Date: 3/12/12
 * Time: 11:58
 * To change this template use File | Settings | File Templates.
 */
package be.devine.cp3.service {


import flash.events.Event;
import flash.events.EventDispatcher;
import flash.net.URLLoader;
import flash.net.URLRequest;
import be.devine.cp3.vo.PageVO;


public class BookService extends EventDispatcher {

    private var _xmlLoader:URLLoader;
    public static const XML_LOADED:String = "xmlLoaded";

    public function BookService() {
    }



    public function loadBook():void
    {
        _xmlLoader = new URLLoader();
        _xmlLoader.addEventListener(Event.COMPLETE, xmlLoaderCompleteHandler);
        _xmlLoader.load(new URLRequest("assets/xml/book.xml"));
        //var songsXMLLoader:URLLoader = new URLLoader();
        /*songsXMLLoader.addEventListener(Event.COMPLETE, songsXMLLoaderCompleteHandler);
         songsXMLLoader.load(new URLRequest("assets/xml/songs.xml"));*/
    }

    private function xmlLoaderCompleteHandler(event:Event):void
    {
        var bookXML:XML = new XML(event.target.data);
        var pages:Array = new Array();
        for each(var page:Object in bookXML.page)
        {
            var pageVO:PageVO = new PageVO();
            pageVO.page =  page.pageNumber.@page;
            pageVO.template = page.@template;

            // trace(pageVO.page);
            //trace(pageVO.template);

            if(page.@template == 2)
            {
                if(page.title.@size == 1)
                {
                    pageVO.h1 = page.title;
                }
                if(page.title.@size == 2)
                {
                    pageVO.h2 = page.title;
                }



                trace(page.title);
            }

            pages.push(pageVO);

        }

        dispatchEvent(new Event(Event.COMPLETE));

    }

}
}
