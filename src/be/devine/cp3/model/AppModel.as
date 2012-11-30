/**
 * Created with IntelliJ IDEA.
 * User: Ducaluk
 * Date: 23/11/12
 * Time: 11:20
 * To change this template use File | Settings | File Templates.
 */
package be.devine.cp3.model
{

import flash.events.Event;
import flash.events.EventDispatcher;
import flash.net.URLLoader;
import flash.net.URLRequest;
import be.devine.cp3.vo.PageVO;

public class AppModel extends EventDispatcher
    {
        private static var instance:AppModel;
        private var _xmlLoader:URLLoader;

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
        }
    }
}

internal class Enforcer{};
