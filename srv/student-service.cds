using { school, sap.common } from '../db/schema';


service StudentService {

  @(requires:'authenticated-user')
  @readonly entity Courses as projection on school.Courses;
 
  entity Enrollments as projection on school.Enrollments;

  @requires: 'Admin'
  entity Students @(restrict: [
    { grant: '*',
      to: 'Admin',
      where: 'country = $user.Country or $user.country is null' }
  ]) as projection on school.Students {
    ID,
    name,
    birthDate,
    country,
  };
  
  @readonly entity ClassRooms as projection on school.Classrooms;
  @readonly entity Classes as projection on school.Classes{
    *, 
    course.name as courseName,
    classRoom.name as ClassRoomName
    
  };


  //view localized_course(p_code: String) as select from school.Courses{key ID, name} where 
/*
 view localizedCourse with parameters p_code : String 
  as select from school.Courses {
    key ID,
    name,
    courseLoad,
    country.code
  }

  where country.code = :p_code; 
*/
 /* entity localizedCourse (p_code: String ) as select from school.Courses(country.code: :p_code);*/
/*@readonly entity Bookinfo_CalcView_SRV (INPUT_DATE: Date) as 
     select from Bookinfo_CalcView(IP_KPI_DATE: :INPUT_DATE) {*}
  */
}