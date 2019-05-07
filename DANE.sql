INSERT INTO `ADDRESSES` (`address_id`,`street`,`building_number`,`apartament_number`,`zip_code`,`city`) VALUES
(1,"Wyszyńskiego","12","32","50-333","Pcim"),
(2,"Grodzka","11","33","50-450","Pcim"),
(3,"Grunwaldzka","42","22","50-343","Pcim"),
(4,"Grunwaldzka","6","1","50-343","Pcim"),
(5,"Petrusewicza","9b","33","50-313","Pcim"),
(6,"Krucza","5b","2","50-331","Pcim"),
(7,"Krucza","1","3","50-331","Pcim"),
(8,"Miła","37","4","50-021","Pcim"),
(9,"Piwna","8a","5","50-022","Pcim"),
(10,"Wyszyńskiego","5","6","50-333","Pcim"),
(11,"Bema","44","5","50-888","Pcim"),
(12,"Nowowiejska","65","2","50-222","Pcim"),
(13,"Nowowiejska","21","4","50-222","Pcim");

INSERT INTO `PERSONS` (`person_id`,`first_name`,`last_name`,`pesel`,`ADDRESSES_address_id`) VALUES
(1,"Paweł","Kwiecień","1208971234",7),
(2,"Adam","Zieliński","1236452184",8),
(3,"Łukasz","Bednarek","1245435341",9),
(4,"Gabriel","Nowak","2312342451",10),
(5,"Paweł","Kołodziej","1234574313",11),
(6,"Jakub","Pietrzak","1235432311",12),
(7,"Alicja","Wróbel","1223331222",13),
(8,"Katarzyna","Dybowska","1222223432",1),
(9,"Anna","Nowak","1231241246",2),
(10,"Julia","Nowakowska","1223434221",3),
(11,"Maria","Dybowska","1235435342",4),
(12,"Agnieszka","Wróbel","2345423432",5),
(13,"Monika","Pietrzak","5346624524",6),
(14,"Beata","Nowakowska","2452625232",7),
(15,"Iwona","Kołodziej","4265472566",8),
(16,"Roman","Kaczmarek","4314513413",9),
(17,"Jan","Mazur","6431534543",10),
(18,"Marian","Majewski","1345613451",11),
(19,"Maciej","Kwiecień","1451453466",12),
(20,"Janusz","Walczak","6653241423",13);

INSERT INTO `PARENTS` (`parent_id`,`PERSONS_person_id`) VALUES
(1,19),
(2,9),
(3,15),
(4,13),
(5,12),
(6,11),
(7,14);

INSERT INTO `TEACHERS` (`teacher_id`,`PERSONS_person_id`) VALUE
(1,2),
(2,3),
(3,16),
(4,17),
(5,18),
(6,20);

INSERT INTO `CLASSES` (`classs_id`,`class_title`,`start_year`,`end_year`,`TEACHERS_teacher_id`) VALUES
(1,"Ib",2012,2013,1),
(2,"Va",2012,2013,2);

INSERT INTO `STUDENTS` (`student_id`,`PERSONS_person_id`,`PARENTS_parent_id`,`CLASSES_class_id`) VALUES
(1,1,6,1),
(2,4,5,1),
(3,5,4,1),
(4,6,3,1),
(5,7,2,2),
(6,8,1,2),
(7,10,7,2);

INSERT INTO `SUBJECTS` (`subject_id`,`subject_name`,`description`) VALUES
(1,"J. Polski","Suspendisse aliquet molestie tellus. Aenean egestas hendrerit neque. In ornare"),
(2,"Matematyka","convallis est, vitae sodales nisi magna sed dui. Fusce aliquam,"),
(3,"J. Angielski","pede, malesuada vel, venenatis vel, faucibus id, libero. Donec consectetuer"),
(4,"Informatyka","eu metus. In lorem. Donec elementum, lorem ut aliquam iaculis,"),
(5,"W-F","Proin sed turpis nec mauris blandit mattis. Cras eget nisi"),
(6,"Historia","et magnis dis parturient montes, nascetur ridiculus mus. Proin vel"),
(7,"Biologia","quam vel sapien imperdiet ornare. In faucibus. Morbi vehicula. Pellentesque"),
(8,"Chemia","egestas. Aliquam fringilla cursus purus. Nullam scelerisque neque sed sem"),
(9,"Geografia","Duis risus odio, auctor vitae, aliquet nec, imperdiet nec, leo."),
(10,"Fizyka","aliquet vel, vulputate eu, odio. Phasellus at augue id ante");

INSERT INTO `GRADEDEF` (`gradedef_id`, `grade_name`, `grade`) VALUES
(1, '1', 1.0),
(2, '2', 2.0),
(3, '3', 3.0),
(4, '4', 4.0),
(5, '5', 5.0),
(6, '6', 6.0),
(7, '2-', 1.75),
(8, '2+', 2.5),
(9, '3-', 2.75),
(10, '3+', 3.5),
(11, '4-', 3.75),
(12, '4+', 4.5),
(13, '5-', 4.75),
(14, '5+', 5.5),
(15, '6-', 5.75);

INSERT INTO `LESSONS` (`lesson_id`,`SUBJECTS_subject_id`,`lesson_datetime`,`topic`,`room`, `CLASSES_class_id`, `TEACHERS_teacher_id`) VALUES
(1,1,"2019-04-29 08:00:00","TEMATJAkis","23",1,1),
(2,2,"2019-04-29 09:00:00","TEMATJAkis","25",1,2),
(3,3,"2019-04-29 10:00:00","TEMATJAkis","26",1,3),
(4,4,"2019-04-29 08:00:00","TEMATJAkis","25",2,4),
(5,5,"2019-04-28 08:00:00","TEMATJAkis","26",1,5),
(6,6,"2019-04-28 09:00:00","TEMATJAkis","27",1,6),
(7,7,"2019-04-28 09:00:00","TEMATJAkis","28",2,4),
(8,1,"2019-04-27 08:00:00","TEMATJAkis","29",1,1),
(9,1,"2019-04-27 09:00:00","TEMATJAkis","2",1,2),
(10,2,"2019-04-26 08:00:00","TEMATJAkis","3",1,3),
(11,3,"2019-04-26 08:00:00","TEMATJAkis","4",2,3),
(12,4,"2019-04-25 09:00:00","TEMATJAkis","5",1,4),
(13,5,"2019-04-25 09:00:00","TEMATJAkis","6",2,5),
(14,6,"2019-04-25 10:00:00","TEMATJAkis","7",2,6);

INSERT INTO `GRADES` (`grade_id`,`grade_scale`, `grade_type` ,`STUDENTS_student_id`, `GRADEDEF_gradedef_id`, `grade_datetime`, `TEACHERS_teacher_id`, `SUBJECTS_subject_id`) VALUES
(1,1,"normal",1,3,"2019-04-29 08:00:00",1,1),
(2,1,"normal",1,4,"2019-04-29 09:00:00",2,2),
(3,1,"normal",1,5,"2019-04-29 10:00:00",3,3),
(4,1,"normal",1,3,"2019-04-29 10:00:00",3,3),
(5,1,"normal",2,5,"2019-04-29 08:00:00",1,1),
(6,1,"normal",2,2,"2019-04-29 09:00:00",2,2),
(7,1,"normal",3,3,"2019-04-29 08:00:00",1,1),
(8,1,"normal",1,3,"2019-04-25 09:00:00",5,5),
(9,1,"normal",3,3,"2019-04-29 09:00:00",2,2),
(10,1,"normal",3,4,"2019-04-29 10:00:00",3,3),
(11,2,"normal",1,3,"2019-04-26 08:00:00",3,3),
(12,3,"normal",2,4,"2019-04-29 10:00:00",6,6),
(13,4,"normal",4,5,"2019-04-29 08:00:00",5,5),
(14,5,"normal",5,3,"2019-04-29 08:00:00",4,4),
(15,6,"normal",5,5,"2019-04-25 10:00:00",1,6),
(16,6,"normal",6,2,"2019-04-29 08:00:00",5,4),
(17,6,"normal",7,3,"2019-04-29 08:00:00",6,7),
(18,6,"normal",4,3,"2019-04-29 09:00:00",2,9),
(19,8,"normal",7,3,"2019-04-25 10:00:00",5,5),
(20,8,"normal",6,4,"2019-04-25 10:00:00",4,4);

INSERT INTO `BEHAVIORS` (`behavior_id`,`behavior`,`behavior_type`,`STUDENTS_student_id`) VALUES
(1,"et magnis dis parturient montes, nascetur ridiculus mus. Proin vel","koncowa",2),(2,"urna. Ut tincidunt vehicula risus. Nulla eget metus eu erat","koncowa",1),(3,"odio. Nam interdum enim non nisi. Aenean eget metus. In","czastkowa",6),(4,"Phasellus ornare. Fusce mollis. Duis sit amet diam eu dolor","czastkowa",3),(5,"tellus non magna. Nam ligula elit, pretium et, rutrum non,","czastkowa",5),(6,"sed tortor. Integer aliquam adipiscing lacus. Ut nec urna et","czastkowa",7),(7,"montes, nascetur ridiculus mus. Proin vel arcu eu odio tristique","koncowa",4),(8,"et magnis dis parturient montes, nascetur ridiculus mus. Donec dignissim","czastkowa",2),(9,"ante lectus convallis est, vitae sodales nisi magna sed dui.","koncowa",5),(10,"nostra, per inceptos hymenaeos. Mauris ut quam vel sapien imperdiet","czastkowa",2);
INSERT INTO `BEHAVIORS` (`behavior_id`,`behavior`,`behavior_type`,`STUDENTS_student_id`) VALUES
(11,"metus urna convallis erat, eget tincidunt dui augue eu tellus.","czastkowa",3),(12,"elementum at, egestas a, scelerisque sed, sapien. Nunc pulvinar arcu","koncowa",4),(13,"mauris, aliquam eu, accumsan sed, facilisis vitae, orci. Phasellus dapibus","czastkowa",3),(14,"odio sagittis semper. Nam tempor diam dictum sapien. Aenean massa.","czastkowa",7),(15,"molestie in, tempus eu, ligula. Aenean euismod mauris eu elit.","koncowa",4),(16,"nisi. Aenean eget metus. In nec orci. Donec nibh. Quisque","czastkowa",1),(17,"at, velit. Pellentesque ultricies dignissim lacus. Aliquam rutrum lorem ac","czastkowa",6),(18,"Praesent interdum ligula eu enim. Etiam imperdiet dictum magna. Ut","koncowa",7),(19,"Vivamus nibh dolor, nonummy ac, feugiat non, lobortis quis, pede.","czastkowa",1),(20,"ut, sem. Nulla interdum. Curabitur dictum. Phasellus in felis. Nulla","czastkowa",2);
INSERT INTO `BEHAVIORS` (`behavior_id`,`behavior`,`behavior_type`,`STUDENTS_student_id`) VALUES 
(21,"auctor ullamcorper, nisl arcu iaculis enim, sit amet ornare lectus","czastkowa",7),(22,"Cras eget nisi dictum augue malesuada malesuada. Integer id magna","koncowa",2),(23,"et magnis dis parturient montes, nascetur ridiculus mus. Aenean eget","czastkowa",3),(24,"aliquam, enim nec tempus scelerisque, lorem ipsum sodales purus, in","czastkowa",6),(25,"non, cursus non, egestas a, dui. Cras pellentesque. Sed dictum.","koncowa",3),(26,"Integer tincidunt aliquam arcu. Aliquam ultrices iaculis odio. Nam interdum","czastkowa",6),(27,"tempus eu, ligula. Aenean euismod mauris eu elit. Nulla facilisi.","czastkowa",5),(28,"ornare, facilisis eget, ipsum. Donec sollicitudin adipiscing ligula. Aenean gravida","czastkowa",6),(29,"dapibus rutrum, justo. Praesent luctus. Curabitur egestas nunc sed libero.","czastkowa",6),(30,"sit amet, consectetuer adipiscing elit. Etiam laoreet, libero et tristique","koncowa",5);
INSERT INTO `BEHAVIORS` (`behavior_id`,`behavior`,`behavior_type`,`STUDENTS_student_id`) VALUES 
(31,"elit elit fermentum risus, at fringilla purus mauris a nunc.","czastkowa",6),(32,"Curabitur massa. Vestibulum accumsan neque et nunc. Quisque ornare tortor","czastkowa",1),(33,"nascetur ridiculus mus. Donec dignissim magna a tortor. Nunc commodo","czastkowa",5),(34,"vel arcu eu odio tristique pharetra. Quisque ac libero nec","koncowa",5),(35,"Donec felis orci, adipiscing non, luctus sit amet, faucibus ut,","czastkowa",2),(36,"Pellentesque ultricies dignissim lacus. Aliquam rutrum lorem ac risus. Morbi","czastkowa",2),(37,"aliquet vel, vulputate eu, odio. Phasellus at augue id ante","koncowa",7),(38,"molestie pharetra nibh. Aliquam ornare, libero at auctor ullamcorper, nisl","czastkowa",5),(39,"a, malesuada id, erat. Etiam vestibulum massa rutrum magna. Cras","czastkowa",4),(40,"vitae velit egestas lacinia. Sed congue, elit sed consequat auctor,","czastkowa",5);
INSERT INTO `BEHAVIORS` (`behavior_id`,`behavior`,`behavior_type`,`STUDENTS_student_id`) VALUES 
(41,"vitae, aliquet nec, imperdiet nec, leo. Morbi neque tellus, imperdiet","koncowa",3),(42,"Fusce feugiat. Lorem ipsum dolor sit amet, consectetuer adipiscing elit.","czastkowa",6),(43,"eu nulla at sem molestie sodales. Mauris blandit enim consequat","czastkowa",1),(44,"varius et, euismod et, commodo at, libero. Morbi accumsan laoreet","czastkowa",4),(45,"vehicula et, rutrum eu, ultrices sit amet, risus. Donec nibh","czastkowa",6),(46,"lacus. Aliquam rutrum lorem ac risus. Morbi metus. Vivamus euismod","koncowa",2),(47,"ac sem ut dolor dapibus gravida. Aliquam tincidunt, nunc ac","czastkowa",7),(48,"Nunc mauris sapien, cursus in, hendrerit consectetuer, cursus et, magna.","czastkowa",6),(49,"erat volutpat. Nulla facilisis. Suspendisse commodo tincidunt nibh. Phasellus nulla.","czastkowa",3),(50,"condimentum eget, volutpat ornare, facilisis eget, ipsum. Donec sollicitudin adipiscing","czastkowa",1);

INSERT INTO `ABSENCES` (`absence_id`,`excused`,`STUDENTS_student_id`,`LESSONS_lesson_id`) VALUES
(1,1,6,1),
(2,0,5,2),
(3,0,4,5),
(4,0,3,6),
(5,1,2,1),
(6,1,1,2),
(7,1,6,2);
