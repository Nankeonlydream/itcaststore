<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<script type="text/javascript">
/**
 * my_click和my_blur均是用于前台页面搜索框的函数
 */
//鼠标点击搜索框时执行
function my_click(obj, myid){
	//点击时，如果取得的值和搜索框默认value值相同，则将搜索框清空
	if (document.getElementById(myid).value == document.getElementById(myid).defaultValue){
	  document.getElementById(myid).value = '';
	  obj.style.color='#000';
	}
}
//鼠标不聚焦在搜索框时执行
function my_blur(obj, myid){
	//鼠标失焦时，如果搜索框没有输入值，则用搜索框的默认value值填充
	if (document.getElementById(myid).value == ''){
	 document.getElementById(myid).value = document.getElementById(myid).defaultValue;
	 obj.style.color='#999';
 }
}

/**
 * 点击搜索按钮执行的函数
 */
function search(){
	document.getElementById("searchform").submit();
}
</script>
<%!
	public String convert(String data){
		String str = "";
		for(int i = 0; i < data.length(); i++){
			str += "/u" + Integer.toHexString(data.charAt(i));
		}
		String context = "http://localhost:8080/itcaststore";
		String address = context + "/showProductPage?category=" + str;
		return address;
	}
%>
<div id="divmenu">
		<a href="<%=convert("文学")%>">文学</a>
		<a href="<%=convert("生活")%>">生活</a>
		<a href="<%=convert("计算机")%>">计算机</a>
		<a href="<%=convert("外语")%>">外语</a>
		<a href="<%=convert("经管")%>">经管</a>
		<a href="<%=convert("励志")%>">励志</a>
		<a href="<%=convert("社科")%>">社科</a>
		<a href="<%=convert("学术")%>">学术</a>
		<a href="<%=convert("少儿")%>">少儿</a>
		<a href="<%=convert("艺术")%>">艺术</a>
		<a href="<%=convert("原版")%>">原版</a>
		<a href="<%=convert("科技")%>">科技</a>
		<a href="<%=convert("考试")%>">考试</a>
		<a href="<%=convert("生活百科")%>">生活百科</a>
		<a href="<%=convert("全部商品")%>" style="color:#b4d76d">全部商品目录</a>
</div>
<div id="divsearch">
<form action="${pageContext.request.contextPath }/MenuSearchServlet" id="searchform">
	<table width="100%" border="0" cellspacing="0">
		<tr>
			<td style="text-align:right; padding-right:220px">
				Search 
				<input type="text" name="textfield" class="inputtable" id="textfield" value="请输入书名"
				onmouseover="this.focus();"
				onclick="my_click(this, 'textfield');"
				onBlur="my_blur(this, 'textfield');"/> 
				<a href="#">
					<img src="${pageContext.request.contextPath}/client/images/serchbutton.gif" border="0" style="margin-bottom:-4px" onclick="search()"/> 
				</a>
			</td>
		</tr>
	</table>
</form>
</div>