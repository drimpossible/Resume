\ProvidesClass{page2_formatting}[2017/01/08 CV class]
\LoadClass{article}
\NeedsTeXFormat{LaTeX2e}

%----------------------------------------------------------------------------------------
%	 REQUIRED PACKAGES
%----------------------------------------------------------------------------------------
\RequirePackage{fontawesome}

\RequirePackage[sfdefault]{ClearSans}
\RequirePackage[T1]{fontenc}
\RequirePackage{tikz}
\RequirePackage{xcolor}
\RequirePackage[absolute,overlay]{textpos}
\RequirePackage{ragged2e}
\RequirePackage{array}
\RequirePackage{etoolbox}
\RequirePackage{ifmtarg}
\RequirePackage{ifthen}
\RequirePackage{pgffor}
\RequirePackage{marvosym}
\RequirePackage{longtable} 	
\RequirePackage{parskip}
\RequirePackage{amsmath}
\RequirePackage[skins]{tcolorbox}
\usetikzlibrary{arrows}
\RequirePackage{enumitem}
\usepackage{setspace}
%\RequirePackage{multicol}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax

%----------------------------------------------------------------------------------------
%	 COLOURS
%----------------------------------------------------------------------------------------

\definecolor{white}{RGB}{255,255,255}
\definecolor{gray}{HTML}{4D4D4D}
\definecolor{sidecolor}{HTML}{F7F7F7}
\definecolor{mainblue}{HTML}{0E5484}
\definecolor{maingray}{HTML}{B9B9B9}
\definecolor{lime}{HTML}{00cc33}
\definecolor{forestgreen}{HTML}{228B22}
\colorlet{emphasis}{black}
\colorlet{accent}{blue!70!black}
\colorlet{body}{black!80!white}


%----------------------------------------------------------------------------------------
%	 MISC CONFIGURATIONS
%----------------------------------------------------------------------------------------

%\renewcommand{\bfseries}{\color{gray}} % Make \textbf produce coloured text instead

\pagestyle{empty} % Disable headers and footers

\setlength{\parindent}{0pt} % Disable paragraph indentation


%----------------------------------------------------------------------------------------
%	 SIDEBAR DEFINITIONS
%----------------------------------------------------------------------------------------

\setlength{\TPHorizModule}{1cm} % Left margin
\setlength{\TPVertModule}{1cm} % Top margin


% Setup Array : new column type
\newcolumntype{R}[1]{>{\hfill}m{#1}}
\newcolumntype{E}{>{\raggedright\arraybackslash}p{\rightcolumnlength}}

\newlength\imagewidth
\newlength\imagescale
\pgfmathsetlength{\imagewidth}{5cm}
\pgfmathsetlength{\imagescale}{\imagewidth/600}

\newlength{\TotalSectionLength} % Define a new length to hold the remaining line width after the section title is printed
\newlength{\SectionTitleLength} % Define a new length to hold the width of the section title
\newcommand{\profilesection}[1]{%
	% \vspace{0.5cm}
	\setlength\TotalSectionLength{5cm}% Set the total line width
	\settowidth{\SectionTitleLength}{\Large #1 }% Calculate the width of the section title
	\addtolength\TotalSectionLength{-\SectionTitleLength}% Subtract the section title width from the total width
	\addtolength\TotalSectionLength{-2.22221pt}% Modifier to remove overfull box warning
	\vspace{4pt}% Whitespace before the section title
	{\color{black!80} \Large #1 \rule[0.15\baselineskip]{\TotalSectionLength}{1pt}} \\ % Print the title and auto-width rule
}

% Define custom commands for CV info
\newcommand{\cvdate}[1]{\renewcommand{\cvdate}{#1}}
\newcommand{\cvmail}[1]{\renewcommand{\cvmail}{#1}}
\newcommand{\cvnumberphone}[1]{\renewcommand{\cvnumberphone}{#1}}
\newcommand{\cvaddress}[1]{\renewcommand{\cvaddress}{#1}}
\newcommand{\cvsite}[1]{\renewcommand{\cvsite}{#1}}
\newcommand{\aboutme}[1]{\renewcommand{\aboutme}{#1}}
\newcommand{\profilepic}[1]{\renewcommand{\profilepic}{#1}}
\newcommand{\cvname}[1]{\renewcommand{\cvname}{#1}}
\newcommand{\cvjobtitle}[1]{\renewcommand{\cvjobtitle}{#1}}

% Command for printing the contact information icons
\newcommand*\icon[1]{\tikz[baseline=(char.base)]{\node[shape=circle,draw,inner sep=1pt, fill=mainblue,mainblue,text=white] (char) {#1};}}

\newcommand{\cvtag}[1]{%
  \tikz[baseline]\node[anchor=base, draw=body!30,,minimum height=0.5cm,, inner xsep=0.6ex,inner ysep =0.75ex,text height= 1ex,text depth=0.0ex, align=center, fill=maingray, maingray, text=black]{\footnotesize #1};
}
\newcommand{\greentag}[1]{%
  \tikz[baseline]\node[anchor=base , draw=body!30,,minimum height=0.4cm,, inner xsep=1ex,inner ysep =0.75ex,text height= .15cm,text depth=0.0ex, align=center, fill=mainblue, mainblue, text=white,font=\bfseries]{\footnotesize #1};
}
\newcommand{\bluetag}[1]{%
  \tikz[baseline]\node[anchor=base, draw=body!30,,minimum height=0.6cm,, inner xsep=1ex,inner ysep =0.3ex,text height= 0.75ex,text depth=0.0ex, align=center, fill=mainblue,mainblue, text=white,font=\bfseries]{#1};
}

\newcommand*\foobar[1]{
	\begin{center}
		\begin{tikzpicture}[x=\imagescale,y=-\imagescale]
			\clip (32,32) rectangle (32, 32);
			\node[anchor=north west, inner sep=0pt, outer sep=0pt] at (0,0) 					{\includegraphics[width=\imagewidth]{#1}};
		\end{tikzpicture}
	\end{center}
}
\newcommand{\imgsym}[1]{\ensuremath{%
  \mathchoice{\includegraphics[height=2ex]{#1}}
    {\includegraphics[height=2ex]{#1}}
    {\includegraphics[height=2.5ex]{#1}}
    {\includegraphics[height=1ex]{#1}}
}}

\newcommand{\handle}[4]{
	\vspace{0.1cm}
    \hspace{2cm}
	\imgsym{#1}
    \hspace{0.11cm}
    \href{#3}{\small{\textbf{\textcolor{#4}{#2}}}} \\
}

% End the experiences environment -----------------------------------------------------------

% Command for printing skill progress bars
\newcommand{\skills}[1]{ 
	\renewcommand{\skills}{
		%\begin{tikzpicture}
			\foreach [count=\i] \x/\y in {#1}{
            	\cvskill{\x}{\y} 
				%\draw[fill=maingray,maingray] (0,\i) rectangle (6,\i+0.4);
				%\draw[fill=white,mainblue](0,\i) rectangle (\y,\i+0.4);
				%\node [above right] at (0,\i+0.4) {\x};
			}
		%\end{tikzpicture}
	}
}

% Command for printing skills text
\newcommand\skillstext[1]{ 
	\renewcommand{\skillstext}{
		\begin{flushleft}
			\foreach [count=\i] \x/\y in {#1}{ 
				\x$ \star $\y
			}
		\end{flushleft}
	}
}

\newcommand{\ratingmarker}{\faCircle}

\newcommand{\cvskill}[3]{%
	\hspace{2cm}
	\parbox[t]{0.8 \textwidth}{
		\textcolor{gray}{{\textbf{#1}}}% \hfill\quad
		%\foreach \x in {1,...,5}{%
  		%	{\ifnumgreater{\x}{#2}{\color{body!30}}{\color{#3}}\faCircle}
    	%}\par
        % {\color{maingray}\hrule}
	}
    \vspace{-0.3 cm}
}

%----------------------------------------------------------------------------------------
%	 SIDEBAR LAYOUT
%----------------------------------------------------------------------------------------


\newcommand{\makeprofile}{
	\begin{tikzpicture}[remember picture,overlay]
   		\node [rectangle, fill=sidecolor, anchor=north, minimum width=6.2cm, minimum height=\paperheight-0.15cm] (box) at (-3.5cm,0.4cm){};
	\end{tikzpicture}
    
	%------------------------------------------------

	\begin{textblock}{6.5}(-1.5, 0.2)
			
		%------------------------------------------------
		
		% \ifthenelse{\equal{\profilepic}{}}{}{
		%	\begin{center}
		%		\begin{tikzpicture}[x=\imagescale,y=-\imagescale]
		%			\clip (600/2, 567/2) circle (567/2);
		%			\node[anchor=north west, inner sep=0pt, outer sep=0pt] at (0,0) {\includegraphics[width=\imagewidth]{\profilepic}};
		%		\end{tikzpicture}
		%	\end{center}
		% }

		%------------------------------------------------

		{\huge\color{mainblue}\cvname}

		%------------------------------------------------

		\renewcommand{\arraystretch}{1.4}
		\begin{tabular}{p{0.5cm} @{\hskip 0.05cm}p{5cm}}
			% \ifthenelse{\equal{\cvaddress}{}}{}{\textsc{\small\icon{\Letter}} & \cvaddress\\}
            %\ifthenelse{\equal{\cvsite}{}}{}{\textsc{\small\icon{}} & \href{http://\cvsite}{\cvsite}}
		\end{tabular}
        
        
       
        %-----------------------------------------------
        % COURSES SECTION
        %-----------------------------------------------
        %\profilesection{}\\
        	\vspace{\parsep}
        	\hspace{0.1cm}
        	 { \space -Economics and Privacy \\
       		\vspace{\parsep}
            \hspace{2.2cm}
            in Blockchains}\\
            \vspace{\parsep}
            \hspace{2cm}
            {\faAngleRight \space Database Systems}
           % \vspace{\parsep}
            \hspace{1.8cm} 
        
        \profilesection{ML Frameworks}\\
        	%\vspace{\parsep}
        	%\hspace{2cm}
        	%\textbf{Systems}\\
        	\vspace{\parsep}
        	\hspace{2cm}
            {\faAngleRight \space Deep Learning: PyTorch,\\
            \vspace{\parsep}
            \hspace{2.2cm}
            Keras \& Tensorflow (Basic)}\\
             \vspace{\parsep}
            \hspace{2cm}
            {\faAngleRight \space Parallel Computing: MPI,\\
            \vspace{\parsep}
            \hspace{2.2cm}
             OpenMP \& CUDA (Basic)}\\
             \vspace{\parsep}
            \hspace{2cm}
            {\faAngleRight \space Small Experiments: OpenCV,  \\
            \vspace{\parsep}
            \hspace{2.2cm}
            SciPy, \& Scikit-Learn}\\
            \vspace{\parsep}
            \hspace{2cm}
            {\faAngleRight \space Languages: Python, C++\\
            \vspace{\parsep}
            \hspace{2cm}
            Java (Basic), Bash \& Lua}
            %{\faAngleRight \space \LaTeX}\\
            %\vspace{\parsep}
            %\hspace{2cm} 
      
        %-----------------------------------------------
        % POSITIONS HELD SECTION
        %----------------------------------------------- 
		\profilesection{Research Activities}\\
        \begin{twenty}
        \positionsheld{Peer Reviewing Activities}{CVPR 2019\\ICVGIP 2018}{(2018-Present)}\\
        \positionsheld{Grants \& Scholarships}{Google India Travel Grant\\CVIT Student Travel Grant}{(2018-Present)}\\
		\end{twenty}
        
        \profilesection{IIIT-H Activities}\\
        \begin{twenty}
        	\positionsheld{Overall Coordinator}{The Economics Club}{\textit{IIIT-H}}\\
            %\positionsheld{Fomer Captain}{Table Tennis Team}{\textit{IIIT-H}}\\
            \positionsheld{Member}{Constitution Drafting\\ Committee}{\textit{IIIT-H}}\\
            \positionsheld{Organizer}{Kings of Machine Learning}{\textit{Felicity '17}}\\
            \positionsheld{Writer}{Eye to the Future\\ Tech \& Society Column, Ping!}{\textit{Newsletter , IIIT-H}}\\
		\end{twenty}

        %-----------------------------------------------
        % INTERESTS SECTION
        %-----------------------------------------------        
		
	\end{textblock}
    
}
%----------------------------------------------------------------------------------------
%	 COLOURED SECTION TITLE BOX
%----------------------------------------------------------------------------------------

% Command to create the rounded boxes around the first three letters of section titles
\newcommand*\round[2]{%
	\tikz[baseline=(char.base)]\node[anchor=north west, draw,rectangle, rounded corners, inner sep=1.4pt, minimum size=5.5mm, text height=3.6mm, fill=#2,#2,text=white](char){#1};%
}

\newcounter{colorCounter}
\newcommand{\sectioncolor}[1]{%
	{%
		\round{#1}{
			\ifcase\value{colorCounter}%
			maingray\or%
			mainblue\or%
			maingray\or%
			mainblue\or%
			maingray\or%
			mainblue\or%
			maingray\or%
			mainblue\or%
 			maingray\or%
			mainblue\else%
			maingray\fi%
		}%
	}%
	\stepcounter{colorCounter}%
}

\renewcommand{\section}[1]{
	{%
		\color{gray}%
		\Large\sectioncolor{#1}%
	}
}

\renewcommand{\subsection}[1]{
	\par\vspace{.5\parskip}{%
		\large\color{gray} #1%
	}
	\par\vspace{.25\parskip}%
}


%----------------------------------------------------------------------------------------
%	 LONG LIST ENVIRONMENT
%----------------------------------------------------------------------------------------

\setlength{\tabcolsep}{0pt}

% New environment for the long list
\newenvironment{twenty}{%
	\begin{tabular*}{\textwidth}{@{\extracolsep{\fill}}ll}
}{%
	\end{tabular*}
}

\newcommand{\twentyitem}[4]{%
\vspace{0.2cm}
	\parbox[t]{0.9 \textwidth}{%
    	%\vspace{\parsep}
		\textbf{#1}, {\color{gray} #4}%
        \hfill{
        	\foreach [count=\i] \x in {#2}{
        		\greentag{\x}
        	}
         }
         
         \vspace{\parsep}
		%{\greentag{#2}}\\%[rightmargin=\dimexpr\linewidth-5cm-\leftmargin\relax]
			#3\vspace{\parsep}%
        {\color{maingray}\hrule}
	}\\
}

\newcommand{\twentyitemeducation}[4]{%
	\vspace{0.1cm}
	\parbox[t]{0.8 \textwidth}{
		\textbf{#1} \\
		\emph{#2} \qquad
        \emph{\small{#3}}
        \\
        GPA: #4/10
        % {\color{maingray}\hrule}
        % \vspace{0.1cm}%
	}
}

\newcommand{\workexperience}[4]{%
	\hspace{0.2cm}
	\parbox[t]{0.43 \textwidth}{
		\textbf{#1}%
		\hfill\\%
		\emph{#2}
        \hfill\\%
		{\color{gray} #3 - #4}
        \vspace{0.1cm}%
        {\color{maingray}\hrule}
        \vspace{0.1cm}%
	}\\
}

\newcommand{\myeducation}[5]{%
	\hspace{0.2cm}
	\parbox[t]{0.9 \textwidth}{
		\textbf{#1}\hfill{\color{gray} #3 - #4}\\%
		\emph{#2}\hfill%
        \emph{CGPA: #5/10}%
        \vspace{0.3cm}%
        {\color{maingray}\hrule}
	}\\
}

\newcommand{\myskills}[2]{%
\hspace*{2cm}
	\parbox[t]{0.9 \textwidth}{%
    	\vspace*{0.005cm}
		\textbf{#1}:{
        	\foreach [count=\i] \x in {#2}{
            	\x
        	}
         }
	}\\
}

\newcommand{\positionsheld}[3]{%
	\hspace{2cm}
	\parbox[t]{0.7 \textwidth}{
		\textbf{#1}\\
        #2\\
        #3 \\
        {\color{maingray}\hrule}
        % \vspace{0.3cm}%
	}
}

\newcommand{\twentyitemshort}[1]{%
	\hspace{0.3 cm}
	\parbox[t]{0.43\textwidth}{%
		\textbf{#1}%
		\hfill%
        \vspace{\parsep}%
	}\\

}
%----------------------------------------------------------------------------------------
%	 SMALL LIST ENVIRONMENT
%----------------------------------------------------------------------------------------

% Define the 'experiences' environment ---------------------------------------------------
%New length definition
\newlength{\leftcolumn}
\setlength{\leftcolumn}{3.5cm}

\newlength{\rightcolumnlength}
\setlength{\rightcolumnlength}{12.5cm}
\setlist[itemize,1]{label=\faAngleRight, nosep, leftmargin=2em} 

\newenvironment{experiences}{%
  \begin{longtable}{R{\leftcolumn}@{\hspace{1em}}|@{\hspace{0.3em}}E}
}{%
  \end{longtable}
}

% Render an experience in the experiences environment
% Usage: 
% \experience
%  {<End date>}      {<Title>}{<Enterprise>}{<Country>}
%  {<Start date}     {
%                      <Experience description (Could be a list)>
%                    }
%                    {<Technology list>}
\newcommand\experience[2]{
	%\hfill{       							
 		 \textsc{\textbf{#1}}    & \begin{minipage}[t]{\rightcolumnlength}
  					          #2
                  		 \end{minipage}\\*
  }
\newcommand\emptySeparator{\multicolumn{2}{c}{}\\
}	


\setlength{\tabcolsep}{0pt}

% New environment for the small list
%\newenvironment{twentyshort}{%
%	\begin{tabular*}{\textwidth}{@{\extracolsep{\fill}}ll}
%}{%
%	\end{tabular*}
%}


%----------------------------------------------------------------------------------------
%	 MARGINS AND LINKS
%----------------------------------------------------------------------------------------

\RequirePackage[left=4.7cm,top=0.1cm,right=1cm,bottom=0.2cm,nohead,nofoot]{geometry}

\RequirePackage[hidelinks]{hyperref}
