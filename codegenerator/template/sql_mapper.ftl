<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE mapper
  PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN"
  "http://mybatis.org/dtd/mybatis-3-mapper.dtd">
  
<mapper namespace="${packageStr}.${capitalModelName}Mapper">

 	<!-- save -->
 	<insert id="save" parameterType="${packageName}.model.${capitalModelName}">
		INSERT INTO ${tableName}
		(
			<#list columns as column>
			${column.columnName}<#if column_has_next>,</#if>
		    </#list>   
		) 
		VALUES 
		( 
			<#list columns as column>
			${r"#{"}${column.beanName}, jdbcType=${column.jdbcType}${r"}"}<#if column_has_next>,</#if>
			</#list>   
		) 
	</insert>
	
	<!-- update -->
	<update id="update" parameterType="${packageName}.model.${capitalModelName}" >
     	UPDATE ${tableName}
			<set> 
				<#list columns as column> 
				<#if column.beanName != primaryKeyBeanName>
				<if test=" ${column.beanName} != null" > 
					${column.columnName} = ${r"#{"}${column.beanName}${r"}"}, 
				</if>
				</#if>
				</#list>  
			</set> 
		 WHERE  ${primaryKeyColumnName} = ${r"#{"}${primaryKeyBeanName}${r"}"}
  	</update>
  	
  	<!-- delete -->
 	<delete id="delete" parameterType="${packageName}.model.${capitalModelName}" >
            DELETE FROM ${tableName} WHERE ${primaryKeyColumnName} IN
            <foreach item="dbid" index="index" collection="dbIds" open="(" separator="," close=")">
		    		${r"#{"}dbid${r"}"}
		  	</foreach> 
  	</delete>
  	
  	<sql id="selectAllColumns">
		<#list columns as column>   
		TB.${column.columnName} AS ${column.beanName}<#if column_has_next>,</#if>  
		</#list>  
  	</sql>
  	
  	<sql id="queryWhereWithPage">
  		<#list columns as column>  
  		<#if column.beanName != "tabIndex"> 
		<if test=" queryParam.${column.beanName} != null" > 
		and TB.${column.columnName} = ${r"#{"}queryParam.${column.beanName}${r"}"}
		</if>
		</#if> 
		</#list> 
		<if test="queryParam.dbIds != null &amp;&amp; queryParam.dbIds.size() &gt; 0">
		and TB.${primaryKeyColumnName} IN
		  <foreach item="dbid" index="index" collection="queryParam.dbIds" open="(" separator="," close=")">
		    ${r"#{"}dbid${r"}"}
		  </foreach> 
		</if> 
  	</sql>
  	
  	<!-- query page by page -->
	<select id="queryByPage" parameterType="PageModel" resultType="${packageName}.model.${capitalModelName}">
		SELECT
			<include refid="selectAllColumns" />  
		FROM ${tableName} TB  
    	WHERE 1=1   
    		 <include refid="queryWhereWithPage" />
	</select>
	
	<!-- queryPageWithAuth -->
	<select id="queryPageWithAuth" parameterType="PageModel" resultType="${packageName}.model.${capitalModelName}">
		SELECT
			<include refid="selectAllColumns" />  
		FROM ${tableName} TB  
    	WHERE 1=1   
    		 <include refid="queryWhereWithPage" />
	</select> 
	
	<sql id="queryWhereWithEntity">
		<#list columns as column> 
		<#if column.beanName != "tabIndex"> 
		<if test="${column.beanName} != null" > 
		and TB.${column.columnName} = ${r"#{"}${column.beanName}${r"}"}
		</if>
		</#if>
		</#list> 
		<if test="dbIds != null &amp;&amp; dbIds.size() &gt; 0">
		and TB.${primaryKeyColumnName} IN
		  <foreach item="dbid" index="index" collection="dbIds" open="(" separator="," close=")">
		    ${r"#{"}dbid${r"}"}
		  </foreach> 
		</if>  
	</sql>
	
	<!-- query all -->
	<select id="queryAll" parameterType="Entity" resultType="${packageName}.model.${capitalModelName}">
	 SELECT
		<include refid="selectAllColumns" /> 
	  FROM ${tableName} TB 
	  WHERE 1=1   
    	<include refid="queryWhereWithEntity" />
	 </select>
	 
	 <!-- queryWithAuth -->
	<select id="queryWithAuth" parameterType="Entity" resultType="${packageName}.model.${capitalModelName}">
	 SELECT
		<include refid="selectAllColumns" /> 
	  FROM ${tableName} TB 
	  WHERE 1=1   
    	<include refid="queryWhereWithEntity" />
	 </select>
	
	<!-- query by id -->
	<select id="queryById" parameterType="java.lang.String" resultType="${packageName}.model.${capitalModelName}">
	  SELECT
		<include refid="selectAllColumns" /> 
	  FROM ${tableName} TB  
          WHERE  TB.${primaryKeyColumnName} = ${r"#{"}${primaryKeyBeanName}${r"}"}
	</select>  
		
</mapper>
