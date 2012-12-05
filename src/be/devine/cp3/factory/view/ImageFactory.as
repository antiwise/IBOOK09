/**
 * Created with IntelliJ IDEA.
 * User: TatsBookPro
 * Date: 4/12/12
 * Time: 14:53
 * To change this template use File | Settings | File Templates.
 */
package be.devine.cp3.factory.view {

import starling.display.Image;
import starling.display.Quad;
import starling.display.Sprite;

import starling.textures.Texture;
public class ImageFactory {
    public static function createImage(config:Object):Sprite {

        // TODO: switch op 'textType'

        switch (config.style){

            case "wide":

                var container:Sprite = new Sprite();
                var img:Image = new Image(config.texture);

                var q:Quad = new Quad( 443,  262, 0xFFFFFF)
                container.addChild(q);
                container.addChild(img)
                img.x = 25;
                img.y = 25;

                return container;
               break;

            case "portrait":

                var container:Sprite = new Sprite();
                var img:Image = new Image(config.texture);

                var q:Quad = new Quad( 238,  318, 0xFFFFFF)
                container.addChild(q);
                container.addChild(img)
                img.x = 25;
                img.y = 25;

                return container;
                break;
        }

        return null;

    }
}
}
