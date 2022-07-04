package com.greatlearning.controller;

import com.greatlearning.entity.Student;
import com.greatlearning.service.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
@RequestMapping("/student")
public class StudentController {
    @Autowired
    private StudentService studentService;

    @RequestMapping("/home")
    public String homePage() {
        return "home-page";
    }

    @RequestMapping("/list")
    public String listStudent(Model model) {

        List<Student> students = studentService.findAll();
        model.addAttribute("Students", students);
        return "list-students";
    }

    @RequestMapping("/addStudent")
    public String addStudent(Model model) {
        Student student = new Student();
        model.addAttribute("Student", student);
        return "student-form";
    }

    @RequestMapping("/updateStudent")
    public String updateStudent(@RequestParam("id") int id, Model model) {
        Student student = studentService.findById(id);
        model.addAttribute("Student", student);
        return "student-form";
    }

    @PostMapping("/save")
    public String saveStudent(@RequestParam("id") int id, @RequestParam("name") String name,
                              @RequestParam("department") String department,
                              @RequestParam("country") String country) {
        Student student;
        if (id != 0) {
            student = studentService.findById(id);
            student.setName(name);
            student.setDepartment(department);
            student.setCountry(country);
        } else {
            student = new Student(name, department, country);
        }
        studentService.save(student);
        return "redirect:/student/list";
    }

    @RequestMapping("/delete")
    public String delete(@RequestParam("id") int id) {
        studentService.deleteById(id);
        return "redirect:/student/list";
    }
}
