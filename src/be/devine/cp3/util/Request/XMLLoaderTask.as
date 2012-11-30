/**
 * Created with IntelliJ IDEA.
 * User: Ducaluk
 * Date: 28/09/12
 * Time: 11:28
 * To change this template use File | Settings | File Templates.
 */
package be.devine.cp3.util.Request {
import flash.display.Loader;
import flash.events.Event;
import flash.net.URLRequest;

public class XMLLoaderTask extends Loader implements IQueueTask
{
    private var _imageURL:String;

    public function XMLLoaderTask(imageURL:String)
    {
        _imageURL = imageURL;
    }

    public function start()
    {
        this.contentLoaderInfo.addEventListener(Event.COMPLETE, completeEventHandler)
        this.load(new URLRequest(_imageURL));
    }

    public function completeEventHandler(event:Event)
    {
        trace("complete");
        //this.dispatchEvent(new ProgressEvent(ProgressEvent))
    }
}
}
