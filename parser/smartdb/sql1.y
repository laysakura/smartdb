	/* symbolic tokens */

%union {
	int intval;
	double floatval;
	char *strval;
	int subtok;
}

	
%token NAME
%token STRING
%token INTNUM APPROXNUM

	/* operators */

%left OR
%left AND
%left NOT
%left <subtok> COMPARISON /* = <> < > <= >= */
%left '+' '-'
%left '*' '/'
%nonassoc UMINUS

	/* literal keyword tokens */

%token ALL AMMSC ANY AS ASC AUTHORIZATION BETWEEN BY
%token CHARACTER CHECK CLOSE COMMIT CONTINUE CREATE CURRENT
%token CURSOR DECIMAL DECLARE DEFAULT DELETE DESC DISTINCT DOUBLE
%token ESCAPE EXISTS FETCH FLOAT FOR FOREIGN FOUND FROM GOTO
%token GRANT GROUP HAVING IN INDICATOR INSERT INTEGER INTO
%token IS KEY LANGUAGE LIKE MODULE NULLX NUMERIC OF ON
%token OPEN OPTION ORDER PRECISION PRIMARY PRIVILEGES PROCEDURE
%token PUBLIC REAL REFERENCES ROLLBACK SCHEMA SELECT SET
%token SMALLINT SOME SQLCODE SQLERROR TABLE TO UNION
%token UNIQUE UPDATE USER VALUES VIEW WHENEVER WHERE WITH WORK
%token COBOL FORTRAN PASCAL PLI C ADA

%start direct_SQL_statement

%%

direct_SQL_statement
  : directly_executable_statement ';'
  ;

directly_executable_statement
  : direct_SQL_data_statement
    /* TODO */
  ;

direct_SQL_data_statement
  : direct_select_statement_multiple_rows
    /* TODO */
  ;

direct_select_statement_multiple_rows
  : cursor_specification
  ;

cursor_specification
  : query_expression opt_order_by_clause opt_updatability_clause
  ;

query_expression
  : query_specification_body
    /* TODO */
  ;

query_specification_body
  : non_join_query_expression
    /* TODO */
  ;

non_join_query_expression
  : non_join_query_term
    /* TODO */
  ;

non_join_query_term
  : non_join_query_primary
    /* TODO */
  ;

non_join_query_primary
  : simple_table
    /* TODO */
  ;

simple_table
  : query_specification
    /* TODO */
  ;

opt_order_by_clause
  : /* empty */
    /* TODO */
  ;

opt_updatability_clause
  : /* empty */
    /* TODO */
  ;

query_specification
  : SELECT opt_set_quantifier select_list table_expression
  ;

opt_set_quantifier
  : /* TODO */
  ;

select_list
  : '*'
  | select_sublist
  | select_list ',' select_sublist
  ;

select_sublist
  : derived_column
    /* TODO */
  ;

derived_column
  : value_expression
    /* TODO */
  ;

value_expression
  : common_value_expression
    /* TODO */
  ;

common_value_expression
  : reference_value_expression
    /* TODO */
  ;

reference_value_expression
  : value_expression_primary
  ;

value_expression_primary
  : parenthesized_value_expression
  | nonparenthesized_value_expression
  ;

parenthesized_value_expression
  : '(' value_expression ')'
  ;

nonparenthesized_value_expression
  : column_reference
    /* TODO */
  ;

column_reference
  : basic_identifier_chain
    /* TODO */
  ;

basic_identifier_chain
  : identifier_chain
  ;

identifier_chain
  : identifier
    /* TODO */
  ;

identifier
  : actual_identifier
  ;

actual_identifier
  : regular_identifier
    /* TODO */
  ;

regular_identifier
  : identifier_body
  ;

identifier_body
  : identifier_start
    /* TODO */
  ;

identifier_start
  : NAME
  ;

table_expression
  : from_clause opt_where_clause opt_group_by_clause opt_having_clause opt_window_clause
  ;

from_clause
  : FROM table_reference_list
  ;

table_reference_list
  : table_reference
  | table_reference_list ',' table_reference
  ;

table_reference
  : table_primary_or_joined_table
    /* TODO */
  ;

table_primary_or_joined_table
  : table_primary
    /* TODO */
  ;

table_primary
  : table_or_query_name
    /* TODO */
  ;

table_or_query_name
  : table_name
    /* TODO */
  ;

table_name
  : local_or_schema_qualified_name
  ;

local_or_schema_qualified_name
  : qualified_identifier
    /* TODO */
  ;

qualified_identifier
  : identifier
  ;

opt_where_clause
  : /* empty */
    /* TODO */
  ;

opt_group_by_clause
  : /* empty */
    /* TODO */
  ;

opt_having_clause
  : /* empty */
    /* TODO */
  ;

opt_window_clause
  : /* empty */
    /* TODO */
  ;

%%
