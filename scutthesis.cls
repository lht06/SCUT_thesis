
\NeedsTeXFormat{LaTeX2e}[1999/12/01]
\ProvidesClass{scutthesis}[2011/03/31 2.0.1 The LaTeX class for the thesis of South China University of Technology]

%% import global options
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newif\ifmasterdegree\masterdegreefalse %默认为doctor
\newif\ifpdfcover\pdfcoverfalse
\newif\ifchapterx\chapterxfalse

\DeclareOption{master}{\masterdegreetrue}
\DeclareOption{pdfcover}{\pdfcovertrue} %using pdfcover,TOdo
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{book}}
\ProcessOptions\relax %revised by Quansheng Guan \ProcessOptions
\LoadClass[12pt,a4paper,openany]{book}

%% define 几个宏
\newcommand{\scutthesis}{%
  S\hspace{-0.3ex}\raisebox{-0.5ex}{C}\hspace{-0.3ex}U\hspace{0.1em}\raisebox{-0.5ex}{T}%
  \textsc{Thesis}
}
\def \institute#1{\gdef\@institute{#1}}
\def \supervisor#1{\gdef\@supervisor{#1}}
\ifmasterdegree \newcommand{\@degree}{硕士} \else \newcommand{\@degree}{博士} \fi
\newcommand{\thesissubject}{华南理工大学实训报告}
\renewcommand{\today}{\the\year~年~\the\month~月~\the\day~日}

%% 加载几个常用的sty packages
\RequirePackage{ifpdf}
\RequirePackage{ifthen}
% \RequirePackage{doc} % delete for Package hypdoc Warning: hyperref has been loaded before with option 'hyperindex' enabled.
\RequirePackage{keyval}
\RequirePackage[dvipsnames]{xcolor}
\RequirePackage{indentfirst}
\RequirePackage{makeidx} % 索引
\RequirePackage{amsmath} 
\RequirePackage{mathrsfs}
\RequirePackage{amssymb} %this package conflicts with xeCJK, place it before xeCJK to avoid the coflict.
\RequirePackage[final]{pdfpages}
\RequirePackage{color}
\RequirePackage[no-math]{fontspec}
\newlength{\tablewidth}
\setlength{\tablewidth}{14cm} % <- 你想要的总宽度，可以改成 \textwidth 或别的
\RequirePackage[left=2.5cm,right=2.5cm,bottom=2.5cm,top=2.5cm,%设置页面上下左右各为25mm
 headheight=1.5cm,%页眉所占高度
 footskip=1cm %页脚所占高度
]{geometry}

\RequirePackage[BoldFont, SlantFont]{xeCJK} %CJKnumber已弃用
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%\@ifpackagelater {xeCJK}  { 2008/12/29 }
\RequirePackage{CJKnumb} % used in recent TEX distribution
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%-by MCH
\RequirePackage{xCJKnumb} %中文编号如第一章的“一”，利用xCJKnumb设置
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%\punctstyle{kaiming}
\setmainfont[Mapping=tex-text]{Times New Roman}%\rmfamily 使用的字体,默认英文和数字的字体。% setmainfont是 fontspec 宏包中的一个命令，用于设置 LaTeX 文档中的主字体（即英文部分的主要字体）。setmainfont 用于设置正文中的英文字体。它会影响所有非数学、非 CJK（中文、日文、韩文）字符的字体。


\XeTeXlinebreaklocale "zh" %采用中文断行方式
\XeTeXlinebreakskip = 0pt plus 1pt %字元间可加入0pt~1pt 的弹性间距，这样才能排出左右对齐的段落。

\setCJKmainfont{PingFang SC}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%-by MCH
\setCJKsansfont{PingFang SC}	%设置默认字体，防止报警
\setCJKmonofont{PingFang SC} %设置默认字体，防止报警
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\setCJKfamilyfont{song}{Songti SC}
\setCJKfamilyfont{hei}{Heiti SC}
\setCJKfamilyfont{kai}{Kaiti SC}
\setCJKfamilyfont{fang}{STFangsong}


\newcommand{\songti}{\CJKfamily{song}}
\newcommand{\heiti}{\CJKfamily{hei}}
\newcommand{\kaiti}{\CJKfamily{kai}}
\newcommand{\fangsong}{\CJKfamily{fang}}

\newcommand{\chuhao}{\fontsize{42pt}{46pt}\selectfont}
\newcommand{\xiaochuhao}{\fontsize{36pt}{40pt}\selectfont}
\newcommand{\yichu}{\fontsize{32pt}{36pt}\selectfont}
\newcommand{\yihao}{\fontsize{28pt}{32pt}\selectfont}
\newcommand{\erhao}{\fontsize{21pt}{24pt}\selectfont}
\newcommand{\xiaoerhao}{\fontsize{18pt}{20}\selectfont}
\newcommand{\sanhao}{\fontsize{15.75pt}{18pt}\selectfont}
%\newcommand{\xiaosanhao}{\fontsize{15bp}{18pt plus .3pt minus .2pt}\selectfont}
\newcommand{\xiaosanhao}{\fontsize{15pt}{22.5pt}\selectfont}%1.5
\newcommand{\sihao}{\fontsize{14pt}{16pt}\selectfont}
\newcommand{\xiaosihao}{\fontsize{12pt}{14pt}\selectfont}
\newcommand{\wuhao}{\fontsize{10.5pt}{13pt}\selectfont} % change 10.95pt to 10.5pt --by mch, 真正的五号字应该是10.5。10.95是通常所说的11pt，在英文排版中使用。
\newcommand{\xiaowuhao}{\fontsize{9pt}{11pt}\selectfont}
\newcommand{\liuhao}{\fontsize{7.5pt}{9pt}\selectfont}
\newcommand{\xiaoliuhao}{\fontsize{6.5pt}{7.5pt}\selectfont}
\newcommand{\qihao}{\fontsize{5.5pt}{6.5pt}\selectfont}

% 中文段首缩进
\newlength\CJK@twochars %set \CJK@twochars zero
\def\CJK@spaceChar{\hskip \f@size \p@}
%%\def\CJK@spaceChar{\Unicode{48}{7}} %delete
\def\CJKindent{%
    \settowidth\CJK@twochars{\CJK@spaceChar\CJK@spaceChar}%
    \parindent\CJK@twochars}
\newcommand{\cndash}{\rule{0.0em}{0pt}\rule[0.35em]{1.4em}{0.05em}\rule{0.2em}{0pt}} % 中文破折号,added by Quansheng


\raggedbottom

\hbadness=10000 \tolerance=10000 \hfuzz=150pt % 去掉表格中的badboxes报警,看着不爽

% My fonts for Scut thesis字体字号设置，由于部分内容的字体使用默认设置，因此部分字体用不到。
\renewcommand{\normalsize}{\xiaosihao\songti\normalfont} % Normal font size 小四号宋体
\newcommand{\absnamecn}{\heiti\xiaoerhao}         % 中文“摘要”字样的字体
\newcommand{\abskeycn}{\heiti\xiaosihao}       % 中文摘要“关键字”字样的字体
\newcommand{\abskeyscn}{\songti\xiaosihao\normalfont} % 中文摘要关键字的字体
\newcommand{\absnameen}{\heiti\xiaosihao}               % 英文``Abstract''字样的字体
\newcommand{\abskeyen}{\bfseries\xiaosihao}   % 英文``KEY WORDS''字样的字体
\newcommand{\abskeysen}{\songti\xiaosihao\normalfont}        % 英文关键字的字体
\newcommand{\headfont}{\songti\wuhao\normalfont} 	% 页眉字体
\newcommand{\toctitlefont}{\heiti\xiaoerhao}            % “目录”字样的字体
\newcommand{\tocchapterfont}{\heiti\xiaosihao} % 目录上第X章的字体
\newcommand{\tocsectionfont}{\normalsize}         % 目录上X.Y节的字体
\newcommand{\tocsubsectionfont}{\normalsize}      % 目录上X.Y.Z小节的字体
\newcommand{\tocsubsubsectionfont}{\normalsize}      % 目录上X.Y.Z小节的字体
\newcommand{\textchapterfont}{\centering\heiti\xiaoerhao} % 正文上第X章的字体
\newcommand{\textsectionfont}{\heiti\xiaosanhao}            % 正文上X.Y节的字体
\newcommand{\textsubsectionfont}{\heiti\sihao}     % 正文上X.Y.Z小节的字体
\newcommand{\textsubsubsectionfont}{\heiti\xiaosihao}     % 正文上X.Y.Z.K小节的字体
\newcommand{\footnotefont}{\songti\xiaowuhao\normalfont}     % 脚注字体
\newcommand{\ftcaptionfont}{\songti\wuhao\normalfont}         % 图表标题的字体

\newcommand{\reftitlefont}{\heiti\xiaoerhao}      % “参考文献”字样的字体
\newcommand{\refbodyfont}{\songti\wuhao\normalfont}          % 参考文献字体
\newcommand{\pubfont}{\songti\wuhao\normalfont}          % 《攻读博士/硕士学位期间取得的研究成果》字体，2022年更新。

\newcommand{\thanktitlefont}{\heiti\sanhao}    % “致谢”字样的字体
\newcommand{\appendixtitlefont}{\heiti\sanhao} % “附录”字样的字体

\RequirePackage{graphicx}
\DeclareGraphicsExtensions{.pdf,.eps,.jpg,.png} % 如果插入的图片没有指定扩展名,那么依次搜索下面的扩展名所对应的文件
\RequirePackage{subfig} % config兼容subfigure命令
\RequirePackage{float} % 可以使用［H］命令
\RequirePackage{caption} % 定义图的标题格式：居中. 使用caption3.0
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 根据子图引用显示，重定义部分参数 ——by mch
\DeclareSubrefFormat{parens}{#1 #2)}
\DeclareSubrefFormat{subparens}{#2)}
\DeclareCaptionListOfFormat{parens}{#1 #2)}
\DeclareCaptionListOfFormat{subparens}{#2)}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\DeclareCaptionFont{capFont}{\ftcaptionfont} % 表格名及图名
\DeclareCaptionLabelSeparator{twospace}{~~}
\captionsetup{ labelsep=space,% 去掉图标签后的冒号 % 原模板labelsep=twospace，而论文撰写规范要求是space
  belowskip=0bp,aboveskip=0bp,
  font={capFont}, figurename=图,tablename=表,listfigurename=插图目录,listtablename=表格目录}
\captionsetup[figure]{position=bottom}
\captionsetup[subfloat]{captionskip=6bp,nearskip=0bp,farskip=0bp,topadjust=0bp,
  justification=centering,labelformat=brace,labelsep=space,subrefformat=subparens,listofformat=parens}%要使分图题和图题一样字号，选项加上 font={capFont}

\RequirePackage{array} % 扩展了 array 和 tabular 环境功能
\RequirePackage{multirow} % 支持表格中的多行合并
\RequirePackage{booktabs} % 增加对三线表格的支持 % \toprule，\midrule，\bottomrule
\RequirePackage{longtable} % 长表格支持，截断跨页
%\RequirePackage{ctable, threeparttable} % 支持表格注释,复杂表格，一般用不上
\RequirePackage{tabularx}
\captionsetup[table]{position=top}
%定义双标题命令
\newcommand{\TableBicaption}[2]{
  \renewcommand{\tablename}{表}
  \vspace{8pt}
  \caption{#1}
  \vspace{6pt}
  \addtocounter{table}{-1}
  \renewcommand{\tablename}{Table}
  \captionsetup{list=false}
  \caption{#2}
  \captionsetup{list=true}
  \renewcommand{\tablename}{表}
}
\usepackage{algorithm}
\usepackage{algorithmicx}
\usepackage{algpseudocode}
\renewcommand{\thealgorithm}{\thechapter-\arabic{algorithm}} % 算法编号格式

\renewcommand{\theequation}{\arabic{chapter}-\arabic{equation}}
\renewcommand{\thetable}{\arabic{chapter}-\arabic{table}}
\renewcommand{\thefigure}{\arabic{chapter}-\arabic{figure}}

\renewcommand{\thefootnote}{注\arabic{footnote}} \setcounter{footnote}{0}

\renewcommand\fps@figure{htbp} % 设置图浮动的默认参数
\renewcommand\fps@table{htbp}

\renewcommand{\textfraction}{0.07}
\renewcommand{\topfraction}{0.9}
\renewcommand{\bottomfraction}{0.8}
\renewcommand{\floatpagefraction}{0.85}

%% 列表
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 删除 itemize和 enumerate环境中 列表项之间的间隔，默认列表项之间的间距非常宽（超过1.5倍行距）
\def\@listi{%
  \leftmargin\leftmargini
  \parsep 0pt%
  \topsep \parsep
  \itemsep \parsep}
\let\@listI\@listi
\@listi
\def\@listii{%
  \leftmargin\leftmarginii
  \labelwidth\leftmarginii
  \advance\labelwidth-\labelsep
  \parsep 0pt%
  \topsep \parsep
  \itemsep \parsep}
\def\@listiii{%
  \leftmargin\leftmarginiii
  \labelwidth\leftmarginiii
  \advance\labelwidth-\labelsep
  \parsep 0pt%
  \topsep \parsep
  \itemsep \parsep
  \partopsep \p@ \@plus\z@ \@minus\p@}

\RequirePackage{listings}
\definecolor{mygray}{RGB}{245,245,245}
\lstset{
  tabsize=4, %
  frame=tb,
  commentstyle=\color{red!50!green!50!blue!50},
  rulesepcolor=\color{red!20!green!20!blue!20},%代码块边框为淡青色
  keywordstyle=\color{blue!90}\bfseries,
  backgroundcolor=\color{mygray},
  showstringspaces=false,%不显示代码字符串中间的空格标记
  stringstyle=\ttfamily,
  basicstyle={\footnotesize\ttfamily},
  breaklines=true,
  keepspaces=true, %
  flexiblecolumns=true, %
  lineskip=-0.1pt,%行距
  fontadjust,
  captionpos=t,
  framextopmargin=1pt,framexbottommargin=1pt,abovecaptionskip=-1pt,belowcaptionskip=1pt,
  %xleftmargin=4em,xrightmargin=4em, % 设定listing左右的空白
 extendedchars=false,columns=flexible,mathescape=false
  breakautoindent=true
}
\renewcommand{\lstlistingname}{代码}
\RequirePackage[nottoc]{tocbibind} %增加目录项目，tocbibind宏包会自动加入目录项本身、参考文献、索引等项目。[nottoc]取消了对自身的显示

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\renewcommand{\bibname}{参考文献}

% 设置目录
%%%%%%%%%%%%%%%%%
\RequirePackage{titletoc}
%\renewcommand\contentsname{\centerline{\toctitlefont{目\quad{}录}}}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%-by MCH
\renewcommand{\contentsname}{目\texorpdfstring{\quad}{}录}	%中文目录
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\titlecontents{chapter}[0ex]{\tocchapterfont}{%
    }{}{%
    \hspace{.5em}\titlerule*[5pt]{$\cdot$}\contentspage}%
\titlecontents{section}[1em]{\tocsectionfont}{%
    \thecontentslabel\quad{}}{}{%
    \hspace{.5em}\titlerule*[5pt]{$\cdot$}\contentspage}%
\titlecontents{subsection}[2em]{\tocsubsectionfont}{%
    \thecontentslabel\quad{}}{}{%
    \hspace{.5em}\titlerule*[5pt]{$\cdot$}\contentspage}%
\titlecontents{subsubsection}[3em]{\tocsubsubsectionfont}{%
    \thecontentslabel\quad{}}{}{%
    \hspace{.5em}\titlerule*[5pt]{$\cdot$}\contentspage}%

% 设定章节深度和目录深度
\setcounter{secnumdepth}{4}
\setcounter{tocdepth}{2}

\RequirePackage[pagestyles, rm]{titlesec}%调用titlesec涵盖fancyhdr的功能
\renewcommand{\chaptername}{}
\titleformat{\chapter}[hang]{\textchapterfont}{}{0em}{}
\titleformat{\section}[hang]{\textsectionfont}{\thesection}{1em}{}
\titleformat{\subsection}[hang]{\textsubsectionfont}{\thesubsection}{1em}{}
\titleformat{\subsubsection}[hang]{\textsubsubsectionfont}{\thesubsubsection}{1ex}{}% 小四黑体居左

%\titlespacing{\chapter}{0pt}{3ex plus .5ex minus .5ex}{3ex plus .5ex minus .5ex} % 缩短章节标题的上边距
\setlength{\parskip}{0ex}% 正文段前段后距：无空行
\titlespacing{\chapter}{0pt}{-20pt}{1pt} % 缩短章标题上间距，revised by Quansheng Guan
\titlespacing{\section}{0pt}{1pt}{1pt}  % 标题间距
\titlespacing{\subsection}{0pt}{4pt}{0pt}
\titlespacing{\subsubsection}{0pt}{6pt}{6pt}

\newcommand{\linespacing}[1]{\linespread{#1}\selectfont}% 行距命令

\AtBeginDocument{\CJKindent{}%
    \makeindex%
    \normalsize%正文字体格式
    \linespacing{1.682}% 主行距～1.5倍  % 手调参数，利用1比1的打印效果看行距是否和word的1.5倍行距一样。latex行距控制水太深了。见109行ToDo。--by mch
  }
\AtEndDocument{}

% --- 报告封面页定义 (紧凑版本，保证在一页内) ---
\renewcommand{\maketitle}{
\begin{titlepage}
\pagestyle{empty} % 确保此页无页眉页脚
\centering
\null
\vspace*{0cm} % 进一步减小顶部空白

% 校徽和校名
\begin{center}
\includegraphics[height=2.5cm]{assets/华南理工大学校名.jpg}
\end{center}
\vspace{0.8cm}

% 报告标题
\begin{center}
{\heiti\erhao 《openGauss并行物化算子优化》实训报告}\\[0.6cm] % 减小了间距
{\songti\sanhao (2024-\,2025 学年第 2 学期)}
\end{center}
\vspace{0.2cm} % 减小了间距

% 学生姓名
\begin{center}
{\songti\sanhao 学生姓名：吕浩天}
\end{center}
\vspace{0.4cm} % 减小了间距

% 完整的大表格 - 所有信息都在一个连续表格内
\begin{center}
  % 调整行高
  \renewcommand{\arraystretch}{1.6} % 适中的行高
  % 设置单元格左右的内边距
  \setlength{\tabcolsep}{8pt}
  % 使用 tabularx 环境，使其宽度与文本宽度一致
  \begin{tabularx}{\textwidth}{|p{6.8cm}|p{6.8cm}|}
    \hline
    \sihao\songti \textbf{提交日期：}2025 年 6 月 29 日 & \sihao\songti \textbf{学生签名：} 吕浩天  \\
    \hline
    \sihao\songti \textbf{学\hspace{1cm}号：}202230481431 & \sihao\songti \textbf{座位编号：}\underline{\hspace{3.2cm}} \\
    \hline
    \sihao\songti \textbf{学\hspace{1cm}院：}软件学院 & \sihao\songti \textbf{专业班级：}软件工程3班 \\
    \hline
    \sihao\songti \textbf{课程名称：}《openGauss并行物化算子优化》 & \sihao\songti \textbf{任课教师：}汤德佑 \\
    \hline
    % 教师评语：跨两列，形成一个大的评语区域
    \multicolumn{2}{|p{\dimexpr\textwidth-2\tabcolsep-2\arrayrulewidth\relax}|}{
        \vspace{0pt} % 顶部留一点空间
        \sihao\songti \textbf{教师评语：}
        \vspace{5.5cm} % 控制页面长度的关键参数
        \vspace{5pt} % 底部留一点空间
    } \\
    \hline
    % 成绩评定也在表格内
    \multicolumn{2}{|p{\dimexpr\textwidth-2\tabcolsep-2\arrayrulewidth\relax}|}{
        \vspace{5pt}
        \sihao\songti \textbf{本报告成绩评定：}\underline{\hspace{2.5cm}}\textbf{分}
        \vspace{5pt}
    } \\
    \hline
  \end{tabularx}
\end{center}

\vfill % 填充剩余空间，使内容整体向上对齐
\end{titlepage}
}


\newcommand{\keywordsCN}[1]{
  \par
 \vspace{1em}
  \newcommand{\@keywords}{#1}
  {\noindent\abskeycn 关键词：} {\abskeyscn \@keywords} % \noindent去掉缩进
}
\newcommand{\keywordsEN}[1]{
  \par
 \vspace{1em}
  {\noindent\abskeyen Keywords:} {\abskeysen #1} % \noindent去掉缩进
}
%
\newcommand{\abstractx}[1]
{
 \begin{center}
  #1
 \par\end{center}
  \addcontentsline{toc}{chapter}{#1}
}

\newpagestyle{revtitlestyle}{
  \sethead[][{openGauss 并行物化算子优化实验报告}][] % 页眉偶数页
  {}{{openGauss 并行物化算子优化实验报告}}{} % 页眉奇数页
  \setfoot[][\headfont{}\thepage][] %偶数页码五号宋体居右
   {}{\headfont{}\thepage}{}%页码五号宋体居右
  \headrule%上横线
  \setheadrule{1.5pt}%设置横线粗细
}


\renewcommand\frontmatter{ %标题之后，开始中英文摘要，目录
	\clearpage	
    \pagestyle{plain} % plain
    \pagenumbering{Roman}% Roman style page number
    \@mainmatterfalse
}

\renewcommand\mainmatter{%
 \@mainmattertrue
  \chapterxfalse % 改变页眉标题方式
  \clearpage
  \pagenumbering{arabic}

  \makeatletter
  \let\ps@plain=\ps@revtitlestyle
  \makeatother
  \pagestyle{revtitlestyle} % here and continue
  % 开始正文部分
}
\RequirePackage{amsthm}
\allowdisplaybreaks[4]
\newtheoremstyle{definition}% name
  {0pt}%      Space above, empty = `usual value'
  {0pt}%      Space below
  {}% Body font \itshape
  {\parindent}%         Indent amount (empty = no indent, \parindent = para indent)
  {\bfseries}% Thm head font
  {:}%        Punctuation after thm head
  {0.5em}% Space after thm head: \newline = linebreak
  {}%         Thm head spec
\theoremstyle{definition}
\newtheorem{definition}{定义~}[chapter]
\newtheorem{example}{例~}[chapter]
\newtheorem{remark}{注~}[chapter]
\newtheorem{assumption}{假设~}[chapter]	
\newtheorem{proposition}{命题~}[chapter]
\newtheorem{lemma}{引理~}[chapter]
\newtheorem{theorem}{定理~}[chapter]
\newtheorem{axiom}{公理~}[chapter]
\newtheorem{corollary}{ 推论~}[chapter]
\newtheorem{case}{情形~}[chapter]
\newtheorem{conjecture}{猜想~}[chapter]
\newtheorem{property}{性质~}[chapter]

\newtheoremstyle{plain}% name
  {0pt}%      Space above, empty = `usual value'
  {0pt}%      Space below
  {\itshape}% Body font \itshape
  {\parindent}%         Indent amount (empty = no indent, \parindent = para indent)
  {\bfseries}% Thm head font
  {:}%        Punctuation after thm head
  {0.5em}% Space after thm head: \newline = linebreak
  {}%         Thm head spec
\theoremstyle{plain}
\renewenvironment{proof}{\vskip 1pt\indent  证明:~\normalfont}{\hfill$\square$\vskip 0.01\baselineskip} %$\blacksquare$ -----去掉\itshape 该命令用于设置斜体

\abovedisplayshortskip=10pt
\belowdisplayshortskip=10pt
\abovedisplayskip=10pt
\belowdisplayskip=10pt

\endinput