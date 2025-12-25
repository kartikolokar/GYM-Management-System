package com.nit.repository;

import java.time.LocalDate;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.nit.Entity.Member;

public interface MemberRepository extends JpaRepository<Member, Long> {

	List<Member> findByExpiryDateBefore(LocalDate date);
}
