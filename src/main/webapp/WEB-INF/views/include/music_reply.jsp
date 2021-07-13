<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>	
		
<!-- 댓글 작성 폼 -->
<form id="replyForm" name="replyForm" method="POST" class="replyWrite">
	<input type="hidden" id="bno" name="bno" value="${musicBean.no}" />
	<input type="hidden" id="page" name="page" value="${scri.page}"> 
	<input type="hidden" id="perPageNum" name="perPageNum" value="${scri.perPageNum}"> 
	<input type="hidden" id="searchType" name="searchType" value="${scri.searchType}"> 
	<input type="hidden" id="keyword" name="keyword" value="${scri.keyword}">
	<div>
		<input type="hidden" id="writer" name="writer" value="${loggedMemberInfo.id}"/>
		<input type="hidden" id="profileImg" name="profileImg" value="${loggedMemberInfo.profileImg}"/>
		<h2><span class="text-danger">${total }</span>개의 댓글</h2>
		<div class="sub1">		
			<label for="content">댓글 내용</label>
		</div>
		<textarea id="content" name="content" rows="5" cols="100" class="sub2" style="resize: none;"></textarea>
	</div>
	<div>
		<button type="button" class="replyWriteBtn btn btn-success" id="replyWrite">댓글작성</button>
	</div>
</form>
	<div>
		<input type="text" placeholder="(0/60)" id="textLengthCheck">   	
	</div>
			
<!--  댓글 내용 -->
			<div id="reply">
				<ol class="replyList">
					<c:forEach var="musicReplyBean" items="${musicReplyList}"
													begin="0" 
													end="${musicReplyList.size() }" 
													step="1"
													varStatus="status">
						<li>
							<div class="reply">
								<img src="${musicReplyBean.profileImg}" class="profileImg">
								<div class="replytest">
								<p class="writer">작성자 : ${musicReplyBean.writer} </p>
								<p class="numbering"> ${numbering - status.index} </p> 
								<p class="content">${musicReplyBean.content}</p>
								<p class="regDate"><fmt:formatDate value="${musicReplyBean.regDate}" pattern="yyyy-MM-dd[E] a hh:mm:ss" /></p>
								</div>
								<c:set var="a" value="${loggedMemberInfo.id}" scope="session"/>
								<c:set var="b" value="${musicReplyBean.writer}" scope="session"/>
								<c:if test="${a eq b || a == 'admin'}">
									<button type="button" class="replyDeleteBtn btn btn-danger"
									onclick="location.href='MusicReplyDelete.do?rno=${musicReplyBean.rno}&no=${musicReplyBean.bno}'">삭제</button>
									<button type="button" class="replyUpdateBtn btn btn-warning"
									onclick="location.href='MusicReplyUpdateForm.do?rno=${musicReplyBean.rno}'"data-rno="${replyList.rno}">수정</button>
									
								</c:if>
							</div>
						</li>
					</c:forEach>
				</ol>
			</div>
			
<!--  		                            게시판 페이징                                     -->	
			<div class="pagination">
			
				
				<c:if test="${startPage > pageGroup }">
					<button onclick="location.href='MusicInfo.do?no=${bno}&clickedPage=1'">
						<span>처음</span>
					</button>
					<a href="MusicInfo.do?no=${bno}&clickedPage=${startPage - pageGroup}">
						<span>이전</span>
					</a>
				</c:if>	
				
				<c:forEach var="i" begin="${startPage}" end="${endPage}" varStatus="status">
					<a href="MusicInfo.do?no=${bno}&clickedPage=${i}" class="btn btn-info">${i}</a>
				</c:forEach>
				
				<c:if test="${endPage < paginationTotal }">
					<a href="MusicInfo.do?no=${bno}&clickedPage=${startPage + pageGroup}">
						<span>다음</span>
					</a>
					<button onclick="location.href='MusicInfo.do?no=${bno}&clickedPage=${paginationTotal }'">
						<span>끝</span>
					</button>
				</c:if>
			</div>
			
<script>
	$("#content").keyup(function(e) {
	    console.log("키업!");
		var reply = $(this).val();
		$("#textLengthCheck").val("(" + reply.length + "/ 60)"); //실시간 글자수 카운팅
		if (reply.length > 60) {
			alert("최대 60자까지 입력 가능합니다.");
			$(this).val(reply.substring(0, 60));
			$('#textLengthCheck').html("(60 / 최대 60자)");
		}
	});
</script>