/**
 * Created with IntelliJ IDEA.
 * User: Ducaluk
 * Date: 28/09/12
 * Time: 08:59
 * To change this template use File | Settings | File Templates.
 */
package be.devine.cp3.util.Request
{
import flash.display.Loader;
import flash.display.Sprite;
import flash.events.Event;
import flash.net.URLLoader;
import flash.net.URLRequest;

public class Application extends Sprite
{
    private var _arrPaths:Array;
    private var _queue:Queue;
    private var _imageLoader:Loader;
    private var _iQuetask:IQueueTask;
    private var _xmlLoader:URLLoader;

    public function Application()
    {
        _queue = new Queue();
        _arrPaths = new Array("assets/images/bloem.jpg","assets/images/golven.jpg","assets/images/mooie_bloem.jpg");

        _xmlLoader = new URLLoader();
        _xmlLoader.addEventListener(Event.COMPLETE, xmlLoadedHandler);
        _xmlLoader.load(new URLRequest("assets/xml/images.xml"));
    }

    public function xmlLoadedHandler(event:Event):void
    {
        var xmlData:XML = new XML(event.target.data); // haal de data uit het event dat je meekrijgt wanneer de xml file is ingeladen en steek die in een variabele van het type XML

        for each(var imageNode:XML in xmlData.image) // voor iedere node persoon in de xml file... doe dit
        {
           _arrPaths.push(imageNode.path)// trace(imageNode.voornaam + " " + persoonNode.achternaam + " is " + persoonNode.leeftijd + " jaar oud");
        }

        for each(var path:String in _arrPaths)
        {
            _queue.add(path);
        }

        _queue.addEventListener(Queue.QUEUE_COMPLETE,queueCompleteHandler);
        _queue.start();
    }

    public function queueCompleteHandler(event:Event):void
    {
        for(var i:uint = 0;i< _queue.completedTasks.length;i++)
        {
            var spr:Sprite = new Sprite();

            spr.addChild(_queue.completedTasks[i]);
            spr.x = i*30;
            addChild(spr);

        }
       /* for each(var path:String in _arrPaths)
        {

        }
        addChild(_queue.completedImages);*/
    }
}
}
