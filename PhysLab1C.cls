%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% CU Boulder Physics Lab Writeup One Column
% Class File
% Version 1.0 (2022-10-05)
%
% This template has been downloaded from:
% http://www.LaTeXTemplates.com
%
% Original author:
% Mathias Legrand (legrand.mathias@gmail.com) titled Stylish Article 
% With extensive modifications by:
% Vel (vel@latextemplates.com)
% Further modifications for CU Boulder Physics by:
% Kristopher Bunker (kristopher.bunker@colorado.edu)
%
% License:
% CC BY-NC-SA 3.0 (http://creativecommons.org/licenses/by-nc-sa/3.0/)
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%----------------------------------------------------------------------------------------
%	CLASS CONFIGURATION
%----------------------------------------------------------------------------------------

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{PhysLab1C}[05/10/2022, v1.0]

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}} % Pass through any options to the base class
\ProcessOptions\relax % Process given options

\LoadClass{article} % Load the base class

%----------------------------------------------------------------------------------------
%	REQUIRED PACKAGES AND DOCUMENT CONFIGURATIONS
%----------------------------------------------------------------------------------------

\RequirePackage{ifthen}
\RequirePackage{calc}
\RequirePackage{amsmath, amsfonts, amssymb, bm}
\RequirePackage{graphicx}
%\graphicspath{{Figures/}{./}} % Specifies where to look for included images (trailing slash required)
\RequirePackage[dvipsnames]{xcolor}
\RequirePackage{circuitikz}
%\usepackage{subfig}
\RequirePackage{float}
\RequirePackage{caption}
\RequirePackage{subcaption}
\RequirePackage{datetime}
\RequirePackage{booktabs}
\RequirePackage{lastpage} % Number of pages in the document

\AtEndOfClass{\RequirePackage{microtype}}

\flushbottom % Makes all text pages the same height

\RequirePackage[skip=5pt, indent=0pt]{parskip} % Sets spacing between paragraphs and paragraph indent

%\ctikzset{amplifiers/fill=cyan!20, component text=left} % Color of op-amp fill

%\ctikzset{resistors/scale=0.8, capacitors/scale=0.5} % smaller R 
    


%----------------------------------------------------------------------------------------
%	FONTS
%----------------------------------------------------------------------------------------

\RequirePackage[utf8]{inputenc}
\RequirePackage{times} % Loads the Times Roman Fonts
\RequirePackage{mathptmx} % Loads the Times Roman Math Fonts

%----------------------------------------------------------------------------------------
%	MARGINS
%----------------------------------------------------------------------------------------

\RequirePackage[
	left=2cm,
	right=2cm,
	top=2cm,
	bottom=2cm,
	headheight=1pt,
	letterpaper,
]{geometry}


%----------------------------------------------------------------------------------------
%	FIGURE AND TABLE CAPTIONS
%----------------------------------------------------------------------------------------

\RequirePackage[
	labelfont={bf,sf,small},
	textfont={sf,small},
	labelsep=period,
	justification=raggedright,
]{caption}

\setlength{\abovecaptionskip}{3pt}
\setlength{\belowcaptionskip}{0pt}

%----------------------------------------------------------------------------------------
%	PAGE HEADER
%----------------------------------------------------------------------------------------

\RequirePackage{fancyhdr} % Needed to define custom headers/footers
\pagestyle{fancy} % Enables the custom headers/footers

\renewcommand{\headrulewidth}{0pt} % No header rule
\renewcommand{\footrulewidth}{0pt} % No footer rule

\fancypagestyle{firstpage}{%
  \rhead{{\raggedleft\small\sffamily\bfseries\@CourseInfo\\\@Department\\\par}}
  \lhead{}
}

% Headers
\lhead{}
\chead{}
\rhead{\small\sffamily\bfseries\@LabTitle\ --- \thepage/\pageref{LastPage}}

% Footers
\lfoot{}
\cfoot{}
\rfoot{}

%----------------------------------------------------------------------------------------
%	SECTION SETUP
%----------------------------------------------------------------------------------------

\RequirePackage[explicit]{titlesec}

\titleformat{\section}
	{\color{color1}\large\sffamily\bfseries}
	{}
	{0em}
	{\colorbox{color2!10}{\parbox{\dimexpr\linewidth-2\fboxsep\relax}{\thesection.\space#1}}}
	[]

\titleformat{name=\section,numberless}
	{\color{color1}\large\sffamily\bfseries}
	{}
	{0em}
	{\colorbox{color2!10}{\parbox{\dimexpr\linewidth-2\fboxsep\relax}{\raggedright#1}}}
	[]

\titleformat{\subsection}
	{\color{color1}\sffamily\bfseries}
	{\thesubsection}
	{0.5em}
	{#1}
	[]

\titleformat{\subsubsection}
	{\sffamily\small\bfseries}
	{\thesubsubsection}
	{0.5em}
	{#1}
	[]

\titleformat{\paragraph}[runin]
	{\sffamily\small\bfseries}
	{}
	{0em}
	{#1} 

\titlespacing*{\section}{0pc}{3ex \@plus4pt \@minus3pt}{5pt}
%\titlespacing*{\subsection}{0pc}{2.5ex \@plus3pt \@minus2pt}{0pt}
\titlespacing*{\subsection}{0pc}{3ex \@plus4pt \@minus3pt}{5pt}
\titlespacing*{\subsubsection}{0pc}{2ex \@plus2.5pt \@minus1.5pt}{0pt}
\titlespacing*{\paragraph}{0pc}{1.5ex \@plus2pt \@minus1pt}{10pt}

%----------------------------------------------------------------------------------------
%	TABLE OF CONTENTS SETUP
%----------------------------------------------------------------------------------------

\newlength{\tocsep} 
\setlength\tocsep{1.75pc} % Sets the indentation of the sections in the table of contents
\setcounter{tocdepth}{3} % Three levels in the table of contents section: sections, subsections and subsubsections

\usepackage{titletoc}
\contentsmargin{0cm}

\titlecontents{section}[\tocsep]
	{\addvspace{4pt}\small\bfseries\sffamily}
	{\contentslabel[\thecontentslabel]{\tocsep}}
	{}
	{\hfill\thecontentspage}
	[]

\titlecontents{subsection}[\tocsep]
	%{\addvspace{2pt}\sffamily}
	{\addvspace{4pt}\small\sffamily}
	{\contentslabel[\thecontentslabel]{\tocsep}}
	{}
	{\hfill\thecontentspage}
	%{\ \titlerule*[.5pc]{.}\ \thecontentspage}
	[]

\titlecontents*{subsubsection}[\tocsep]
	{\footnotesize\sffamily}
	{}
	{}
	{}
	[\ \textbullet\ ]

%----------------------------------------------------------------------------------------
%	MULTIPLE AUTHOR SET
%----------------------------------------------------------------------------------------

\newcount\@authcnt
\newcount\@tmpcnt\@tmpcnt\z@

\def\@affiliation{%
	\ifnum\@tmpcnt<\@authcnt
		 \global\advance\@tmpcnt1
		\raggedright \csname @auth\romannumeral\the\@tmpcnt\endcsname\hfill\\%
		 \let\next\@affiliation \vskip1pt
	\else
		\let\next\relax
	\fi
	\next%
}

\newcommand{\affiliation}[1]{%
	\global\advance\@authcnt1
	\expandafter\gdef\csname @auth\romannumeral\the\@authcnt\endcsname
	{#1}
}

%----------------------------------------------------------------------------------------
%	LISTS
%----------------------------------------------------------------------------------------

\RequirePackage{enumitem}
%\setlist{nosep} % Uncomment to remove spacing before lists (enumerate, itemize)
\setlist{itemsep=1pt,parsep=5pt,topsep=1pt,partopsep=1pt} % Uncomment to remove spacing before lists (enumerate, itemize)

%----------------------------------------------------------------------------------------
%	ABSTRACT AND AUTHOR FRAME
%----------------------------------------------------------------------------------------

\newcommand{\LabTitle}[1]{\def\@LabTitle{#1}}
\newcommand{\Department}[1]{\def\@Department{#1}}
\newcommand{\Copyright}[1]{\def\@Copyright{#1}}
%\newcommand{\Authors}[1]{\def\@Authors{#1}}
\newcommand{\CourseInfo}[1]{\def\@CourseInfo{#1}}
\newcommand{\Abstract}[1]{\def\@Abstract{#1}}
%\newcommand{\Keywords}[1]{\def\@Keywords{#1}}

% ---------------------------------------------------------------------

\renewcommand{\@maketitle}{%
	%\twocolumn[{%
		\thispagestyle{empty}%
		%\vskip20pt%
	%	{\raggedleft\small\sffamily\bfseries\@CourseInfo\\\@Department\\\@Copyright\par}%
		{\raggedright\color{color1}\sffamily\bfseries\fontsize{10}{10}\selectfont\ \par}%
		{\raggedright\color{color1}\sffamily\bfseries\fontsize{20}{25}\selectfont\@LabTitle\par}%
	%	{\raggedright\color{color1}\sffamily\fontsize{12}{16}\selectfont\@Authors\par}%
		\vskip10pt%
		\noindent\fcolorbox{color1}{white}{%
			\parbox{\textwidth-2\fboxsep-2\fboxrule}{\centering%
				\colorbox{color2!10}{%
					\parbox{\textwidth-4\fboxsep-2\fboxrule}{%
							\sffamily\@Abstract%
					}%
				}%
			}%
		}%
		\vskip10pt%
	%}]%
}

%----------------------------------------------------------------------------------------
%	REFERENCES
%----------------------------------------------------------------------------------------

\renewcommand{\@biblabel}[1]{\bfseries\color{color1}\textsuperscript{[#1]}} % Styling of the reference numbers in the bibliography
%\setlength{\bibitemsep}{0cm}

\let\oldbibliography\thebibliography

\renewcommand{\thebibliography}[1]{%
	\addcontentsline{toc}{section}{\refname}%
	\oldbibliography{#1}%
	\setlength\itemsep{0pt}%
}
