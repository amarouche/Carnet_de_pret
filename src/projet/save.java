package projet;

import org.jdom2.Document;
import org.jdom2.Element;
import org.jdom2.JDOMException;
import org.jdom2.input.SAXBuilder;
import org.jdom2.output.Format;
import org.jdom2.output.XMLOutputter;
import java.io.FileWriter;
import java.io.IOException;
import java.util.List;

/**
 * Created by ouahab on 16/03/2017.
 */

public class save {
    public static void save_persone(int id, String nom,String prenom)
    {
        try {
            SAXBuilder builder = new SAXBuilder();
            Document document = (Document) builder.build("carnet.xml");
            Element rootNode = document.getRootElement();
            List<Element> list = rootNode.getChildren("personne");
            String nbr = null;
            int ids = 0;
            for (int i = 0; i < list.size(); i++) {
                nbr = list.get(i).getAttribute("id").getValue();
                ids = Integer.parseInt(nbr);
                if (id == ids) {
                    list.get(i).getChild("nom").setText(nom);
                    list.get(i).getChild("prenom").setText(prenom);
                    XMLOutputter xmlOutput = new XMLOutputter();
                    xmlOutput.setFormat(Format.getPrettyFormat());
                    xmlOutput.output(document, new FileWriter("carnet.xml"));
                }
            }
        }
        catch (JDOMException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public static void save_items(int id, String objet, String type, String date,String ancien)
    {
        try {
            SAXBuilder builder = new SAXBuilder();
            Document document = (Document) builder.build("carnet.xml");
            Element rootNode = document.getRootElement();
            List<Element> list = rootNode.getChildren("personne");
            String nbr = null;
            int ids = 0;
            for (int i = 0; i < list.size(); i++) {
                List<Element> list2 = list.get(i).getChild("Items").getChildren();
                nbr = list.get(i).getAttribute("id").getValue();
                ids = Integer.parseInt(nbr);
                if (id == ids) {
                    for (int z = 0; z < list2.size(); z++) {
                        String ob = list2.get(z).getChild("objet").getText();
                        if (ob.equals(ancien)) {
                            list2.get(z).getChild("objet").setText(objet);
                            list2.get(z).getChild("type").setText(type);
                            list2.get(z).getChild("Date").setText(date);
                            XMLOutputter xmlOutput = new XMLOutputter();
                            xmlOutput.setFormat(Format.getPrettyFormat());
                            xmlOutput.output(document, new FileWriter("carnet.xml"));

                        }
                    }
                }
            }
        }
        catch (JDOMException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
