package be.devine.cp3.view
{
    import be.devine.cp3.factory.view.ImageFactory;
    import be.devine.cp3.vo.ImageElementVO;

    import flash.display.Bitmap;

    import flash.display.Loader;
    import flash.events.Event;
import flash.net.URLLoader;
import flash.net.URLLoaderDataFormat;
import flash.net.URLRequest;
import flash.utils.ByteArray;

import starling.display.Image;

import starling.display.Sprite;
    import starling.textures.Texture;

    public class ImageElement extends Element
    {

        private var ldr:URLLoader;
        private var imageElementVO:ImageElementVO;

        public function ImageElement(imageElementVO:ImageElementVO)
        {
            super(imageElementVO);
            this.imageElementVO = imageElementVO;


            ldr = new URLLoader();
            ldr.dataFormat = URLLoaderDataFormat.BINARY;
            ldr.addEventListener(Event.COMPLETE, imageLoadedHandler);
            ldr.load(new URLRequest("assets/images/"+imageElementVO.url));
        }

        private function imageLoadedHandler(e:Event)
        {
            var texture:Texture = Texture.fromAtfData(ldr.data as ByteArray);
            var img:Sprite =  ImageFactory.createImage({
                style: imageElementVO.style,
                texture: texture
            });
            addChild(img);


        }
    }
}
