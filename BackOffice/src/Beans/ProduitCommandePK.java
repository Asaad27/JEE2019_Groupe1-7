
package Beans;

import java.io.Serializable;



public class ProduitCommandePK implements Serializable {

    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String model;
    private int idCmd;

    public ProduitCommandePK() {
    }

    public ProduitCommandePK(String model, int idCmd) {
        this.model = model;
        this.idCmd = idCmd;
    }

    public String getModel() {
        return model;
    }

    public void setModel(String model) {
        this.model = model;
    }

    public int getIdCmd() {
        return idCmd;
    }

    public void setIdCmd(int idCmd) {
        this.idCmd = idCmd;
    }



  
}
