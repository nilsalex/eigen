import Eigen.SparseMatrix

a :: Maybe (SparseMatrixXd 3 3)
a = fromList [(0,2,1),(1,0,1),(1,2,2),(2,1,-3)]

b :: Maybe (SparseMatrixXd 1 3)
b = fromDenseList [[1,2,3]]

main :: IO ()
main = do
  putStrLn "Here is the matrix A:" >> print a
  putStrLn "Here is the matrix B:" >> print b
  putStrLn "Here is the transpose of matrix A:" >> print (transpose <$> a)
  putStrLn "Here is the norm of matrix A:" >> print (norm <$> a)
  putStrLn "Here is the nonZeros of matrix A:" >> print (nonZeros <$> a)
  putStrLn "Here is the A * transpose B:" >> print (mul <$> a <*> (transpose <$> b))
  putStrLn "Here is the pruned matrix A with a huge reference" >> print (pruned 1e20 <$> a)

--  print $ values a'
--  print $ innerIndices a'
--  print $ outerStarts a'
--  print $ innerNNZs a'

