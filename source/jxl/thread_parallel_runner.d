module jxl.thread_parallel_runner;
@nogc nothrow:
extern(C): __gshared:

 
public import jxl.memory_manager;
public import jxl.parallel_runner;
public import core.stdc.stddef;
public import core.stdc.stdint;
public import core.stdc.stdlib;

/** Parallel runner internally using std::thread. Use as JxlParallelRunner.
 */
JxlParallelRetCode JxlThreadParallelRunner(void* runner_opaque, void* jpegxl_opaque, JxlParallelRunInit init, JxlParallelRunFunction func, uint start_range, uint end_range);

/** Creates the runner for JxlThreadParallelRunner. Use as the opaque
 * runner.
 */
void* JxlThreadParallelRunnerCreate(const(JxlMemoryManager)* memory_manager, size_t num_worker_threads);

/** Destroys the runner created by JxlThreadParallelRunnerCreate.
 */
void JxlThreadParallelRunnerDestroy(void* runner_opaque);

/** Returns a default num_worker_threads value for
 * JxlThreadParallelRunnerCreate.
 */
size_t JxlThreadParallelRunnerDefaultNumWorkerThreads();
