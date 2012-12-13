/**
 * Created with IntelliJ IDEA.
 * User: TatsBookPro
 * Date: 13/12/12
 * Time: 18:59
 * To change this template use File | Settings | File Templates.
 */
package be.devine.cp3.vo {
public class BookVO {
    public var edition:uint,
            pages:Vector.<PageVO>;

    public function BookVO(edition:uint)
    {
        pages = new Vector.<PageVO>();
        this.edition = edition;

    }
}
}
