/**
 * Created with IntelliJ IDEA.
 * User: Ducaluk
 * Date: 30/11/12
 * Time: 10:11
 * To change this template use File | Settings | File Templates.
 */
package be.devine.cp3.view
{
import be.devine.cp3.model.AppModel;
import be.devine.cp3.util.style.Style;

import flash.display.Bitmap;


import flash.display.Loader;
import flash.events.Event;
import flash.net.URLRequest;

import starling.display.Image;


import starling.display.Sprite;
import starling.text.TextField;
import starling.textures.Texture;
import starling.utils.HAlign;
import starling.utils.VAlign;

public class Page extends Sprite
    {
        private var _appModel:AppModel;
        private var _imageLoader:Loader;

        public function Page()
        {
            _appModel = AppModel.getInstance();

            _imageLoader = new Loader();
            _imageLoader.contentLoaderInfo.addEventListener(Event.COMPLETE, completeEventHandler)
            _imageLoader.load(new URLRequest("assets/images/"+_appModel.arrPages[0].image));

           // var texture:Texture = Texture.fromBitmapData()

        }

        private function completeEventHandler(e:Event)
        {
              // trace("imageLOaded");

            var loadedBitmap:Bitmap = e.currentTarget.loader.content as Bitmap;

            var texture:Texture = Texture.fromBitmap(loadedBitmap);
            var img:Image = new Image(texture);
            addChild(img);

            var starlingTextField:starling.text.TextField = Style.makeTextfield("Hallo Wereld","h1");
            addChild(starlingTextField);


          /*  var starlingTextField:starling.text.TextField = new starling.text.TextField
                    (480,50,"Lorem ipsum dolor sit amet","Bitter-Bold",12,0x182C49,false);
            starlingTextField.hAlign = HAlign.LEFT;
            starlingTextField.vAlign = VAlign.TOP;
            addChild(starlingTextField);           */

          /*  var image:Image = new Image(Texture.fromBitmap(_imageLoader as Bitmap));
            addChild(image);*/

        }
    }
}
