/* Copyright (c) the JPEG XL Project Authors. All rights reserved.
 *
 * Use of this source code is governed by a BSD-style
 * license that can be found in the LICENSE file.
 */

/** @addtogroup libjxl_threads
 * @{
 * @file resizable_parallel_runner.h
 * @brief implementation using std::thread of a resizeable ::JxlParallelRunner.
 */

/** Implementation of JxlParallelRunner than can be used to enable
 * multithreading when using the JPEG XL library. This uses std::thread
 * internally and related synchronization functions. The number of threads
 * created can be changed after creation of the thread pool; the threads
 * (including the main thread) are re-used for every
 * ResizableParallelRunner::Runner call. Only one concurrent
 * @ref JxlResizableParallelRunner call per instance is allowed at a time.
 *
 * This is a scalable, lower-overhead thread pool runner, especially suitable
 * for data-parallel computations in the fork-join model, where clients need to
 * know when all tasks have completed.
 *
 * Compared to the implementation in @ref thread_parallel_runner.h, this
 * implementation is tuned for execution on lower-powered systems, including
 * for example ARM CPUs with big.LITTLE computation models.
 */
module jxl.resizable_parallel_runner;

public import jxl.memory_manager;
public import jxl.parallel_runner;

extern (C):

/** Parallel runner internally using std::thread. Use as @ref JxlParallelRunner.
 */
JxlParallelRetCode JxlResizableParallelRunner (
    void* runner_opaque,
    void* jpegxl_opaque,
    JxlParallelRunInit init,
    JxlParallelRunFunction func,
    uint start_range,
    uint end_range);

/** Creates the runner for @ref JxlResizableParallelRunner. Use as the opaque
 * runner. The runner will execute tasks on the calling thread until
 * @ref JxlResizableParallelRunnerSetThreads is called.
 */
void* JxlResizableParallelRunnerCreate (
    const(JxlMemoryManager)* memory_manager);

/** Changes the number of threads for @ref JxlResizableParallelRunner.
 */
void JxlResizableParallelRunnerSetThreads (
    void* runner_opaque,
    size_t num_threads);

/** Suggests a number of threads to use for an image of given size.
 */
uint JxlResizableParallelRunnerSuggestThreads (ulong xsize, ulong ysize);

/** Destroys the runner created by @ref JxlResizableParallelRunnerCreate.
 */
void JxlResizableParallelRunnerDestroy (void* runner_opaque);

/* JXL_RESIZABLE_PARALLEL_RUNNER_H_ */

/** @}*/
