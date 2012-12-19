package be.devine.cp3.factory.vo
{
    import be.devine.cp3.model.AppModel;
    import be.devine.cp3.vo.BookVO;

    public class BookVOFactory
    {
        private var appModel:AppModel;

        public static function createBookVOFromXML(bookXml:XML):BookVO
        {
            var bookVO:BookVO = new BookVO(bookXml.@edition);
            bookVO.cover = bookXml.bookinfo.cover;
            bookVO.title = bookXml.bookinfo.title.text();
            bookVO.description = bookXml.bookinfo.description;
            bookVO.date = bookXml.bookinfo.date;

            for each(var pageXML:XML in bookXml.page)
            {
                bookVO.pages.push(PageVOFactory.createPageVOFromXML(pageXML));
            }
            return bookVO;
        }
    }
}
