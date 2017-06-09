package projet;

import org.jdom2.Document;
import org.jdom2.Element;
import org.jdom2.JDOMException;
import org.jdom2.input.SAXBuilder;

import java.io.File;
import java.io.IOException;
import java.util.List;


public class projet extends count {

    public static void CreatePerso(String nom, String prenom, String type, String date, String objet) {
        File fichier;

        try {
            fichier = new File("carnet.xml");
            if (!fichier.exists()) {
                dontexist(nom,prenom,type,date,objet,fichier);
            } else if (fichier.exists() && fichier.length() == 0) {
                existNull(nom,prenom,type,date,objet,fichier);
            } else if (fichier.exists() && fichier.length() > 0) {

                existenotnull(nom,prenom,type,date,objet,fichier);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static List returnList()
    {
        try {
            SAXBuilder builder = new SAXBuilder();
            Document document = (Document) builder.build("carnet.xml");
            Element rootNode = document.getRootElement();
            List<Element> list = rootNode.getChildren("personne");
            return list;
        }
        catch (JDOMException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return null;
    }

   /* public static int get_id() {
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

/*class count{
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
        }
        catch (JDOMException e) {
            System.out.println("koko");
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return null;
    }

}*/