<%inherit file="base.mako" />
<%
  colors = bf.config.colors
  shades = bf.config.shades
%>

/**
 * HTML5 And CSS3 Theme version 1.2
 * By Jayj.dk 2009-2010
 * Download for free at http://jayj.dk/a-free-html5-and-css3-theme/
 
	Released under New BSD License
	http://www.opensource.org/licenses/bsd-license.php
	 
	Copyright (c) 2009-2010, Jayj.dk
	All rights reserved.
	
	Redistribution and use in source and binary forms, with or without modification,
	are permitted provided that the following conditions are met:
	
		* Redistributions of source code must retain the above copyright notice,
		  this list of conditions and the following disclaimer.
	
		* Redistributions in binary form must reproduce the above copyright notice,
		  this list of conditions and the following disclaimer in the documentation
		  and/or other materials provided with the distribution.
	
		* Neither the name of Jayj.dk nor the names of its
		  contributors may be used to endorse or promote products derived from this
		  software without specific prior written permission.
	
	THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
	ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
	WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
	DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR
	ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
	(INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
	LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON
	ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
	(INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
	SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

*/

@font-face {
	font-family: 'ChunkFive Regular';
	src: url('fonts/Chunkfive.eot');
	src: local('ChunkFive Regular'), local('ChunkFive'), url('fonts/Chunkfive.woff') format('woff'), url('fonts/Chunkfive.svg#ChunkFive') format('svg'), url('fonts/Chunkfive.otf') format('opentype');
}

/* Reset.css */
html, body, div, span, h1, h2, h3, h4, h5, h6, p, blockquote, pre,
a, abbr, acronym, address, big, cite, code,
del, dfn, em, font, img, q, small, strong, sub, sup, tt, var,
ol, ul, li, fieldset, form, label, legend,
table, caption, tbody, tfoot, thead, tr, th, td,
article, aside, canvas, details, figcaption, figure, 
footer, header, hgroup, menu, nav, section, summary,
time, mark, audio, video {
	margin: 0;
	padding: 0;
	border: 0;
	outline: 0;
	font-size: 100%;
	vertical-align: baseline;
	background: transparent;
}
ul, ol { list-style: none;}
img { border: none; }
:focus { outline: 0; }
ins { text-decoration: underline; }
del { text-decoration: line-through; }
table { border-collapse: collapse; border-spacing: 0; }
h1, h2, h3, h4, h5, h6 { font-weight: normal; }
/* End reset */

body { 
	background: ${colors.bodyBackground};
	color: ${colors.body};
	font: 14px/24px Georgia, 'Times New Roman', Times, serif;
}

/* HTML5 */
article, aside, details, figcaption, figure,
footer, header, hgroup, menu, nav, section { 
    display: block;
}

/* Typography and default stuff */

a {
	color: ${colors.a};
	text-shadow: ${colors.aShadow} 1px 1px 1px;
	text-decoration: none;
	-webkit-transition: all .1s linear;
	-moz-transition: all .1s linear;
	transition: all .1s linear;
}

#menu a:hover, 
#menu li.current > a {
	background: ${colors.buttonBackground};
	color: ${colors.button};
	text-decoration: none;
	text-shadow: ${colors.buttonShadow} 1px 1px 1px;
	-webkit-border-radius: 3px;
	-moz-border-radius: 3px;
	border-radius: 3px;
}

a:hover {
/*	background: ${colors.aHoverBackground};
	color: ${colors.aHover}; */
	text-decoration: underline;
/*	text-shadow: ${colors.aHoverShadow} 1px 1px 1px;
	-webkit-border-radius: 3px;
	-moz-border-radius: 3px;
	border-radius: 3px; */
}

p, dl, hr, h1, h2, h3, h4, h5, h6,
ol, ul, pre, table, fieldset, blockquote, .widget {
	margin-bottom: 20px;
}

h1 { font-size: 32px; }
h2 { font-size: 28px; }
h3 { font-size: 26px; }
h4 { font-size: 23px; }
h5 { font-size: 19px; }
h6 { font-size: 16px; }

#header h1 {
	font-family: 'ChunkFive Regular', Arial, Helvetica, sans-serif; /* Chunkfive is called via @font-face */
}
/*
#header h2,
.post h2,
h3 {
	font-family: Arial, Helvetica, sans-serif; /* Chunkfive is called via @font-face */
}
*/
hr { 
	border: 0 solid ${colors.hrBorder}; 
	border-top-width: 1px; 
	clear: both; height: 0; }
ol { list-style: decimal; }
ul { list-style: disc; }
li { margin-left: 30px; }

pre {
	background: ${colors.preBackground};
	border: 2px solid ${colors.preBorder};
	font-size: 12px;
	padding: 10px;
	-webkit-box-shadow: inset -1px 1px 1px rgba(255, 255, 255, 0.65);
	-moz-box-shadow: inset -1px 1px 1px rgba(255, 255, 255, 0.65);
	box-shadow: inset -1px 1px 1px rgba(255, 255, 255, 0.65);
}

pre code { background: none; }
code { background: ${colors.codeBackground}; font-size: 12px; }

blockquote {
	border-left: 4px solid #00B;
	border-bottom: 1px solid #00B;
	color: ${colors.blockquote};
	font-style: italic;
	padding: 15px 0 10px 10px;
	margin-left: 20px;
	text-indent: 10px;
	-webkit-box-shadow: inset 1px -1px 1px rgba(255, 255, 255, 0.65);
	-moz-box-shadow: inset 1px -1px 1px rgba(255, 255, 255, 0.65);
	box-shadow: inset 1px -1px 1px rgba(255, 255, 255, 0.65);
}

blockquote p { margin: 0; }

/* Header */

#header {
	height: 75px;
}

#header h1 a {
	color: ${colors.header};
	font-size: 66px;
	font-weight: bold;
	float: left;
	margin-top: 20px;
	padding: 20px 2px;
	text-shadow: 2px 2px 1px #fff;
}

#header h1 a:hover {
	background: inherit;
}

#header h2 {
	margin-top: 50px;
	text-align: right;
}

/* Content */
#content { 
	background: ${colors.contentBackground};
	border: 1px solid ${colors.contentBorder};
	border-left: none; border-right: none;
	float: left;
	width: 940px;
	padding: 20px 10px 0 10px;
	-webkit-border-radius: 5px;
	-moz-border-radius: 5px;
	border-radius: 5px;
	-webkit-box-shadow: rgba(0, 0, 0, 0.496094) 3px 3px 6px;
	-moz-box-shadow: rgba(0, 0, 0, 0.496094) 3px 3px 6px;
	box-shadow: rgba(0, 0, 0, 0.496094) 3px 3px 6px;
}

/* Nav */
#content nav {
	height: 70px;
}

#menu {
	border-bottom: 1px solid ${colors.menuBorderBottom};
	list-style: none;
}

#menu li {
	float: left;
	margin: 0 15px 0 0;
	padding-bottom: 5px;
	position: relative;
}

#menu li a {
	display: block;
	font-size: 16px;
	padding: 8px 10px;
	-webkit-border-radius: 5px;
	-moz-border-radius: 5px;
	border-radius: 5px;
}

	/* Level 2 */
	#menu ul {
		background: #54C4A9; /* Fallback */
		background: rgba(188, 215, 227, 0.95);
		display: none;
		padding: 10px;
		list-style: none;
		position: absolute;
		left: 0; top: 100%;
		z-index: 100;
		text-shadow: 1px 1px 0 #eae7e7;
		
		-webkit-box-shadow: 2px 3px 3px #4d4b4b;
		-moz-box-shadow: 2px 3px 3px #4d4b4b;
		box-shadow: 2px 3px 3px #4d4b4b;
		
		-webkit-border-bottom-right-radius: 5px;
		-moz-border-radius-bottomright: 5px;
		border-bottom-right-radius: 5px;
	}
	
	#menu li:hover > ul { display: block;  }
	
	#menu ul li {
		float: none;
		min-width: 150px;
	}
	
/* Post */
.post { 
	position: relative;
}

.post p { padding-right: 30px; }

.post img.thumbnail + p { margin-top: 25px; } /* First p after the thumbnail */

.post header h1,
.post header h1 a {
	color: ${colors.postH2A};
	display: block;
	font-size: 1.2em;
	font-weight: bold;
	-webkit-transition: opacity 0.15s ease-in-out;
	-moz-transition: opacity 0.15s ease-in-out;
	transition: opacity 0.15s ease-in-out;
	margin-bottom: 2px;
}

.post header h1 a:hover { 
	background: none; 
	opacity: 0.7; 
	text-decoration: none;
	text-shadow: none;
}

.post header p { /* meta */
	margin-left: 30px;
	color: ${shades[2]};
}

.post h2 { margin: 30px 0; }

	/* Post meta */
	.postmeta {
		margin: 30px 35px 0 0;
		overflow: hidden;
		text-shadow: 1px 1px 1px #37C;
	}
	
	.postmeta a { color: #fff; }


/* Sidebar */

.widget h3 {
	font-size: 1.1em;
	margin-bottom: 0;
	font-weight: bold;
}

.widget {
	overflow: hidden;
	margin-bottom: 0;
	border-bottom: 1px solid ${colors.menuBorderBottom};
}

.widget ul {
	list-style: none;
}

.widget li { margin-left: 2em; text-indent: -2em; }

.widget li a { 
/*	padding: 4px 5px; */
/*	-webkit-transition: margin-left 0.3s linear;
	-moz-transition: margin-left 0.3s linear;
	transition: margin-left 0.3s linear; */
}

/*
.widget li a:hover {
	color: ${colors.aHover};
	-webkit-border-radius: 5px;
	-moz-border-radius: 5px;
	border-radius: 5px;
}

aside h3 {
	font-size: 26px;
}
*/

#sidebar #tags .tag0 {
    font-size: 0.8em;
}

#sidebar #tags .tag1 {
    font-size: 0.9em;
}

#sidebar #tags .tag2 {
    font-size: 1.0em;
}

#sidebar #tags .tag3 {
    font-size: 1.1em;
}

#sidebar #tags .tag4 {
    font-size: 1.2em;
}

#sidebar #tags .tag5 {
    font-size: 1.3em;
}

/* Footer */

footer a {
	color: black;
	text-decoration: underline;
}

footer p { margin: 0; }

/* Form */

input,
textarea,
label {
	font: 16px Georgia, "Times New Roman", Times, serif;
}

input[type=text],
input[type=email],
textarea {
	background: #cecdcd; /* Fallback */
	background: rgba(206, 205, 205, 0.6);
	border: 2px solid #00B;
	padding: 6px 5px;
	
	-webkit-box-shadow: inset -1px 1px 1px rgba(255, 255, 255, 0.65);
	-moz-box-shadow: inset -1px 1px 1px rgba(255, 255, 255, 0.65);
	box-shadow: inset -1px 1px 1px rgba(255, 255, 255, 0.65);
}

input[type=search] {
	padding: 6px 5px;
	width: 200px;
}

textarea { overflow: auto; }

input[type=text]:hover, input[type=text]:focus,
input[type=email]:hover, input[type=email]:focus,
textarea:hover, textarea:focus {
	background: #cecdcd;
	background: rgba(206, 205, 205, 0.8);
	border: 2px solid #e02a72;
	text-shadow: 1px 1px 0 #eae7e7;
}

form input[type=submit] {
	border: none;
	cursor: pointer;
}

/* When a form input is invalid - Used on the email type field */
input:invalid { 
	border: 2px solid red;
	-webkit-transform: rotate(1deg);
	-moz-transform: rotate(1deg);
	transform: rotate(1deg);
}

	/* Contactform */
	#contactform {
		margin-top: 30px;
		overflow: hidden;
	}
	
	#contactform p {
		overflow: hidden;
	}
	
	#contactform label {
		float: left;
		padding-top: 10px;
	}


.success {
	background: #e7f7d3 url(images/accepted.png) no-repeat 10px center;
	background: rgba(231, 247, 211, 0.4) url(images/accepted.png) no-repeat 10px center;
	border: 1px solid #6c3;
	padding: 20px 0 20px 80px;
}

.error {
	background: #ffebe8 url(images/cancel.png) no-repeat 10px center;
	background: rgba(255,235,232,0.4) url(images/cancel.png) no-repeat 10px center;
	border: 1px solid #C00;
	color: #C00;
	line-height: 30px;
	padding: 10px 0 10px 80px;
}

/* Misc */

a.feed {
	background: url(images/feed-icon.png) no-repeat 0% 50%;
	padding-left: 16px;
}

.alignleft { float: left; }
.alignright { float: right; }

.btn,
.more-link,
input[type=submit]  {
	background: ${colors.buttonBackground};
	color: ${colors.button};
	text-shadow: ${colors.buttonShadow} 1px 1px 1px;
	padding: 5px 16px;
	border-radius: 10px;
	-webkit-border-radius: 10px;
	-moz-border-radius: 10px; 
}

.btn:hover,
.more-link:hover,
input[type=submit]:hover {
	background: #37C;
}

img.alignleft, 
img.alignright { 
	background: #f2f2f2;
	border: 2px solid #cecdcd;
	padding: 5px;
	-webkit-transition: border 0.2s linear;
	-moz-transition: border 0.2s linear;
	transition: border 0.2s linear;
}

img.alignleft { margin-right: 15px; }
img.alignright { margin-left: 15px; }

.thumbnail { margin-left: -50px; }
.thumbnail:hover { border: 2px solid #00B; }

.hide { display: none; }

.twoColumns {
  -webkit-column-count:2;
  -moz-column-count:2;
  -moz-column-gap:22px;
  -webkit-coulmn-gap:22px;
}

.tilt {
	-webkit-transform: rotate(5deg); 
	-moz-transform: rotate(5deg); 
	transform: rotate(5deg); 
}

.shadow {
	-webkit-box-shadow: rgba(0, 0, 0, 0.496094) 3px 3px 6px;
	-moz-box-shadow: rgba(0, 0, 0, 0.496094) 3px 3px 6px;
	box-shadow: rgba(0, 0, 0, 0.496094) 3px 3px 6px;
}

/* Thumbnail rotation - Uncomment to use */

/*
.thumbnail {
	-webkit-transform: rotate(1deg); 
	-moz-transform: rotate(1deg); 
	transform: rotate(1deg); 
}
.post:nth-child(odd) .thumbnail {
	-webkit-transform: rotate(-1deg);
	-moz-transform: rotate(-1deg);
	transform: rotate(-1deg);
 }
*/
