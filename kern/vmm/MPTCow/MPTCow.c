#include <lib/gcc.h>
#include <lib/x86.h>
#include <lib/debug.h>
#include <lib/trap.h>

#include "import.h"

#define VM_USERLO   0x40000000
// #define VM_USERHI   0xF0000000
#define DIR_MASK    0xffc00000
#define PAGE_MASK   0x003ff000
#define OFFSET_MASK 0x00000fff
#define DIR_SHIFT   22
#define PAGE_SHIFT  12
#define PAGESIZE    4096
#define PAGENUM		1024
#define PERM_MASK   0xfffff000
#define PERM_COW	(PTE_COW | PTE_U | PTE_P)
#define PERM_REG    (PTE_W | PTE_U | PTE_P)

extern tf_t uctx_pool[NUM_IDS];

/** ASSIGNMENT INFO:
  * - In this part of the kernel, we will be implementing Virtual Memory Management (VMM) with 
  *   two level paging mechanism.
  * - Like with PMM section, we need certain data structures and abstractions over these structures 
  *   to access and modify them. (See project handout for description of abstraction layers.)
  * - Each abstraction layer is a sub-folder within the vmm folder and is organised the same as 
  *   pmm layer with files export.h, import.h, test.c, <layer_name>.c and the Makefile.inc.
  *
  * HELPFUL LINKS ON PAGING:
  * - Intel 80386 Programmer’s Reference Manual: http://flint.cs.yale.edu/cs422/readings/i386/s05_02.htm
*/ 

/** * VMM Data Structure: PDirPool
  * - We will maintain one page structure for each process.
  * - We will statically allocate page directories, and maintain the second level page tables dynamically.
  * - We have a Page directory pool for NUM_IDS processes.
  *   -- Each PDirPool[index] represents the page directory of the page structure for the process # [index].
  * - We will have a maximum of NUM_IDS (=64) processes. 
  * - The PAGESIZE for VMM is 4096 bytes. 
  * - Each Page Table Entry (pte) is 4 bytes. Therefore, each page can hold 4096/4 = 1024 pte.
  * Page Table Entry Format:
  * 20+9+3=32
  * |31                         12|11          |2   |1   |0  | 
  * |-----------------------------|------------|----|----|---|
  * | Page Frame Address 31..12   |  Flags     |U/S |R/W |P  |
  *
  * - U/S = User / Supervisor bit
  * - R/W = Read / Write bit
  * - P   = Present bit
 */

void map_cow(unsigned int from_pid, unsigned int to_pid) {
	//DEBUG
	// dprintf("In map_cow()\n");

	// Local vars
	unsigned int i, j, lo, hi, pde, pde_new, pte;

	// User space
	lo = VM_USERLO / PAGESIZE / PAGENUM;
	hi = VM_USERHI / PAGESIZE / PAGENUM;

	// Copies user space
	for(i = lo; i < hi; i++){
		// Gets from pde
		pde = get_pdir_entry(from_pid, i);
		pde = pde>>PAGE_SHIFT;

		// If pde exists, create pde for child and copy ptes
		if(pde){
			// Creates pde for child pid
			pde_new = container_alloc(to_pid);
			set_pdir_entry(to_pid, i, pde_new);

			// Copies ptes to the child and sets both perms to COW
			for(j = 0; j < PAGENUM; j++){
				// Gets parent pte
				pte = get_ptbl_entry(from_pid, i, j);
				pte = pte>>PAGE_SHIFT;

				// pte exists, copy addr and change perms in both
				if(pte){
					set_ptbl_entry(from_pid, i, j, pte, PERM_COW);
					set_ptbl_entry(to_pid, i, j, pte, PERM_COW);
					cow_plus(pte);
				}
			}
		}
	}
	//DEBUG
	// dprintf("map_cow() end\n");
}

void map_decow(unsigned int pid, unsigned int vadr) {
	//DEBUG
	// dprintf("\nIn map_decow(), pid = %d, va = 0x%08x\n", pid, vadr);
	// dprintf("In map_decow()\n");

	// Local vars
	unsigned int old_pte=0, new_pte=0, i, *to, *from, count;

	// Gets pte to copy
	old_pte = get_ptbl_entry_by_va(pid, vadr);
	old_pte = old_pte & PERM_MASK;

	// Get alloc count refs
	count = cow_get(old_pte>>12);
	// dprintf("count = %u\n", count);

	if(count == 1){
		set_ptbl_entry_by_va(pid, vadr, old_pte>>12, PERM_REG);
	}

	// If more than one ref, copies
	else{
		// Allocs new page and gets the newly allocated pte
		alloc_page(pid, vadr, PERM_REG);
		new_pte = get_ptbl_entry_by_va(pid, vadr) & PERM_MASK;

		// Pointer setup
		to = (unsigned int*)new_pte; 
		from = (unsigned int*)old_pte;

		// Copies page table to child
		for(i = 0; i < 1024; i++){
			to[i] = from[i];
		}

		// Remove one ref alloc
		cow_minus(old_pte>>12);
	}
}

unsigned int proc_fork(void) {
	//DEBUG
	// dprintf("\nIN proc_fork()\n");

	// Local vars
	unsigned int curid, quota, chid;

	// Gets current pid and quota
	curid = get_curid();
	quota = (container_get_quota(curid) - container_get_usage(curid)) / 2;

	// Spawns child fork and sets up copy on write
	chid = thread_spawn((void *)proc_start_user, curid, quota);
	map_cow(curid, chid);

	// Copies context and sets error and chid registers for new process
	uctx_pool[chid] = uctx_pool[curid];
	uctx_pool[chid].regs.eax = 0;
	uctx_pool[chid].regs.ebx = 0;

	// Returns chid to parent/curid
	return chid;
}