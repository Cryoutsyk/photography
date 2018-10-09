package net.artron.core;

import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringRunner;

import net.mars.boot.SpringContextApplication;
import net.mars.boot.SpringContextBeanInitializer;
import net.mars.boot.akka.AkkaApplication;
import net.mars.core.boot.SpringBeanApplication;

@RunWith(SpringRunner.class)
@ContextConfiguration(classes = { AkkaApplication.class, SpringBeanApplication.class,SpringContextBeanInitializer.class, SpringContextApplication.class })
public abstract class SpringContextApplicationTest {
	static {
        System.setProperty("spring.profiles.active", "dev");
    }
}
