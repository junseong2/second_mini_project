<!-- order/orderDone.jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div class="container">    
<table>
	<tr>
		<td height="30">
	</tr>

	<tr>
		<td><b>주문완료</b></td>
	</tr>

	<tr>
		<td height="30">
	</tr>

	<tr>
		<td align="center"><b>주문해주셔서 감사합니다.</b></td>
	</tr>

	<tr>
		<td height="7">
	</tr>

	<tr>
		<td class="td_default" align="center"><b>${oDTO.orderName }</b> 님의 주문이
			안전하게 처리되었습니다.</td>
	</tr>

	<tr>
		<td height="40">
	</tr>

	<tr>
		<td class="td_default"><b>상품 및 배송정보</b>
		</td>
	</tr>

	<tr>
		<td height="15">
	</tr>

	<tr>
		<td>
			<table width="100%" border="1" style="border-collapse: collapse">
				<tr>
					<td class="td_default" width="150" height="35"> 받으시는 분</td>
					<td class="td_default" height="35">${oDTO.orderName }</td>
				</tr>
				<tr>
					<td class="td_default" height="35"> 주소</td>
					<td class="td_default" height="35"> (${oDTO.post })<br>
						${oDTO.addr1 } <br> ${oDTO.addr2 }
					</td>
				</tr>
				
				<tr>
					<td class="td_default" height="35"> 휴대전화</td>
					<td class="td_default" height="35"> ${oDTO.phone }</td>
				</tr>
				<tr>
					<td class="td_default" height="35"> 상품코드</td>
					<td class="td_default" height="35"> ${cDTO.gCode }</td>
				</tr>
				
				<tr>
					<td class="td_default" height="35"> 수량</td>
					<td class="td_default" height="35"> ${cDTO.gAmount }</td>
				</tr>
			</table>
	</tr>


	<tr>
		<td height="20">
	</tr>

</table>
</div>