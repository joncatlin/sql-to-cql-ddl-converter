package sqlparser;

import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.IOException;
import java.util.ArrayList;
import sqlparser.CQLDataType.DataTypeNotFound;

public class ConvertToCQLListener extends SQLiteBaseListener {

	private boolean inCreateTable = false;
	private boolean inColumnDef = false;
	private boolean foundPrimaryKey = false;
	private BufferedWriter bw = null;
	private ArrayList<String> columnNames = null;

	
	public ConvertToCQLListener(String cqlOutFile) throws IOException {
		
		// Create the BufferedWriter to write out the CQL statements to
		bw = new BufferedWriter(new FileWriter(cqlOutFile));
	}

	
	@Override
	public void exitParse(SQLiteParser.ParseContext ctx) {
		// Finished processing the file so close the output file
		try {
			// Close any open create table statement before closing the file
			if (inCreateTable) bw.write(")");
			bw.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	
	@Override
	public void enterCreate_table_stmt(SQLiteParser.Create_table_stmtContext ctx) {
//		System.out.println("enterCreate_table_name getText();=" + ctx.table_name().getText());
		inCreateTable = true;
		
		// Create a place to store the column names in the table as it may be needed for the
		// PRIMARY KEY clause
		columnNames = new ArrayList<String>();
		
		// Output the CQL syntax for the CREATE TABLE
		try {
			bw.write("CREATE TABLE " + 
				ctx.table_name().getText() + " ( \n");
		} catch (IOException e) {
			e.printStackTrace();
			try {bw.close();} catch (IOException e1) {/* IGNORE */}
			System.exit(-1);
		}
		/*
		CREATE TABLE [IF NOT EXISTS] [keyspace_name.]table_name ( 
				   column_definition [, ...]
				   PRIMARY KEY (column_name [, column_name ...])
		 */
	}

	
	@Override
	public void exitCreate_table_stmt(SQLiteParser.Create_table_stmtContext ctx) {
//		System.out.println("exitCreate_table_name getText();=" + ctx.getText());
		inCreateTable = false;
		inColumnDef = false;

		try {
			
			// Check to see if a PRIMARY KEY clause was found and if not create one from one of the columns
			// in the table
			if (!foundPrimaryKey) {
				// Place a comma at the end of the previous line
				bw.write(",\n");
				
				boolean foundColumnEndingInID = false;
				
				// Look for a column ending in ID
				for (String columnName : columnNames) {
					if (columnName.endsWith("ID")) {
						bw.write("    PRIMARY KEY (" + columnName + ")");
						foundColumnEndingInID = true;
						break;
					}
				}
				
				// If no column ending in ID was found pick the first column and make it a
				// PRIMARY KEY
				if (!foundColumnEndingInID) {
					bw.write("    PRIMARY KEY (" + columnNames.get(0) + ")");
				}
			}
			
			// Write out the closing table syntax
			bw.write(");\n\n\n");
			bw.flush();
		} catch (IOException e) {
			e.printStackTrace();
			System.exit(-1);
		}
		
		// Reset the found PRIMARY KEY flag as we should have fiished processing this table
		foundPrimaryKey = false;
	}

	
	@Override
	public void exitColumn_def(SQLiteParser.Column_defContext ctx) {

		boolean isMultivalueColumn = false;
		
		// Only process these types of statements when certain flags are set
		if (!inCreateTable) return;
		
		// Check to see if the column is a PRIMARY KEY
		if (ctx.column_name().any_name().getText().equals("CONSTRAINT") &&
			ctx.type_name().name().get(1).any_name().getText().equals("PRIMARY")) {
			try {
				foundPrimaryKey = true;
				if (inColumnDef) bw.write(",\n");
				bw.write("    PRIMARY KEY " + ctx.type_name().name().get(3).any_name().getText());
			} catch (IOException e) {
				e.printStackTrace();
				System.exit(-1);
			}
		} else {
			// Write out the column definition
			try {
				// Determine if the column is a multi value one and if it is create
				// the correct Cassandra data type
				String columnName = ctx.column_name().any_name().getText();
				if (columnName.contains("(mv)")) {
					isMultivalueColumn = true;
					columnName = columnName.replace("(mv)", "_mv");
				}

				// Add the column name to the list of names for this table as we may
				// need it to add a primary key later in the processing
				columnNames.add(columnName);
				
				// Write out the CQL clause
				if (inColumnDef) bw.write(",\n");
				if (isMultivalueColumn) {
					bw.write("    " + columnName + " list<" +
							CQLDataType.getCQLDataType (ctx.type_name().name().get(0).any_name().getText().toLowerCase()) +
							">");
				} else {
					bw.write("    " + columnName + " " +
						CQLDataType.getCQLDataType (ctx.type_name().name().get(0).any_name().getText().toLowerCase()));
				}
			} catch (IOException e) {
				e.printStackTrace();
				System.exit(-1);
			} catch (DataTypeNotFound e) {
				System.out.println(e.getMessage());
				System.out.println("At column_name: " + ctx.column_name().any_name().getText());
				System.exit(-1);
			}
		}

		// Set the flag to denote that we have processed a column definition
		// so that we can keep track of the need to output a comma between statements
		inColumnDef = true;
	}
}
