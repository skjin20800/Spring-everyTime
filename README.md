#everytime 프로젝트

-spring

```MYSQL
create user 'every'@'%' identified by 'every1234';
GRANT ALL PRIVILEGES ON *.* TO 'every'@'%';
create database every;
```

## 회원가입 후
```MYSQL 
insert into course (courseCode,courseName,major,type)values ("111","자바 기초","컴퓨터공학과","COREMAJOR");
insert into course (courseCode,courseName,major,type)values ("101","스프링 기초","컴퓨터공학과","COREMAJOR");
insert into course (courseCode,courseName,major,type)values ("102","c언어 기초","컴퓨터공학과","COREMAJOR");

insert into timetable (tableName,yearType,semesterType,userId,isStandard)values ("시간표 1","2020","1",1,true);
insert into timetable (tableName,yearType,semesterType,userId,isStandard)values ("시간표 2","2020","1",1,false);

insert into lecture (courseTarget,credit,lectureTime,professor,recommendYear,regularNumber,courseId)values ("컴퓨터공학과(2)",3,"국제403[수3-5]","교수님","2","30",1);
insert into lecture (courseTarget,credit,lectureTime,professor,recommendYear,regularNumber,courseId)values ("컴퓨터공학과(3)",3,"국제403[화3-5]","장보고","3","20",2);
insert into lecture (courseTarget,credit,lectureTime,professor,recommendYear,regularNumber,courseId)values ("컴퓨터공학과(1)",3,"국제403[목3-5]","미스터","1","40",3);

insert into studentlecture (lectureId,timetableId)values (1,1);
insert into studentlecture (lectureId,timetableId)values (2,1);
insert into studentlecture (lectureId,timetableId)values (3,1);
```