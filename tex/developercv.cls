%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% CV
%
% This CV template is based on:
% https://overleaf.com/latex/templates/cv-developer/rdycxzvvnvcc
% by Omar Roldan
%
% Modified by Yunus Emre Yavuz
%
% License:
% The MIT License (see included LICENSE file)
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%----------------------------------------------------------------------------------------
%	CLASS CONFIGURATION
%----------------------------------------------------------------------------------------

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{developercv}[2023/10/12 Developer CV class v2.0]

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{extarticle}} % Pass through any options to the base class
\ProcessOptions\relax % Process given options

\LoadClass{extarticle} % Load the base class

%----------------------------------------------------------------------------------------
%	PACKAGES AND OTHER DOCUMENT CONFIGURATIONS
%----------------------------------------------------------------------------------------

\setlength{\parindent}{0mm} % Suppress paragraph indentation

\usepackage[hidelinks]{hyperref} % Required for links but hide the default boxes around links

\pagestyle{empty} % No headers or footers

\usepackage{moresize} % Provides more font size commands (\HUGE and \ssmall)
\usepackage{enumitem}

%----------------------------------------------------------------------------------------
%	PAGE LAYOUT
%----------------------------------------------------------------------------------------

\usepackage{geometry} % Required for adjusting page dimensions and margins

\geometry{
	paper=a4paper, % Paper size, change to letterpaper for US letter size
	top=1.5cm, % Top margin
	bottom=1.5cm, % Bottom margin
	left=1.5cm, % Left margin
	right=1.5cm, % Right margin
	headheight=0.75cm, % Header height
	footskip=1cm, % Space from the bottom margin to the baseline of the footer
	headsep=0.5cm, % Space from the top margin to the baseline of the header
	%showframe, % Uncomment to show how the type block is set on the page
}

%----------------------------------------------------------------------------------------
%	FONTS
%----------------------------------------------------------------------------------------

\usepackage[utf8]{inputenc} % Required for inputting international characters
\usepackage[T1]{fontenc} % Output font encoding for international characters

\usepackage[default]{raleway}
%\usepackage[defaultsans]{droidsans}
%\usepackage{cmbright}

\renewcommand*\familydefault{\sfdefault} % Force the sans-serif version of any font used

%------------------------------------------------

\usepackage{fontawesome} % Required for FontAwesome icons

% Command to output an icon in a black square box with text to the right
\newcommand{\icon}[3]{% The first parameter is the FontAwesome icon name, the second is the box size and the third is the text
	\vcenteredhbox{\colorbox{white}{\makebox(#2, #2){\textcolor{black!70}{\Large\csname fa#1\endcsname}}}}% Icon and box
	\hspace{0.2cm}% Whitespace
	\vcenteredhbox{\textcolor{black}{#3}}% Text
}

%----------------------------------------------------------------------------------------
%	GRAPHICS DEFINITIONS
%---------------------------------------------------------------------------------------- 

\usepackage{tikz} % Required for creating the plots
\usetikzlibrary{shapes, backgrounds}
\tikzset{x=1cm, y=1cm} % Default tikz units

% Command to vertically centre adjacent content
\newcommand{\vcenteredhbox}[1]{% The only parameter is for the content to centre
	\begingroup%
		\setbox0=\hbox{#1}\parbox{\wd0}{\box0}%
	\endgroup%
}

% Command to create a skill level indicator with four smaller squares with spacing
\newcommand{\skilllevel}[1]{%
    \begin{tikzpicture}[scale=0.5]
        \foreach \i in {1,2,3,4} {
            \ifnum \i>#1
                \fill[gray!20] (\i*0.6-0.6,0) rectangle (\i*0.6-0.1,0.5);
            \else
                \fill[black!70] (\i*0.6-0.6,0) rectangle (\i*0.6-0.1,0.5);
            \fi
        }
    \end{tikzpicture}
}



%----------------------------------------------------------------------------------------
%	CUSTOM SECTIONS
%----------------------------------------------------------------------------------------
\def\Vhrulefill{\leavevmode\leaders\hrule height 0.7ex depth \dimexpr0.4pt-0.7ex\hfill\kern0pt}

% Command to output section title headings
\newcommand{\cvsect}[1]{% The only parameter is the section text
	\vspace{\baselineskip} % Whitespace before the section title
	\textcolor{black}{ \MakeUppercase{\textbf{#1}}} \hspace{4pt} \Vhrulefill \\% Section title
}

%----------------------------------------------------------------------------------------
%	ENTRY LIST
%----------------------------------------------------------------------------------------

\usepackage{longtable} % Required for tables that span multiple pages
\setlength{\LTpre}{0pt} % Remove default whitespace before longtable
\setlength{\LTpost}{0pt} % Remove default whitespace after longtable

\setlength{\tabcolsep}{0pt} % No spacing between table columns

% Environment to hold a new list of entries
\newenvironment{entrylist}{
	\begin{longtable}[H]{l l}
}{
	\end{longtable}
}

\newcommand{\entry}[4]{% First argument for the leftmost date(s) text, second is for the bold entry heading, third and fourth for the entry description
	\parbox[t]{0.15\textwidth}{
	   \small #1 % Leftmost entry date(s) text
	}
	&\parbox[t]{0.85\textwidth}{
		\textbf{#2} % Entry heading text
        
		#3  \vspace{5pt} % Entry description text 1
  
		#4 % Entry description text 2
	}\\\\
 }

% Command to output a separator slash between lists, e.g. '  /  '
\newcommand{\slashsep}{\hspace{3mm}/\hspace{3mm}}
