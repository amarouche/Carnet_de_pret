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
import java.util.List;

/**
 * Created by ouahab on 16/03/2017.
 */
public class count {
    public static String count() {

        try {
            SAXBuilder builder = new SAXBuilder();
            Document document = (Document) builder.build("carnet.xml");
            Element rootNode = document.getRootElement();
            List<Element> list = rootNode.getChildren("personne");
            String nbr = null;
            for (int i = 0; i < list.size(); i++) {
                nbr = list.get(i).getAttribute("id").getValue();
            }
            return nbr;
        } catch (JDOMException e) {
           // System.out.println("koko");
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return null;
    }

    public static void dontexist(String nom, String prenom, String type, String date, String objet, File fichier) {
        try {
            fichier.createNewFile();
            Element carnet = new Element("carnet_de_pret");
            org.jdom2.Document doc = new org.jdom2.Document(carnet);
            Element user = new Element("personne");
            carnet.addContent(user);
            user.setAttribute("id", "1");
            user.addContent(new Element("nom").setText(nom));
            user.addContent(new Element("prenom").setText(prenom));
            Element Items = new Element("Items");
            Element item = new Element("item");
            item.addContent(new Element("objet").setText(objet));
            item.addContent(new Element("type").setText(type));
            item.addContent(new Element("Date").setText(date));
            Items.addContent(item);
            user.addContent(Items);
            XMLOutputter xmlOutput = new XMLOutputter();
            xmlOutput.setFormat(Format.getPrettyFormat());
            xmlOutput.output(doc, new FileWriter("carnet.xml"));
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public static void existNull(String nom, String prenom, String type, String date, String objet, File fichier) {
        try {
            Element utilisateurs = new Element("carnet_de_pret");
            Document doc = new Document(utilisateurs);
            Element user = new Element("personne");
            user.setAttribute("id", "1");
            utilisateurs.addContent(user);
            user.addContent(new Element("nom").setText(nom));
            user.addContent(new Element("prenom").setText(prenom));
            Element Items = new Element("Items");
            Element item = new Element("item");
            item.addContent(new Element("objet").setText(objet));
            item.addContent(new Element("type").setText(type));
            item.addContent(new Element("Date").setText(date));
            Items.addContent(item);
            user.addContent(Items);
            XMLOutputter xmlOutput = new XMLOutputter();
            xmlOutput.setFormat(Format.getPrettyFormat());
            xmlOutput.output(doc, new FileWriter("carnet.xml"));
        } catch (IOException e) {
            e.printStackTrace();
        }
    }


    public static void existenotnull(String nom, String prenom, String type, String date, String objet, File fichier) {
        int counts = 0;
        try {
            SAXBuilder builder = new SAXBuilder();
            Document document = (Document) builder.build(fichier);
            Element rootNode = document.getRootElement();
            List<Element> list = rootNode.getChildren("personne");
            for (int i = 0; i < list.size(); i++) {
                Element node = (Element) list.get(i);
                List<Element> allname = node.getChildren("nom");
                Element node2 = (Element) allname.get(0);
                List<Element> allprenom = node.getChildren("prenom");
                Element node3 = (Element) allprenom.get(0);
                String toto = node2.getText();
                String pr = node3.getText();
                if (toto.equals(nom) && pr.equals(prenom)) {
                    List<Element> list_it = node.getChildren("Items");
                    Element it = (Element) list_it.get(0);
                    Element item = new Element("item");
                    item.addContent(new Element("objet").setText(objet));
                    item.addContent(new Element("type").setText(type));
                    item.addContent(new Element("Date").setText(date));
                    it.addContent(item);
                    counts++;
                }
            }
            if (counts == 0) {
                add_person(nom,prenom,type,date,objet,document);
            }
            XMLOutputter xmlOutput = new XMLOutputter();
            xmlOutput.setFormat(Format.getPrettyFormat());
            xmlOutput.output(document, new FileWriter("carnet.xml"));
        } catch (IOException e) {
            e.printStackTrace();
        } catch (JDOMException e) {
            e.printStackTrace();
        }
    }

    public static void add_person(String nom, String prenom, String type, String date, String objet, Document document)
    {
        try {
            count test = new count();
            int ids = Integer.parseInt(test.count()) + 1;
            Element user = new Element("personne");
            user.setAttribute("id", String.valueOf(ids));
            user.addContent(new Element("nom").setText(nom));
            user.addContent(new Element("prenom").setText(prenom));
            Element Items = new Element("Items");
            Element item = new Element("item");
            item.addContent(new Element("objet").setText(objet));
            item.addContent(new Element("type").setText(type));
            item.addContent(new Element("Date").setText(date));
            Items.addContent(item);
            user.addContent(Items);
            document.getRootElement().addContent(user);
        }
        catch (Exception e) {
            e.printStackTrace();
        }

    }


    /*public static int get_id() {
        try {
            SAXBuilder builder = new SAXBuilder();
            Document document = (Document) builder.build("carnet.xml");
            Element rootNode = document.getRootElement();
            List<Element> list = rootNode.getChildren("personne");
            int x =0;
            String nbr = null;
            int n = 0;
            for (int i = 0; i < list.size(); i++) {
                List<Element> list2 = list.get(i).getChild("Items").getChildren();
                //System.out.println(list2);
                for (int z = 0; z < list2.size(); z++)
                {
                    nbr = list2.get(z).getAttribute("id").getValue();
                    n = Integer.parseInt(nbr);
                    // System.out.println(n);
                    if (x < n)
                    {
                        x = n;
                    }
                }
            }
            return x;
        }
        catch (JDOMException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return 0;
    }*/
}
