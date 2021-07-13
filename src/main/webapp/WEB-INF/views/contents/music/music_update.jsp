<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../include/header.jsp" %>
<link href="css/music_update.css" rel="stylesheet">
<link href="css/bootstrap.min.css" rel="stylesheet">
<script src="js/jquery-3.6.0.min.js"></script>	
<script src="js/bootstrap.min.js"></script>
<body>
<div class="topmenu">
	<img src="images/TIS3.png" class="logo" alt="로고"
	onclick="location.href='ContentsList.do'">
</div>
 <div class="container">
      <h2 class="text-center">MUSIC UPDATE</h2>
      <form method="POST" action="MusicUpdate.do" id="joinForm">
         <table class="table table-hover">
            <colgroup>
               <col style="width:150px;">
               <col style="width:850px;">
            </colgroup>
            <tbody>
               <tr>
                  <th>제목</th>
                  <td><input type="text" name="title" id="title" value="${musicBean.title }"></td>
               </tr >
               <tr>
                  <th>리뷰</th>
                  <td><textarea cols="60" rows="5" name="review" id="review">${musicBean.review }</textarea> </td>
               </tr>
               <tr>
                  <th>추천!</th>
                  <td><input type="text" name="choochoo" id="choochoo" value="${musicBean.choochoo }"></td>
               </tr>
            </tbody>
         </table>
         <div class="col text-right">
            <input type="hidden" name="no" value="${musicBean.no }">
            <button type="submit" class="btn btn-primary" id="join">작성 완료</button>
            <button type="reset" class="btn btn-default" onclick="location.href='ContentsList.do'">취소</button>
         </div>
      </form>
   </div>
</body>
	<%@ include file="../../include/footer.jsp" %>
</html>