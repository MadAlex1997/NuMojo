import math
import . _math_funcs as _mf
from tensor import Tensor
from .arithmetic import sqrt, fma

"""
implements trigonometry functions
"""
# ===------------------------------------------------------------------------===#
# Inverse Trig
# ===------------------------------------------------------------------------===#


fn acos[dtype: DType, backend:_mf.Backend = _mf.Vectorized](tensor: Tensor[dtype]) -> Tensor[dtype]:
    """
    Apply acos also known as inverse cosine .

    Parameters:
        dtype: The element type.
        backend: Sets utility function origin, defualts to `Vectorized.

    Args:
        tensor: A tensor.

    Returns:
        The elementwise acos of `tensor` in radians.
    """
    return backend()._math_func_1_tensor_in_one_tensor_out[dtype, math.acos](tensor)


fn asin[dtype: DType, backend:_mf.Backend = _mf.Vectorized](tensor: Tensor[dtype]) -> Tensor[dtype]:
    """
    Apply asin also known as inverse sine .

    Parameters:
        dtype: The element type.
        backend: Sets utility function origin, defualts to `Vectorized.

    Args:
        tensor: A tensor.

    Returns:
        The elementwise asin of `tensor` in radians.
    """
    return backend()._math_func_1_tensor_in_one_tensor_out[dtype, math.asin](tensor)


fn atan[dtype: DType, backend:_mf.Backend = _mf.Vectorized](tensor: Tensor[dtype]) -> Tensor[dtype]:
    """
    Apply atan also known as inverse tangent .

    Parameters:
        dtype: The element type.
        backend: Sets utility function origin, defualts to `Vectorized.

    Args:
        tensor: A tensor.

    Returns:
        The elementwise atan of `tensor` in radians.
    """
    return backend()._math_func_1_tensor_in_one_tensor_out[dtype, math.atan](tensor)


fn atan2[
    dtype: DType,
    backend:_mf.Backend = _mf.Vectorized
](tensor1: Tensor[dtype], tensor2: Tensor[dtype]) raises -> Tensor[dtype]:
    """
    Apply atan2 also known as inverse tangent.
    [atan2 wikipedia](https://en.wikipedia.org/wiki/Atan2).

    Constraints:
        Both tensors must have the same shapes.

    Parameters:
        dtype: The element type.
        backend: Sets utility function origin, defualts to `Vectorized.

    Args:
        tensor1: A tensor.
        tensor2: A tensor.

    Returns:
        The elementwise atan2 of `tensor1` and`tensor2` in radians.
    """
    return backend()._math_func_2_tensor_in_one_tensor_out[dtype, math.atan2](
        tensor1, tensor2
    )


# ===------------------------------------------------------------------------===#
# Trig
# ===------------------------------------------------------------------------===#


fn cos[dtype: DType, backend:_mf.Backend = _mf.Vectorized](tensor: Tensor[dtype]) -> Tensor[dtype]:
    """
    Apply cos also known as cosine.

    Parameters:
        dtype: The element type.
        backend: Sets utility function origin, defualts to `Vectorized.

    Args:
        tensor: A tensor assumed to be in radian.

    Returns:
        The elementwise cos of `tensor`.
    """
    return backend()._math_func_1_tensor_in_one_tensor_out[dtype, math.cos](tensor)


fn sin[dtype: DType, backend:_mf.Backend = _mf.Vectorized](tensor: Tensor[dtype]) -> Tensor[dtype]:
    """
    Apply sin also known as sine .

    Parameters:
        dtype: The element type.
        backend: Sets utility function origin, defualts to `Vectorized.

    Args:
        tensor: A tensor assumed to be in radian.

    Returns:
        The elementwise sin of `tensor`.
    """
    return backend()._math_func_1_tensor_in_one_tensor_out[dtype, math.sin](tensor)


fn tan[dtype: DType, backend:_mf.Backend = _mf.Vectorized](tensor: Tensor[dtype]) -> Tensor[dtype]:
    """
    Apply tan also known as tangent .

    Parameters:
        dtype: The element type.
        backend: Sets utility function origin, defualts to `Vectorized.

    Args:
        tensor: A tensor assumed to be in radian.

    Returns:
        The elementwise tan of `tensor`.
    """
    return backend()._math_func_1_tensor_in_one_tensor_out[dtype, math.tan](tensor)


fn hypot[
    dtype: DType,
    backend:_mf.Backend = _mf.Vectorized
](tensor1: Tensor[dtype], tensor2: Tensor[dtype]) raises -> Tensor[dtype]:
    """
    Apply hypot also known as hypotenuse which finds the longest section of a right triangle
    given the other two sides.

    Constraints:
        Both tensors must have the same shapes.

    Parameters:
        dtype: The element type.
        backend: Sets utility function origin, defualts to `Vectorized.

    Args:
        tensor1: A tensor.
        tensor2: A tensor.

    Returns:
        The elementwise hypotenuse of `tensor1` and`tensor2`.
    """
    return backend()._math_func_2_tensor_in_one_tensor_out[dtype, math.hypot](
        tensor1, tensor2
    )

fn hypot_fma[
    dtype: DType,
    backend:_mf.Backend = _mf.Vectorized
](tensor1: Tensor[dtype], tensor2: Tensor[dtype]) raises -> Tensor[dtype]:
    """
    Apply hypot also known as hypotenuse which finds the longest section of a right triangle
    given the other two sides.

    Constraints:
        Both tensors must have the same shapes.

    Parameters:
        dtype: The element type.
        backend: Sets utility function origin, defualts to `Vectorized.

    Args:
        tensor1: A tensor.
        tensor2: A tensor.

    Returns:
        The elementwise hypotenuse of `tensor1` and`tensor2`.
    """
    
    
    var tensor2_squared =fma[dtype,backend=backend](tensor2,tensor2,SIMD[dtype,1](0))
    return sqrt[dtype,backend=backend](fma[dtype,backend=backend](tensor1,tensor1,tensor2_squared))
    
# ===------------------------------------------------------------------------===#
# Inverse Hyperbolic Trig
# ===------------------------------------------------------------------------===#


fn acosh[dtype: DType, backend:_mf.Backend = _mf.Vectorized](tensor: Tensor[dtype]) -> Tensor[dtype]:
    """
    Apply acosh also known as inverse hyperbolic cosine .

    Parameters:
        dtype: The element type.
        backend: Sets utility function origin, defualts to `Vectorized.

    Args:
        tensor: A tensor.

    Returns:
        The elementwise acosh of `tensor` in radians.
    """
    return backend()._math_func_1_tensor_in_one_tensor_out[dtype, math.acosh](tensor)


fn asinh[dtype: DType, backend:_mf.Backend = _mf.Vectorized](tensor: Tensor[dtype]) -> Tensor[dtype]:
    """
    Apply asinh also known as inverse hyperbolic sine .

    Parameters:
        dtype: The element type.
        backend: Sets utility function origin, defualts to `Vectorized.

    Args:
        tensor: A tensor.

    Returns:
        The elementwise asinh of `tensor` in radians.
    """
    return backend()._math_func_1_tensor_in_one_tensor_out[dtype, math.asinh](tensor)


fn atanh[dtype: DType, backend:_mf.Backend = _mf.Vectorized](tensor: Tensor[dtype]) -> Tensor[dtype]:
    """
    Apply atanh also known as inverse hyperbolic tangent .

    Parameters:
        dtype: The element type.
        backend: Sets utility function origin, defualts to `Vectorized.

    Args:
        tensor: A tensor.

    Returns:
        The elementwise atanh of `tensor` in radians.
    """
    return backend()._math_func_1_tensor_in_one_tensor_out[dtype, math.atanh](tensor)


# ===------------------------------------------------------------------------===#
# Hyperbolic Trig
# ===------------------------------------------------------------------------===#


fn cosh[dtype: DType, backend:_mf.Backend = _mf.Vectorized](tensor: Tensor[dtype]) -> Tensor[dtype]:
    """
    Apply cosh also known as hyperbolic cosine .

    Parameters:
        dtype: The element type.
        backend: Sets utility function origin, defualts to `Vectorized.

    Args:
        tensor: A tensor assumed to be in radian.

    Returns:
        The elementwise cosh of `tensor`.
    """
    return backend()._math_func_1_tensor_in_one_tensor_out[dtype, math.cosh](tensor)


fn sinh[dtype: DType, backend:_mf.Backend = _mf.Vectorized](tensor: Tensor[dtype]) -> Tensor[dtype]:
    """
    Apply sin also known as hyperbolic sine .

    Parameters:
        dtype: The element type.
        backend: Sets utility function origin, defualts to `Vectorized.

    Args:
        tensor: A tensor assumed to be in radian.

    Returns:
        The elementwise sinh of `tensor`.
    """
    return backend()._math_func_1_tensor_in_one_tensor_out[dtype, math.sinh](tensor)


fn tanh[dtype: DType, backend:_mf.Backend = _mf.Vectorized](tensor: Tensor[dtype]) -> Tensor[dtype]:
    """
    Apply tan also known as hyperbolic tangent .

    Parameters:
        dtype: The element type.
        backend: Sets utility function origin, defualts to `Vectorized.

    Args:
        tensor: A tensor assumed to be in radian.

    Returns:
        The elementwise tanh of `tensor`.
    """
    return backend()._math_func_1_tensor_in_one_tensor_out[dtype, math.tanh](tensor)
