all: resume.html resume.pdf resume.docx resume.txt

resume.html: resume.md style.css
	pandoc --standalone -c style.css --from markdown --to html -o resume.html resume.md

resume.pdf: resume.html
	wkhtmltopdf --disable-smart-shrinking --zoom 2.5 resume.html resume.pdf

resume.docx: resume.md
	pandoc --from markdown --to docx -o resume.docx resume.md

resume.txt: resume.md
	pandoc --standalone --smart --from markdown --to plain -o resume.txt resume.md

clean:
	rm -f *.html *.pdf *.docx *.txt
