
## Scheduling Algorithms for DNNs on RISC-V

This repository focuses on implementing and researching scheduling algorithms for deep neural networks (DNNs) on RISC-V architecture. The project aims to optimize the performance of DNNs using advanced scheduling techniques tailored to the RISC-V instruction set.

### Current Research Areas

 ### 1. Valuation of Novel SIMD MAC and AF Architecture
- Conducted a comprehensive study on the valuation of novel Single Instruction, Multiple Data (SIMD) Multiply-Accumulate (MAC) and Activation Function (AF) architectures.
- Evaluated the tradeoff between accuracy and area, providing insights into optimizing DNN performance.

### 2. Exploration of Advanced DNN Concepts
- **Tiling**: Investigated techniques for dividing large DNN computations into smaller, manageable tiles to improve processing efficiency.
- **Stitching**: Explored methods to recombine tiled computations effectively.
- **Layers-Reused Scheduling**: Analyzed scheduling algorithms that maximize the reuse of layers to enhance computational efficiency.
- **Pruning**: Studied the impact of pruning techniques on model size and performance, focusing on reducing computational complexity without significant loss of accuracy.

### 3. Implementation of FIFO Scheduler
- **FIFO Scheduler using Dual-Port SRAM**: Designed and implemented a FIFO (First-In-First-Out) Scheduler in Verilog, utilizing Dual-Port SRAM. This component is crucial for managing data flow efficiently within the DNN accelerator, ensuring seamless data storage and retrieval, which is vital for maintaining high throughput and low latency in DNN operations.
- The FIFO Scheduler supports simultaneous read and write operations, leveraging the dual-port capability of the SRAM to optimize data handling.

### 4. Evaluation of Dynamically Configurable Variable Precision Systolic Array
- Currently evaluating dynamically configurable variable precision systolic arrays to support various kernel sizes.
- This involves designing systolic arrays that can adapt to different precision requirements, providing flexibility and efficiency in handling diverse DNN workloads.

     

### Goals

- Develop and optimize scheduling algorithms specific to DNNs on RISC-V.
- Implement tiling and stitching strategies to improve computational efficiency.
- Leverage insights from well-known DNN architectures like VGG and AlexNet.
- Integrate OS-level concepts to support and enhance scheduling algorithms.

This repository is a work in progress, with ongoing research and development.
