package be.devine.cp3.view
{
    import be.devine.cp3.factory.view.ImageFactory;
    import be.devine.cp3.vo.ImageElementVO;

    import flash.display.Bitmap;

    import flash.display.Loader;
    import flash.events.Event;
    import flash.net.URLRequest;

    import starling.display.Sprite;
    import starling.textures.Texture;

    public class ImageElement extends Element
    {

        private var ldr:Loader;
        private var _imageElementVO:ImageElementVO;

        public function ImageElement(imageElementVO:ImageElementVO)
        {
            super(imageElementVO);
            this._imageElementVO = imageElementVO;

            ldr = new Loader();
            ldr.contentLoaderInfo.addEventListener(Event.COMPLETE, imageLoadedHandler);
            ldr.load(new URLRequest("assets/images/"+_imageElementVO.url));
        }

        private function imageLoadedHandler(e:Event)
        {
            var loadedBitmap:Bitmap = e.currentTarget.loader.content as Bitmap;

            var texture:Texture = Texture.fromBitmap(loadedBitmap);
            var img:Sprite =  ImageFactory.createImage({
                style: _imageElementVO.style,
                texture: texture
            });
            addChild(img);
        }
    }
}
