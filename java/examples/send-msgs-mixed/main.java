import java.util.List;
import java.io.IOException;
import java.io.Reader;
import java.io.Writer;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.PrintWriter;
import java.nio.file.Paths;
import java.nio.file.Files;
import java.nio.charset.Charset;

import net.cell_lang.Logins;
import net.cell_lang.Long_String;


class Main {
  public static void main(String[] args) throws IOException {
    if (args.length != 3) {
      System.err.println("Usage: java -jar send-msgs.jar <initial state> <message list> <final state>");
      return;
    }

    // Reading the message list, with one message per line
    // Do not split a single message over multiple lines
    List<String> msgList = Files.readAllLines(Paths.get(args[1]), Charset.defaultCharset());

    // Creating the automaton
    Logins logins = new Logins();

    // Loading the initial state
    try (FileReader reader = new FileReader(args[0])) {
      logins.load(reader);
    }

    // Printing the initial state
    logins.save(new PrintWriter(System.out));
    System.out.println();

    // Sending the messages and printing the results
    for (String line : msgList) {
      String msg = line.trim();
      // Skipping lines that are empty or commented out
      if (!msg.equals("") && !msg.startsWith("//")) {
        try {
          logins.execute(msg);
          System.out.printf("Success: %s\n", msg);
        }
        catch (RuntimeException e) {
          System.out.printf("Failure: %s\n", msg);
        }
        // Printing the state after the update
        logins.save(new PrintWriter(System.out));
        System.out.println();
      }
    }

    // Saving the final state to the indicated file
    try (Writer writer = new FileWriter(args[2])) {
      logins.save(writer);
      writer.write("\n");
    }
  }
}
