class Post{
  int? id;
  String? employee_name;
  int? employee_salary;
  int? employee_age;

  Post({this.id, this.employee_name, this.employee_salary, this.employee_age});

  Post.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        employee_name = json["employee_name"],
        employee_salary = json["employee_salary"],
        employee_age = json["employee_age"];

  Map<String, dynamic> toJson() => {
    "id" : id,
    "employee_name" : employee_name,
    "employee_salary" : employee_salary,
    "employee_age" : employee_age,
  };
}