% LaTeX Dokumentenklasse f�r die LNI Reihe der GI
%
% (C) 2002 Robert Tolksdorf
% Im Fall von Fragen zu dieser Dokumentenklasse wenden Sie sich bitte
% an mail@robert-tolksdorf.de
%
%
\ProvidesClass{akdw}[2004/13/07 v0.41, by Robert Tolksdorf, Berlin customized FZ 2015/10/24]

%\newif\ifpdf\ifx\pdfoutput\undefined\pdffalse\else\pdfoutput=1\pdftrue\fi


\newif\iflnienglish\lnienglishfalse
\DeclareOption{english}{\lnienglishtrue}

\ProcessOptions

% 10 pt
\LoadClass[12pt,a4paper,fleqn]{article}
\RequirePackage[english,ngerman]{babel}
\iflnienglish\selectlanguage{english}\def\bbl@main@language{english}\fi
% Blocksatz durch LaTeX-Default
% Satzspiegel
\setlength{\textheight}{222mm}
\setlength{\textwidth}{160mm}
\oddsidemargin0pt
\topmargin0pt
% Times als Grundschrift
\RequirePackage{times}
% Hyphenation
% Durch normale LaTeX-Parameter verhindert (\doublehyphendemerits)

% Title: Kopie aus article.cls mit anderem \thispagestyle
\renewcommand\maketitle{\par
  \begingroup
    \renewcommand\thefootnote{\@fnsymbol\c@footnote}%
    \def\@makefnmark{\rlap{\@textsuperscript{\normalfont\@thefnmark}}}%
    \long\def\@makefntext##1{\parindent 1em\noindent
            \hb@xt@1.8em{%
                \hss\@textsuperscript{\normalfont\@thefnmark}}##1}%
    \if@twocolumn
      \ifnum \col@number=\@ne
        \@maketitle
      \else
        \twocolumn[\@maketitle]%
      \fi
    \else
      \newpage
      \global\@topnum\z@   % Prevents figures from going at top of page.
      \@maketitle
    \fi
    \thispagestyle{empty}\@thanks
  \endgroup
  \setcounter{footnote}{0}%
  \global\let\thanks\relax
  \global\let\maketitle\relax
  \global\let\@maketitle\relax
  \global\let\@thanks\@empty
  \global\let\@author\@empty
  \global\let\@date\@empty
  \global\let\@title\@empty
  \global\let\title\relax
  \global\let\author\relax
  \global\let\date\relax
  \global\let\and\relax
}
\def\@maketitle{%
  \newpage
  \null
  \vskip 2em%
  \begin{center}%
  \let \footnote \thanks
    {\fontsize{16}{20}\fontseries{b}\selectfont \@title \par}%
    \vskip 1.5em%
    {\fontsize{12}{14}\selectfont
      \lineskip .5em%
      \begin{tabular}[t]{c}%
        \@author
      \end{tabular}\par}%
    \vskip 1\baselineskip%
  \end{center}%
  \par
  }

% Abstract
\renewenvironment*{abstract}{%
 \renewcommand{\abstractname}{Abstract}
 \fontsize{9}{10}\selectfont
    \quotation\noindent{\bfseries \abstractname:}%
}{\endquotation}  

% �berschriften
\renewcommand{\section}{\@startsection{section}{1}{\z@}%
  {2\baselineskip}{\baselineskip}{\fontsize{14}{17}\fontseries{b}\selectfont}}
\renewcommand{\subsection}{\@startsection{subsection}{2}{\z@}%
  {2\baselineskip}{\baselineskip}{\fontsize{12}{14}\fontseries{b}\selectfont}}
% weitere nicht durch Formatvorlage gekl�rt


% Bildunterschriften
\long\def\@makecaption#1#2{%
  \vskip\abovecaptionskip
  {\fontsize{9}{10}\selectfont
   \sbox\@tempboxa{#1: #2}%
  \ifdim \wd\@tempboxa >\hsize
    #1: #2\par
  \else
    \global \@minipagefalse
    \hb@xt@\hsize{\hfil\box\@tempboxa\hfil}%
  \fi}
  \vskip\belowcaptionskip}

% gleichungen mit richtiger einr�ckung
% fleqn-Option oben
\setlength{\mathindent}{1.5cm}

% listings mit richtiger einr�ckung
\RequirePackage{verbatim}
\def\verbatim@processline{\hskip4ex\the\verbatim@line\par}

% Fussnoten mit 5cm Linie und richtiger Gr��e
\renewcommand\footnoterule{%
  \kern-3\p@
  \hrule\@width5cm
  \kern2.6\p@}
\renewcommand\@makefntext[1]{%
    \parindent 1em%
    \noindent
    \hb@xt@1.8em{\hss\@makefnmark}{\fontsize{10}{12}\selectfont#1}}

%
\RequirePackage{listings}
\lstloadlanguages{Java}
\lstset{language=Java,keywordstyle=\bfseries,basewidth=5.5pt,xleftmargin=1.5cm,
 literate={�}{{\"o}}1
           {�}{{\"a}}1
           {�}{{\"u}}1
           {�}{{\"U}}1
           {�}{{\"A}}1
           {�}{{\"O}}1
           {�}{{\3}}1
}    
    
% Gemutma�te Absatzeinz�ge und Abst�nde
\parindent0pt
\parskip 1ex

% bibliography
\iflanguage{english}{\bibliographystyle{ak}}{\bibliographystyle{akg}}
\renewenvironment{thebibliography}[1]
     {%\def\refname{Literaturverzeichnis}
      \section*{\refname}%
      \bgroup\fontsize{10}{12}\selectfont
      \list{\@biblabel{\@arabic\c@enumiv}}%
           {\settowidth\labelwidth{\@biblabel{#1}}%
            \leftmargin\labelwidth
            \advance\leftmargin\labelsep
            \@openbib@code
            \usecounter{enumiv}%
            \let\p@enumiv\@empty
            \renewcommand\theenumiv{\@arabic\c@enumiv}}%
      \sloppy
      \clubpenalty4000
      \@clubpenalty \clubpenalty
      \widowpenalty4000%
      \sfcode`\.\@m}
     {\def\@noitemerr
       {\@latex@warning{Empty `thebibliography' environment}}%
      \endlist\egroup}

 % numbering of figures by section     
\@addtoreset{figure}{section}     
\@namedef{thefigure}{\arabic{section}.\arabic{figure}}

   