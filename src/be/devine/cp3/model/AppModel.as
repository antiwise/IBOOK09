/**
 * Created with IntelliJ IDEA.
 * User: Ducaluk
 * Date: 23/11/12
 * Time: 11:20
 * To change this template use File | Settings | File Templates.
 */
package be.devine.cp3.model
{

import flash.events.Event;
import flash.events.EventDispatcher;
import flash.net.URLLoader;
import flash.net.URLRequest;
import be.devine.cp3.vo.PageVO;

public class AppModel extends EventDispatcher
    {
        private static var instance:AppModel;


        public function AppModel(e:Enforcer)
        {
            if(e == null)
            {
                throw new Error("Appmodel is a singleton");
            }
        }

        public static function getInstance():AppModel
        {
            if(instance == null)
            {
                instance = new AppModel(new Enforcer());
            }
            return instance;
        }

    }
}

internal class Enforcer{};
