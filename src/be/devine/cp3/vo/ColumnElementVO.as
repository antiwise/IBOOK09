package be.devine.cp3.vo
{
    public class ColumnElementVO extends ElementVO
    {
        public var position:String,
                   textElements:Vector.<TextElementVO>;

        public function ColumnElementVO()
        {
            textElements = Vector.<TextElementVO>([]);
        }
    }
}
