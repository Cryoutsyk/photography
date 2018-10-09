package net.artron.core;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

import org.junit.Test;

import net.artron.cms.pgymtawards.model.Pgymtawards;
import net.mars.exception.MarsException;

public class removeobjtest {
	@Test
	public void testremove() {
		List<Pgymtawards> list=new ArrayList<Pgymtawards>();
		Pgymtawards a1=new Pgymtawards();
//		a1.setName("a1");
		a1.setTabIndex(2);
		list.add(a1);
		Pgymtawards a2=new Pgymtawards();
		a2.setName("a2");
		a2.setTabIndex(3);
		list.add(a2);
		Pgymtawards a3=new Pgymtawards();
//		a3.setName("a3");
		a3.setTabIndex(10);
		list.add(a3);
		Pgymtawards a4=new Pgymtawards();
		a4.setName("a4");
		a4.setTabIndex(3);
		list.add(a4);
		Pgymtawards a5=new Pgymtawards();
		a5.setName("a5");
		a5.setTabIndex(10);
		list.add(a5);
		Pgymtawards a6=new Pgymtawards();
		a6.setName("a6");
		a6.setTabIndex(20);
		list.add(a6);
		System.out.println(list.size());
		List<Pgymtawards> namenull = list.stream().filter(s -> s.getName()==null || s.getName().length()==0).collect(Collectors.toList());
		System.out.println(namenull.size());
		if(namenull!=null && !namenull.isEmpty())
		{
			for (Pgymtawards md : namenull) {
				list.remove(md);
			}					
		}
		System.out.println(list.size());
		
		System.out.println(list.stream().map(Pgymtawards::getTabIndex).collect(Collectors.toSet()).size());
		
		if (list.size()!= list.stream().map(Pgymtawards::getTabIndex).collect(Collectors.toSet()).size())
		{
			System.out.println("xx");
		}
		
	}
}
