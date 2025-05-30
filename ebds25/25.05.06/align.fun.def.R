compute_pairwise_global_alignment <- function(____,____,submat = NULL, gap_open_penalty = -10){
  aln <- ____( ____ , ____  ,sub_mat = submat, gap_open_penalty = gap_open_penalty) # call global alignment function defined in helpers.R
  aln_data <- ____(aln$T, x, y) # call traceback function defined in helpers.R
  ____(aln_data)
}

needleman_wunsch <- function(x,y, gap_open_penalty = -10, sub_mat = load_subsitution_matrix()){
  
  m <- ____(____) + ____
  n <- ____(____) + ____
  
  D <- matrix(nc = n, nr = m,data = 0)
  D[,1] <- 0:(m-1) * ____
  D[1,] <- 0:(n-1) * ____
  
  Tm <- matrix(nc = n, nr = m) # traceback matrix

  Tm[1,] <- "right"
  Tm[,1] <- "down"
  Tm[1,1] <- "stop"
  
  for(i in 2:m){
    for(j in 2:n){
      x_i <- ____[____]
      y_j <- ____[____]
      
      arg1 <- D[____, ____] + ____ 
      arg2 <- D[____, ____] + ____
      arg3 <- D[____, ____] + ____[____, ____]
      
      
      arg_vec <- c(____, ____, ____) # combine
      
      D[i,j] <- ____(____)
      
      if(D[i,j] == ____){
        Tm[i,j] <- ____
      }else if(D[i,j] == ____){
        Tm[i,j] <- ____
      }else if(D[i,j] == ____){
        Tm[i,j] <- ____
      }
        
    }
  }
  
  score <- D[____, ____]
  
  aln_data <- list()
  aln_data[["D"]] <- D
  aln_data[["T"]] <- Tm
  aln_data[["score"]] <- score 
  
  return(aln_data)
}


run_traceback <- function(Tm, x, y, i_start = nrow(Tm), j_start = ncol(Tm)){
  
  i <- i_start
  j <- j_start
  
  t <- Tm[i,j]
  
  x_ali <- character()
  y_ali <- character()
  
  while(t != "stop"){
    
    if(t == "diag"){
      
      x_ali <- append(x_ali, x[i-1])
      y_ali <- append(y_ali, y[j-1])
      
      i <- i - 1
      j <- j - 1
      
      
    }else if(t == "right"){
      x_ali <- append(x_ali, "-")
      y_ali <- append(y_ali, y[j-1])
      
      j <- j -1
      
    }else if(t == "down"){
      x_ali <- append(x_ali, x[i-1])
      y_ali <- append(y_ali, "-")
      i <- i - 1
    }
    t <- Tm[i,j] 
  }
  
  x_ali <- rev(x_ali)
  y_ali <- rev(y_ali)
  
  aligned_sequences <- list()
  aligned_sequences[["x_ali"]] <- x_ali
  aligned_sequences[["y_ali"]] <- y_ali
  return(aligned_sequences)
}

write_alignment_to_file <- function(alignment_data, filename){
  x_a <- alignment_data$x_ali
  y_a <- alignment_data$y_ali
  
  x_s <- paste0(x_a,collapse = "")
  y_s <- paste0(y_a,collapse = "")
  
  writeLines(c(x_s,y_s),filename)
}
