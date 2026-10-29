# RISC-V
RISC-V assembler samples

## Samples

| File | Target | Description |
|------|--------|-------------|
| `hello.s` | RV32I / RV64I, Linux | Bare `_start`, uses `write`/`exit` syscalls directly |
| `HelloWorlV2.S` | RV64 (`rv64gc`, `lp64d`), Linux + libc | GCC-style output calling `printf` |

## Build and run

Tested with GNU binutils 2.42, GCC 13.3, clang 18 and qemu-user 8.2.

```sh
# hello.s (no libc)
riscv64-linux-gnu-as -march=rv64i hello.s -o hello.o
riscv64-linux-gnu-ld hello.o -o hello
qemu-riscv64 ./hello

# or with LLVM
clang --target=riscv64-linux-gnu -march=rv64i -c hello.s -o hello.o
ld.lld hello.o -o hello

# HelloWorlV2.S (libc)
riscv64-linux-gnu-gcc -march=rv64gc -mabi=lp64d -static HelloWorlV2.S -o hello2
qemu-riscv64 ./hello2
```

Since ISA spec 20191213 (binutils 2.38 / GCC 12) `Zicsr` and `Zifencei` are no
longer part of base `I`. These samples use neither, so plain `rv64i` works;
code with `csrr*`/`fence.i` needs e.g. `-march=rv64i_zicsr_zifencei` (`g`
already includes both). Profile strings such as `-march=rva23u64` need a
recent toolchain (e.g. GCC 15+); binutils 2.42 / GCC 13 reject them.

## Specifications

`riscv-spec-v2.2.pdf` (2017) is kept for reference but is outdated. Current
ratified specifications:

- Unprivileged and Privileged ISA: https://riscv.org/specifications/ratified/
- Source and latest builds: https://github.com/riscv/riscv-isa-manual/releases
- Profiles (RVA22, RVA23): https://github.com/riscv/riscv-profiles
