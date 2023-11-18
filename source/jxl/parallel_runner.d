module jxl.parallel_runner;
@nogc nothrow:
extern(C): __gshared:


public import core.stdc.stddef;
public import core.stdc.stdint;

/** Return code used in the JxlParallel* functions as return value. A value
 * of 0 means success and any other value means error. The special value
 * JXL_PARALLEL_RET_RUNNER_ERROR can be used by the runner to indicate any
 * other error.
 */
alias JxlParallelRetCode = int;

/**
 * General error returned by the JxlParallelRunInit function to indicate
 * an error.
 */
enum JXL_PARALLEL_RET_RUNNER_ERROR = (-1);

/**
 * Parallel run initialization callback. See JxlParallelRunner for details.
 *
 * This function MUST be called by the JxlParallelRunner only once, on the
 * same thread that called JxlParallelRunner, before any parallel execution.
 * The purpose of this call is to provide the maximum number of threads that the
 * JxlParallelRunner will use, which can be used by JPEG XL to allocate
 * per-thread storage if needed.
 *
 * @param jpegxl_opaque the @p jpegxl_opaque handle provided to
 * JxlParallelRunner() must be passed here.
 * @param num_threads the maximum number of threads. This value must be
 * positive.
 * @return 0 if the initialization process was successful.
 * @return an error code if there was an error, which should be returned by
 * JxlParallelRunner().
 */
alias JxlParallelRunInit = JxlParallelRetCode function(void* jpegxl_opaque, size_t num_threads);

/**
 * Parallel run data processing callback. See JxlParallelRunner for details.
 *
 * This function MUST be called once for every number in the range [start_range,
 * end_range) (including start_range but not including end_range) passing this
 * number as the @p value. Calls for different value may be executed from
 * different threads in parallel.
 *
 * @param jpegxl_opaque the @p jpegxl_opaque handle provided to
 * JxlParallelRunner() must be passed here.
 * @param value the number in the range [start_range, end_range) of the call.
 * @param thread_id the thread number where this function is being called from.
 * This must be lower than the @p num_threads value passed to
 * JxlParallelRunInit.
 */
alias JxlParallelRunFunction = void function(void* jpegxl_opaque, uint value, size_t thread_id);

/**
 * JxlParallelRunner function type. A parallel runner implementation can be
 * provided by a JPEG XL caller to allow running computations in multiple
 * threads. This function must call the initialization function @p init in the
 * same thread that called it and then call the passed @p func once for every
 * number in the range [start_range, end_range) (including start_range but not
 * including end_range) possibly from different multiple threads in parallel.
 *
 * The JxlParallelRunner function does not need to be re-entrant. This means
 * that the same JxlParallelRunner function with the same runner_opaque
 * provided parameter will not be called from the library from either @p init or
 * @p func in the same decoder or encoder instance. However, a single decoding
 * or encoding instance may call the provided JxlParallelRunner multiple
 * times for different parts of the decoding or encoding process.
 *
 * @return 0 if the @p init call succeeded (returned 0) and no other error
 * occurred in the runner code.
 * @return JXL_PARALLEL_RET_RUNNER_ERROR if an error occurred in the runner
 * code, for example, setting up the threads.
 * @return the return value of @p init() if non-zero.
 */
alias JxlParallelRunner = JxlParallelRetCode function(void* runner_opaque, void* jpegxl_opaque, JxlParallelRunInit init, JxlParallelRunFunction func, uint start_range, uint end_range);

/* The following is an example of a JxlParallelRunner that doesn't use any
 * multi-threading. Note that this implementation doesn't store any state
 * between multiple calls of the ExampleSequentialRunner function, so the
 * runner_opaque value is not used.

  JxlParallelRetCode ExampleSequentialRunner(void* runner_opaque,
                                                void* jpegxl_opaque,
                                                JxlParallelRunInit init,
                                                JxlParallelRunFunction func,
                                                uint32_t start_range,
                                                uint32_t end_range) {
    // We only use one thread (the currently running thread).
    JxlParallelRetCode init_ret = (*init)(jpegxl_opaque, 1);
    if (init_ret != 0) return init_ret;

    // In case of other initialization error (for example when initializing the
    // threads) one can return JXL_PARALLEL_RET_RUNNER_ERROR.

    for (uint32_t i = start_range; i < end_range; i++) {
      // Every call is in the thread number 0. These don't need to be in any
      // order.
      (*func)(jpegxl_opaque, i, 0);
    }
    return 0;
  }
 */
