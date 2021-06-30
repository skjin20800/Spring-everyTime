FROM openjdk:8-jdk

# # root 에 app 폴더를 생성
RUN mkdir /every

# work dir 고정
WORKDIR /every

# host pc 의 nginx.conf 를 아래 경로에 복사
COPY . .

# 80 포트 오픈
EXPOSE 8080

# container 실행 시 자동으로 실행할 command. nginx 시작함
CMD ["./gradlew", "bootRun"]
