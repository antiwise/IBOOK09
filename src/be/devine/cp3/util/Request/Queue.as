/**
 * Created with IntelliJ IDEA.
 * User: Ducaluk
 * Date: 28/09/12
 * Time: 09:21
 * To change this template use File | Settings | File Templates.
 */
package be.devine.cp3.util.Request
{
import flash.display.Loader;
import flash.display.Sprite;
import flash.events.Event;
import flash.net.URLRequest;

public class Queue extends Sprite
    {




        public static const QUEUE_COMPLETE:String = "QUEUE_COMPLETE";
        public static const QUEUE_PROGRESS:String = "QUEUE_PROGRESS";
        private var _imageLoader:Loader;
        private var _tasks:Array;
        private var totalImages:uint = 0;

        private var _imageLoaderTask:ImageLoaderTask;

        public var completedTasks:Array;

        private var _currentTask:IQueueTask;

        public function Queue()
        {
            _tasks = new Array();
            completedTasks = new Array();
        }

        public function add(path:String)
        {
            _tasks.push(path);
        }

        public function start()
        {
            if(_tasks.length > 0)
            {

                //_imageLoaderTask = new ImageLoaderTask(IQueueTask)
                //var iqueTask = IQueueTask();
               /* var pathUrl:String = _tasks.shift();
                _imageLoaderTask = new ImageLoaderTask(pathUrl);
                _imageLoaderTask.start();*/

                //trace("test");
                var pathUrl:String = _tasks.shift();
                _imageLoader = new Loader();
                _imageLoader.contentLoaderInfo.addEventListener(Event.COMPLETE, complete);
                _imageLoader.load(new URLRequest(pathUrl));
            }
            else
            {
                dispatchEvent(new Event(QUEUE_COMPLETE));
            }
        }

        public function complete(event:Event):void
        {
            trace("current loader complete");
            completedTasks.push(event.target.loader);

           // dispatchEvent(new ProgressEvent(ProgressEvent.PROGRESS,false,false,completedImages.length))  ;

            start();

        }
    }
}
