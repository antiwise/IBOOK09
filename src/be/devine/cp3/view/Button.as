/**
 * Created with IntelliJ IDEA.
 * User: Ducaluk
 * Date: 11/12/12
 * Time: 22:59
 * To change this template use File | Settings | File Templates.
 */
package be.devine.cp3.view
{
import starling.display.Image;
import starling.display.Sprite;
import starling.textures.Texture;
import starling.textures.TextureAtlas;

public class Button extends Sprite
    {
        public function Button(textureAtlas:TextureAtlas,imageUrl:String)
        {
            var buttonTex:Texture = textureAtlas.getTexture(imageUrl);
            var ButtonImg:Image = new Image(buttonTex);
            addChild(ButtonImg);
            ButtonImg.useHandCursor = true;
        }
    }
}
