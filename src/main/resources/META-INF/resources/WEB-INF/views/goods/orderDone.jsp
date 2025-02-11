<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">

<div class="container mt-5">
    <div class="card shadow-lg p-4">
        <h2 class="text-center text-primary mb-4">주문 완료</h2>
        
        <div class="alert alert-success text-center">
            <strong>주문해주셔서 감사합니다!</strong>
            <br>
            <span class="text-muted">${oDTO.orderName} 님의 주문이 안전하게 처리되었습니다.</span>
        </div>

        <div class="border p-3 rounded">
            <h4 class="mb-3 text-secondary">📦 상품 및 배송정보</h4>
            
            <table class="table table-bordered text-center align-middle">
                <tbody>
                    <tr>
                        <th class="bg-light">받으시는 분</th>
                        <td>${oDTO.orderName}</td>
                    </tr>
                    <tr>
                        <th class="bg-light">주소</th>
                        <td>(${oDTO.post}) <br> ${oDTO.addr1} <br> ${oDTO.addr2}</td>
                    </tr>
                    <tr>
                        <th class="bg-light">휴대전화</th>
                        <td>${oDTO.phone}</td>
                    </tr>
                    <tr>
                        <th class="bg-light">상품코드</th>
                        <td>${cDTO.gCode}</td>
                    </tr>
                    <tr>
                        <th class="bg-light">수량</th>
                        <td>${cDTO.gAmount}</td>
                    </tr>
                </tbody>
            </table>
        </div>

        <div class="text-center mt-4">
            <a href="main" class="btn btn-primary">홈으로 이동</a>
        </div>
    </div>
</div>
