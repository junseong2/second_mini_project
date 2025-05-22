# 📖 스포츠몰 : 신세계 아이앤씨 7차수_2차 미니프로젝트
<br>

## ✍🏻 프로젝트 소개

* **🗓 개발 기간** : 2025.02.06 ~ 2025.02.13
* 신세계 아이앤씨 교육 과정 중 2차 미니 프로젝트로 진행한 2인 프로젝트입니다.
* **Spring Boot, Java, MyBatis** 를 기반으로 **JSP** 와 연동하여 구현한 간단한 스포츠 쇼핑몰 웹 프로젝트입니다.
* 구현 구조 : **Controller → Service → Mapper → MySQL**, DTO 를 통해 계층 간 데이터를 전달하는 MVC 패턴
* Spring Security 를 사용하여 로그인 및 접근 권한을 처리하였습니다.
<br>

### 🔍 구현 기능 목록

#### 1. 회원 기능
- 회원가입 및 로그인  
- 아이디 찾기 / 비밀번호 재설정  
- 마이페이지 (회원정보 수정 및 탈퇴)

#### 2. 상품 기능
- 상품 목록 정렬 및 상품명 일부 검색  
- 카테고리별 상품 확인  
- 상품 상세 페이지  
- 상품 후기 작성 및 조회 (후기 작성은 주문 이력이 있는 사용자만 가능)

#### 3. 장바구니 및 주문 기능
- 상품 바로 구매 및 장바구니 담기  
- 장바구니 관리: 개별 삭제 / 전체 삭제 / 주문 기능  
- 주문 완료 페이지 구현

#### 4. 기타 기능
- FAQ 게시판  
- 관리자 상품 등록 (Insert 기능)


<br>

## 👥 팀원 구성 : 2인 프로젝트
| 이름 | 역할 | GitHub | 이메일 |
|------|------|--------|--------|
| 이소정 | 풀스택 | [@SojungLeeee](https://github.com/SojungLeeee) | dlthwjd1118@gmail.com | 
| 이준성 | 풀스택 | [@junseong2](https://github.com/junseong2)|  a01096982827@gmail.com | 

<br>

## 🛠 개발 환경

<div> 
  <img src="https://img.shields.io/badge/java-007396?style=for-the-badge&logo=java&logoColor=white" /> 
  <img src="https://img.shields.io/badge/springboot-6DB33F?style=for-the-badge&logo=springboot&logoColor=white" /> 
  <img src="https://img.shields.io/badge/mysql-4479A1?style=for-the-badge&logo=mysql&logoColor=white" /> 
  <img src="https://img.shields.io/badge/mybatis-3DDC84?style=for-the-badge&logo=data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIyNCIgaGVpZ2h0PSIyNCIgZmlsbD0id2hpdGUiPjxwYXRoIGQ9Ik0xMiAxYTIgMiAwIDEgMSAwIDQgMiAyIDAgMCAxIDAtNHptMC0xQTYgNiAwIDAgMC41IDggNiA2IDAgMCAwIDExIDIxYTQgNCAwIDAgMC0xLTJBNCA0IDAgMCAxIDEyIDF6Ii8+PC9zdmc+" />  <br>
  <img src="https://img.shields.io/badge/html5-E34F26?style=for-the-badge&logo=html5&logoColor=white" />
  <img src="https://img.shields.io/badge/css3-1572B6?style=for-the-badge&logo=css3&logoColor=white" /> 
  <img src="https://img.shields.io/badge/javascript-F7DF1E?style=for-the-badge&logo=javascript&logoColor=black" />
  <img src="https://img.shields.io/badge/git-F05032?style=for-the-badge&logo=git&logoColor=white" />
  <img src="https://img.shields.io/badge/github-181717?style=for-the-badge&logo=github&logoColor=white" /> 
  <img src="https://img.shields.io/badge/notion-000000?style=for-the-badge&logo=notion&logoColor=white" /> </div>

<br>


- **언어** : Java 17  
- **빌드 도구** : Maven
- **프레임워크** : Spring Boot
- **라이브러리** : MyBatis 3.5.14  
- **데이터베이스** : MySQL 8.0.33  
- **실행 환경** : Spring Boot 기반 웹 애플리케이션  
- **프론트엔드** : HTML, CSS, JavaScript
- **IDE** : Spring Tool Suite 4 (STS)  


<br>

## 💬 프로젝트 구조
```
src/
├── main/
│   ├── java/
│   │   └── com/
│   │       └── exam/
│   │           ├── config/
│   │           ├── controller/
│   │           ├── dto/
│   │           ├── exception/
│   │           ├── interceptor/
│   │           ├── mapper/
│   │           ├── security/
│   │           ├── service/
│   │           └── Application.java
│   │
│   └── resources/
│       ├── META-INF/
│       │   └── resources/
│       │       └── WEB-INF/
│       │           └── views/
│       ├── static/
│       │   └── images/
│       └── application.properties


```


<br>

## 🗃 사용 테이블 및 ERD 설계
<table>
  <tr>
    <td>
      <img src="https://github.com/user-attachments/assets/bdba1ed9-610d-4bb6-86f6-8da1730b8cf6" width="600"/>
    </td>
    <td style="vertical-align: top; padding-left: 30px;">
      <ul>
        <li><strong>member</strong> : 쇼핑몰에 가입한 사용자 정보 테이블</li>
        <li><strong>leegoods</strong> : 쇼핑몰에 존재하는 상품 정보 테이블</li>
        <li><strong>cart</strong> : 사용자의 장바구니 관련 정보 테이블</li>
        <li><strong>orderinfo</strong> : 사용자의 주문 기록 테이블</li>
        <li><strong>feedback</strong> : 상품에 대한 리뷰 테이블</li>
        <li><strong>board</strong> : 게시판 관련 테이블</li>
      </ul>
    </td>
  </tr>
</table>


<br>

---

<br>

## 🖥️ 실행 화면
### ⭐ 메인 쇼핑몰 화면
| 메인 쇼핑몰 화면 1 (Bowling) | 메인 쇼핑몰 화면 2 (Basketball)|
|------|------|
| ![image](https://github.com/user-attachments/assets/7b3ccc3c-7bf1-4a87-84e5-6867399f2869) | ![image](https://github.com/user-attachments/assets/0f2e7d0e-b5bc-454e-a169-8918f5193570) |

<br>

### ⭐ 회원 기능 
| 회원가입 (중복된 ID 불가능) | 로그인 |
|----------|--------|
| <img src="https://github.com/user-attachments/assets/d4b80d39-cc31-4f0a-8013-b02922877b91" width="500"/> | <img src="https://github.com/user-attachments/assets/5916c6f4-b420-4d4b-a2fe-b5e961467335" width="500"/> |


| 아이디 찾기 (이름과 휴대폰 번호를 기반으로) | 비밀번호 재설정 (아이디를 기반으로) |
|------|------|
| <img src="https://github.com/user-attachments/assets/33d1fb01-5dc3-4415-b5d3-9e6ef6e6d246" width="500"/> |<img src="https://github.com/user-attachments/assets/4d4ac45f-9d83-424c-82a6-139931eea570" width="500"/> |

| 마이페이지 (회원 정보 수정 및 탈퇴)|
|------|
|<img src="https://github.com/user-attachments/assets/d1defbe3-2659-4520-a9ff-0e41aefd5b0b" width="1000"/> |


<br>
<br>

### ⭐ 상품 기능
| 상품 정렬 (가격 높은/낮은 순, 상품 코드순) | 상품명 일부 검색 |
|------|------|
| <img src="https://github.com/user-attachments/assets/a8346cf3-a8de-42be-bd24-23f44a6d4c9c" width="500"/> |<img src="https://github.com/user-attachments/assets/2a34bd87-747e-462e-8194-179effaef15a" width="500"/> |

| 상품 상세 페이지 및 후기 |
|------|
| <img src="https://github.com/user-attachments/assets/35ef2adc-8732-46ec-882c-e19da8330187" width="1000"/> 

<br>
<br>

### ⭐ 장바구니 및 주문 기능
| 장바구니 |
|------|
| <img src="https://github.com/user-attachments/assets/02fae39e-a7d7-49ef-aa3c-0013394456a6" width="1000"/> |

| 주문 페이지 | 주문 완료 페이지 |
|------|------|
| <img src="https://github.com/user-attachments/assets/23548d86-2686-41d3-9433-013290d0c209" width="500"/> |<img src="https://github.com/user-attachments/assets/9989ff46-beba-4462-bdd8-76107de39745" width="500"/> |

<br>
<br>

### ⭐ 기타 기능
| 관리자 암호 입력 | 관리자 insert 페이지 |
|------|------|
| <img src="https://github.com/user-attachments/assets/f29f5211-43b5-406d-b56f-6dd248274c61" width="500"/> |<img src="https://github.com/user-attachments/assets/d5ccfc93-fd90-44b9-a2cf-ebf8e3f7af07" width="500"/> |

| FAQ 게시판 | 세부 내용 |
|------|------|
| <img src="https://github.com/user-attachments/assets/132e94f8-3671-4409-8f98-c34be7e8f695" width="500"/> |<img src="https://github.com/user-attachments/assets/8e657a88-2aed-4c83-a66e-08c202b6f503" width="500"/> |

<br>

---

<br>


## 💬 프로젝트 후기
* 교육 기간 동안 배운 내용을 바탕으로 관심 있는 분야의 쇼핑몰을 직접 구현하면서 <br>
그동안 익힌 기술들을 정리하고 실제로 적용해볼 수 있는 좋은 경험이 되었습니다.
* 향후에는 결제 방식에 소셜페이를 추가해 더욱 다양한 결제 수단을 제공하고 싶습니다.
* 현재는 장바구니에서 개별 상품만 구매가 가능한데, 전체 상품 일괄 구매 기능도 추가할 계획입니다.
* 배포는 학습하지 않아 진행하지 않았습니다.

