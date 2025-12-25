package com.nit.controller;
import java.time.LocalDate;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.nit.Entity.Member;
import com.nit.service.MemberService;

import jakarta.validation.Valid;

@Controller
public class MemberController {

    @Autowired
    private MemberService service;

    @GetMapping("/")
    public String index(Model model) {
        model.addAttribute("members", service.getAll());
        return "index";
    }

    @GetMapping("/add")
    public String showAddForm(Model model) {
        model.addAttribute("member", new Member());
        return "add-member";
    }

    @PostMapping("/save")
    public String saveMember(@Valid @ModelAttribute("member") Member member,
                             BindingResult br, Model model) {
        if (br.hasErrors()) {
            return "add-member";
        }
        service.save(member);
        return "redirect:/";
    }

    @GetMapping("/edit/{id}")
    public String showEdit(@PathVariable Long id, Model model) {
        Member member = service.findById(id)
                .orElseThrow(() -> new IllegalArgumentException("Invalid member Id:" + id));

        model.addAttribute("member", member);
        return "edit-member";
    }

    @PostMapping("/update")
    public String updateMember(@Valid @ModelAttribute("member") Member member,
                               BindingResult br) {
        if (br.hasErrors()) {
            return "edit-member";
        }

        service.update(member);
        return "redirect:/";
    }

    @GetMapping("/delete/{id}")
    public String deleteMember(@PathVariable Long id) {
        service.deleteById(id);
        return "redirect:/";
    }

    @GetMapping("/expired")
    public String showExpired(Model model) {
        model.addAttribute("expiredMembers", service.getExpiredMembers());
        model.addAttribute("today", LocalDate.now());
        return "expired-members";
    }
}
