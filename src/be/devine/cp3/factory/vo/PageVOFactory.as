package be.devine.cp3.factory.vo
{
    import be.devine.cp3.vo.PageVO;

    public class PageVOFactory
    {
        public static function createPageVOFromXML(pageXML:XML):PageVO
        {

            var pageVO:PageVO = new PageVO(pageXML.@template);
            for each(var elementXML:XML in pageXML.element)
            {
                pageVO.elements.push(ElementVOFactory.createElementVOFromXML(elementXML));
            }
            return pageVO;
        }
    }
}
