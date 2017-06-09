package projet;

import org.jdom2.Document;
import org.jdom2.Element;
import org.jdom2.JDOMException;
import org.jdom2.input.SAXBuilder;

import java.io.IOException;
import java.util.List;

/**
 * Created by ouahab on 16/03/2017.
 */
public class item{
        public static List recup_item(int id)
        {
            try {
                SAXBuilder builder = new SAXBuilder();
                Document document = (Document) builder.build("carnet.xml");
                Element rootNode = document.getRootElement();
                List<Element> list = rootNode.getChildren("personne");
                List<Element> list2 = list.get(id-1).getChild("Items").getChildren();
                //System.out.println(id);
                return list2;
            }
            catch (JDOMException e) {
                e.printStackTrace();
            } catch (IOException e) {
                e.printStackTrace();
            }
            return null;
        }
}
