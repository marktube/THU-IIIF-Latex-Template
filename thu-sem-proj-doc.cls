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
  \PassOptionsToClass{\CurrentOption}{book}
}

\ProcessOptions\relax
\LoadClass[a4paper,\@@ptsize]{book}
\ProcessOptions




% Dependences
%A Few Useful Packages
\RequirePackage[utf8]{luainputenc}
\RequirePackage{ctex}
%\RequirePackage{xeCJK}
\RequirePackage{fontspec} 				% for loading fonts
\RequirePackage{titlesec}
\RequirePackage{caption}
\RequirePackage{hyperref}
\RequirePackage{graphicx}
\RequirePackage{subcaption}
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
% set chinese bibstyle
%\RequirePackage{gbt7714}
%\bibliographystyle{gbt7714-numerical}
\RequirePackage[style=gb7714-2015,backend=biber,sorting=none]{biblatex}
% set chapter counter
\RequirePackage{{chngcntr}}
% code highlight
\RequirePackage{listings}
% table auto new line
\RequirePackage{makecell}
%%% for dashed line in table
\RequirePackage{arydshln}


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
        \includegraphics[width=10cm]{img/iiif-logo.jpeg}
        \end{center}
    \newpage
    \clearpage
    \thispagestyle{empty}  % 清除页码
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

% Set margin for self defined chapter title in toc
%\renewcommand{\cftchapnumwidth}{4em}  % 调整目录编号宽度
\renewcommand{\numberline}[1]{\makebox[3.5em][l]{#1}}  % 调整这里的宽度，例如 3em


%\renewcommand{\contentsname}{\centering 目录}


%Setup color for hyper link
\hypersetup{
    colorlinks=true,
    linkcolor=red,
    filecolor=blue,      
    urlcolor=blue,
    citecolor=cyan,
}

% Setup caption font
\captionsetup{
    font={normalsize,it,stretch=1.25},justification=raggedright,
    labelfont={small,bf,stretch=1.25}
}

% Setup python code highlight
\lstdefinestyle{mystyle}{
    language=Python,
    backgroundcolor=\color{gray!10},   
    commentstyle=\color{green!60!black},
    keywordstyle=\color{blue},
    numberstyle=\tiny\color{gray},
    stringstyle=\color{orange},
    basicstyle=\ttfamily\small,
    breaklines=true,
    numbers=left,
    numbersep=5pt,
    frame=single,
    showstringspaces=false,
    tabsize=4,
}
\lstset{style=mystyle}


% set title format !no chapter macro in article class!

\renewcommand{\thechapter}{第\chinese{chapter}章}
% 让 section 不带 chapter 编号
\renewcommand{\thesection}{\arabic{chapter}.\arabic{section}}
\renewcommand{\thesubsection}{\arabic{chapter}.\arabic{section}.\arabic{subsection}}
\renewcommand{\thesubsubsection}{\arabic{subsubsection}}
% 让图表编号跟随章节
\counterwithin{table}{chapter}
\renewcommand{\thetable}{\arabic{chapter}-\arabic{table}}

\counterwithin{figure}{chapter}
\renewcommand{\thefigure}{\arabic{chapter}-\arabic{figure}}

\counterwithin{equation}{chapter}
\renewcommand{\theequation}{\arabic{chapter}.\arabic{equation}}


\titleformat{\chapter}[block]
  {\centering\fontsize{18pt}{18pt}\selectfont\heiti\thispagestyle{fancy}}{\thechapter}{2pc}{}

\titleformat{\section}[block]
  {\fontsize{16pt}{16pt}\selectfont\heiti}
  {\thesection}{7pt}{}

\titleformat{\subsection}[block]
  {\fontsize{14pt}{14pt}\selectfont\heiti}
  {\thesubsection}{7pt}{}

\titleformat{\subsubsection}[block]
  {\fontsize{12pt}{12pt}\selectfont\heiti}
  {\thesubsubsection}{6pt}{}

% Font
%\setCJKmainfont{}
% 设置英文字体为 Times New Roman
\setmainfont{Times New Roman}

% 设置中文为仿宋（可选）
%\setCJKmainfont{FangSong}
\setCJKmainfont{AdobeFangsongStd-Regular}[
  Path = /Users/yanchaoliu/Downloads/latex/fonts/,
  Extention = .otf
  BoldFont = {AdobeHeitiStd-Regular},
  ItalicFont = {AdobeKaitiStd-Regular}  
]

% set ref font as songti
\renewcommand{\bibfont}{\fontsize{12pt}{14pt}\selectfont\songti}

% set bold in chinese
\newcommand{\textbfcn}[1]{{\songti #1}}
