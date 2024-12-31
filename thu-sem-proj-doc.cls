%% Copyright 2024 Yanchao Liu
%
% Author:
% Yanchao Liu (marktube)
%
% Created on 2024.4.21
%
% This work may be distributed and/or modified under the
% conditions of the LaTeX Project Public License, either version 1.3c
% of this license or (at your option) any later version.
% The latest version of this license is in
%   https://www.latex-project.org/lppl.txt
% and version 1.3 or later is part of all distributions of LaTeX
% version 2005/12/01 or later.

\ProvidesClass{thu-sem-proj-doc}[2024/4/21 v0.1 thu-sem-proj-doc class by lyc]

\def\@@ptsize{10pt}

\DeclareOption{10pt}{\def\@@ptsize{10pt}}
\DeclareOption{11pt}{\def\@@ptsize{11pt}}
\DeclareOption{12pt}{\def\@@ptsize{12pt}}
\DeclareOption*{%
  \PassOptionsToClass{\CurrentOption}{article}
}

\ProcessOptions\relax
\LoadClass[a4paper,\@@ptsize]{article}
\ProcessOptions


% Dependences
%A Few Useful Packages
\RequirePackage[utf8]{luainputenc}
\RequirePackage{ctex}
\RequirePackage{fontspec} 				% for loading fonts
\RequirePackage{titlesec}
\RequirePackage{color}
\RequirePackage{hyperref}
\RequirePackage{graphicx}
\RequirePackage{multirow}
\RequirePackage{transparent}
\RequirePackage{eso-pic}
\RequirePackage{xcolor}
\RequirePackage{titlesec}               % customize the section headers
\RequirePackage{fancyhdr}               % footnote
\RequirePackage[left=3cm,right=3cm,top=2cm,bottom=2cm]{geometry}
% set the margins
\RequirePackage{tikz}
%\usetikzlibrary{calc}
% set the equations
\RequirePackage{amsmath}
\RequirePackage{amssymb}
% set list
\RequirePackage{enumerate}
% set algorithm
\RequirePackage{algorithm}
\RequirePackage{algorithmic}

% set backgroud pic
\newcommand\BackgroundPic{
    \put(0,0){
        \parbox[b][\paperheight]{\paperwidth}{
            \centering
            \vfill
            \transparent{0.25}
            \includegraphics[width=10cm,keepaspectratio]{thu_logo.jpg} 
            \vfill
        }
    }
}

% set foregroud pic
\newcommand{\ForegroundPic}[3]{
    \AddToHook{shipout/foreground}{
        \begin{tikzpicture}[remember picture,overlay]
            \node[black,rotate=#2,scale=1,opacity=#3] at (current page.center) {\includegraphics[width=10cm,keepaspectratio]{#1}}; 
        \end{tikzpicture}
    }
}

% define date format
\renewcommand{\today}{\number\year 年 \number\month 月 \number\day 日}

\newcommand{\makecover}[2]{
    \thispagestyle{empty}
    \begin{center}
        \vspace*{2cm}
        \fontsize{36pt}{36pt}\selectfont{\songti \textbf{#1}\\}
        \vspace{5cm}
        \fontsize{15pt}{15pt}\selectfont{\heiti #2\\ }
        \vspace{2cm}
        \fontsize{15pt}{15pt}\selectfont{\songti \today\\ }
        \vspace{8cm}
        \includegraphics[width=10cm]{dtlogow.png}
        \end{center}
    \newpage
    \setcounter{page}{1}
}

% Define a header for doc
% Usage: \makedocheader{<left>}{<right>}
\newcommand*{\makedocheader}[3]{
  % setup fancyhdr
  \pagestyle{fancy}
  \fancyhf{}
  \setlength{\headheight}{15pt}
  \rhead{#1}
  \chead{#2}
  \lhead{#3}
}

% Define a footer for doc
% Usage: \makedocfooter{<left>}{<center>}{<right>}
\newcommand*{\makedocfooter}[2]{%
  \fancyfoot{}
  \fancyfoot[L]{#1}
  \fancyfoot[C]{\thepage}
  \fancyfoot[R]{#2}
}

%Setup color for hyper link
\hypersetup{
    colorlinks=true,
    linkcolor=red,
    filecolor=blue,      
    urlcolor=blue,
    citecolor=cyan,
}


% set title format !no chapter macro in article class!
%\titleformat{\chapter}[block]
%  {\centering\fontsize{15pt}{15pt}\selectfont\heiti\thispagestyle{fancy}}{\thechapter}{2pc}{}

%\titleformat{\section}[block]
%  {\fontsize{14pt}{14pt}\selectfont\heiti}
%  {\thesection}{7pt}{}

%\titleformat{\subsection}[block]
%  {\fontsize{14pt}{14pt}\selectfont\heiti}
%  {\thesubsection}{7pt}{}

%\titleformat{\subsubsection}[block]
%  {\fontsize{12pt}{12pt}\selectfont\heiti}
%  {\thesubsubsection}{6pt}{}

% Font
