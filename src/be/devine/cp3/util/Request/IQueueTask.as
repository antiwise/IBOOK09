/**
 * Created with IntelliJ IDEA.
 * User: Ducaluk
 * Date: 28/09/12
 * Time: 11:22
 * To change this template use File | Settings | File Templates.
 */
package be.devine.cp3.util.Request
{
import flash.events.IEventDispatcher;

public interface IQueueTask extends IEventDispatcher
    {
        function start();
    }
}
