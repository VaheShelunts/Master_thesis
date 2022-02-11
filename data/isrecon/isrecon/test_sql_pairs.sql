---Question 1: What are the papers written by Dorothy Leidner?
SELECT distinct papers.title from papers join authors on authors.article_id = papers.article_id where authors.firstname = "Dorothy" and authors.surname = "Leidner";
---Question 2: How many papers did Dorothy Leidner write?
SELECT COUNT(distinct papers.title) from papers join authors on authors.article_id = papers.article_id where authors.firstname = "Dorothy" and authors.surname = "Leidner";
---Question 3: Who published the most papers in 2020?
select authors.firstname, authors.surname from authors join papers on papers.article_id = authors.article_id GROUP by authors.firstname, authors.surname ORDER by count(papers.article_id) DESC LIMIT 1;
---Question 4: How many papers were published by Dorothy Leidner in 2020?
SELECT count(distinct papers.article_id) from papers join authors on authors.article_id = papers.article_id where  papers.year = 2020 and authors.firstname = "Dorothy" and authors.surname = "Leidner";
---Question 5: What were the papers published by Dorothy Leidner in 2020?
SELECT papers.title from papers join authors on authors.article_id = papers.article_id where  papers.year = 2020 and authors.firstname = "Dorothy" and authors.surname = "Leidner";
---Question 6: How many papers were published in 2020?
SELECT count(*) from papers where  papers.year = 2020;
---Question 7: Show the titles of all the published papers in 2020.
SELECT papers.title FROM papers WHERE papers.year = 2020;
---Question 8: In how many journals did papers of Dorothy Leidner appear?
SELECT count(DISTINCT journal_akronym) from papers  join authors on authors.article_id = papers.article_id where authors.firstname = "Dorothy" and authors.surname = "Leidner";
---Question 9: In which institutions  does Dorothy Leidner work?
SELECT DISTINCT authors.institutions  from authors  where authors.firstname = "Dorothy" and authors.surname = "Leidner";
---Question 10: In which institutions and departments does Dorothy Leidner work?
SELECT authors.institutions , authors.departments from authors  where authors.firstname = "Dorothy" and authors.surname = "Leidner";
---Question 11: What is the number of dsr entities for Dorothy Leidner papers?
SELECT distinct papers.title from papers join authors on authors.article_id = papers.article_id join dsr_count on dsr_count.article_id = papers.article_id where authors.firstname = "Dorothy" and authors.surname = "Leidner";
---Question 12: Which paper of Dorothy Leidner has the highest number of dsr entities?
SELECT papers.title from papers join authors on authors.article_id = papers.article_id join dsr_count on dsr_count.article_id = papers.article_id where authors.firstname = "Dorothy" and authors.surname = "Leidner" ORDER BY dsr_count.count_dsr_all DESC LIMIT 1;
---Question 13: List papers published in JIT journal.
SELECT papers.title FROM papers WHERE papers.journal_akronym = "JIT";
---Question 14: How many papers are published in journal with acronym "JIT"?
SELECT COUNT(*) FROM papers WHERE papers.journal_akronym = "JIT";
---Question 15: How many papers were published in JIT journal in 2020?
SELECT COUNT(*) FROM papers WHERE papers.journal_akronym = "JIT" AND papers.year = 2020;
---Question 16: How many papers were published in JIT journal this year?
SELECT COUNT(*) FROM papers WHERE papers.journal_akronym = "JIT" AND papers.year = 2021;
---Question 17: How many papers were published in JIT journal last year?
SELECT COUNT(*) FROM papers WHERE papers.journal_akronym = "JIT" AND papers.year = 2020;
---Question 18: How many papers were published by authors from TU Berlin?
SELECT COUNT(DISTINCT papers.title) FROM papers JOIN authors on authors.article_id = papers.article_id WHERE authors.institutions = "TU Berlin";
---Question 19: What papers were published by authors from TU Berlin?
SELECT DISTINCT papers.title FROM authors JOIN papers ON papers.article_id = authors.article_id WHERE authors.institutions = "TU Berlin";
---Question 20: Which journal has the highest number of paper publications?
SELECT papers.journal FROM papers GROUP BY papers.journal ORDER BY COUNT(*) DESC LIMIT 1;
---Question 21: Which top 3 journals have the highest number of paper publications?
SELECT papers.journal FROM papers GROUP BY papers.journal ORDER BY COUNT(*) DESC LIMIT 3;
---Question 22: Which is the journal with highest number of paper publications?
SELECT papers.journal FROM papers GROUP BY papers.journal ORDER BY COUNT(*) DESC LIMIT 1;
---Question 23: What is the journal where most papers were published?
SELECT papers.journal FROM papers GROUP BY papers.journal ORDER BY COUNT(*) DESC LIMIT 1
---Question 24: Which journal has the highest number of paper publications in 2020?
select papers.journal from papers where  papers.year = 2020 group by papers.journal order by count(*) DESC limit 1;
---Question 25: Which papers are published in Information Systems Research journal?
select papers.title from papers  where papers.journal = "Information Systems Research";
---Question 26: Which are the titles of  papers published in Information Systems Research journal??
select papers.title from papers  where papers.journal = "Information Systems Research";
---Question 27: Which are the papers published in  journal Information Systems Research in 2020?
select papers.title from papers  where papers.journal = "Information Systems Research" and  papers.year = 2020;
---Question 28:  Which references from Information Systems Research journal have the highest number of citations?
SELECT reference_citations.citekey from reference_citations join citations on citations.reference_citekey = reference_citations.citekey WHERE  reference_citations.journal = "Information Systems Research" group by reference_citations.citekey order by count(*) DESC;
---Question 29:  Which top 5 references from Information Systems Research journal have the highest number of citations?
SELECT reference_citations.citekey from reference_citations join citations on citations.reference_citekey = reference_citations.citekey WHERE  reference_citations.journal = "Information Systems Research" group by reference_citations.citekey order by count(*) DESC LIMIT 5;
---Question 30: What are the names and abstracts for papers published in Information Systems Research journal?
select papers.title, papers.abstract from papers  where papers.journal = "Information Systems Research";
---Question 31: What are the names and abstracts of papers published in Information Systems Research journal in 2020?
SELECT papers.title, papers.abstract FROM papers WHERE papers.journal = "Information Systems Research" AND papers.year = 2020
---Question 32: Show titles and abstracts of papers published in 2020 in Information Systems Research journal.
select papers.title, papers.abstract from papers  where papers.journal = "Information Systems Research" and  papers.year = 2020;
---Question 33: Show titles of top 10 papers with highest number of citations in Information Systems Research journal.
select distinct reference_citations.title from reference_citations  join citations on citations.reference_citekey = reference_citations.citekey where reference_citations.journal = "Information Systems Research" group by reference_citations.title order by count(citations.reference_citekey) DESC limit 10;
---Question 34: In which journals do the papers by authors from Washington State University appear?
SELECT distinct papers.journal from papers join authors on papers.article_id = authors.article_id where authors.institutions = "Washington State University";
---Question 35: What are top 3 journals with published papers with highest number of citations?
SELECT distinct reference_citations.journal from reference_citations join citations on citations.reference_citekey = reference_citations.citekey group by reference_citations.journal order by count(*) desc limit 3;
---Question 36: What are the papers with no less than 100 citations?
SELECT reference_citations.citekey from reference_citations join citations on citations.reference_citekey = reference_citations.citekey group by reference_citations.citekey HAVING COUNT(*) >= 100;
---Question 37: List titles of the papers with at least 100 citations.
SELECT reference_citations.title from reference_citations join citations on citations.reference_citekey = reference_citations.citekey group by reference_citations.title HAVING COUNT(*) >= 100;
---Question 38: Show titles of reference papers that have at least 100 citations.
SELECT reference_citations.title from reference_citations join citations on citations.reference_citekey = reference_citations.citekey group by reference_citations.title HAVING COUNT(*) >= 100;
---Question 39: What are the titles of the referenced papers published in 2010 with at least 100 citations?
SELECT reference_citations.title from reference_citations join citations on citations.reference_citekey = reference_citations.citekey  WHERE reference_citations.year = 2010 group by reference_citations.citekey HAVING COUNT(*) >= 100;
---Question 40: What are the papers published in journal European Journal Of Information Systems with at least 100 citations?
SELECT reference_citations.citekey FROM reference_citations JOIN citations ON citations.reference_citekey = reference_citations.citekey WHERE reference_citations.journal = "European journal Of Information Systems" GROUP BY reference_citations.citekey HAVING COUNT(*) >= 100
---Question 41: What are the papers published in European Journal Of Information Systems in 2018 with at least 100 citations?
SELECT reference_citations.citekey from reference_citations join citations on citations.reference_citekey = reference_citations.citekey  WHERE reference_citations.year = 2018 group by reference_citations.citekey HAVING COUNT(*) >= 100;
---Question 42: What are the papers published by authors from Washington State University in 2020? 
SELECT distinct papers.citekey from papers join authors on papers.article_id = authors.article_id where authors.institutions = "Washington State University" and papers.year = 2020;
---Question 43: What are the references with less than 10 citations?
SELECT reference_citations.citekey FROM citations JOIN reference_citations ON reference_citations.citekey = citations.reference_citekey GROUP BY citations.reference_citekey HAVING COUNT(*) < 10;
---Question 44: List references that have less than 10 citations.
SELECT reference_citations.citekey FROM citations JOIN reference_citations ON reference_citations.citekey = citations.reference_citekey GROUP BY citations.reference_citekey HAVING COUNT(*) < 10
---Question 45: What are the titles of top 5 papers published in 2021 that have the most citations?
SELECT reference_citations.title from reference_citations join citations on citations.reference_citekey = reference_citations.citekey WHERE  reference_citations.year = 2021 group by reference_citations.title order by count(*) DESC LIMIT 5;
---Question 46: Show titles and number of citations for top 5 papers published in 2020 with the highest number of citations.
SELECT reference_citations.title,  count(*) from reference_citations join citations on citations.reference_citekey = reference_citations.citekey WHERE  reference_citations.year = 2020 group by reference_citations.citekey order by count(*) DESC LIMIT 5;
---Question 47: Show journals available in the database.
SELECT distinct papers.journal FROM papers;
---Question 48: The number of papers written by Zheng Wanhong.
SELECT COUNT(distinct papers.title) from papers join authors on authors.article_id = papers.article_id where authors.firstname = "Zheng" and authors.surname = "Wanhong";
---Question 49: Papers published by Dorothy Leidner in 2020?
SELECT papers.title FROM papers JOIN authors ON authors.article_id = papers.article_id WHERE papers.year = 2020 AND authors.firstname = "Dorothy" AND authors.surname = "Leidner"
---Question 50: Show journals in which papers written by Dorothy Leidner in 2020 were published.
SELECT distinct papers.journal from papers join authors on authors.article_id = papers.article_id where papers.year = 2020 and authors.firstname = "Dorothy" and authors.surname = "Leidner";
---Question 51: Who is the author that published the highest number of papers in 2020?
select authors.firstname, authors.surname from authors join papers on papers.article_id = authors.article_id GROUP by authors.firstname, authors.surname ORDER by count(papers.title) DESC LIMIT 1;
---Question 52: List titles of papers that mention "data science" keyword.
select papers.title from papers join papers_keywords on papers_keywords.article_id = papers.article_id where papers_keywords.keywords = "data science";
---Question 53: Show paper titles that mention "data science" keyword.
select papers.title from papers join papers_keywords on papers_keywords.article_id = papers.article_id where papers_keywords.keywords = "data science";
---Question 54: What are the papers mentioning "data science" keyword?
select papers.title from papers join papers_keywords on papers_keywords.article_id = papers.article_id where papers_keywords.keywords = "data science";
---Question 55: In which papers "data science" keyword is mentioned.
select papers.title from papers join papers_keywords on papers_keywords.article_id = papers.article_id where papers_keywords.keywords = "data science";
---Question 56: How many papers mention "data science" keyword.
select count(*) from papers join papers_keywords on papers_keywords.article_id = papers.article_id where papers_keywords.keywords = "data science";
---Question 57: What is the number of papers mentioning "data science" keyword.
select count(*) from papers join papers_keywords on papers_keywords.article_id = papers.article_id where papers_keywords.keywords = "data science";
---Question 58: For each paper mentioning "data science" keyword show the title and abstract.
select papers.title, papers.abstract  from papers join papers_keywords on papers_keywords.article_id = papers.article_id where papers_keywords.keywords = "data science";
---Question 59: Show papers published in 2021 that mention "data science" keyword.
select papers.title from papers join papers_keywords on papers_keywords.article_id = papers.article_id where papers_keywords.keywords = "data science" and papers.year = 2021;
---Question 60: What are the papers published in 2021 mentioning data science?
select papers.title from papers join papers_keywords on papers_keywords.article_id = papers.article_id where papers_keywords.keywords = "data science" and papers.year = 2021;
---Question 61: In which papers from 2021 "data science" keyword is mentioned.
select papers.title from papers join papers_keywords on papers_keywords.article_id = papers.article_id where papers_keywords.keywords = "data science" and papers.year = 2021;
---Question 62: For each paper mentioning "data science" keyword show the title and abstract.
select papers.title, papers.abstract  from papers join papers_keywords on papers_keywords.article_id = papers.article_id where papers_keywords.keywords = "data science";
---Question 63: What are the keywords mentioned in the paper "The challenge of defining information system".
SELECT papers_keywords.keywords FROM papers_keywords JOIN papers ON papers.article_id = papers_keywords.article_id WHERE papers.title = "the challenge of defining information system"
---Question 64:  List the keywords mentioned in the paper "The challenge of defining information system".
SELECT papers_keywords.keywords FROM papers_keywords JOIN papers ON papers.article_id = papers_keywords.article_id WHERE papers.title = "the challenge of defining information system"
---Question 65:  How many keywords does the paper The challenge of defining information system" have.
SELECT COUNT(DISTINCT papers_keywords.keywords) FROM papers_keywords JOIN papers ON papers.article_id = papers_keywords.article_id WHERE papers.title = "the challenge of defining information system"
---Question 66: What are top 10 most common keywords from all papers.
select papers_keywords.keywords from papers_keywords group by papers_keywords.keywords order by count(*) desc limit 10;
---Question 67: What is the most common keyword.
select papers_keywords.keywords from papers_keywords group by papers_keywords.keywords order by count(*) desc limit 1;
---Question 68: List  journals that mention data science keyword.
select distinct papers.journal from papers join papers_keywords on papers_keywords.article_id = papers.article_id where papers_keywords.keywords = "data science";
---Question 69: What are the journals that mention "data science" keyword.
select distinct papers.journal from papers join papers_keywords on papers_keywords.article_id = papers.article_id where papers_keywords.keywords = "data science";
---Question 70: Show journals that mention "natural language processing" term.
select distinct papers.journal from papers join papers_keywords on papers_keywords.article_id = papers.article_id where papers_keywords.keywords = "natural language processing";
---Question 71: Show paper titles that mention natural language processing.
select papers.title from papers join papers_keywords on papers_keywords.article_id = papers.article_id where papers_keywords.keywords = "natural language processing";
---Question 72: Show abstracts of papers that mention natural language processing.
select papers.abstract from papers join papers_keywords on papers_keywords.article_id = papers.article_id where papers_keywords.keywords = "natural language processing";
---Question 73: List 10 most common keywords of 2021 papers.
select papers_keywords.keywords from papers_keywords  join papers on papers.article_id = papers_keywords.article_id where papers.year = 2021 group by papers_keywords.keywords order by count(*) desc limit 10;
---Question 74: What are 10 most common keywords of 2021 papers?
select papers_keywords.keywords from papers_keywords  join papers on papers.article_id = papers_keywords.article_id where papers.year = 2021 group by papers_keywords.keywords order by count(*) desc limit 10;
---Question 75: What are 10 most common keywords of 2020 papers?
select papers_keywords.keywords from papers_keywords  join papers on papers.article_id = papers_keywords.article_id where papers.year = 2020 group by papers_keywords.keywords order by count(*) desc limit 10;
---Question 76: What are 10 most common keywords of 2014 papers?
select papers_keywords.keywords from papers_keywords  join papers on papers.article_id = papers_keywords.article_id where papers.year = 2014 group by papers_keywords.keywords order by count(*) desc limit 10;
---Question 77:  What distinct journals are included in the database.
Select DISTINCT papers.journal from papers;
---Question 78:  How many distinct journals are included in the database.
Select count(DISTINCT papers.journal) from papers;
---Question 79:  For each journal, list number of papers available in the database.
Select DISTINCT papers.journal, count(*) from papers group by papers.journal;
---Question 80:  What are the biggest 3 journals in terms of numer of published papers there.
SELECT papers.journal FROM papers GROUP BY papers.journal ORDER BY COUNT(*) DESC LIMIT 3
---Question 81:  Which journals have more than 1000 papers published there.
Select papers.journal from papers group by papers.journal having count(*) > 1000;
---Question 82:  From which journals are there papers in the database.
Select DISTINCT papers.journal from papers;
---Question 83: In which journals "data science" keyword is mentioned?
select DISTINCT papers.journal from papers join papers_keywords on papers_keywords.article_id = papers.article_id where papers_keywords.keywords = "data science";
---Question 84: What are the journals mentioning "data science" keyword?
select DISTINCT papers.journal from papers join papers_keywords on papers_keywords.article_id = papers.article_id where papers_keywords.keywords = "data science";
---Question 85: What is  the most common source type of reference citations.
select reference_citations.source_type from reference_citations group by reference_citations.source_type order by count(*) desc limit 1;
---Question 86: What are the source types of reference citations.
select distinct reference_citations.source_type from reference_citations;
---Question 87:  For each source type of reference citations how many papers are available there.
select reference_citations.source_type, count(*) from reference_citations group by reference_citations.source_type;
---Question 88: What are top 3 journals with the highest number of reference citations taken.
select reference_citations.journal from reference_citations group by reference_citations.journal order by count(*) desc limit 3;
---Question 89: What are the journals from which reference citations are taken.
select distinct reference_citations.journal from reference_citations;
---Question 90:  For each journal of reference citations how many papers are available there.
select reference_citations.journal, count(*) from reference_citations group by reference_citations.journal;
---Question 91:  Show journals with number of reference papers in descending order.
select reference_citations.journal, count(*) from reference_citations group by reference_citations.journal order by count(*) desc;
---Question 92: Authors from which top 10 institutions have the highest numbers of papers published?
select authors.institutions from authors group by authors.institutions order by count(*) desc limit 10;
---Question 93: How many paper are there in the database that were published in 2021?
select count(*) from papers where papers.year = 2021;
---Question 94: What are the journals in which papers from 2021 were published.
select papers.journal from papers where papers.year = 2021;
---Question 95: For each journal name list the correponding journal akronym.
select DISTINCT papers.journal, papers.journal_akronym from papers;
---Question 96: How many reference citations are taken from monographs.
select count(*) from reference_citations where reference_citations.source_type = "monograph";
---Question 97: What is the average number of dsr entities across all papers?
select avg(dsr_count.count_dsr_all) from dsr_count;
---Question 98: What is  the id of the paper with highest number of dsr entities.
select article_id from dsr_count group by article_id order by dsr_count.count_dsr_all  desc limit 1;
---Question 99: Which keywords does the paper with id 4134 have?
select papers_keywords.keywords from papers_keywords where papers_keywords.article_id = 4134;
---Question 100: What is the abstract of the the paper with id 4134?
select papers.abstract from papers where papers.article_id = 4134;