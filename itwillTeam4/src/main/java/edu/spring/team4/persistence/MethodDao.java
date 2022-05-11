package edu.spring.team4.persistence;

import java.util.List;
import java.util.Map;

public interface MethodDao {

	List<String> toList(String string);

	Map<String, Integer> toMap(String string);

	String toString(Map<String, Integer> map);

	String toString(List<String> list);

	boolean addList(List<String> list, String string);

	boolean removeList(List<String> list, String string);
	
	boolean addMap(Map<String,Integer> map,List<String> list);
	boolean removeMap(Map<String,Integer> map,List<String> list);
}
