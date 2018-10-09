package net.artron.core;

import javax.annotation.Resource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringRunner;

import net.artron.cms.pgymatch.service.PgymatchService;
import net.mars.boot.SpringContextApplication;
import net.mars.boot.SpringContextBeanInitializer;
import net.mars.boot.akka.AkkaApplication;
import net.mars.core.boot.SpringBeanApplication;
import net.mars.exception.MarsException;

@RunWith(SpringRunner.class)
@ContextConfiguration(classes = { AkkaApplication.class, SpringBeanApplication.class,
		SpringContextBeanInitializer.class, SpringContextApplication.class })
public class matchquery {
	/**
	 * 注入Service类对象.
	 */
	@Resource(name = "pgymatchService")
	PgymatchService pgymatchService;
	@Test
	public void test() {
		try {
			Integer sssss=pgymatchService.queryMaxCode("20180911");
			System.out.println(sssss);
		} catch (MarsException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			
		}
	}
}
