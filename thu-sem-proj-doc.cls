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
\LoadClass[a4paper,\@@ptsize, twoside]{book}
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
%\RequirePackage{bm}
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
%%% adjust footnote position
%\RequirePackage{afterpage}
% set circled numbers
\RequirePackage{pifont}
\renewcommand{\thefootnote}{\ding{\numexpr171+\value{footnote}}}

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

% set watermark
\newcommand{\watermark}[3]{
    \AddToHook{shipout/foreground}{
        \begin{tikzpicture}[remember picture,overlay]
         \foreach \y in {-12, -4, 4, 12} {
           \foreach \x in {-10.5, -3.5, 3.5, 10.5}{
             \node[black,rotate=#2,scale=2,opacity=#3] at ([xshift=\x cm, yshift=\y cm] current page.center) {\textcolor{gray!80!cyan!30}{#1}}; 
           }
         }
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
        \includegraphics[width=6cm]{img/thu-pub.png}
        \end{center}
    \newpage
    \clearpage
    \thispagestyle{empty}  % 清除页码
}

% for leftmark command removing number label
\renewcommand{\chaptermark}[1]{\markboth{#1}{}}

% Define a header for doc
% Usage: \makedocheader{<left>}{<right>}
\newcommand*{\makedocheader}[1]{
  % setup fancyhdr
  \pagestyle{fancy}
  \setlength{\headheight}{15pt}.
  \fancyhead{} % 清空页眉
  \renewcommand{\headrulewidth}{0pt} % 移除页眉下方的横线
  % 设置页眉
  \fancyhead[LE]{\thepage\quad\quad \textbf{#1}}      % L: Left, E: Even (偶数页左侧显示页码)
  \fancyhead[RO]{\textbf{
    \ifnum\value{chapter}=0
      \leftmark
    \else
      \thechapter\quad\leftmark
    \fi
  }\quad\quad\thepage}      % R: Right, O: Odd (奇数页右侧显示页码)
  %\fancyhead[RE]{章节名称}      % 偶数页右侧可显示章名（可选）
  %\fancyhead[LO]{文章标题}      % 奇数页左侧可显示标题（可选）
  %\fancyhf{}
  %\setlength{\headheight}{15pt}
  %\rhead{#1}
  %\chead{#2}
  %\lhead{#3}
}


% Define a footer for doc
% Usage: \makedocfooter{<left>}{<center>}{<right>}
\newcommand*{\makedocfooter}[2]{%
  \fancyfoot{}
  \fancyfoot[L]{#1}
  \fancyfoot[C]{\thepage}
  \fancyfoot[R]{#2}
}

% footnote numbered per page
\counterwithin*{footnote}{page}
% forbid footnote splitting in page
%\interfootnotelinepenalty=10000

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


%\newCJKfontfamily{\kaishu}{AdobeKaitiStd-Regular}[
%  Path = ./fonts/,
%  Extension = .otf
%]
\DeclareCaptionFont{kaishu}{\kaishu}
\DeclareCaptionFont{heiti}{\heiti}
\DeclareCaptionLabelSeparator{twospace}{\hspace{0.6em}}
% Setup caption font
\captionsetup{
    labelsep=twospace,
    font={normalsize,kaishu,stretch=1.25},
    justification=raggedright,
    labelfont={small,heiti,stretch=1.25}
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

%\renewcommand{\thechapter}{第\chinese{chapter}章}
\renewcommand{\thechapter}{第\arabic{chapter}章}
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



%\titleformat{\chapter}[block]
%  {\hfill\fontsize{18pt}{18pt}\selectfont\heiti\thispagestyle{empty}}{\thechapter}{2pc}{}

\titleformat{\chapter}[display]
  {\selectfont\heiti\thispagestyle{empty}}
  {%
    \begin{tikzpicture}[remember picture,overlay]
      \node[black,rotate=0,scale=1.5,opacity=0.25] at (current page.center) {\includegraphics[width=\paperwidth]{img/ccover.png}}; 
    \end{tikzpicture}
    %\vspace*{1cm}
    \hfill
    \huge\bfseries
    \thechapter
  }
  {1em}
  {\hfill\Huge\bfseries}
  [\ifnum\value{chapter}>0
      \clearpage
    \fi]

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
  Path = ./fonts/,
  Extension = .otf,
  BoldFont = {AdobeHeitiStd-Regular},
  ItalicFont = {AdobeKaitiStd-Regular}  
]

% load adobe song font
\newCJKfontfamily{\adobesong}{AdobeSongStd-Light}[
  Path = ./fonts/,
  Extension = .otf
]

% set ref font as songti
\renewcommand{\bibfont}{\fontsize{12pt}{14pt}\selectfont\adobesong}

% set bold in chinese
\newcommand{\textbfcn}[1]{{\songti #1}}
