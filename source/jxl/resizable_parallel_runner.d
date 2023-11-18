module jxl.resizable_parallel_runner;
@nogc nothrow:
extern(C): __gshared:

public import jxl.memory_manager;
public import jxl.parallel_runner;
public import core.stdc.stddef;
public import core.stdc.stdint;
public import core.stdc.stdlib;

/** Parallel runner internally using std::thread. Use as JxlParallelRunner.
 */
JxlParallelRetCode JxlResizableParallelRunner(void* runner_opaque, void* jpegxl_opaque, JxlParallelRunInit init, JxlParallelRunFunction func, uint start_range, uint end_range);

/** Creates the runner for JxlResizableParallelRunner. Use as the opaque
 * runner. The runner will execute tasks on the calling thread until
 * @ref JxlResizableParallelRunnerSetThreads is called.
 */
void* JxlResizableParallelRunnerCreate(const(JxlMemoryManager)* memory_manager);

/** Changes the number of threads for JxlResizableParallelRunner.
 */
void JxlResizableParallelRunnerSetThreads(void* runner_opaque, size_t num_threads);

/** Suggests a number of threads to use for an image of given size.
 */
uint32_t JxlResizableParallelRunnerSuggestThreads(ulong xsize, ulong ysize);

/** Destroys the runner created by JxlResizableParallelRunnerCreate.
 */
void JxlResizableParallelRunnerDestroy(void* runner_opaque);
