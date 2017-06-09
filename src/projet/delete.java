package projet;

import org.jdom2.Document;
import org.jdom2.Element;
import org.jdom2.JDOMException;
import org.jdom2.input.SAXBuilder;
import org.jdom2.output.Format;
import org.jdom2.output.XMLOutputter;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

/**
 * Created by ouahab on 15/03/2017.
 */
public class delete {

    public static void delete_perso(int id)
    {
        try {
            //System.out.println(id);
            SAXBuilder builder = new SAXBuilder();
            Document document = (Document) builder.build("carnet.xml");
            Element rootNode = document.getRootElement();
            List<Element> list = rootNode.getChildren("personne");
            String nbr = null;
            int ids = 0;
            for (int i = 0; i < list.size(); i++) {
                Element toto = (Element) list.get(i);
                nbr = list.get(i).getAttribute("id").getValue();
               // System.out.println(nbr);
                ids = Integer.parseInt(nbr);
                if (id == ids)
                {
                    list.get(i).detach();
                    XMLOutputter xmlOutput = new XMLOutputter();
                    xmlOutput.setFormat(Format.getPrettyFormat());
                    xmlOutput.output(document, new FileWriter("carnet.xml"));
                    count2();
                }
            }
        }
        catch (JDOMException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }


    public static void count2() {

        try {
            SAXBuilder builder = new SAXBuilder();
            Document document = (Document) builder.build("carnet.xml");
            Element rootNode = document.getRootElement();
            List<Element> list = rootNode.getChildren("personne");
            int x =list.size();
            if(x == 0){
                System.out.println("x =0");
                File fichier;
                fichier = new File("carnet.xml");
                fichier.createNewFile();
                PrintWriter writer = new PrintWriter(fichier);
                writer.print("");
                writer.close();
            }

        } catch (JDOMException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

}
