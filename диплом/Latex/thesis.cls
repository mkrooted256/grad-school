\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{thesis}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{report}}
\ProcessOptions
\LoadClass[fleqn,12pt,a4paper]{report}
\PassOptionsToPackage{utf8}{inputenc}
\PassOptionsToPackage{english,ukrainian}{babel}
\PassOptionsToPackage{fleqn}{amsmath}
\RequirePackage{inputenc}
\RequirePackage{babel}
\RequirePackage{amsmath}
\RequirePackage{amsthm}
\RequirePackage{latexsym}
\RequirePackage{amssymb}
\RequirePackage{amscd}
\RequirePackage{epsfig}
\RequirePackage{graphics}
\RequirePackage{longtable}
\RequirePackage{cmap}
\RequirePackage{indentfirst}
\RequirePackage{comment}
\RequirePackage{enumerate}
\RequirePackage[dvipsnames]{xcolor}
\RequirePackage{url}
\RequirePackage[labelsep=period]{caption}

\RequirePackage{subcaption}
\subcaptionsetup{margin=5pt}

\RequirePackage[
 pdftex,
 colorlinks,%
 linkcolor=blue,citecolor=red,urlcolor=blue,
 hyperindex,%
 plainpages=false,%
 bookmarksopen,%
 bookmarksnumbered,%
 unicode]{hyperref}

\numberwithin{equation}{chapter}

\numberwithin{figure}{chapter}

\numberwithin{table}{chapter}

% \numberwithin{footnote}{chapter}

\numberwithin{figure}{section}


\@options
% ****************************************
% *      PARAGRAPHING        *
% ****************************************
%
\parskip 0pt plus 1pt       % Extra vertical space between
                  % paragraphs.
\parindent 2.5em  % It was 3.5em % Width of paragraph indentation.
%\topsep 10pt plus 4pt minus 6pt  % Extra vertical space, in addition
                  % to \parskip, added above and below
                  % list and paragraphing environments.
\partopsep 3pt plus 2pt minus 2pt % Extra vertical space, in addition
                  % to \parskip and \topsep, added when
                  % list leaves blank line before
                  % environment.
%\itemsep 5pt plus 2.5pt minus 1pt % Extra vertical space, in addition
                  % to \parskip, added between list
                  % items.
% See \@listI for values of \topsep and \itemsep
% (Change made 9 Jun 87)

% The following page-breaking penalties are defined

\@lowpenalty  51   % Produced by \nopagebreak[1] or \nolinebreak[1]
\@medpenalty 151   % Produced by \nopagebreak[2] or \nolinebreak[2]
\@highpenalty 301   % Produced by \nopagebreak[3] or \nolinebreak[3]

\@beginparpenalty -\@lowpenalty  % Before a list or paragraph
                  % environment.
\@endparpenalty  -\@lowpenalty  % After a list or paragraph
                  % environment.
\@itempenalty   -\@lowpenalty  % Between list items.

% \clubpenalty     % 'Club line' at bottom of page.
% \widowpenalty    % 'Widow line' at top of page.
% \displaywidowpenalty % Math display widow line.
% \predisplaypenalty  % Breaking before a math display.
% \postdisplaypenalty % Breaking after a math display.
% \interlinepenalty  % Breaking at a line within a paragraph.
% \brokenpenalty    % Breaking after a hyphenated line.

%  ****************************************
%  *    CHAPTERS           *
%  ****************************************
%
% Definition of \part moved to report.doc 19 Jan 88

% \@makechapterhead {TEXT} : Makes the heading for the \chapter
% command.
%

\def\@makechapterhead#1{%      % Heading for \chapter command
 \vspace*{10\p@}{%         % Space at top of text page.
  \begin{center}         %Print '\chaptername' and number.
   \Large\bf\@chapapp\space\thechapter\par
   \vskip 20\p@         % Space between number and title.
   \LARGE \bf #1         % Title.
  \end{center}
 \nobreak            % TeX penalty to prevent page break.
 \vskip 40\p@          % Space between title and text.
 }}

% \@makeschapterhead {TEXT} : Makes the heading for the \chapter*
% command.
%

\def\@makeschapterhead#1{%     % Heading for \chapter* command
 \vspace*{10\p@}{%         % Space at top of page.
  \begin{center}
   \LARGE \bf #1         % Title.
  \end{center}
 \nobreak            % TeX penalty to prevent page break.
 \vskip 10\p@          % Space between title and text.
 }}

% \secdef{UNSTARCMDS}{STARCMDS} :
%  When defining a \chapter or \section command without using
%  \@startsection, you can use \secdef as follows:
%    \def\chapter { ... \secdef \CMDA \CMDB }
%    \def\CMDA  [#1]#2{ ...  % Command to define
%                 % \chapter[...]{...}
%    \def\CMDB  #1{ ...    % Command to define
%                 % \chapter*{...}

\def\chapter{\clearpage   % Starts new page.
  \global\@topnum\z@   % Prevents figures from going at top of page.
  \@afterindentfalse   % Suppresses indent in first paragraph.
  \secdef\@chapter\@schapter}  % Change to \@afterindenttrue to have
                 % indent.

\def\@chapter[#1]#2{\ifnum \c@secnumdepth >\m@ne
    \refstepcounter{chapter}%
    \typeout{\@chapapp\space\thechapter.}%
    \addcontentsline{toc}{chapter}{\protect
    {\noindent\@chapapp\hspace{2mm}\thechapter}\hfil\break #1}
   \else \addcontentsline{toc}{chapter}{#1}\fi
  \chaptermark{#1}%
  \addtocontents{lof}%
    {\protect\addvspace{10\p@}}% Adds between-chapter space
  \addtocontents{lot}%
    {\protect\addvspace{10\p@}}% to lists of figs & tables.
  \if@twocolumn         % Tests for two-column mode.
      \@topnewpage[\@makechapterhead{#2}]%
   \else \@makechapterhead{#2}%
      \@afterheading     % Routine called after chapter and
   \fi}             % section heading.

\def\@schapter#1{\if@twocolumn \@topnewpage[\@makeschapterhead{#1}]%
    \else \@makeschapterhead{#1}%
       \@afterheading\fi}




%  ****************************************
%  *   SECTIONS             *
%  ****************************************


% \@startsection {NAME}{LEVEL}{INDENT}{BEFORESKIP}{AFTERSKIP}{STYLE}
%      optional * [ALTHEADING]{HEADING}
%  Generic command to start a section.
%  NAME    : e.g., 'subsection'
%  LEVEL   : a number, denoting depth of section -- e.g.,
%         chapter=1, section = 2, etc. A section number will be
%         printed if and only if LEVEL < or = the value of the
%         secnumdepth counter.
%  INDENT   : Indentation of heading from left margin
%  BEFORESKIP : Absolute value = skip to leave above the heading.
%         If negative, then paragraph indent of text following
%         heading is suppressed.
%  AFTERSKIP : if positive, then skip to leave below heading,
%            else - skip to leave to right of run-in heading.
%  STYLE   : commands to set style
% If '*' missing, then increments the counter. If it is present, then
% there should be no [ALTHEADING] argument. A sectioning command
% is normally defined to \@startsection + its first six arguments.

%\def\section{\@startsection {section}{1}{\z@}{-3.5ex plus-1ex minus
%  -.2ex}{2.3ex plus.2ex}{\reset@font\Large\bf}}
%\def\subsection{\@startsection{subsection}{2}{\z@}{-3.25ex plus-1ex
%  minus-.2ex}{1.5ex plus.2ex}{\reset@font\large\bf}}
%\def\subsubsection{\@startsection{subsubsection}{3}{\z@}{-3.25ex plus
%  -1ex minus-.2ex}{1.5ex plus.2ex}{\reset@font\bf}}
%\def\paragraph{\@startsection
%  {paragraph}{4}{\z@}{3.25ex plus1ex minus.2ex}{-1em}{\reset@font
%  \normalsize\bf}}
%\def\subparagraph{\@startsection
%  {subparagraph}{4}{\parindent}{3.25ex plus1ex minus
%   .2ex}{-1em}{\reset@font\normalsize\bf}}

\def\section{\@startsection {section}{1}{\parindent}%
              {-3.5ex \@plus -1ex \@minus -.2ex}%
              {2.3ex \@plus.2ex}%
              {\normalfont\Large\bfseries}}
\def\subsection{\@startsection{subsection}{2}{0ex}%
               {-3.25ex\@plus -1ex \@minus -.2ex}%
               {-1.5ex \@plus -.2ex}%
               {\normalfont\large\bfseries}}
\def\subsubsection{\@startsection{subsubsection}{3}{\z@}%
                 {-3.25ex\@plus -1ex \@minus -.2ex}%
                 {-1.5ex \@plus -.2ex}%
                 {\normalfont\normalsize\bfseries}}

% Default initializations of \...mark commands. (See below for their
% us in defining page styles.
%

\def\chaptermark#1{}
%\def\sectionmark#1{}      % Preloaded definitions
% \def\subsectionmark#1{}
% \def\subsubsectionmark#1{}
% \def\paragraphmark#1{}
% \def\subparagraphmark#1{}

% The value of the counter secnumdepth gives the depth of the
% highest-level sectioning command that is to produce section numbers.
%

\setcounter{secnumdepth}{2}
\setcounter{tocdepth}{2}


%  ****************************************
%  *    CHAPTERS AND SECTIONS     *
%  ****************************************
%
% DEFINE COUNTERS:

%
% \arabic{COUNTER} : The value of COUNTER printed as an arabic numeral.
% \roman{COUNTER} : Its value printed as a lower-case roman numberal.
% \Roman{COUNTER} : Its value printed as an upper-case roman numberal.
% \alph{COUNTER}  : Value of COUNTER printed as a lower-case letter:
%             1 = a, 2 = b, etc.
% \Alph{COUNTER}  : Value of COUNTER printed as an upper-case letter:
%              1 = A, 2 = B, etc.
%

\def\thechapter    {\arabic{chapter}}
\def\thesection    {\thechapter.\arabic{section}}
\def\thesubsection  {\thesection.\arabic{subsection}}
\def\thesubsubsection {\thesubsection.\arabic{subsubsection}}
\def\theparagraph   {\thesubsubsection.\arabic{paragraph}}
\def\thesubparagraph {\theparagraph.\arabic{subparagraph}}

% \@chapapp is initially defined to be '\chaptername'. The \appendix
% command redefines it to be '\appendixname'.
%
\def\@chapapp{\chaptername}


% TO PUT DOTS AFTER (SUB)SECTION NUMBERS AND SUBSECTION TITLE

\def\@seccntformat#1{\csname the#1\endcsname.\ }
\let\@Tocseccntformat\@seccntformat
\def\@sect#1#2#3#4#5#6[#7]#8{%
 \ifnum #2>\c@secnumdepth
  \let\@svsec\@empty
 \else
  \refstepcounter{#1}%
  \protected@edef\@svsec{\@seccntformat{#1}\relax}%
 \fi
 \@tempskipa #5\relax
 \ifdim \@tempskipa>\z@
  \begingroup
   #6{%
    \@hangfrom{\hskip #3\relax\@svsec}%
     \interlinepenalty \@M #8\@@par}%
  \endgroup
  \csname #1mark\endcsname{#7}%
  \addcontentsline{toc}{#1}{%
   \ifnum #2>\c@secnumdepth \else
    \protect\numberline{\@Tocseccntformat{#1}}%
   \fi
   #7}%
 \else
  \def\@svsechd{%
   #6{\hskip #3\relax
   \@svsec #8.}%
   \csname #1mark\endcsname{#7}%
   \addcontentsline{toc}{#1}{%
    \ifnum #2>\c@secnumdepth \else
     \protect\numberline{\@Tocseccntformat{#1}}%
    \fi
    #7}}%
 \fi
 \@xsect{#5}}


%  ****************************************
%  *      MISCELLANEOUS       *
%  ****************************************
%
% DATE
%
% we define today's date in European format
%\def\today{\number\day\space
%   \ifcase\month\or
%    января\or февраля\or марта\or апреля\or мая\or июня\or
%    июля\or августа\or сентября\or октября\or ноября\or
%    декабря\fi \space\number\year}

% EQUATION and EQNARRAY -- put here because it must follow \section
% definition
%
% \newcounter{equation}
%
\@addtoreset{equation}{chapter}  % Makes \section reset 'equation'
                 % counter.

\def\theequation{\thechapter.\arabic{equation}}

% TO DOUBLE SIGNS IN TEXTSTYLE
\newcommand{\hm}[1]{#1\nobreak\discretionary{}{\hbox{\ensuremath{#1}}}{}}

% SOVIET STYLE OF REFERENCE LABEL
\renewcommand{\@biblabel}[1]{#1.}

% TO ALLOW BREAKS OF LONG EQUATIONS BETWEEN PAGES
\allowdisplaybreaks

% TO INCREASE VERTICAL SPACE AROUND EQUATIONS
\advance\topsep-3.7pt

% TO INCREASE VERTICAL SPACE BETWEEN ROWS IN 20%
\renewcommand{\baselinestretch}{1.20}

% FOR LOWER BORDERS TO BE EQUAL
%\flushbottom

% PAGE SIZES
\setlength{\textwidth}{160.0mm}
\setlength{\textheight}{230.0mm}%{36\baselineskip}
\setlength{\topmargin}{0mm}%{-5mm}
\setlength{\parindent}{7.0mm}
\setlength{\evensidemargin}{0mm}
\setlength{\oddsidemargin}{10mm}

% ADDITIONAL VERTICAL SPACE IN TABLES: \tsep{1pt} \bsep{1pt}
\def\tsep#1{%
 {\@tempdima=\ht\strutbox\advance\@tempdima #1
  \vrule height \@tempdima depth 0pt width 0pt\nobreak\hspace{0pt}%
 }%
}
\def\bsep#1{%
 {\@tempdima=\dp\strutbox \advance\@tempdima #1
  \nobreak\hspace{0pt}\vrule height 0pt depth \@tempdima width 0pt
 }%
}


\tolerance=9999
\relpenalty=9000
\binoppenalty=8000



% \jot = 3pt   % Extra space added between lines of an eqnarray
         % environment

% The macro \@eqnnum defines how equation numbers are to appear in
% equations.
%
% \def\@eqnnum{(\theequation)}
%


%  ****************************************
%  *     PAGE HEADS and FOOTS    *
%  ****************************************

% mkrooted: VERSIONING
\newcommand{\version}{версія 1}

\renewcommand{\@evenhead}{\null \version \hfill\thepage}
\renewcommand{\@oddhead}{\null \version \hfill\thepage}
\let\@oddfoot\@empty\let\@evenfoot\@empty



%  ****************************************
%  *      UKRAINIAN NAMES      *
%  ****************************************

\renewcommand{\contentsname}{ЗМІСТ}
\renewcommand{\partname}{Частина}
\renewcommand{\chaptername}{РОЗДІЛ}
\renewcommand{\listfigurename}{Список малюнків}
\renewcommand{\listtablename}{Список таблиць}
\renewcommand{\bibname}{Список використаних джерел}
\renewcommand{\indexname}{Предметний покажчик}
\renewcommand{\tablename}{Таблиця}
\renewcommand{\abstractname}{Анотація}
\renewcommand{\figurename}{Рис.}
\renewcommand{\appendixname}{Додаток}
\renewcommand{\proofname}{Доведення}

\newtheorem*{theorem*}{Теорема}
\newtheorem{theorem}{Теорема}[chapter]
\newtheorem{proposition}[theorem]{Твердження}
\newtheorem{statement}[theorem]{Твердження}
\newtheorem{lemma}[theorem]{Лема}
\newtheorem{corollary}[theorem]{Наслідок}
{\theoremstyle{definition}
\newtheorem{definition}[theorem]{Означення}
\newtheorem*{definition*}{Означення}
\newtheorem{remark}[theorem]{Зауваження}
\newtheorem{example}[theorem]{Приклад}
\newtheorem{problem}[theorem]{Задача}
\newtheorem*{Notation}{Позначення}
}

\newcommand{\MyTableCaption}{\refstepcounter{table}\vspace*{-2.5ex}\null \hfill{\it Таблиця~\thetable}}



\endinput
