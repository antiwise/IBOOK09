package be.devine.cp3.vo
{
    public class BookVO
    {
        public var edition:uint,
                pages:Vector.<PageVO>,
                cover:String,
                title:String,
                date:String,
                description:String;

        public function BookVO(edition:uint)
        {
            pages = new Vector.<PageVO>();
            this.edition = edition;

        }
    }
}
