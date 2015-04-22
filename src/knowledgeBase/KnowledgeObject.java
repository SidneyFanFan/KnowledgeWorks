package knowledgeBase;

import java.util.ArrayList;
import java.util.List;

/**
 * 
 * Basic structure of knowledge object
 * 
 * @author Sidney Fan
 *
 */
public class KnowledgeObject {
	private String subClassOf;
	private String name;
	private List<KnowledgeObject> subClassList;

	public KnowledgeObject(String name) {
		this(name, null, null);
	}

	private KnowledgeObject(String name, List<KnowledgeObject> subClassList,
			String subClassOf) {
		this.name = name;
		this.subClassList = subClassList;
		this.subClassOf = subClassOf;
	}

	public String getName() {
		return name;
	}

	public KnowledgeObject updateName(String name) {
		return new KnowledgeObject(name, subClassList, subClassOf);
	}

	public KnowledgeObject updatesubClassOf(String subClassOf) {
		return new KnowledgeObject(name, subClassList, subClassOf);
	}

	public KnowledgeObject updateSubClassList(List<KnowledgeObject> subClassList) {
		return new KnowledgeObject(name, subClassList, subClassOf);
	}

	public List<KnowledgeObject> getSubClassList() {
		return subClassList;
	}

	public void addSubClass(KnowledgeObject subClass) {
		if (subClass.hasParent()) {
			throw new IllegalArgumentException("object has parent:"
					+ subClass.getParent());
		}
		subClass.setSubClassOf(name);
		if (subClassList == null) {
			subClassList = new ArrayList<KnowledgeObject>();
		}
		subClassList.add(subClass);
	}

	public String getParent() {
		return subClassOf;
	}

	public void setSubClassOf(String subClassOf) {
		this.subClassOf = subClassOf;
	}

	public boolean hasParent() {
		return subClassOf != null;
	}

}
