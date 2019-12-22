send-msgs.jar: main.java logins.cell
	rm -rf tmp/
	mkdir tmp/
	mkdir tmp/gen/ tmp/cls/
	java -jar ../../bin/cellc-java.jar -g project.txt tmp/gen/
	javac -d tmp/cls/ main.java tmp/gen/*.java
	jar cfe send-msgs.jar Main -C tmp/cls/ .

clean:
	rm -rf tmp/ send-msgs.jar
