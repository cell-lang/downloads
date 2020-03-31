all:
	make -s clean
	make --no-print-directory run-java-tests
	make -s clean
	make --no-print-directory run-csharp-tests
	make -s clean

clean:
	rm -rf tmp/ windows/ windows.zip
	make -s -C java/examples/send-msgs/ clean
	make -s -C java/examples/send-msgs-mixed/ clean
	make -s -C java/examples/water-sensor/ clean
	make -s -C java/examples/water-sensor-mixed/ clean
	make -s -C csharp/examples/send-msgs/ clean
	make -s -C csharp/examples/send-msgs-mixed/ clean
	make -s -C csharp/examples/water-sensor/ clean
	make -s -C csharp/examples/water-sensor-mixed/ clean

windows.zip:
	rm -rf windows/
	mkdir windows/
	cd windows/ && mkdir examples/ stdlib/ sublime-text/
	cd windows/examples/ && mkdir send-msgs/ send-msgs-mixed/ water-sensor/ water-sensor-mixed/
	cp csharp/examples/README.txt windows/examples/
	unix2dos windows/examples/README.txt
	cp csharp/examples/send-msgs/main.cell windows/examples/send-msgs/
	cp csharp/examples/send-msgs/*.txt windows/examples/send-msgs/
	unix2dos windows/examples/send-msgs/*
	cp csharp/examples/send-msgs-mixed/logins.cell windows/examples/send-msgs-mixed/
	cp csharp/examples/send-msgs-mixed/main.cs windows/examples/send-msgs-mixed/
	cp csharp/examples/send-msgs-mixed/*.txt windows/examples/send-msgs-mixed/
	unix2dos windows/examples/send-msgs-mixed/*
	cp csharp/examples/water-sensor/main.cell windows/examples/water-sensor/
	cp csharp/examples/water-sensor/project.txt windows/examples/water-sensor/
	unix2dos windows/examples/water-sensor/*
	cp csharp/examples/water-sensor-mixed/water-sensor.cell windows/examples/water-sensor-mixed/
	cp csharp/examples/water-sensor-mixed/main.cs windows/examples/water-sensor-mixed/
	cp csharp/examples/water-sensor-mixed/project.txt windows/examples/water-sensor-mixed/
	unix2dos windows/examples/water-sensor-mixed/*
	cp csharp/stdlib/* windows/stdlib/
	unix2dos windows/stdlib/*
	cp csharp/sublime-text/* windows/sublime-text/
	unix2dos windows/sublime-text/*
	cd windows/ && zip -r ../windows.zip *

################################################################################

run-java-tests:
	make --no-print-directory run-send-msgs-java-tests
	@echo ; echo
	make --no-print-directory run-send-msgs-mixed-java-tests
	@echo ; echo
	make --no-print-directory run-water-sensor-java-tests
	@echo ; echo
	make --no-print-directory run-water-sensor-mixed-java-tests
	@echo ; echo

run-send-msgs-java-tests:
	@rm -rf tmp/ ; mkdir tmp/
	make -s -C java/examples/send-msgs/ clean
	make -s -C java/examples/send-msgs/
	java -jar java/examples/send-msgs/send-msgs.jar java/examples/send-msgs/init-state.txt java/examples/send-msgs/msg-list.txt tmp/final-state.txt
	cmp tmp/final-state.txt misc/send-msgs/final-state.txt

run-send-msgs-mixed-java-tests:
	@rm -rf tmp/ ; mkdir tmp/
	make -s -C java/examples/send-msgs-mixed/ clean
	make -s -C java/examples/send-msgs-mixed/
	java -jar java/examples/send-msgs-mixed/send-msgs.jar java/examples/send-msgs-mixed/init-state.txt java/examples/send-msgs-mixed/msg-list.txt tmp/final-state.txt > tmp/output.txt
	cmp tmp/final-state.txt misc/send-msgs-mixed/final-state.txt
	cmp tmp/output.txt misc/send-msgs-mixed/output.txt

run-water-sensor-java-tests:
	@rm -rf tmp/ ; mkdir tmp/
	make -s -C java/examples/water-sensor/ clean
	make -s -C java/examples/water-sensor/
	java -jar java/examples/water-sensor/test-water-sensor.jar > tmp/output.txt
	cmp tmp/output.txt misc/water-sensor/output.txt

run-water-sensor-mixed-java-tests:
	@rm -rf tmp/ ; mkdir tmp/
	make -s -C java/examples/water-sensor-mixed/ clean
	make -s -C java/examples/water-sensor-mixed/
	java -jar java/examples/water-sensor-mixed/test-water-sensor.jar > tmp/output.txt
	cmp tmp/output.txt misc/water-sensor-mixed/output.txt

################################################################################

run-csharp-tests:
	make --no-print-directory run-send-msgs-csharp-tests
	@echo ; echo
	make --no-print-directory run-send-msgs-mixed-csharp-tests
	@echo ; echo
	make --no-print-directory run-water-sensor-csharp-tests
	@echo ; echo
	make --no-print-directory run-water-sensor-mixed-csharp-tests
	@echo ; echo

run-send-msgs-csharp-tests:
	@rm -rf tmp/ ; mkdir tmp/
	make -s -C csharp/examples/send-msgs/ clean
	make -s -C csharp/examples/send-msgs/
	dotnet run --project csharp/examples/send-msgs/tmp/ csharp/examples/send-msgs/init-state.txt csharp/examples/send-msgs/msg-list.txt tmp/final-state.txt
	cmp tmp/final-state.txt misc/send-msgs/final-state.txt

run-send-msgs-mixed-csharp-tests:
	@rm -rf tmp/ ; mkdir tmp/
	make -s -C csharp/examples/send-msgs-mixed/ clean
	make -s -C csharp/examples/send-msgs-mixed/
	dotnet run --project csharp/examples/send-msgs-mixed/tmp/ csharp/examples/send-msgs-mixed/init-state.txt csharp/examples/send-msgs-mixed/msg-list.txt tmp/final-state.txt > tmp/output.txt
	cmp tmp/final-state.txt misc/send-msgs-mixed/final-state.txt
	cmp tmp/output.txt misc/send-msgs-mixed/output.txt

run-water-sensor-csharp-tests:
	@rm -rf tmp/ ; mkdir tmp/
	make -s -C csharp/examples/water-sensor/ clean
	make -s -C csharp/examples/water-sensor/
	dotnet run --project csharp/examples/water-sensor/tmp/ > tmp/output.txt
	cmp tmp/output.txt misc/water-sensor/output.txt

run-water-sensor-mixed-csharp-tests:
	@rm -rf tmp/ ; mkdir tmp/
	make -s -C csharp/examples/water-sensor-mixed/ clean
	make -s -C csharp/examples/water-sensor-mixed/
	dotnet run --project csharp/examples/water-sensor-mixed/tmp/ > tmp/output.txt
	cmp tmp/output.txt misc/water-sensor-mixed/output.txt
