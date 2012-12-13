/**
 * Created with IntelliJ IDEA.
 * User: Ducaluk
 * Date: 12/12/12
 * Time: 19:40
 * To change this template use File | Settings | File Templates.
 */
package be.devine.cp3.view
{
import starling.display.Quad;
import starling.display.Sprite;

public class Thumbnail extends Sprite
{
    private var thumbnail:Page;
    public function Thumbnail(thumbnailPreview:Page)
    {

        this.thumbnail = thumbnailPreview;

        var q:Quad = new Quad(100,140,0xffffff);
        addChild(q);

        thumbnail.scaleX = thumbnail.scaleY = 0.2;



        addChild(thumbnail);

    }
}
}
