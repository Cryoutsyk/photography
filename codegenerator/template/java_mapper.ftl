package ${packageStr};
  
import net.mars.core.mapper.ApplicationMapper;
import net.mars.mybatis.MarsMapper;
import ${packageName}.model.${capitalModelName};

/**
 * Mapper.
 * @author zzg
 *
 */
@MarsMapper
public interface ${capitalModelName}Mapper extends ApplicationMapper<${capitalModelName}, ${primaryKeyJavaType}> {
}

