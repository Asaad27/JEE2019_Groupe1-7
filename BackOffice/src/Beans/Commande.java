
package Beans;

import Beans.Client;
import java.io.Serializable;
import java.util.Collection;



public class Commande implements Serializable {
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Integer idCmd;
    private String dateCmd;
    private String etatCmd;
    private Client client;
    private Facture facture;
    private Collection<ProduitCommande> produitCommandeCouleurCollection;

    public Commande() {
    }

    public Commande(Integer idCmd) {
        this.idCmd = idCmd;
    }

    public Integer getIdCmd() {
        return idCmd;
    }

    public void setIdCmd(Integer idCmd) {
        this.idCmd = idCmd;
    }

    public String getDateCmd() {
        return dateCmd;
    }

    public void setDateCmd(String dateCmd) {
        this.dateCmd = dateCmd;
    }

    public String getEtatCmd() {
        return etatCmd;
    }

    public void setEtatCmd(String etatCmd) {
        this.etatCmd = etatCmd;
    }

    public Client getClient() {
        return client;
    }

    public void setClient(Client client) {
        this.client = client;
    }

    public Facture getFacture() {
        return facture;
    }

    public void setFacture(Facture facture) {
        this.facture = facture;
    }

    public Collection<ProduitCommande> getProduitCommandeCouleurCollection() {
        return produitCommandeCouleurCollection;
    }

    public void setProduitCommandeCouleurCollection(Collection<ProduitCommande> produitCommandeCouleurCollection) {
        this.produitCommandeCouleurCollection = produitCommandeCouleurCollection;
    }

 
}
