package edu.bit.ex.domain.account;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Optional;

@Transactional(readOnly = true)
public interface AccountRepository extends JpaRepository<Account, Long> {

    Account findByAccountId(String accountId);
//    Account findByEmail(String accountIdOrEmail);
    Optional<Account> findByEmail(String accountIdOrEmail);
    Account findByNickname(String nickname);

    @Query("SELECT a FROM Account a WHERE a.id=:id")
    List<Account> getPointList(Long id);
}
