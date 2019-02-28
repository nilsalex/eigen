#ifndef EIGEN_MISC_PIVOTS_H
#define EIGEN_MISC_PIVOTS_H

namespace Eigen { 

namespace internal {

/** \class pivots_retval_base
  *
  */
template<typename DecompositionType>
struct traits<pivots_retval_base<DecompositionType> >
{
  typedef typename DecompositionType::MatrixType MatrixType;
  typedef Matrix<
    Index,
    1,
    Dynamic,                       // we don't know at compile time the dimension of the image (the rank)
    0,
    1,
    MatrixType::MaxColsAtCompileTime  // so it has the same number of rows and at most as many columns.
  > ReturnType;
};

template<typename _DecompositionType> struct pivots_retval_base
 : public ReturnByValue<pivots_retval_base<_DecompositionType> >
{
  typedef _DecompositionType DecompositionType;
  typedef typename DecompositionType::MatrixType MatrixType;
  typedef ReturnByValue<pivots_retval_base> Base;

  pivots_retval_base(const DecompositionType& dec, const MatrixType& originalMatrix)
    : m_dec(dec), m_rank(dec.rank()),
      m_cols(m_rank),
      m_originalMatrix(originalMatrix)
  {}

  inline Index rows() const { return 1; }
  inline Index cols() const { return m_cols; }
  inline Index rank() const { return m_rank; }
  inline const DecompositionType& dec() const { return m_dec; }
  inline const MatrixType& originalMatrix() const { return m_originalMatrix; }

  template<typename Dest> inline void evalTo(Dest& dst) const
  {
    static_cast<const pivots_retval<DecompositionType>*>(this)->evalTo(dst);
  }

  protected:
    const DecompositionType& m_dec;
    Index m_rank, m_cols;
    const MatrixType& m_originalMatrix;
};

} // end namespace internal

#define EIGEN_MAKE_PIVOTS_HELPERS(DecompositionType) \
  typedef typename DecompositionType::MatrixType MatrixType; \
  typedef typename MatrixType::Scalar Scalar; \
  typedef typename MatrixType::RealScalar RealScalar; \
  typedef Eigen::internal::pivots_retval_base<DecompositionType> Base; \
  using Base::dec; \
  using Base::originalMatrix; \
  using Base::rank; \
  using Base::rows; \
  using Base::cols; \
  pivots_retval(const DecompositionType& dec, const MatrixType& originalMatrix) \
    : Base(dec, originalMatrix) {}

} // end namespace Eigen

#endif // EIGEN_MISC_PIVOTS_H
