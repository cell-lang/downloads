send-msgs.jar: main.cell
	mkdir -p tmp
	rm -rf tmp/net/ tmp/gen/
	mkdir tmp/gen/
	java -jar ../../bin/cellc-java.jar project.txt tmp/gen/
	javac -d tmp/ tmp/gen/*.java
	jar cfe send-msgs.jar net.cell_lang.Generated -C tmp net/

clean:
	@rm -rf tmp/ send-msgs.jar
