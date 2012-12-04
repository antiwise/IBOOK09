/**
 * Created with IntelliJ IDEA.
 * User: TatsBookPro
 * Date: 3/12/12
 * Time: 11:53
 * To change this template use File | Settings | File Templates.
 */
package be.devine.cp3.view {
import be.devine.cp3.vo.ImageElementVO;

import flash.display.Bitmap;

import flash.display.Loader;
import flash.events.Event;
import flash.net.URLRequest;

import starling.display.Image;

import starling.display.Quad;
import starling.textures.Texture;

public class ImageElement extends Element{

    private var ldr:Loader;

    public function ImageElement(imageElementVO:ImageElementVO) {
       super(imageElementVO);


        var q:Quad = new Quad( imageElementVO.width + 50,  imageElementVO.height + 50, 0xFFFFFF)
       addChild(q);

        ldr = new Loader();
        ldr.contentLoaderInfo.addEventListener(Event.COMPLETE, imageLoadedHandler);
        ldr.load(new URLRequest(imageElementVO.url));
    }


    private function imageLoadedHandler(e:Event)
    {
        // trace("imageLOaded");

        var loadedBitmap:Bitmap = e.currentTarget.loader.content as Bitmap;

        var texture:Texture = Texture.fromBitmap(loadedBitmap);
        var img:Image = new Image(texture);
        addChild(img);



    }
}
}
