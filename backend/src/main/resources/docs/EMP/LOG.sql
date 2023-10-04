-- 사원근태
DROP TABLE IF EXISTS `final`.log;
CREATE TABLE `final`.log
(
    `LOG_ID`            BIGINT       NOT NULL AUTO_INCREMENT COMMENT '근태코드',
    `LOG_EMP_ID`        BIGINT       NOT NULL COMMENT '사원코드',
    `LOG_DATE`          DATE         NOT NULL COMMENT '날짜',
    `LOG_CHECKIN`       DATETIME     NULL COMMENT '출근시간',
    `LOG_CHECKOUT`      DATETIME     NULL COMMENT '퇴근시간',
    `LOG_STATUS`        VARCHAR(255) NOT NULL COMMENT '근태상태',
    `LOG_TOTALVACATION` INT          NOT NULL COMMENT '총 휴가',
    `LOG_USEDVACATION`  INT          NOT NULL COMMENT '사용 휴가',
    `LOG_TOTALDAYOFF`   INT          NOT NULL COMMENT '총 연차',
    `LOG_USEDDAYOFF`    INT          NOT NULL COMMENT '사용 연차',
    `LOG_DATEDAYOFF`    DATE         NULL COMMENT '연차사용일',
    PRIMARY KEY (`LOG_ID`)
) ENGINE = InnoDB COMMENT '사원근태'
  AUTO_INCREMENT = 1;

ALTER TABLE `final`.log
    ADD CONSTRAINT `FK_LOG_EMP` FOREIGN KEY (`LOG_EMP_ID`) REFERENCES `final`.emp (`EMP_ID`);