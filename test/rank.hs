import Data.Eigen.Matrix
import Data.Eigen.LA

main = do
    let a = fromList [[1,2,5],[2,1,4],[3,0,3]] :: MatrixXf
    putStrLn "Here is the matrix A:"
    print a

    putStrLn "The rank of A is:"
    print $ rank FullPivLU a

    putStrLn "Here is a matrix whose columns form a basis of the null-space of A:"
    print $ kernel FullPivLU a

    putStrLn "Here is a matrix whose columns form a basis of the column-space of A:"
    print $ image FullPivLU a

    putStrLn "Here is a list of the pivot positions in A:"
    print $ pivots FullPivLU a

    let b = fromList [[0,0,0],[0,0,0],[0,0,0]] :: MatrixXf
    putStrLn "Here is the matrix B:"
    print b

    putStrLn "The rank of B is:"
    print $ rank FullPivLU b

    putStrLn "Here is a matrix whose columns form a basis of the column-space of B:"
    print $ image FullPivLU b

    putStrLn "Here is a list of the pivot positions in B:"
    print $ pivots FullPivLU b

    let c = fromList [[0,0,0,0,0,1],[0,0,0,0,1,0],[0,0,0,1,0,0],[0,0,1,0,0,0],[0,1,0,0,0,0],[1,0,0,0,0,0]] :: MatrixXf
    putStrLn "Here is the matrix C:"
    print a

    putStrLn "Here is a list of the pivot positions in C:"
    print $ pivots FullPivLU c
