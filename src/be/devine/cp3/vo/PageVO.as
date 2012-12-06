package be.devine.cp3.vo
{
    public class PageVO
    {
        public var template:Number;
        public var elements:Vector.<ElementVO>;

        public function PageVO()
        {
            elements = new Vector.<ElementVO>();
        }
    }
}
