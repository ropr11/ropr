package model;
// Generated 3.12.2013 12:14:03 by Hibernate Tools 3.6.0



/**
 * UserRolesId generated by hbm2java
 */
public class UserRolesId  implements java.io.Serializable {


     private int userRolesId;
     private int fkEmployeeId;
     private int fkCustomerId;

    public UserRolesId() {
    }

    public UserRolesId(int userRolesId, int fkEmployeeId, int fkCustomerId) {
       this.userRolesId = userRolesId;
       this.fkEmployeeId = fkEmployeeId;
       this.fkCustomerId = fkCustomerId;
    }
   
    public int getUserRolesId() {
        return this.userRolesId;
    }
    
    public void setUserRolesId(int userRolesId) {
        this.userRolesId = userRolesId;
    }
    public int getFkEmployeeId() {
        return this.fkEmployeeId;
    }
    
    public void setFkEmployeeId(int fkEmployeeId) {
        this.fkEmployeeId = fkEmployeeId;
    }
    public int getFkCustomerId() {
        return this.fkCustomerId;
    }
    
    public void setFkCustomerId(int fkCustomerId) {
        this.fkCustomerId = fkCustomerId;
    }


   public boolean equals(Object other) {
         if ( (this == other ) ) return true;
		 if ( (other == null ) ) return false;
		 if ( !(other instanceof UserRolesId) ) return false;
		 UserRolesId castOther = ( UserRolesId ) other; 
         
		 return (this.getUserRolesId()==castOther.getUserRolesId())
 && (this.getFkEmployeeId()==castOther.getFkEmployeeId())
 && (this.getFkCustomerId()==castOther.getFkCustomerId());
   }
   
   public int hashCode() {
         int result = 17;
         
         result = 37 * result + this.getUserRolesId();
         result = 37 * result + this.getFkEmployeeId();
         result = 37 * result + this.getFkCustomerId();
         return result;
   }   


}


