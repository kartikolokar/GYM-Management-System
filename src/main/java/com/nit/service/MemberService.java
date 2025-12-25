package com.nit.service;

import java.time.LocalDate;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nit.Entity.Member;
import com.nit.repository.MemberRepository;

@Service
public class MemberService {

    @Autowired
    private MemberRepository repo;

    public List<Member> getAll() {
        return repo.findAll();
    }

    public Member save(Member m) {
        return repo.save(m);
    }

    public Member update(Member m) {
        return repo.save(m);  // save() works as update when id is present
    }

    public Optional<Member> findById(Long id) {
        return repo.findById(id);
    }

    public void deleteById(Long id) {
        repo.deleteById(id);
    }

    public List<Member> getExpiredMembers() {
        return repo.findByExpiryDateBefore(LocalDate.now());
    }
}
