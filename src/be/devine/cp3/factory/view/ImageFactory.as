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
            switch (config.style)
            {
                case "wide":
                    var container:Sprite = new Sprite();

                    var img:Image = new Image(config.texture);
                    var q:Quad = new Quad( 441,  260, 0xFFFFFF);
                    container.addChild(q);

                    var maskedDisplayObject:PixelMaskDisplayObject = maskImages(img, 393, 212);
                    container.addChild(maskedDisplayObject);

                    return container;

                case "portrait":
                    var container:Sprite = new Sprite();
                    var img:Image = new Image(config.texture);

                    var q:Quad = new Quad( 234,  314, 0xFFFFFF);
                    container.addChild(q);

                    var maskedDisplayObject:PixelMaskDisplayObject = maskImages(img, 188, 268);
                    container.addChild(maskedDisplayObject);
                    return container;

                case "fullscreen":
                    var container:Sprite = new Sprite();
                    var img:Image = new Image(config.texture);

                    var myCustomMaskDisplayObject:Quad = new Quad(512,718);
                    var maskedDisplayObject:PixelMaskDisplayObject = maskImages(img, 512, 718);
                    maskedDisplayObject.x = 0;
                    maskedDisplayObject.y = 0;
                    container.addChild(maskedDisplayObject);

                    return container;

                case "cover":
                    var container:Sprite = new Sprite();
                    var img:Image = new Image(config.texture);
                    img.width = 550;
                    img.height = 550;

                    var q:Quad = new Quad( 333,  448, 0xFFFFFF);
                    container.addChild(q);

                    var myCustomMaskDisplayObject:Quad = new Quad(285,400);
                    var maskedDisplayObject:PixelMaskDisplayObject = maskImages(img, 285, 400);

                    container.addChild(maskedDisplayObject);
                    return container;
            }
            return null;
        }

    private static function maskImages(img:Image, width:uint,  height:uint):PixelMaskDisplayObject{
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
