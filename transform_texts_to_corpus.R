# If not installed already, you need the install the readtext R package

if (!require("readtext")) {
  install.packages("readtext")
  library("readtext")
}

# Load all text files from the folder "raw_texts". 
# Please copy the texts into one or more folders.

# In this example, the folder contains three UK manifestos.
# Simply changes these files with your text files.

# The script supports several file formats, amongst others 
# txt, PDF, docx, doc (Word files).
# If you have a csv, xlslx, dta or sav file, you can upload it 
# directly to the TADA GUI.

# You can either take the document level variables from the filenames
# or you provide a separate csv file.

# Here we use the filenames and determine "_" as the delimiter
# https://github.com/kbenoit/readtext/blob/master/vignettes/readtext_vignette.Rmd

# You can also specify the names of the document-level variables

custom_docvarnames <- c("Country", "Year", "Party")

texts <- readtext::readtext("raw_data/*", 
                            docvarsfrom = "filenames",
                            dvsep = "_",
                            docvarnames = custom_docvarnames)

texts_data_frame <- as.data.frame(texts)

head(texts)

# To use the file in the TADA GUI, we save it as a Rds file. 
# Please load this file in the app.

write.csv(texts_data_frame, file = "output/my_texts.csv",
          fileEncoding = "utf-8", row.names = FALSE)
