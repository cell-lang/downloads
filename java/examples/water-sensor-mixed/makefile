test-water-sensor.jar: water-sensor.cell main.java
	mkdir -p tmp
	rm -rf tmp/net/ tmp/gen/
	mkdir tmp/gen/
	java -jar ../../bin/cellc-java.jar project.txt tmp/gen/
	javac -g -d tmp/ tmp/gen/*.java main.java
	jar cfe test-water-sensor.jar Test  -C tmp .
	@echo
	@echo '********************************************************************************'
	@echo '********************************************************************************'
	@echo
	@echo 'To run the program now type:'
	@echo '  java -jar test-water-sensor.jar'
	@echo ''

clean:
	rm -rf tmp/ test-water-sensor.jar
