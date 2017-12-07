package sqlparser;

import java.io.File;
import java.io.FilenameFilter;
import java.io.IOException;
import java.util.Arrays;

import org.antlr.v4.runtime.CharStream;
import org.antlr.v4.runtime.CharStreams;
import org.antlr.v4.runtime.CommonTokenStream;
import org.antlr.v4.runtime.tree.ParseTree;
import org.antlr.v4.runtime.tree.ParseTreeWalker;

import org.apache.commons.lang3.text.WordUtils;
import org.apache.commons.io.FilenameUtils;

public class ConvertToCQL {

	private int filesProcessed = 0;

	// Class to filter files that end in .sql
	private static class SqlFilter implements FilenameFilter {
		
		public boolean accept(File directory, String fileName) {
			if (fileName.endsWith(".sql")) {
	            return true;
	        }
	        return false;
		}
	}
	
	
	public static void main(String[] args) {
		ConvertToCQL convert = new ConvertToCQL();

		try {
			File folder = new File("J:\\Development\\EclipseWorkspace\\sqlparser\\src\\main\\resources");
			File[] listOfFiles = folder.listFiles(new SqlFilter());
			for (File fileToProcess : listOfFiles) {
				convert.convertFile(fileToProcess.getCanonicalPath());
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
	// Take a file containing sql DDL statements and convert them to cql DDL statements
	public void convertFile(String fileName) throws IOException {
		System.out.println("Converting file: " + fileName);
		CharStream stream = CharStreams.fromFileName(fileName);

		// Create a lexer for the language we are converting from
		SQLiteLexer lexer = new SQLiteLexer(stream);

		// Create a buffer of tokens pulled from the lexer
		CommonTokenStream tokens = new CommonTokenStream(lexer);
		
		// Create a parser that feeds off the tokens buffer
		SQLiteParser parser = new SQLiteParser(tokens);
		ParseTree tree = parser.parse();
		
		// Display the tree for the file we are converting, in case the conversion dows not work
		String treeString = tree.toStringTree(parser);
		String prettyPrint = WordUtils.wrap(treeString, 132);
		System.out.println("Parse tree for " + fileName);
		System.out.println(prettyPrint+"\n\n");
		
		// Create the output file name the same as the input but with .cql on the end
		String outputFileName = FilenameUtils.removeExtension(fileName) + ".cql";

		// Create a generic parse tree walker that can trigger callbacks
		ParseTreeWalker walker = new ParseTreeWalker();
		walker.walk(new ConvertToCQLListener(outputFileName), tree);
		
	}
}
