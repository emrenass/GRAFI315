/* A Bison parser, made by GNU Bison 3.0.4.  */

/* Bison interface for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2015 Free Software Foundation, Inc.

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <http://www.gnu.org/licenses/>.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.

   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

#ifndef YY_YY_Y_TAB_H_INCLUDED
# define YY_YY_Y_TAB_H_INCLUDED
/* Debug traces.  */
#ifndef YYDEBUG
# define YYDEBUG 0
#endif
#if YYDEBUG
extern int yydebug;
#endif

/* Token type.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
  enum yytokentype
  {
    ASSIGN = 258,
    EQUALITYCHECK = 259,
    PLUS = 260,
    EXCLAMATION = 261,
    HASHTAG = 262,
    RARROW = 263,
    LARROW = 264,
    DOUBLEHYPHEN = 265,
    MINUS = 266,
    MUL = 267,
    DIV = 268,
    COMMA = 269,
    DOT = 270,
    LESSTHAN = 271,
    GREATERTHAN = 272,
    LTE = 273,
    GTE = 274,
    NOT = 275,
    CONCAT = 276,
    LPARAN = 277,
    RPARAN = 278,
    LCBRACKET = 279,
    RCBRACKET = 280,
    LSBRACKET = 281,
    RSBRACKET = 282,
    DIGIT = 283,
    LETTER = 284,
    NEWLINE = 285,
    NONSTAR = 286,
    NONSTARNONDIV = 287,
    NONNEWLINE = 288,
    UNDERSCORE = 289,
    STRINGLITERAL = 290,
    BOOL = 291,
    ID = 292,
    INT = 293,
    FLOAT = 294,
    ENDSTATEMENT = 295,
    DIRECTEDGRAPH = 296,
    UNDIRECTEDGRAPH = 297,
    VERTEX = 298,
    EDGE = 299,
    QUESTION = 300,
    AND = 301,
    OR = 302,
    QUERY = 303,
    PROPERTYSIGN = 304,
    HASPROP = 305,
    ABS = 306,
    ROUNDUP = 307,
    ROUNDDOWN = 308,
    INTKEY = 309,
    FLOATKEY = 310,
    BOOLKEY = 311,
    STRINGKEY = 312,
    STAR = 313
  };
#endif
/* Tokens.  */
#define ASSIGN 258
#define EQUALITYCHECK 259
#define PLUS 260
#define EXCLAMATION 261
#define HASHTAG 262
#define RARROW 263
#define LARROW 264
#define DOUBLEHYPHEN 265
#define MINUS 266
#define MUL 267
#define DIV 268
#define COMMA 269
#define DOT 270
#define LESSTHAN 271
#define GREATERTHAN 272
#define LTE 273
#define GTE 274
#define NOT 275
#define CONCAT 276
#define LPARAN 277
#define RPARAN 278
#define LCBRACKET 279
#define RCBRACKET 280
#define LSBRACKET 281
#define RSBRACKET 282
#define DIGIT 283
#define LETTER 284
#define NEWLINE 285
#define NONSTAR 286
#define NONSTARNONDIV 287
#define NONNEWLINE 288
#define UNDERSCORE 289
#define STRINGLITERAL 290
#define BOOL 291
#define ID 292
#define INT 293
#define FLOAT 294
#define ENDSTATEMENT 295
#define DIRECTEDGRAPH 296
#define UNDIRECTEDGRAPH 297
#define VERTEX 298
#define EDGE 299
#define QUESTION 300
#define AND 301
#define OR 302
#define QUERY 303
#define PROPERTYSIGN 304
#define HASPROP 305
#define ABS 306
#define ROUNDUP 307
#define ROUNDDOWN 308
#define INTKEY 309
#define FLOATKEY 310
#define BOOLKEY 311
#define STRINGKEY 312
#define STAR 313

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED

union YYSTYPE
{
#line 60 "query_parser.y" /* yacc.c:1909  */

  char ctf; 
  char * string;
  int integer;

#line 176 "y.tab.h" /* yacc.c:1909  */
};

typedef union YYSTYPE YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;

int yyparse (void);

#endif /* !YY_YY_Y_TAB_H_INCLUDED  */
