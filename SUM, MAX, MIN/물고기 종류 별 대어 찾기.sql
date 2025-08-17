-- 문제
--물고기 종류 별로 가장 큰 물고기의 ID, 물고기 이름, 길이를 출력하는 SQL 문을 작성해주세요.
--
--물고기의 ID 컬럼명은 ID, 이름 컬럼명은 FISH_NAME, 길이 컬럼명은 LENGTH로 해주세요.
--결과는 물고기의 ID에 대해 오름차순 정렬해주세요.
--단, 물고기 종류별 가장 큰 물고기는 1마리만 있으며 10cm 이하의 물고기가 가장 큰 경우는 없습니다.

-- 답 // 풀다가 실패 구글링해서 답 찾음
-- WHERE 조건절에서 각 행 대해 조건을 걸어야함
-- 하나의 열만 비교해서 찾을 수 없음

SELECT FI.ID, FNI.FISH_NAME, FI.LENGTH
FROM FISH_INFO FI
JOIN FISH_NAME_INFO FNI ON FI.FISH_TYPE = FNI.FISH_TYPE
WHERE (FI.FISH_TYPE, FI.LENGTH) IN (SELECT FISH_TYPE, MAX(LENGTH)
                                    FROM FISH_INFO
                                    GROUP BY FISH_TYPE)
ORDER BY FI.ID ASC;

-------------------------

# SELECT FI.ID, FNI.FISH_NAME, MAX(FI.LENGTH) AS LENGTH
# FROM FISH_INFO AS FI
#     JOIN FISH_NAME_INFO AS FNI
#     ON FI.FISH_TYPE = FNI.FISH_TYPE
# WHERE FNI.FISH_TYPE = (SELECT FISH_TYPE FROM FISH_INFO)
# GROUP BY FI.FISH_TYPE
# ORDER BY FI.ID ASC;