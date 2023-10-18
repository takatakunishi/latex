init:
	sudo rm -r .git

comp-%: # make comp-test と入力することで、test下のmain.texを元にpdfが生成される
	cd ${@:comp-%=%} && latexmk -C ./main.tex && latexmk main.tex && latexmk -c main.tex

new-%:
	cp -r base/ ${@:new-%=%}/

lint-%:
	cd lint && for file in $$(find ../${@:lint-%=%} -name "*.tex"); do \
		pwd && npx textlint $$file --rules-base-directory ../;\
	done

test:
	for file in $$(find ./hci2023 -name "*.tex"); do \
    	cd $$(find ./hci2023 -name "*.tex") && echo $$file   # ここで任意の処理を行う。この例ではファイル名を表示している\
	done
