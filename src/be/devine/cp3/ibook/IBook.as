/**
 * Created with IntelliJ IDEA.
 * User: Ducaluk
 * Date: 29/11/12
 * Time: 15:13
 * To change this template use File | Settings | File Templates.
 */
package be.devine.cp3.ibook
{
    import be.devine.cp3.model.AppModel;
    import starling.display.Sprite;

    public class IBook extends Sprite
    {
        private var _appModel:AppModel;

        public function IBook()
        {
           _appModel = AppModel.getInstance();
            _appModel.loadBook();
        }
    }
}
