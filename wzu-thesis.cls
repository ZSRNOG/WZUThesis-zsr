% Wenzhou University master thesis class.
% Contact: zsrnog@yeah.net
% Compile with XeLaTeX + biber. See README.md for usage.
\NeedsTeXFormat{LaTeX2e}[2020-10-01]
\ProvidesClass{wzu-thesis}[2026/06/13 v2.0 WZU master thesis template]

\RequirePackage{iftex}
\ifXeTeX\else
  \ClassError{wzu-thesis}{Please compile with XeLaTeX}{Use: latexmk -xelatex thesis.tex}
\fi

\newif\ifwzu@anonymous
\newif\ifwzu@print
\newif\ifwzu@draft

\DeclareOption{anonymous}{\wzu@anonymoustrue}
\DeclareOption{blind}{\wzu@anonymoustrue}
\DeclareOption{print}{\wzu@printtrue\PassOptionsToClass{twoside}{ctexbook}}
\DeclareOption{twoside}{\PassOptionsToClass{twoside}{ctexbook}}
\DeclareOption{oneside}{\PassOptionsToClass{oneside}{ctexbook}}
\DeclareOption{draft}{\wzu@drafttrue\PassOptionsToClass{draft}{ctexbook}}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{ctexbook}}
\ExecuteOptions{twoside}
\ProcessOptions\relax

\LoadClass[UTF8,a4paper,zihao=-4]{ctexbook}

\RequirePackage{etoolbox}
\RequirePackage{kvsetkeys}
\RequirePackage{geometry}
\RequirePackage{setspace}
\RequirePackage{fancyhdr}
\RequirePackage{titlesec}
\RequirePackage{graphicx}
\RequirePackage{pdfpages}
\RequirePackage{tikz}
\RequirePackage{xcolor}
\RequirePackage{caption}
\RequirePackage{subcaption}
\RequirePackage{booktabs}
\RequirePackage{tabularx}
\RequirePackage{longtable}
\RequirePackage{makecell}
\RequirePackage{multirow}
\RequirePackage{threeparttable}
\RequirePackage{array}
\RequirePackage{enumitem}
\RequirePackage{float}
\RequirePackage[section]{placeins}
\RequirePackage{amsmath}
\RequirePackage{amssymb}
\RequirePackage{amsthm}
\RequirePackage{mathtools}
\RequirePackage{bm}
\RequirePackage{siunitx}
\RequirePackage{algorithm}
\RequirePackage{algpseudocode}
\RequirePackage{listings}
\RequirePackage[backend=biber,style=gb7714-2015,gbpub=false,gbnamefmt=lowercase]{biblatex}
\RequirePackage{hyperref}
\RequirePackage[nameinlink,noabbrev]{cleveref}
\RequirePackage{bookmark}

\setCJKfamilyfont{wzucoverhei}{SimHei}[AutoFakeBold=3]
\newcommand{\wzucoverhei}{\CJKfamily{wzucoverhei}}
\setCJKfamilyfont{wzucoversong}{SimSun}[AutoFakeBold=2.5]
\newcommand{\wzucoversong}{\CJKfamily{wzucoversong}}
\setCJKfamilyfont{wzucoverkai}{KaiTi}[AutoFakeBold=2.5]
\newcommand{\wzucoverkai}{\CJKfamily{wzucoverkai}}

\geometry{
  paper=a4paper,
  left=25.5mm,
  right=25.5mm,
  top=25.4mm,
  bottom=25.4mm,
  headheight=12pt,
  headsep=17.5pt,
  footskip=10.4mm
}
\ifwzu@print
  \geometry{left=31.7mm,right=19.3mm}
\fi

\setstretch{1.2}
\setlength{\parindent}{2em}
\setlength{\parskip}{0.5ex plus 0.25ex minus 0.25ex}
\raggedbottom
\emergencystretch=3em
\newcommand{\wzu@covercalligraphy}{\kaishu}

\AtBeginDocument{%
  \IfFontExistsTF{Times New Roman}{\setmainfont{Times New Roman}}{\IfFontExistsTF{TeX Gyre Termes}{\setmainfont{TeX Gyre Termes}}{}}%
  \IfFontExistsTF{Arial}{\setsansfont{Arial}}{\IfFontExistsTF{TeX Gyre Heros}{\setsansfont{TeX Gyre Heros}}{}}%
  \IfFontExistsTF{Fira Code}{\setmonofont{Fira Code}[Scale=MatchLowercase]}{}%
  \IfFontExistsTF{SimSun}{\setCJKmainfont{SimSun}[AutoFakeBold=2.5,ItalicFont=KaiTi]}{}%
  \IfFontExistsTF{SimHei}{\setCJKsansfont{SimHei}[AutoFakeBold=2.5]}{}%
  \IfFontExistsTF{FangSong}{\setCJKmonofont{FangSong}}{}%
}

\hypersetup{
  colorlinks=true,
  linkcolor=black,
  citecolor=black,
  urlcolor=black,
  bookmarksnumbered=true,
  bookmarksopen=true,
  plainpages=false,
  hypertexnames=false,
  pdfstartview=FitH
}
\pdfstringdefDisableCommands{%
  \def\quad{ }%
}

\sisetup{
  detect-all,
  group-separator={,},
  group-minimum-digits=4,
  separate-uncertainty=true
}

\lstdefinestyle{wzu-code}{
  basicstyle=\ttfamily\small,
  breaklines=true,
  columns=fullflexible,
  frame=single,
  rulecolor=\color{black!35},
  backgroundcolor=\color{black!3},
  keywordstyle=\bfseries,
  commentstyle=\color{black!55},
  showstringspaces=false,
  tabsize=2
}
\lstset{style=wzu-code}

\renewcommand{\contentsname}{目录}
\renewcommand{\bibname}{参考文献}
\renewcommand{\listfigurename}{图形列表}
\renewcommand{\listtablename}{表格列表}
\renewcommand{\figurename}{图}
\renewcommand{\tablename}{表}
\renewcommand{\algorithmicrequire}{\textbf{输入：}}
\renewcommand{\algorithmicensure}{\textbf{输出：}}
\floatname{algorithm}{算法}

\renewcommand{\thechapter}{\arabic{chapter}}
\renewcommand{\thesection}{\thechapter.\arabic{section}}
\renewcommand{\thesubsection}{\thesection.\arabic{subsection}}
\renewcommand{\thesubsubsection}{\thesubsection.\arabic{subsubsection}}
\numberwithin{equation}{chapter}
\renewcommand{\theequation}{\arabic{chapter}-\arabic{equation}}
\renewcommand{\thefigure}{\arabic{chapter}-\arabic{figure}}
\renewcommand{\thetable}{\arabic{chapter}-\arabic{table}}

\captionsetup{
  font={small},
  labelfont={bf},
  labelsep=space,
  justification=centering,
  singlelinecheck=false,
  skip=8pt
}
\captionsetup[sub]{font=small,labelfont=bf,justification=centering}

\makeatletter
\newcommand{\wzubicaption}[2]{%
  \ifdefstring{\@captype}{figure}{%
    {\captionsetup{list=false}\caption{\kaishu\zihao{5}#1\\[-0.2ex]\rmfamily\zihao{5}Figure~\thefigure\quad #2}}%
    \addcontentsline{lof}{figure}{\protect\numberline{\thefigure}#1}%
    \addcontentsline{lof}{figure}{\protect\numberline{\thefigure}#2}%
  }{%
    \ifdefstring{\@captype}{table}{%
      {\captionsetup{list=false}\caption{\kaishu\zihao{5}#1\\[-0.2ex]\rmfamily\zihao{5}Table~\thetable\quad #2}}%
      \addcontentsline{lot}{table}{\protect\numberline{\thetable}#1}%
      \addcontentsline{lot}{table}{\protect\numberline{\thetable}#2}%
    }{%
      \caption[#1]{#1\\[-0.2ex]\small #2}%
    }%
  }%
}
\makeatother

\ctexset{
  chapter = {
    name = {第,章},
    number = \arabic{chapter},
    format = \linespread{1.0}\zihao{3}\bfseries\sffamily\centering,
    nameformat = {},
    titleformat = {},
    aftername = \quad,
    beforeskip = 7pt,
    afterskip = 24pt,
    pagestyle = wzu
  },
  section = {
    format = \linespread{1.0}\zihao{4}\bfseries\sffamily\raggedright,
    numberformat = \rmfamily,
    aftername = \quad,
    beforeskip = 24pt,
    afterskip = 12pt
  },
  subsection = {
    format = \linespread{1.0}\zihao{-4}\bfseries\sffamily\raggedright,
    numberformat = \rmfamily,
    aftername = \quad,
    beforeskip = 12pt,
    afterskip = 6pt
  },
  subsubsection = {
    format = \linespread{1.0}\zihao{-4}\sffamily\raggedright,
    numberformat = \rmfamily,
    aftername = \quad,
    beforeskip = 10pt,
    afterskip = 4pt
  }
}

\setcounter{secnumdepth}{3}
\setcounter{tocdepth}{2}
\makeatletter
\def\@dotsep{1.5mu}
\def\@pnumwidth{2em}
\def\@tocrmarg{2em}
\def\@chaptervspace{1ex}
\renewcommand*{\@dottedtocline}[5]{%
  \ifnum #1>\c@tocdepth \else
    \vskip \z@ \@plus.2\p@
    {\leftskip #2\relax \rightskip \@tocrmarg \parfillskip -\rightskip
    \parindent #2\relax\@afterindenttrue
    \interlinepenalty\@M
    \leavevmode
    \@tempdima #3\relax
    \advance\leftskip \@tempdima \null\nobreak\hskip -\leftskip
    {#4}\nobreak
    \leaders\hbox{$\m@th\mkern \@dotsep \cdot\mkern \@dotsep$}\hfill
    \nobreak
    \hb@xt@\@pnumwidth{\hfil\normalfont\normalcolor\zihao{-4} #5}%
    \par}%
  \fi
}
\renewcommand*{\l@chapter}[2]{%
  \ifnum \c@tocdepth >\m@ne
    \addpenalty{-\@highpenalty}%
    \vskip \@chaptervspace \@plus\p@
    \setlength\@tempdima{4.5em}%
    \begingroup
      \parindent \z@ \rightskip \@pnumwidth
      \parfillskip -\@pnumwidth
      \leavevmode \zihao{4}\sffamily
      \advance\leftskip\@tempdima
      \hskip -\leftskip
      #1\nobreak
      \leaders\hbox{$\m@th\mkern \@dotsep \cdot\mkern \@dotsep$}%
      \hfil \nobreak\hb@xt@\@pnumwidth{\hss\normalfont\normalcolor\zihao{-4} #2}\par
      \penalty\@highpenalty
    \endgroup
  \fi
}
\renewcommand*\l@section{\@dottedtocline{1}{1em}{1.8em}}
\renewcommand*\l@subsection{\@dottedtocline{2}{2em}{2.8em}}
\renewcommand*\l@subsubsection{\@dottedtocline{3}{3em}{3.8em}}
\makeatother

\newcommand{\wzuheadtitle}{温州大学硕士学位论文}
\fancypagestyle{wzu}{%
  \fancyhf{}%
  \fancyhead[C]{\songti\zihao{-5}\wzuheadtitle}%
  \fancyfoot[C]{\songti\zihao{-5}\thepage}%
  \renewcommand{\headrulewidth}{0.8pt}%
  \renewcommand{\footrulewidth}{0pt}%
}
\pagestyle{wzu}
\fancypagestyle{plain}{%
  \fancyhf{}%
  \fancyhead[C]{\songti\zihao{-5}\wzuheadtitle}%
  \fancyfoot[C]{\songti\zihao{-5}\thepage}%
  \renewcommand{\headrulewidth}{0.8pt}%
  \renewcommand{\footrulewidth}{0pt}%
}
\fancypagestyle{wzufront}{%
  \fancyhf{}%
  \fancyfoot[C]{\songti\zihao{-5}\thepage}%
  \renewcommand{\headrulewidth}{0pt}%
  \renewcommand{\footrulewidth}{0pt}%
}
\fancypagestyle{empty}{%
  \fancyhf{}%
  \renewcommand{\headrulewidth}{0pt}%
}

\makeatletter
\renewcommand{\chaptermark}[1]{%
  \if@mainmatter
    \markboth{第\arabic{chapter}章\quad #1}{}%
  \else
    \markboth{#1}{#1}%
  \fi
}
\renewcommand{\sectionmark}[1]{}

\renewcommand{\cleardoublepage}[1][plain]{%
  \clearpage\if@twoside\ifodd\c@page\else
    \thispagestyle{#1}\hbox{}\newpage
    \if@twocolumn\hbox{}\newpage\fi
  \fi\fi
}
\renewcommand\frontmatter{%
  \cleardoublepage
  \@mainmatterfalse
  \pagenumbering{Roman}%
  \pagestyle{wzufront}%
}
\renewcommand\mainmatter{%
  \cleardoublepage[wzufront]%
  \@mainmattertrue
  \pagenumbering{arabic}%
  \pagestyle{wzu}%
}
\renewcommand\backmatter{%
  \cleardoublepage
  \@mainmatterfalse
  \pagestyle{wzu}%
}
\makeatother

\theoremstyle{plain}
\newtheorem{theorem}{定理}[chapter]
\newtheorem{lemma}{引理}[chapter]
\newtheorem{proposition}{命题}[chapter]
\newtheorem{corollary}{推论}[chapter]
\theoremstyle{definition}
\newtheorem{definition}{定义}[chapter]
\newtheorem{example}{例}[chapter]
\theoremstyle{remark}
\newtheorem*{remark}{注}
\renewcommand{\proofname}{证明}

\crefname{chapter}{第}{第}
\crefname{section}{节}{节}
\crefname{subsection}{小节}{小节}
\crefname{figure}{图}{图}
\crefname{table}{表}{表}
\crefname{equation}{式}{式}
\crefname{algorithm}{算法}{算法}
\crefname{theorem}{定理}{定理}
\crefname{definition}{定义}{定义}

\makeatletter
\def\wzu@school{温州大学}
\def\wzu@committee{温州大学学位委员会}
\def\wzu@classification{}
\def\wzu@udc{}
\def\wzu@studentid{}
\def\wzu@secretlevel{公开}
\def\wzu@title{论文中文题目}
\def\wzu@entitle{English Title of the Thesis}
\def\wzu@author{作者姓名}
\def\wzu@enauthor{Author Name}
\def\wzu@trainingtype{全日制统招硕士}
\def\wzu@degreetype{学术型}
\def\wzu@degree{硕士}
\def\wzu@endegree{Master}
\def\wzu@major{专业名称}
\def\wzu@enmajor{Major}
\def\wzu@researchfield{研究方向}
\def\wzu@advisor{指导教师}
\def\wzu@enadvisor{Advisor}
\def\wzu@institute{学院名称}
\def\wzu@eninstitute{School or Institute}
\def\wzu@completiondate{\the\year 年\the\month 月}
\def\wzu@encompletiondate{\today}

\define@key{wzu}{school}{\def\wzu@school{#1}}
\define@key{wzu}{committee}{\def\wzu@committee{#1}}
\define@key{wzu}{classification}{\def\wzu@classification{#1}}
\define@key{wzu}{udc}{\def\wzu@udc{#1}}
\define@key{wzu}{student-id}{\def\wzu@studentid{#1}}
\define@key{wzu}{secret-level}{\def\wzu@secretlevel{#1}}
\define@key{wzu}{title}{\def\wzu@title{#1}}
\define@key{wzu}{title*}{\def\wzu@entitle{#1}}
\define@key{wzu}{author}{\def\wzu@author{#1}}
\define@key{wzu}{author*}{\def\wzu@enauthor{#1}}
\define@key{wzu}{training-type}{\def\wzu@trainingtype{#1}}
\define@key{wzu}{degree-type}{\def\wzu@degreetype{#1}}
\define@key{wzu}{degree}{\def\wzu@degree{#1}}
\define@key{wzu}{degree*}{\def\wzu@endegree{#1}}
\define@key{wzu}{major}{\def\wzu@major{#1}}
\define@key{wzu}{major*}{\def\wzu@enmajor{#1}}
\define@key{wzu}{research-field}{\def\wzu@researchfield{#1}}
\define@key{wzu}{advisor}{\def\wzu@advisor{#1}}
\define@key{wzu}{advisor*}{\def\wzu@enadvisor{#1}}
\define@key{wzu}{institute}{\def\wzu@institute{#1}}
\define@key{wzu}{institute*}{\def\wzu@eninstitute{#1}}
\define@key{wzu}{completion-date}{\def\wzu@completiondate{#1}}
\define@key{wzu}{completion-date*}{\def\wzu@encompletiondate{#1}}
\newcommand{\wzusetup}[1]{\kvsetkeys{wzu}{#1}}

\newcommand{\wzu@maybehidden}[1]{\ifwzu@anonymous\relax\else #1\fi}
\newcommand{\wzu@field}[2]{%
  \makebox[7.2em][l]{#1} & \makebox[0.56\textwidth][c]{#2}\\[1.0em]%
}

\newcommand{\includewzucover}[2][-]{%
  \includepdf[pages={#1},pagecommand={\thispagestyle{empty}}]{#2}%
}

\def\wzu@coverlogo{figures/wzu-logo.jpg}
\def\wzu@covertitleimage{figures/wzu-title.png}
\newcommand{\wzu@covertopfield}[6]{%
  \pgfmathsetmacro{\wzu@yline}{#4-1.2}%
  \pgfmathsetmacro{\wzu@xmid}{(#2+#3)/2}%
  \node[anchor=base west,font=\songti\zihao{-4}] at (#1mm,#4mm) {#5};%
  \draw[line width=0.35pt] (#2mm,\wzu@yline mm) -- (#3mm,\wzu@yline mm);%
  \node[anchor=base,font=\songti\zihao{-4}] at (\wzu@xmid mm,#4mm) {#6};%
}
\newcommand{\wzu@coverlinefield}[3]{%
  \pgfmathsetmacro{\wzu@yline}{#1-1.3}%
  \node[anchor=base east,font=\wzucoverkai\bfseries\zihao{-3}] at (82mm,#1mm) {#2};%
  \draw[line width=0.35pt] (87mm,\wzu@yline mm) -- (158mm,\wzu@yline mm);%
  \node[anchor=base,font=\wzucoverkai\bfseries\zihao{-3}] at (122.5mm,#1mm) {#3};%
}
\newcommand{\makewzucover}{%
  \hypersetup{pdftitle={\wzu@title},pdfauthor={\wzu@author}}%
  \clearpage
  \thispagestyle{empty}%
  \null
  \begin{tikzpicture}[remember picture,overlay]
    \begin{scope}[shift={(current page.south west)}]
      \wzu@covertopfield{39}{60}{84}{268}{分\hspace{1em}类\hspace{1em}号：}{\wzu@classification}
      \wzu@covertopfield{39}{60}{84}{260.1}{学\hspace{2em}号：}{\wzu@maybehidden{\wzu@studentid}}
      \wzu@covertopfield{134}{148}{169}{268}{UDC：}{\wzu@udc}
      \wzu@covertopfield{134}{148}{169}{260.1}{密级：}{\wzu@secretlevel}
      \node[inner sep=0pt] at (105mm,241mm) {%
        \IfFileExists{\wzu@covertitleimage}{\includegraphics[width=72mm]{\wzu@covertitleimage}}{\wzu@covercalligraphy\zihao{0}\wzu@school}%
      };
      \node[align=center,font=\wzucoverhei\zihao{-0}\bfseries] at (105mm,220mm) {硕\hspace{0.7em}士\hspace{0.7em}学\hspace{0.7em}位\hspace{0.7em}论\hspace{0.7em}文};
      \node[inner sep=0pt] at (105mm,193mm) {%
        \IfFileExists{\wzu@coverlogo}{\includegraphics[width=29mm]{\wzu@coverlogo}}{}%
      };
      \node[align=center,text width=150mm,font=\wzucoversong\bfseries\zihao{2},execute at begin node=\setstretch{1.25}] at (105mm,168mm) {\wzu@title};
      \wzu@coverlinefield{143.5}{作\hspace{1em}者\hspace{1em}姓\hspace{1em}名：}{\wzu@maybehidden{\wzu@author}}
      \wzu@coverlinefield{132.2}{培\hspace{1em}养\hspace{1em}类\hspace{1em}型：}{\wzu@trainingtype}
      \wzu@coverlinefield{121.0}{学\hspace{1em}位\hspace{1em}类\hspace{1em}型：}{\wzu@degreetype}
      \wzu@coverlinefield{109.8}{专\hspace{1em}业\hspace{1em}名\hspace{1em}称：}{\wzu@major}
      \wzu@coverlinefield{98.6}{研\hspace{1em}究\hspace{1em}方\hspace{1em}向：}{\wzu@researchfield}
      \wzu@coverlinefield{87.4}{指\hspace{1em}导\hspace{1em}教\hspace{1em}师：}{\wzu@maybehidden{\wzu@advisor}}
      \wzu@coverlinefield{76.2}{完\hspace{1em}成\hspace{1em}日\hspace{1em}期：}{\wzu@completiondate}
      \node[font=\songti\zihao{-3}] at (105mm,63mm) {\wzu@committee};
    \end{scope}
  \end{tikzpicture}%
  \cleardoublepage[empty]
}
\newcommand{\makewzudeclaration}{%
  \ifwzu@anonymous
    \relax
  \else
    \cleardoublepage
    \thispagestyle{empty}%
    \begingroup
    \zihao{5}\setstretch{1.95}
    \vspace*{0mm}
    \begin{center}
      {\wzucoverhei\bfseries 温~~州~~大~~学~~学~~位~~论~~文~~独~~创~~性~~声~~明}
    \end{center}
    \vspace{12mm}
    {\zihao{5}
    ~~~~~~~本人郑重声明：所呈交的学位论文是我个人在导师指导下进行的研究工作及取得的研究成果。尽我所知，除了文中特别加以标注和致谢的地方外，论文中不包含其他人已经发表或撰写过的研究成果，也不包含为获得温州大学或其它教育机构的学位或证书而使用过的材料。与我一同工作的同志对本研究所做的任何贡献均已在论文中作了明确的说明并表示了谢意。}
    
    \vspace{18mm}
    {\zihao{5} 论文作者签名：\hspace{50mm}日期：\makebox[3em][c]{}年\makebox[2em][c]{}月\makebox[2em][c]{}日}

    \vspace{13mm}
    \begin{center}
      {\wzucoverhei\bfseries 温 ~~州~~大~~学~~学~~位~~论~~文~~使~~用~~授~~权~~声~~明}
    \end{center}
    \vspace{12mm}
    {\zihao{5}
    ~~~~~~~~本人完全了解温州大学关于收集、保存、使用学位论文的规定，即：学校有权保留并向国家有关部门或机构送交论文的复印件和电子版，允许论文被查阅和借阅。本人授权温州大学可以将本学位论文的全部或部分内容编入有关数据库进行检索，可以采用影印、缩印或扫描等复制手段保存和汇编本学位论文。本人在导师指导下完成的论文成果，知识产权归属温州大学。

    保密论文在解密后遵守此规定。
}

    \vspace{9mm}
    {\zihao{5}论文作者签名：\hspace{60mm} 导师签名：}

    \vspace{5mm}
    {\zihao{5}日期：\makebox[3em][c]{}年\makebox[2em][c]{}月\makebox[2em][c]{}日\hspace{38mm} 日期：\makebox[3em][c]{}年\makebox[2em][c]{}月\makebox[2em][c]{}日}
    \par\endgroup
    \cleardoublepage[empty]
  \fi
}

\newenvironment{chineseabstract}[1]{%
  \clearpage
  \phantomsection
  \pdfbookmark[0]{摘要}{abstract-cn}
  \markboth{摘\quad 要}{摘\quad 要}%
  \thispagestyle{wzufront}%
  \begingroup
  \begin{center}
    {\heiti\zihao{3}\wzu@title\par}
    \vspace{\baselineskip}
    {\heiti\zihao{4}摘\quad 要\par}
  \end{center}
  \vspace{\baselineskip}%
  \zihao{4}%
  \def\wzu@abstractkeywords{#1}
}{%
  \par\vspace{\baselineskip}\noindent{\heiti\zihao{4}关键词：}{\songti\zihao{4}\wzu@abstractkeywords}%
  \par\endgroup
}

\newenvironment{englishabstract}[1]{%
  \cleardoublepage[wzufront]%
  \phantomsection
  \pdfbookmark[0]{Abstract}{abstract-en}
  \markboth{Abstract}{Abstract}%
  \thispagestyle{wzufront}%
  \begingroup
  \begin{center}
    {\rmfamily\bfseries\zihao{3}\begin{minipage}{0.9\textwidth}\centering\MakeUppercase{\wzu@entitle}\end{minipage}\par}
    \vspace{\baselineskip}
    {\rmfamily\bfseries\zihao{4}ABSTRACT\par}
  \end{center}
  \vspace{\baselineskip}%
  \zihao{4}%
  \setlength{\parindent}{4em}%
  \def\wzu@abstractkeywords{#1}
}{%
  \par\vspace{\baselineskip}\noindent\textbf{KEY WORDS: } \wzu@abstractkeywords%
  \par\endgroup
}

\newcommand{\makewzutoc}{%
  \cleardoublepage[wzufront]%
  \phantomsection
  \pdfbookmark[0]{目录}{toc}
  \markboth{\contentsname}{\contentsname}%
  \tableofcontents
  \thispagestyle{wzufront}%
  \markboth{\contentsname}{\contentsname}%
}

\newcommand{\makewzulistoffigures}{%
  \cleardoublepage[wzufront]%
  \phantomsection
  \addcontentsline{toc}{chapter}{\listfigurename}
  \listoffigures
  \thispagestyle{wzufront}%
}

\newcommand{\makewzulistoftables}{%
  \cleardoublepage[wzufront]%
  \phantomsection
  \addcontentsline{toc}{chapter}{\listtablename}
  \listoftables
  \thispagestyle{wzufront}%
}

\newcommand{\makewzubibliography}{%
  \cleardoublepage
  \phantomsection
  \markboth{\bibname}{\bibname}%
  \addcontentsline{toc}{chapter}{\bibname}
  \printbibliography[title=\bibname]
  \markboth{\bibname}{\bibname}%
}

\newcommand{\Vector}[1]{\bm{#1}}
\newcommand{\Matrix}[1]{\bm{#1}}
\newcommand{\Tensor}[1]{\mathcal{#1}}
\newcommand{\diff}{\mathop{}\!\mathrm{d}}
\newcommand{\e}{\mathrm{e}}
\newcommand{\ii}{\mathrm{i}}
\makeatother

\endinput
