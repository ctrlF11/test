<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="ko" xml:lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>OUIF : FAQ</title>
<link rel="stylesheet" type="text/css" href="./dummy/faq.css"/>
</head>
<body>
<div class="faq">
	<div class="faqHeader">
		<h1>FAQ</h1>
		<button type="button" class="showAll">답변 모두 여닫기</button>
	</div>
	<ul class="faqBody">
		<li class="article" id="a1">
			<p class="q"><a href="#a1">Q: 질문과 답변 목록은 무엇으로 마크업 해야 하나요?</a></p>
			<p class="a">A: 비 순차 목록, 순차 목록, 정의 목록으로 마크업 할 수 있습니다. 더 나아가 각각의 항목 안에서 '질문'과 '답변'을 무엇으로 마크업 할 것인지에 대하여는 많은 고민이 필요 합니다.</p>
		</li>
		<li class="article" id="a2">
			<p class="q"><a href="#a2">Q: 질문과 답변 목록은 무엇으로 마크업 해야 하나요?</a></p>
			<p class="a">A: 비 순차 목록, 순차 목록, 정의 목록으로 마크업 할 수 있습니다. 더 나아가 각각의 항목 안에서 '질문'과 '답변'을 무엇으로 마크업 할 것인지에 대하여는 많은 고민이 필요 합니다.</p>
		</li>
		<li class="article" id="a3">
			<p class="q"><a href="#a3">Q: 질문과 답변 목록은 무엇으로 마크업 해야 하나요?</a></p>
			<p class="a">A: 비 순차 목록, 순차 목록, 정의 목록으로 마크업 할 수 있습니다. 더 나아가 각각의 항목 안에서 '질문'과 '답변'을 무엇으로 마크업 할 것인지에 대하여는 많은 고민이 필요 합니다.</p>
		</li>
	</ul>
</div>
<br />
<button type="button" onclick="$('link').attr('href','')">CSS(X)</button>
<button type="button" onclick="$('link').attr('href','faq.css')">CSS(O)</button>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script> 
<script type="text/javascript" src="./js/faq.js"></script>
</body>
</html>