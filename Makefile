.PHONY: all clean
all: resume.html resume.pdf resume.docx

resume.html: resume.md style.css
	pandoc --standalone -c style.css --from markdown --to html --metadata pagetitle="Juan Ibiapina's Resume" -o resume.html resume.md

resume.pdf: resume.html
	weasyprint resume.html resume.pdf

resume.docx: resume.md
	pandoc --from markdown --to docx -o resume.docx resume.md

clean:
	rm -f *.html *.pdf *.docx *.txt
