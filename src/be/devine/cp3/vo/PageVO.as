/**
 * Created with IntelliJ IDEA.
 * User: Ducaluk
 * Date: 29/11/12
 * Time: 19:47
 * To change this template use File | Settings | File Templates.
 */
package be.devine.cp3.vo
{
    public class PageVO
    {

        public var template:Number;
        public var h1:String;
        public var h2:String;
        public var page:Number;
        public var image:String;

        public var elements:Vector.<ElementVO>;

        public function PageVO()
        {
            elements = new Vector.<ElementVO>();
        }
    }
}
