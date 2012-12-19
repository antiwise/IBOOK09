package be.devine.cp3.factory.view
{

import be.devine.cp3.extensions.PixelMaskDisplayObject;

import flash.geom.Point;

import starling.display.Image;

import starling.display.Image;
    import starling.display.Quad;
    import starling.display.Sprite;
import starling.textures.Texture;

    public class ImageFactory
    {
        public static function createImage(config:Object):Sprite
        {
            var container:Sprite = new Sprite();
            var img:Image = new Image(config.texture);

            switch (config.style)
            {
                case "wide":
                    var qWide:Quad = new Quad( 441,  260, 0xFFFFFF);
                    container.addChild(qWide);

                    var maskedDisplayObjectWide:PixelMaskDisplayObject = maskImages(img, 393, 212);
                    container.addChild(maskedDisplayObjectWide);

                    return container;

                case "portrait":
                    var qPortrait:Quad = new Quad( 234,  314, 0xFFFFFF);
                    container.addChild(qPortrait);

                    var maskedDisplayObjectPortrait:PixelMaskDisplayObject = maskImages(img, 188, 268);
                    container.addChild(maskedDisplayObjectPortrait);
                    return container;

                case "fullscreen":
                    var maskedDisplayObjectFullScreen:PixelMaskDisplayObject = maskImages(img, 512, 718);
                    maskedDisplayObjectFullScreen.x = 0;
                    maskedDisplayObjectFullScreen.y = 0;
                    container.addChild(maskedDisplayObjectFullScreen);

                    return container;

                case "cover":
                    img.width = 550;
                    img.height = 550;

                    var qCover:Quad = new Quad( 333,  448, 0xFFFFFF);
                    container.addChild(qCover);
                    var maskedDisplayObjectCover:PixelMaskDisplayObject = maskImages(img, 285, 400);
                    container.addChild(maskedDisplayObjectCover);

                    return container;

                case "thumbnail":
                    var thumb:Image = new Image(config.texture);
                    thumb.width = 128;
                    thumb.height = 128;
                    container.addChild(thumb);

                    return container ;
            }
            return null;
        }

        private static function maskImages(img:Image, width:uint,  height:uint):PixelMaskDisplayObject
        {
            var maskedDisplayObject:PixelMaskDisplayObject = new PixelMaskDisplayObject();
            var myCustomMaskDisplayObject:Quad = new Quad(width,height);
            maskedDisplayObject.addChild(img);
            maskedDisplayObject.x = 12;
            maskedDisplayObject.y = 12;
            maskedDisplayObject.mask = myCustomMaskDisplayObject;
            return  maskedDisplayObject
        }
    }
}
