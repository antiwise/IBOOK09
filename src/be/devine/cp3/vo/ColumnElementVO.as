/**
 * Created with IntelliJ IDEA.
 * User: TatsBookPro
 * Date: 6/12/12
 * Time: 16:20
 * To change this template use File | Settings | File Templates.
 */
package be.devine.cp3.vo {
public class ColumnElementVO extends ElementVO {

    public var position:String,
            textElements:Vector.<TextElementVO>;

    public function ColumnElementVO() {
        textElements = Vector.<TextElementVO>([]);
    }
}
}
