/* Copyright (c) the JPEG XL Project Authors. All rights reserved.
 *
 * Use of this source code is governed by a BSD-style
 * license that can be found in the LICENSE file.
 */

/** @addtogroup libjxl_threads
 * @{
 * @file thread_parallel_runner.h
 * @brief implementation using std::thread of a ::JxlParallelRunner.
 */

/** Implementation of JxlParallelRunner than can be used to enable
 * multithreading when using the JPEG XL library. This uses std::thread
 * internally and related synchronization functions. The number of threads
 * created is fixed at construction time and the threads are re-used for every
 * ThreadParallelRunner::Runner call. Only one concurrent
 * JxlThreadParallelRunner call per instance is allowed at a time.
 *
 * This is a scalable, lower-overhead thread pool runner, especially suitable
 * for data-parallel computations in the fork-join model, where clients need to
 * know when all tasks have completed.
 *
 * This thread pool can efficiently load-balance millions of tasks using an
 * atomic counter, thus avoiding per-task virtual or system calls. With 48
 * hyperthreads and 1M tasks that add to an atomic counter, overall runtime is
 * 10-20x higher when using std::async, and ~200x for a queue-based thread
 */
module jxl.thread_parallel_runner;

public import jxl.memory_manager;
public import jxl.parallel_runner;

extern (C):

/** Parallel runner internally using std::thread. Use as @ref JxlParallelRunner.
 */
JxlParallelRetCode JxlThreadParallelRunner (
    void* runner_opaque,
    void* jpegxl_opaque,
    JxlParallelRunInit init,
    JxlParallelRunFunction func,
    uint start_range,
    uint end_range);

/** Creates the runner for @ref JxlThreadParallelRunner. Use as the opaque
 * runner.
 */
void* JxlThreadParallelRunnerCreate (
    const(JxlMemoryManager)* memory_manager,
    size_t num_worker_threads);

/** Destroys the runner created by @ref JxlThreadParallelRunnerCreate.
 */
void JxlThreadParallelRunnerDestroy (void* runner_opaque);

/** Returns a default num_worker_threads value for
 * @ref JxlThreadParallelRunnerCreate.
 */
size_t JxlThreadParallelRunnerDefaultNumWorkerThreads ();

/* JXL_THREAD_PARALLEL_RUNNER_H_ */

/** @}*/
