package springbootcamp.mainfinalproject.service.impl;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import springbootcamp.mainfinalproject.mapper.BlogMapper;
import springbootcamp.mainfinalproject.model.Blog;
import springbootcamp.mainfinalproject.model.Comments;
import springbootcamp.mainfinalproject.model.Role;
import springbootcamp.mainfinalproject.model.dto.BlogDto;
import springbootcamp.mainfinalproject.repository.CommentsRepository;
import springbootcamp.mainfinalproject.service.BlogService;
import springbootcamp.mainfinalproject.service.CommentsService;
import springbootcamp.mainfinalproject.service.RoleService;
import springbootcamp.mainfinalproject.service.UserService;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;

@Service
@RequiredArgsConstructor
public class CommentsServiceImpl implements CommentsService {
    private final CommentsRepository commentsRepository;
    private final BlogService blogService;
    private final UserService userService;
    private final RoleService roleService;
    private final BlogMapper blogMapper;

    @Override
    public List<Comments> getAllComments() {
        return commentsRepository.findAllByOrderByCommentCreateDateDesc();
    }

    @Override
    public List<Comments> getAllCommentsByBlog(Long blogId) {
        BlogDto blog = blogService.getBlogById(blogId);
        if (blog != null) {
            return commentsRepository.findAllByBlogBlogIdOrderByCommentCreateDateDesc(blogId);
        }
        return null;
    }

    @Override
    public Comments getCommentById(Long commentId) {
        Comments comment = commentsRepository.findById(commentId).orElse(null);
        if (comment != null) {
            return comment;
        }
        return null;
    }

    @Override
    public Comments addComment(String commentText, Long blogId) {
        BlogDto blog = blogService.getBlogById(blogId);
        if (blog != null) {
            Comments comment = new Comments();
            comment.setCommentText(commentText);
            comment.setCommentCreateDate(LocalDate.now());
            comment.setAuthor(userService.getCurrentUser());
            comment.setBlog(blogMapper.toEntity(blog));
            return commentsRepository.save(comment);
        }
        return null;
    }

    @Override
    public void deleteComment(Long commentId) {
        Comments checkComment = commentsRepository.findById(commentId).orElse(null);
        if (checkComment != null) {
            commentsRepository.delete(checkComment);
        }
    }
}
