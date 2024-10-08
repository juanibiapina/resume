all: resume.html resume.pdf resume.docx resume.txt

resume.html: resume.md style.css
	pandoc --standalone -c style.css --from markdown --to html --metadata pagetitle="Juan Ibiapina's Resume" -o resume.html resume.md

resume.pdf: resume.html
	wkhtmltopdf --enable-local-file-access resume.html resume.pdf

resume.docx: resume.md
	pandoc --from markdown --to docx -o resume.docx resume.md

resume.txt: resume.md
	pandoc --standalone --from markdown+smart --to plain -o resume.txt resume.md

clean:
	rm -f *.html *.pdf *.docx *.txt
