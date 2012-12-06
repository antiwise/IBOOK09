package be.devine.cp3.model
{
    import flash.events.EventDispatcher;

    public class AppModel extends EventDispatcher
    {
        private static var instance:AppModel;
        public var pages:Array;



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
