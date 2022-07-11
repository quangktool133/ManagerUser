package manager.webapp.dao;

import java.util.ArrayList;

import manager.webapp.model.Promotion;

public interface PromotionDAO {
	public ArrayList<Promotion> getAll(); 
	public int addPromotion(Promotion item);
}
