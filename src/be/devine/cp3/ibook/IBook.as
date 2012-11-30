/**
 * Created with IntelliJ IDEA.
 * User: Ducaluk
 * Date: 29/11/12
 * Time: 15:13
 * To change this template use File | Settings | File Templates.
 */
package be.devine.cp3.ibook
{
    import be.devine.cp3.model.AppModel;
import be.devine.cp3.view.Page;

import flash.events.Event;

import starling.display.Sprite;
import starling.text.TextField;
import starling.utils.HAlign;
import starling.utils.VAlign;

public class IBook extends Sprite
    {
        private var _appModel:AppModel;

        public function IBook()
        {
           _appModel = AppModel.getInstance();
           _appModel.loadBook();

           _appModel.addEventListener(AppModel.XML_LOADED, XMLLoadedHandler) ;






        }

        private function XMLLoadedHandler(event:Event):void
        {
            var page:Page = new Page();
            addChild(page);
        }
    }
}
