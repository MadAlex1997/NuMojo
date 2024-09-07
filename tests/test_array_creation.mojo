import numojo as nm
from time import now
from python import Python, PythonObject
from utils_for_test import check, check_is_close
from testing.testing import assert_raises


def test_list_creation_methods():
    var np = Python.import_module("numpy")
    check(
        nm.NDArray(5, 5, 5, fill=5),
        np.zeros([5, 5, 5], dtype=np.float64) + 5,
        "*shape broken",
    )
    check(
        nm.NDArray(List[Int](5, 5, 5), fill=5),
        np.zeros([5, 5, 5], dtype=np.float64) + 5,
        "List[int] shape broken",
    )
    check(
        nm.NDArray(VariadicList[Int](5, 5, 5), fill=5),
        np.zeros([5, 5, 5], dtype=np.float64) + 5,
        "VariadicList[Int] shape broken",
    )
    check(
        nm.NDArray(nm.NDArrayShape(5, 5, 5), fill=5),
        np.zeros([5, 5, 5], dtype=np.float64) + 5,
        "NDArrayShape shape broken",
    )
    with assert_raises(
        contains="Error if random is true you cannot set a fill value"
    ):
        _ = nm.NDArray(nm.NDArrayShape(5, 5, 5), fill=5, random=True)


def test_arange():
    var np = Python.import_module("numpy")
    check(
        nm.arange[nm.i64](0, 100),
        np.arange(0, 100, dtype=np.int64),
        "Arange is broken",
    )
    check(
        nm.arange[nm.f64](0, 100),
        np.arange(0, 100, dtype=np.float64),
        "Arange is broken",
    )


def test_linspace():
    var np = Python.import_module("numpy")
    check(
        nm.linspace[nm.f64](0, 100),
        np.linspace(0, 100, dtype=np.float64),
        "Linspace is broken",
    )


def test_logspace():
    var np = Python.import_module("numpy")
    check_is_close(
        nm.logspace[nm.f64](0, 100, 5),
        np.logspace(0, 100, 5, dtype=np.float64),
        "Logspace is broken",
    )


def test_geomspace():
    var np = Python.import_module("numpy")
    check_is_close(
        nm.geomspace[nm.f64](1, 100, 5),
        np.geomspace(1, 100, 5, dtype=np.float64),
        "Logspace is broken",
    )


def test_zeros():
    var np = Python.import_module("numpy")
    check(
        nm.zeros[nm.f64](10, 10, 10, 10),
        np.zeros((10, 10, 10, 10), dtype=np.float64),
        "Zeros is broken",
    )


def test_ones():
    var np = Python.import_module("numpy")
    check(
        nm.ones[nm.f64](10, 10, 10, 10),
        np.ones((10, 10, 10, 10), dtype=np.float64),
        "Ones is broken",
    )


def test_full():
    var np = Python.import_module("numpy")
    check(
        nm.full[nm.f64](10, 10, 10, 10, fill_value=10),
        np.full((10, 10, 10, 10), 10, dtype=np.float64),
        "Full is broken",
    )


def test_identity():
    var np = Python.import_module("numpy")
    check(
        nm.identity[nm.i64](100),
        np.identity(100, dtype=np.int64),
        "Identity is broken",
    )


def test_eye():
    var np = Python.import_module("numpy")
    check(
        nm.eye[nm.i64](100, 100),
        np.eye(100, 100, dtype=np.int64),
        "Eye is broken",
    )


def main():
    # var np = Python.import_module("numpy")
    # var arr = nm.arange[nm.f64](0, 100)
    # arr.reshape(10, 10)
    # var np_arr = np.arange(0, 100).reshape(10, 10)
    var np = Python.import_module("numpy")
    print(nm.NDArray(5, 5, 5, fill=5).shape())
    print(np.zeros([5, 5, 5], dtype=np.float64).fill(5))
    # Arange like flat arrays
    # check(nm.arange[nm.i64](0,100),np.arange(0,100,dtype=np.int64),"Arange is broken")
    # check(nm.linspace[nm.i64](0,100),np.linspace(0,100,dtype=np.float64),"Linspace is broken")
    # check_is_close(nm.logspace[nm.i64](0,100,5),np.logspace(0,100,5,dtype=np.float64),"Logspace is broken")
    # check_is_close(nm.geomspace[nm.i64](1,100,5),np.geomspace(1,100,5,dtype=np.float64),"Logspace is broken")
    # print((arr@arr).to_numpy()-np.matmul(np_arr,np_arr))
    # print(
    #     nm.matmul_naive[nm.f64](arr, arr).to_numpy()
    # )  # -np.matmul(np_arr,np_arr))
    # print(np.matmul(np_arr, np_arr))
    # # Basic ND arrays
    # print(nm.sin[nm.f64](nm.arange[nm.f64](0,15)))
    # print( np.sin(np.arange(0,15, dtype=np.float64)))
    # check(nm.zeros[nm.f64](10,10,10,10),np.zeros((10,10,10,10),dtype=np.float64),"Zeros is broken")
    # check(nm.ones[nm.f64](10,10,10,10),np.ones((10,10,10,10),dtype=np.float64),"Ones is broken")
    # check(nm.full[nm.f64](10,10,10,10,fill_value=10),np.full((10,10,10,10),10,dtype=np.float64),"Full is broken")

    # # 2d Linalg related arrays

    # check(nm.identity[nm.i64](100),np.identity(100,dtype=np.int64),"Identity is broken")
    # check(nm.eye[nm.i64](100,100),np.eye(100,100,dtype=np.int64),"Eye is broken")