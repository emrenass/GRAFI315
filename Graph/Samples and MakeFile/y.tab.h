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
    SPACE = 258,
    ASSIGN = 259,
    EQUALITYCHECK = 260,
    PLUS = 261,
    HASHTAG = 262,
    COLON = 263,
    DIRECTIONARROW = 264,
    BIDIRECTIONALARROW = 265,
    PROPERTYSIGN = 266,
    MINUS = 267,
    MUL = 268,
    DIV = 269,
    COMMA = 270,
    DOT = 271,
    LESSTHAN = 272,
    GREATERTHAN = 273,
    LTE = 274,
    GTE = 275,
    NOT = 276,
    CONCAT = 277,
    LPARAN = 278,
    RPARAN = 279,
    LCBRACKET = 280,
    RCBRACKET = 281,
    LSBRACKET = 282,
    RSBRACKET = 283,
    DIGIT = 284,
    LETTER = 285,
    NEWLINE = 286,
    NONSTAR = 287,
    NONSTARNONDIV = 288,
    NONNEWLINE = 289,
    UNDERSCORE = 290,
    STRINGLITERAL = 291,
    BOOL = 292,
    ID = 293,
    INT = 294,
    FLOAT = 295,
    ENDSTATEMENT = 296,
    COMMENT = 297,
    DIRECTEDGRAPH = 298,
    UNDIRECTEDGRAPH = 299,
    QUERY = 300,
    EDGE = 301,
    VERTEX = 302,
    VERTEXQUERY = 303,
    EDGEQUERY = 304,
    IF = 305,
    AND = 306,
    OR = 307,
    STAR = 308
  };
#endif
/* Tokens.  */
#define SPACE 258
#define ASSIGN 259
#define EQUALITYCHECK 260
#define PLUS 261
#define HASHTAG 262
#define COLON 263
#define DIRECTIONARROW 264
#define BIDIRECTIONALARROW 265
#define PROPERTYSIGN 266
#define MINUS 267
#define MUL 268
#define DIV 269
#define COMMA 270
#define DOT 271
#define LESSTHAN 272
#define GREATERTHAN 273
#define LTE 274
#define GTE 275
#define NOT 276
#define CONCAT 277
#define LPARAN 278
#define RPARAN 279
#define LCBRACKET 280
#define RCBRACKET 281
#define LSBRACKET 282
#define RSBRACKET 283
#define DIGIT 284
#define LETTER 285
#define NEWLINE 286
#define NONSTAR 287
#define NONSTARNONDIV 288
#define NONNEWLINE 289
#define UNDERSCORE 290
#define STRINGLITERAL 291
#define BOOL 292
#define ID 293
#define INT 294
#define FLOAT 295
#define ENDSTATEMENT 296
#define COMMENT 297
#define DIRECTEDGRAPH 298
#define UNDIRECTEDGRAPH 299
#define QUERY 300
#define EDGE 301
#define VERTEX 302
#define VERTEXQUERY 303
#define EDGEQUERY 304
#define IF 305
#define AND 306
#define OR 307
#define STAR 308

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED

union YYSTYPE
{
#line 55 "graph_parser.y" /* yacc.c:1909  */

  char ctf; 
  char * string;
  int integer;

#line 166 "y.tab.h" /* yacc.c:1909  */
};

typedef union YYSTYPE YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;

int yyparse (void);

#endif /* !YY_YY_Y_TAB_H_INCLUDED  */
