create_char_vector_from_str <- function(input_str){
  splitted <- unlist(strsplit(input_str,split = ""))
}

read_fasta <- function(file_path) {
  # Read the FASTA file
  lines <- readLines(file_path)
  
  # Initialize variables
  sequences <- list()
  current_header <- NULL
  current_seq <- ""
  
  for (line in lines) {
    if (startsWith(line, ">")) {
      # If we encounter a new header, store the previous sequence
      if (!is.null(current_header)) {
        sequences[[current_header]] <- current_seq
      }
      # Reset for new sequence
      current_header <- substring(line, 2)  # remove '>'
      current_seq <- ""
    } else {
      current_seq <- paste0(current_seq, line)
    }
  }
  # Store the last sequence
  if (!is.null(current_header)) {
    sequences[[current_header]] <- current_seq
  }
  
  return(sequences)
}
