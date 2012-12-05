package be.devine.cp3.view
{
import be.devine.cp3.factory.view.ImageFactory;
import be.devine.cp3.factory.view.TextFieldFactory;
import be.devine.cp3.model.AppModel;


import flash.display.Bitmap;


import flash.display.Loader;
import flash.events.Event;
import flash.geom.Rectangle;
import flash.net.URLRequest;

import starling.display.Image;
import starling.display.Quad;


import starling.display.Sprite;
import starling.text.TextField;
import starling.textures.Texture;
import starling.utils.HAlign;
import starling.utils.VAlign;



public class Page extends Sprite
    {
        private var _appModel:AppModel;
        private var _imageLoader:Loader;
        private var _imageLoader2:Loader;

        public function Page()
        {
            _appModel = AppModel.getInstance();

           _imageLoader = new Loader();
            _imageLoader.contentLoaderInfo.addEventListener(Event.COMPLETE, completeEventHandler)
           // _imageLoader.load(new URLRequest("assets/images/"+_appModel.arrPages[0].image));
            _imageLoader.load(new URLRequest("assets/images/image_02.jpg"));

            _imageLoader2 = new Loader();
            _imageLoader2.contentLoaderInfo.addEventListener(Event.COMPLETE, completeEventHandler2)
            // _imageLoader.load(new URLRequest("assets/images/"+_appModel.arrPages[0].image));
            _imageLoader2.load(new URLRequest("assets/images/image_04.jpg"));

        }

        private function completeEventHandler(e:Event)
        {
              // trace("imageLOaded");

            var loadedBitmap:Bitmap = e.currentTarget.loader.content as Bitmap;

            var texture:Texture = Texture.fromBitmap(loadedBitmap);
            var img:Sprite =  ImageFactory.createImage({
                style: "wide",
                texture: texture
            })

            addChild(img);
            img.x = 512 + 30
            img.y = 25;


            var textFieldH1:TextField = TextFieldFactory.createTextField({
                        //hierin teksttype meegeven
                        text: "Dit is een mega mega mega langeeeeeeeeeeee h1 om te testen of die dat mooi afsplitst afsplitst afsplitst afsplitst afsplitst",
                        fontFormat: "h1"
                    }
            )
            textFieldH1.x = 25;
            textFieldH1.y = 25;
            addChild(textFieldH1)

            var q:Quad = new Quad(100,8, 0x182C49)
            q.y = textFieldH1.y + textFieldH1.height
            q.x = 25;
            addChild(q);


            var textFieldH2:TextField = TextFieldFactory.createTextField({
                        //hierin teksttype meegeven
                        text: "Dit is een h2",
                        fontFormat: "h2"
                    }
            )

            textFieldH2.y = q.height + q.y + 30;
            textFieldH2.x = 25;

            addChild(textFieldH2)


            var textFieldH3:TextField = TextFieldFactory.createTextField({
                        //hierin teksttype meegeven
                        text: "Dit is een h3",
                        fontFormat: "h3"
                    }
            )

            textFieldH3.y = textFieldH2.y + textFieldH2.height ;
            textFieldH3.x = 25;


            addChild(textFieldH3)


            var textFieldPitalic:TextField = TextFieldFactory.createTextField({
                        //hierin teksttype meegeven
                        text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec id elit non mi porta gravida at eget metus. Maecenas sed diam eget risus varius blandit sit amet non magna. Cras justo odio, dapibus ac facilisis in, egestas eget quam. Duis mollis, est non commodo luctus, nisi erat porttitor ligula, eget lacinia odio sem nec elit.",
                        fontFormat: "p-italic"
                    }
            )

            textFieldPitalic.y = textFieldH3.y + textFieldH3.height;
            textFieldPitalic.x = 25;


            addChild(textFieldPitalic)


            var textFieldPNormal:TextField = TextFieldFactory.createTextField({
                        //hierin teksttype meegeven
                        text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec id elit non mi porta gravida at eget metus. Maecenas sed diam eget risus varius blandit sit amet non magna. Cras justo odio, dapibus ac facilisis in, egestas eget quam. Duis mollis, est non commodo luctus, nisi erat porttitor ligula, eget lacinia odio sem nec elit.",
                        fontFormat: "p-normal"
                    }
            )

            textFieldPNormal.y = textFieldPitalic.y;
            textFieldPNormal.x = textFieldPitalic.x + textFieldPitalic.width + 20;


            addChild(textFieldPNormal)


        }


    private function completeEventHandler2(e:Event)
    {

        var loadedBitmap:Bitmap = e.currentTarget.loader.content as Bitmap;

        var texture:Texture = Texture.fromBitmap(loadedBitmap);
        var img:Sprite =  ImageFactory.createImage({
            style: "portrait",
            texture: texture
        })

        addChild(img);
        img.x = 512 + 30
        img.y = 300;

    }


}





}
