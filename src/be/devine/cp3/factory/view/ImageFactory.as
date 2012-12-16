package be.devine.cp3.factory.view
{

    import starling.display.Image;
    import starling.display.Quad;
    import starling.display.Sprite;

    public class ImageFactory
    {
        public static function createImage(config:Object):Sprite
        {
            switch (config.style)
            {
                case "wide":
                    var container:Sprite = new Sprite();
                    var img:Image = new Image(config.texture);

                    var q:Quad = new Quad( 443,  262, 0xFFFFFF);
                    container.addChild(q);
                    container.addChild(img);
                    img.x = 25;
                    img.y = 25;
                    img.width = 393;
                    img.height = 212;

                    return container;

                case "portrait":
                    var container:Sprite = new Sprite();
                    var img:Image = new Image(config.texture);

                    var q:Quad = new Quad( 238,  318, 0xFFFFFF);
                    container.addChild(q);
                    container.addChild(img);
                    img.x = 25;
                    img.y = 25;

                    return container;

                case "fullscreen":
                    var container:Sprite = new Sprite();
                    var img:Image = new Image(config.texture);
                    container.addChild(img);

                    return container;

                case "cover":
                    var container:Sprite = new Sprite();
                    var img:Image = new Image(config.texture);
                    img.height = 400;
                    img.width = 285;
                    img.x = 25;
                    img.y = 25;
                    var q:Quad = new Quad( 335,  450, 0xFFFFFF);
                    container.addChild(q);
                    container.addChild(img);

                    return container;
            }
            return null;
        }
    }
}
