package be.devine.cp3.factory.vo
{
import be.devine.cp3.vo.PageVO;

public class PageVOFactory
    {
        public static function createPageVOFromXML(pageXML:XML)
        {
            var pageVO:PageVO = new PageVO();
            for each(var elementXML:XML in pageXML.element)
            {
                pageVO.elements.push(ElementVOFactory.createElementVOFromXML(elementXML));
               // ..trace("test");
            }
            /*pageVO.page = pageXML.pageNumber.@page;
            pageVO.page = pageXML.page.@template;  */
              //trace(pageXML.pageNumber.@page);


           /* pageVO.page =  page.pageNumber.@page;
            pageVO.template = page.@template;   */
            //for each(var elementXML:XML in pageXML.)
           // for each(var elementXML:XML in pageXML.elements())

        }
    }
}
