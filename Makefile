.PHONY: all clean
all: resume.html resume.pdf

resume.html: resume.md style.css
	pandoc --standalone -c style.css --from markdown --to html --metadata pagetitle="Juan Ibiapina's Resume" -o resume.html resume.md

resume.pdf: resume.html
	weasyprint resume.html resume.pdf

clean:
	rm -f *.html *.pdf *.txt
