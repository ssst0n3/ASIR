<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<p>标题<input type="text" name="form.title" value="${(form.title)}" maxlength="255" size="50"></p>
<p>作者<input type="text" name="form.author" value="${(form.author)}" maxlength="20" size="50"></p>
<p>资源类型<input type="text" name="form.resourceType" value="${(form.resourceType)}" maxlength="20" size="50"></p>
<p>来源<input type="text" name="form.source" value="${(form.source)}" maxlength="20" size="50"></p>
<p>关键词<input type="text" name="form.keyword" value="${(form.keyword)}" maxlength="20" size="50"></p>
<p><input type="hidden" value="${(form.id)}" name="form.id"></p>
<p><input type="submit" value="保存"></p>