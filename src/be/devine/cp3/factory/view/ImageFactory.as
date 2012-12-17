package be.devine.cp3.factory.view
{

import be.devine.cp3.extensions.PixelMaskDisplayObject;

import flash.geom.Point;

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


                        //TODO: in aparte functie best?
                    var myCustomMaskDisplayObject:Quad = new Quad(393,212);
                    var maskedDisplayObject:PixelMaskDisplayObject = new PixelMaskDisplayObject();
                    maskedDisplayObject.addChild(img);
                    maskedDisplayObject.x = 12;
                    maskedDisplayObject.y = 12;

                    maskedDisplayObject.mask = myCustomMaskDisplayObject;
                    container.addChild(maskedDisplayObject);

                    return container;

                case "portrait":
                    var container:Sprite = new Sprite();
                    var img:Image = new Image(config.texture);

                    var q:Quad = new Quad( 236,  316, 0xFFFFFF);
                    container.addChild(q);


                    var myCustomMaskDisplayObject:Quad = new Quad(188,268);
                    var maskedDisplayObject:PixelMaskDisplayObject = new PixelMaskDisplayObject();
                    maskedDisplayObject.addChild(img);
                    maskedDisplayObject.x = 12;
                    maskedDisplayObject.y = 12;
                   maskedDisplayObject.mask = myCustomMaskDisplayObject;
                    container.addChild(maskedDisplayObject);
                    return container;

                case "fullscreen":
                    var container:Sprite = new Sprite();
                    var img:Image = new Image(config.texture);

                    var myCustomMaskDisplayObject:Quad = new Quad(512,718);
                    var maskedDisplayObject:PixelMaskDisplayObject = new PixelMaskDisplayObject();
                    maskedDisplayObject.addChild(img);
                    maskedDisplayObject.mask = myCustomMaskDisplayObject;
                    container.addChild(maskedDisplayObject);

                    return container;

                case "cover":
                    var container:Sprite = new Sprite();
                    var img:Image = new Image(config.texture);
                    //img.height = 400;
                    //img.width = 285;

                    var q:Quad = new Quad( 333,  448, 0xFFFFFF);
                    container.addChild(q);


                    var myCustomMaskDisplayObject:Quad = new Quad(285,400);
                    var maskedDisplayObject:PixelMaskDisplayObject = new PixelMaskDisplayObject();
                    maskedDisplayObject.addChild(img);
                    maskedDisplayObject.x = 12;
                    maskedDisplayObject.y = 12;
                    maskedDisplayObject.mask = myCustomMaskDisplayObject;
                    container.addChild(maskedDisplayObject);

                    return container;
            }
            return null;
        }
    }
}
