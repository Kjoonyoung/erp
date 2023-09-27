-- 댓글
DROP TABLE IF EXISTS `final`.COMMENT;
CREATE TABLE `final`.COMMENT
(
    `COMMENT_ID`            BIGINT       NOT NULL AUTO_INCREMENT COMMENT '댓글코드',
    `COMMENT_BOARD_ID`      BIGINT       NOT NULL COMMENT '게시판코드',
    `COMMENT_EMP_ID`        BIGINT       NOT NULL COMMENT '사원코드',
    `COMMENT_COMMENT`       VARCHAR(255) NOT NULL COMMENT '댓글내용',
    `COMMENT_CREATED_DATE`  DATE         NOT NULL COMMENT '댓글작성일',
    `COMMENT_MODIFIED_DATE` DATE         NULL COMMENT '댓글수정일',
    PRIMARY KEY (`COMMENT_ID`)
) ENGINE = InnoDB COMMENT '댓글'
  AUTO_INCREMENT = 1;

ALTER TABLE `final`.COMMENT
    ADD CONSTRAINT `FK_COMMENT_EMP` FOREIGN KEY (`COMMENT_EMP_ID`) REFERENCES `final`.EMP (`EMP_ID`);

ALTER TABLE `final`.COMMENT
    ADD CONSTRAINT `FK_COMMENT_BOARD` FOREIGN KEY (`COMMENT_BOARD_ID`) REFERENCES `final`.BOARD (`BOARD_ID`);
