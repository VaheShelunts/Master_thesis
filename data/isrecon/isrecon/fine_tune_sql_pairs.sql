---Question 1: Which papers were written by James Hansen?
SELECT distinct papers.title from papers join authors on authors.article_id = papers.article_id where authors.firstname = "James" and authors.surname = "Hansen";
---Question 2: What is the number of papers written by James Hansen?
SELECT COUNT(distinct papers.title) from papers join authors on authors.article_id = papers.article_id where authors.firstname = "James" and authors.surname = "Hansen";
---Question 3: What is the first name and surname of the author that published the highest number of papers in 2020?
select authors.firstname, authors.surname from authors join papers on papers.article_id = authors.article_id GROUP by authors.firstname, authors.surname ORDER by count(papers.article_id) DESC LIMIT 1;
---Question 4: Number of James Hansen's paper written in 2012?
SELECT count(distinct papers.article_id) from papers join authors on authors.article_id = papers.article_id where  papers.year = 2012 and authors.firstname = "James" and authors.surname = "Hansen";
---Question 5: Show paper produced by James Hansen in 2012?
SELECT papers.title from papers join authors on authors.article_id = papers.article_id where  papers.year = 2012 and authors.firstname = "James" and authors.surname = "Hansen";
---Question 6: Number of papers published in 2012.
SELECT count(*) from papers where  papers.year = 2012;
---Question 7: What are the titles of papers published in 2012.
SELECT papers.title FROM papers WHERE papers.year = 2012;
---Question 8: In how many journals did papers of James Hansen appear?
SELECT count(DISTINCT journal_akronym) from papers  join authors on authors.article_id = papers.article_id where authors.firstname = "James" and authors.surname = "Hansen";
---Question 9: Show papers published in European Journal Of Information Systems journal.
SELECT papers.title FROM papers WHERE papers.journal = "European Journal Of Information Systems";
---Question 10: The number of papers in European Journal Of Information Systems journal.
SELECT COUNT(*) FROM papers WHERE papers.journal = "European Journal Of Information Systems";
---Question 11:  The number of papers published in European Journal Of Information Systems journal in 2021?
SELECT COUNT(*) FROM papers WHERE papers.journal_akronym = "JIT" AND papers.year = 2021;
---Question 12: How many papers were published by authors from TU Berlin?
SELECT COUNT(DISTINCT papers.title) FROM papers JOIN authors on authors.article_id = papers.article_id WHERE authors.institutions = "TU Berlin";
---Question 13: What are the paper titles published by authors from New York University?
SELECT DISTINCT papers.title FROM authors JOIN papers ON papers.article_id = authors.article_id WHERE authors.institutions = "New York University";
---Question 14: List the  journal name with the highest number of paper publications?
SELECT papers.journal FROM papers GROUP BY papers.journal ORDER BY COUNT(*) DESC LIMIT 1;
---Question 15:  Which references from IEEE journal have the highest number of citations?
SELECT reference_citations.citekey from reference_citations join citations on citations.reference_citekey = reference_citations.citekey WHERE  reference_citations.journal = "IEEE" group by reference_citations.citekey order by count(*) DESC;
---Question 16:  Which top 5 references from IEEE journal have the highest number of citations?
SELECT reference_citations.citekey from reference_citations join citations on citations.reference_citekey = reference_citations.citekey WHERE  reference_citations.journal = "IEEE" group by reference_citations.citekey order by count(*) DESC LIMIT 5;
---Question 17: Show names and abstracts for papers published in Mis Quarterly journal?
select papers.title, papers.abstract from papers  where papers.journal = "Mis Quarterly";
---Question 18: What are the names and abstracts of papers published in Mis Quarterly journal in 2020?
SELECT papers.title, papers.abstract FROM papers WHERE papers.journal = "Mis Quarterly" AND papers.year = 2020
---Question 19: Show titles of top 10 papers with highest number of citations in IEEE journal.
select distinct reference_citations.title from reference_citations  join citations on citations.reference_citekey = reference_citations.citekey where reference_citations.journal = "IEEE" group by reference_citations.title order by count(citations.reference_citekey) DESC limit 10;
---Question 20: What are the papers having at least 200 citations?
SELECT reference_citations.citekey from reference_citations join citations on citations.reference_citekey = reference_citations.citekey group by reference_citations.citekey HAVING COUNT(*) >= 200;
---Question 21: List titles of the papers with at least 200 citations.
SELECT reference_citations.title from reference_citations join citations on citations.reference_citekey = reference_citations.citekey group by reference_citations.title HAVING COUNT(*) >= 200;
---Question 22: Show titles of reference papers that have at least 200 citations.
SELECT reference_citations.title from reference_citations join citations on citations.reference_citekey = reference_citations.citekey group by reference_citations.title HAVING COUNT(*) >= 200;
---Question 23: List titles of the referenced papers published in 2012 with at least 100 citations?
SELECT reference_citations.citekey from reference_citations join citations on citations.reference_citekey = reference_citations.citekey  WHERE reference_citations.year = 2010 group by reference_citations.citekey HAVING COUNT(*) >= 100;
---Question 24: What are the papers published in IEEE journal  with at least 5 citations?
SELECT reference_citations.citekey from reference_citations join citations on citations.reference_citekey = reference_citations.citekey  WHERE  reference_citations.journal = "IEEE"  group by reference_citations.citekey  HAVING COUNT(*) >= 5;
---Question 25: What are the papers published in in 2018 with at least 10 citations?
SELECT reference_citations.citekey from reference_citations join citations on citations.reference_citekey = reference_citations.citekey  WHERE reference_citations.year = 2018  group by reference_citations.citekey HAVING COUNT(*) >= 10;
---Question 26: What are the titles of references with less than 20 citations?
select reference_citations.title from citations join reference_citations on reference_citations.citekey = citations.reference_citekey group by reference_citekey having count(*) <20;
---Question 27: Show journals available in the database.
SELECT DISTINCT papers.journal FROM papers;
---Question 28: List titles of papers that mention "design science" keyword.
select papers.title from papers join papers_keywords on papers_keywords.article_id = papers.article_id where papers_keywords.keywords = "design science";
---Question 29: Show paper titles that mention "design science" keyword.
select papers.title from papers join papers_keywords on papers_keywords.article_id = papers.article_id where papers_keywords.keywords = "design science";
---Question 30: How many papers mention "data science" keyword.
select count(*) from papers join papers_keywords on papers_keywords.article_id = papers.article_id where papers_keywords.keywords = "design science";
---Question 31: For each paper mentioning "design science" keyword show the title and abstract.
select papers.title, papers.abstract  from papers join papers_keywords on papers_keywords.article_id = papers.article_id where papers_keywords.keywords = "design science";
---Question 32: In which papers from 2021 "design science" keyword is mentioned.
select papers.title from papers join papers_keywords on papers_keywords.article_id = papers.article_id where papers_keywords.keywords = "design science" and papers.year = 2021;
---Question 33:  List the keywords mentioned in the paper "REDUCING RECOMMENDER SYSTEM BIASES: AN INVESTIGATION OF RATING DISPLAY DESIGNS 1 Adomavicius et al./Reducing Recommender System Biases".
select papers_keywords.keywords from papers_keywords join papers on papers.article_id = papers_keywords.article_id where papers.title = "REDUCING RECOMMENDER SYSTEM BIASES: AN INVESTIGATION OF RATING DISPLAY DESIGNS 1 Adomavicius et al./Reducing Recommender System Biases";
---Question 34:  How many keywords does the paper "REDUCING RECOMMENDER SYSTEM BIASES: AN INVESTIGATION OF RATING DISPLAY DESIGNS 1 Adomavicius et al./Reducing Recommender System Biases" have.
select count(*)  from papers_keywords join papers on papers.article_id = papers_keywords.article_id where papers.title = "REDUCING RECOMMENDER SYSTEM BIASES: AN INVESTIGATION OF RATING DISPLAY DESIGNS 1 Adomavicius et al./Reducing Recommender System Biases";
---Question 35: What are top 20 most frequent keywords from all papers.
select papers_keywords.keywords from papers_keywords group by papers_keywords.keywords order by count(*) desc limit 10;
---Question 36: What is the most frequently mentioned keyword.
select papers_keywords.keywords from papers_keywords group by papers_keywords.keywords order by count(*) desc limit 1;
---Question 37: List  journals that mention "recommender systems" keyword.
select distinct papers.journal from papers join papers_keywords on papers_keywords.article_id = papers.article_id where papers_keywords.keywords = "recommender systems";
---Question 38: List 10 most commonly used keywords of 2020 papers.
select papers_keywords.keywords from papers_keywords  join papers on papers.article_id = papers_keywords.article_id where papers.year = 2020 group by papers_keywords.keywords order by count(*) desc limit 10;
---Question 39:  What distinct journals are included in the database.
Select DISTINCT papers.journal from papers;
---Question 40: What are the types of source of reference citations.
select distinct reference_citations.source_type from reference_citations;
---Question 41:  For each source type of reference citations how many papers are available there.
select reference_citations.source_type, count(*) from reference_citations group by reference_citations.source_type;
---Question 42: What are top 5 journals in terms of highest number of reference citations taken.
select reference_citations.journal from reference_citations group by reference_citations.journal order by count(*) desc limit 5;
---Question 43: What are the journals from which reference citations are taken.
select distinct reference_citations.journal from reference_citations;
---Question 44:  For each journal of reference citations show the number of available papers there
select reference_citations.journal, count(*) from reference_citations group by reference_citations.journal;
---Question 45:  Show journals and number of reference papers in descending order.
select reference_citations.journal, count(*) from reference_citations group by reference_citations.journal order by count(*) desc;
---Question 46:Show the journal acronym for each corresponding journal nam.
select DISTINCT papers.journal, papers.journal_akronym from papers;
---Question 47: How many reference citations are taken from monographs source type.
select count(*) from reference_citations where reference_citations.source_type = "monograph";
---Question 48: What is the average number of dsr for all papers?
select avg(dsr_count.count_dsr_all) from dsr_count;
---Question 49: What is  the id of the article with highest number of dsr.
select article_id from dsr_count group by article_id order by dsr_count.count_dsr_all  desc limit 1;
---Question 50: Which keywords are in the paper with id 102?
select papers_keywords.keywords from papers_keywords where papers_keywords.article_id = 102;
---Question 51: Show papers published in 2021 that mention "design science" keyword.
select papers.title from papers join papers_keywords on papers_keywords.article_id = papers.article_id where papers_keywords.keywords = "design science" and papers.year = 2021;