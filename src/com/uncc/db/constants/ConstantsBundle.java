package com.uncc.db.constants;

public interface ConstantsBundle {
public static final String queryForAll = "select distinct b.name from BookDetails b,details d,itemDetails i ,MiscDetails m ,referenceDetails r where b.name = d.name and d.oclc_number = i.oclc_number and b.name = r.name and r.isbn = m.isbn  ";
public static final String queryForGet = "select name,oclc_number,publisher,responsibility from uncclibrary where name =";

}
