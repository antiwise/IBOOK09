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
