package net.artron.cms.util;

import java.util.Set;
import javax.validation.ConstraintViolation;
import javax.validation.Validation;
import javax.validation.Validator;
import javax.validation.ValidatorFactory;

import org.hibernate.validator.HibernateValidator;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class ValidationUtils {
	// /**
	// * 使用hibernate的注解来进行验证
	// *
	// */
	// private static Validator validator =
	// Validation.byProvider(HibernateValidator.class).configure().failFast(true)
	// .buildValidatorFactory().getValidator();

	@Bean
	public static Validator validator() {
		ValidatorFactory validatorFactory = Validation.byProvider(HibernateValidator.class).configure()
				.addProperty("hibernate.validator.fail_fast", "false").buildValidatorFactory();
		Validator validator = validatorFactory.getValidator();

		return validator;
	}

	/**
	 * 功能描述: <br>
	 * 〈注解验证参数〉
	 *
	 * @param obj
	 *            抛出异常IllegalArgumentException
	 */
	public static <T> void validObject(T obj) throws IllegalArgumentException {

		Set<ConstraintViolation<T>> constraintViolations = validator().validate(obj);
		Integer count = constraintViolations.size();
		System.out.println("参数错误数:" + count);
		if (constraintViolations.size() > 0) {
			StringBuffer buff = new StringBuffer();
			for (ConstraintViolation<T> constraintViolation : constraintViolations) {
				// buff.append(constraintViolation.getInvalidValue());
				// buff.append(":");
				buff.append(constraintViolation.getMessage());
				buff.append("!\n");
			}
			throw new IllegalArgumentException(buff.toString().substring(0, buff.toString().length() - 1));
		}
	}

	// /**
	// * 功能描述: <br>
	// * 〈注解验证参数〉
	// *
	// * @param obj
	// * @see [相关类/方法](可选)
	// * @since [产品/模块版本](可选)
	// */
	// public static <T> void validate(T obj) {
	// Set<ConstraintViolation<T>> constraintViolations = validator.validate(obj);
	// // 抛出检验异常
	// if (constraintViolations.size() > 0) {
	// // throw new AppException("0001", String.format("参数校验失败:%s",
	// // constraintViolations.iterator().next().getMessage()));
	// }
	// }

}
