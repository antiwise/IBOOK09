package be.devine.cp3.vo
{
    public class PageVO
    {
        public var template:uint;
        public var elements:Vector.<ElementVO>;
        public var cover:String;

        public function PageVO(template:uint)
        {
            elements = new Vector.<ElementVO>();
            this.template = template;
        }
    }
}
