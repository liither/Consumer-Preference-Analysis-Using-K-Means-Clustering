session server;

/* Start checking for existence of each input table */
exists0=doesTableExist("CASUSER(dasmond.tan@student.umn.ac.id)", "ADIDASSALESDATA");
if exists0 == 0 then do;
  print "Table "||"CASUSER(dasmond.tan@student.umn.ac.id)"||"."||"ADIDASSALESDATA" || " does not exist.";
  print "UserErrorCode: 100";
  exit 1;
end;
print "Input table: "||"CASUSER(dasmond.tan@student.umn.ac.id)"||"."||"ADIDASSALESDATA"||" found.";
/* End checking for existence of each input table */


  _dp_inputTable="ADIDASSALESDATA";
  _dp_inputCaslib="CASUSER(dasmond.tan@student.umn.ac.id)";

  _dp_outputTable="b4bc7097-8064-4003-ac25-f724c79e17bf";
  _dp_outputCaslib="CASUSER(dasmond.tan@student.umn.ac.id)";

dataStep.runCode result=r status=rc / code='/* BEGIN data step with the output table                                           data */
data "b4bc7097-8064-4003-ac25-f724c79e17bf" (caslib="CASUSER(dasmond.tan@student.umn.ac.id)" promote="no");

    length
       "Gender"n varchar(5)
    ;
    label
        "Gender"n=""
    ;
    format
        "Gender"n 5.
    ;

    /* Set the input                                                                set */
    set "ADIDASSALESDATA" (caslib="CASUSER(dasmond.tan@student.umn.ac.id)"   drop="Retailer_ID"n  rename=("Gender_Type"n = "Gender"n) );

    /* BEGIN statement 4093b46f_3c42_417d_bbf0_dae694d89ca3                      casing */
    "Product_Category"n = kupcase("Product_Category"n);
    /* END statement 4093b46f_3c42_417d_bbf0_dae694d89ca3                        casing */

    /* BEGIN statement 799e68a5_67e9_40f3_85af_5f4b8f2182b3               simple_filter */
    if
        ^missing ("Total_Sales"n)
        ;
    /* END statement 799e68a5_67e9_40f3_85af_5f4b8f2182b3                 simple_filter */

    /* BEGIN statement 799e68a5_67e9_40f3_85af_5f4b8f2182b3               simple_filter */
    if
        ^missing ("Price_per_Unit"n)
        ;
    /* END statement 799e68a5_67e9_40f3_85af_5f4b8f2182b3                 simple_filter */

    /* BEGIN statement 799e68a5_67e9_40f3_85af_5f4b8f2182b3               simple_filter */
    if
        ^missing ("Units_Sold"n)
        ;
    /* END statement 799e68a5_67e9_40f3_85af_5f4b8f2182b3                 simple_filter */

/* END data step                                                                    run */
run;
';
if rc.statusCode != 0 then do;
  print "Error executing datastep";
  exit 2;
end;
  _dp_inputTable="b4bc7097-8064-4003-ac25-f724c79e17bf";
  _dp_inputCaslib="CASUSER(dasmond.tan@student.umn.ac.id)";

  _dp_outputTable="ADIDASSALESDATA_PREPARED";
  _dp_outputCaslib="CASUSER(dasmond.tan@student.umn.ac.id)";

srcCasTable="b4bc7097-8064-4003-ac25-f724c79e17bf";
srcCasLib="CASUSER(dasmond.tan@student.umn.ac.id)";
tgtCasTable="ADIDASSALESDATA_PREPARED";
tgtCasLib="CASUSER(dasmond.tan@student.umn.ac.id)";
saveType="csv";
tgtCasTableLabel="";
replace=1;
saveToDisk=1;

exists = doesTableExist(tgtCasLib, tgtCasTable);
if (exists !=0) then do;
  if (replace == 0) then do;
    print "Table already exists and replace flag is set to false.";
    exit ({severity=2, reason=5, formatted="Table already exists and replace flag is set to false.", statusCode=9});
  end;
end;

if (saveToDisk == 1) then do;
  /* Save will automatically save as type represented by file ext */
  saveName=tgtCasTable;
  if(saveType != "") then do;
    saveName=tgtCasTable || "." || saveType;
  end;
  table.save result=r status=rc / caslib=tgtCasLib name=saveName replace=replace
    table={
      caslib=srcCasLib
      name=srcCasTable
    };
  if rc.statusCode != 0 then do;
    return rc.statusCode;
  end;
  tgtCasPath=dictionary(r, "name");

  dropTableIfExists(tgtCasLib, tgtCasTable);
  dropTableIfExists(tgtCasLib, tgtCasTable);

  table.loadtable result=r status=rc / caslib=tgtCasLib path=tgtCasPath casout={name=tgtCasTable caslib=tgtCasLib} promote=1;
  if rc.statusCode != 0 then do;
    return rc.statusCode;
  end;
end;

else do;
  dropTableIfExists(tgtCasLib, tgtCasTable);
  dropTableIfExists(tgtCasLib, tgtCasTable);
  table.promote result=r status=rc / caslib=srcCasLib name=srcCasTable target=tgtCasTable targetLib=tgtCasLib;
  if rc.statusCode != 0 then do;
    return rc.statusCode;
  end;
end;


dropTableIfExists("CASUSER(dasmond.tan@student.umn.ac.id)", "b4bc7097-8064-4003-ac25-f724c79e17bf");

function doesTableExist(casLib, casTable);
  table.tableExists result=r status=rc / caslib=casLib table=casTable;
  tableExists = dictionary(r, "exists");
  return tableExists;
end func;

function dropTableIfExists(casLib,casTable);
  tableExists = doesTableExist(casLib, casTable);
  if tableExists != 0 then do;
    print "Dropping table: "||casLib||"."||casTable;
    table.dropTable result=r status=rc/ caslib=casLib table=casTable quiet=0;
    if rc.statusCode != 0 then do;
      exit();
    end;
  end;
end func;

/* Return list of columns in a table */
function columnList(casLib, casTable);
  table.columnInfo result=collist / table={caslib=casLib,name=casTable};
  ndimen=dim(collist['columninfo']);
  featurelist={};
  do i =  1 to ndimen;
    featurelist[i]=upcase(collist['columninfo'][i][1]);
  end;
  return featurelist;
end func;
