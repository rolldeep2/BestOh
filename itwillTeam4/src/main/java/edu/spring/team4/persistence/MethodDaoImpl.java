package edu.spring.team4.persistence;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;

@Repository
public class MethodDaoImpl implements MethodDao {
	/***
	 * String을 List로 바꿔준다.
	 * 
	 * @param string "하나 둘 셋" (띄어쓰기로 구분)
	 * @return List [하나,둘,셋]
	 */
	@Override
	public List<String> toList(String string) {
		String[] strArr = string.split("\\s+");// Splitting using whitespace
		ArrayList<String> list = new ArrayList<String>(Arrays.asList(strArr));
		return list;
	}

	/***
	 * String 을 Map으로 바꿔준다
	 * 
	 * @param string "{\"오싹한\":3,\"징그러운\":7}" (""안에""있음)
	 * @return Map {오싹한=3,징그러운=7}
	 * @throws JsonMappingException
	 * @throws JsonProcessingException
	 */
	@Override
	public Map<String, Integer> toMap(String string) {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Integer> map = null;
		try {
			map = mapper.readValue(string, Map.class);
		} catch (JsonMappingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (JsonProcessingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return map;
	}

	@Override
	public String toString(Map<String, Integer> map) {
		ObjectMapper mapper = new ObjectMapper();
		String string = null;
		try {
			string = mapper.writeValueAsString(map);
		} catch (JsonProcessingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return string;
	}

	@Override
	public String toString(List<String> list) {
		String result = "";
		for (String str : list) {
			result = result + str + " ";
		}
		return result;
	}

	@Override
	public boolean addList(List<String> list, String string) {
		if (!list.contains(string)) {
			list.add(string);
			return true;
		}
		return false;
	}

	@Override
	public boolean removeList(List<String> list, String string) {
		if (list.contains(string)) {
			list.remove(string);
			return true;
		}
		return false;
	}

	@Override
	public boolean addMap(Map<String, Integer> map, List<String> list) {
		for (String s : list) {
			if (!map.containsKey(s)) {
				map.put(s, 1);
			} else {
				map.replace(s, map.get(s) + 1);
			}
		}
		return true;
	}

	@Override
	public boolean removeMap(Map<String, Integer> map, List<String> list) {
		for (String s : list) {
			map.replace(s, map.get(s) - 1);
			if (map.get(s) == 0) {
				map.remove(s);
			}
		}
		return true;
	}
	

}
