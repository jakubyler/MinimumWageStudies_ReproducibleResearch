lp = c(1,2,3,4,5,6,7,8,9,10,11,12,13,14,15)
date = c(1970,1976,1976,1976,1977,1979,1980,1981,1981,1981,1983,1981,1985,1991,1992)
author = c('Kaitz','Mincer','Gramlich','Welch','Ragan','Wachter&Kim','Iden','Ragan','Abowd&Killingsworth','Betsey&Dunson','Brown','Hammermesh','Solon','Wellington','Klerman')
coefs = c(NULL,)

# 1. Kaitz https://fraser.stlouisfed.org/files/docs/publications/bls/bls_1657_1970.pdf
# 2. Mincer https://www.nber.org/system/files/working_papers/w0039/w0039.pdf
# 3. Gramlich https://www.brookings.edu/wp-content/uploads/1976/06/1976b_bpea_gramlich_flanagan_wachter.pdf
# 4. Welch https://www.rand.org/pubs/papers/P5145.html
# 5. Ragan 1977 http://links.jstor.org/sici?sici=0034-6535%28197705%2959%3A2%3C129%3AMWATYL%3E2.0.CO%3B2-X&origin=JSTOR-pdf
# 6. Wachter&Kim https://papers.ssrn.com/sol3/papers.cfm?abstract_id=261237
# 7. Iden
# 8. Ragan 
# 9. Abowd&Killingsworth
# 10. Betsey&Dunson
# 11. Brown
# 12. Hammermesh
# 13. Solon
# 14. Wellington
# 15. Klerman



df = data.frame(lp,author,date, coefs)
