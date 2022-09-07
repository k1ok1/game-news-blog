package springbootcamp.mainfinalproject.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import springbootcamp.mainfinalproject.model.Feedback;

import javax.transaction.Transactional;

@Repository
@Transactional
public interface FeedbackRepository extends JpaRepository<Feedback, Long> {
}
