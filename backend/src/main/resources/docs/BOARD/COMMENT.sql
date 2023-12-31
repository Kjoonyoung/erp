-- 댓글
DROP TABLE IF EXISTS `final`.comment;
CREATE TABLE `final`.comment
(
    `COMMENT_ID`            BIGINT       NOT NULL AUTO_INCREMENT COMMENT '댓글코드',
    `COMMENT_BOARD_ID`      BIGINT       NOT NULL COMMENT '게시판코드',
    `COMMENT_EMP_ID`        BIGINT       NOT NULL COMMENT '사원코드',
    `COMMENT_COMMENT`       VARCHAR(255) NOT NULL COMMENT '댓글내용',
    `COMMENT_CREATED_DATE`  DATETIME         NOT NULL COMMENT '댓글작성일',
    `COMMENT_MODIFIED_DATE` DATETIME         NULL COMMENT '댓글수정일',
    PRIMARY KEY (`COMMENT_ID`)
) ENGINE = InnoDB COMMENT '댓글'
  AUTO_INCREMENT = 1;

ALTER TABLE `final`.comment
    ADD CONSTRAINT `FK_COMMENT_EMP` FOREIGN KEY (`COMMENT_EMP_ID`) REFERENCES `final`.emp (`EMP_ID`);

ALTER TABLE `final`.comment
    ADD CONSTRAINT `FK_COMMENT_BOARD` FOREIGN KEY (`COMMENT_BOARD_ID`) REFERENCES `final`.board (`BOARD_ID`) ON DELETE CASCADE;
