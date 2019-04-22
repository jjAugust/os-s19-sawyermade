#include <lib/gcc.h>
#include <lib/x86.h>
#include <lib/debug.h>

#include "import.h"

#define VM_USERLO   0x40000000
#define VM_USERHI   0xF0000000
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
	
	dprintf("In map_cow()\n");

	// Local vars
	unsigned int i, j, lo, hi, pde, pde_shift, pte, pte_shift, pde_new;

	// User space
	lo = VM_USERLO / PAGESIZE / PAGENUM;
	hi = VM_USERHI / PAGESIZE / PAGENUM;

	// Copies user space
	// for(i = lo; i < hi; i++){
	// 	// dprintf("\nfrom pde[%d] = %d, to pde[%d] = %d\n", i, get_pdir_entry(from_pid, i)>>12, i, get_pdir_entry(to_pid, i)>>12);
	// 	// pde = get_pdir_entry(to_pid, i);
	// 	// if(pde != 0)
	// 	//     dprintf("\nog pde = %d, i = %d", pde, i);

	// 	// Gets pde from, sets to to
	// 	pde = get_pdir_entry(from_pid, i);
	// 	pde_shift = pde>>PAGE_SHIFT;
	// 	if(pde_shift > 0){
	// 		pde_new = container_alloc(to_pid);
	// 		set_pdir_entry_fork(from_pid, i, pde_shift<<12 | PTE_COW | PTE_U | PTE_P);
	// 		set_pdir_entry_fork(to_pid, i, pde_new<<12 | PTE_COW | PTE_U | PTE_P);
	// 		dprintf("\npde = 0x%08x, pde_new = %d, pde_shift = %d\n", pde, pde_new, pde_shift);
	// 	}

	// 	// set_pdir_entry_identity(to_pid, i);

	// 	//Maybe
	// 	// pde = pde<<PAGE_SHIFT | PTE_COW;
	// 	// set_pdir_entry_fork(to_pid, i, pde);
	// 	// set_pdir_entry_fork(from_pid, i, pde);
	// 	if(pde_shift > 0){
	// 		// dprintf("\nfrom pde[%d] = %d, to pde[%d] = %d", i, get_pdir_entry(from_pid, i), i, get_pdir_entry(to_pid, i));
	// 		for(j = 0; j < PAGENUM; j++){
	// 			pte = get_ptbl_entry(from_pid, i, j);
	// 			pte_shift = pte>>PAGE_SHIFT;
	// 			if(pte_shift > 0){
	// 				dprintf("\nj=%d, pte = 0x%08x, pte_shift = %d\n", j, pte, pte_shift);
	// 				set_ptbl_entry(from_pid, i, j, pte_shift, PTE_COW | PTE_P | PTE_U);
	// 				set_ptbl_entry(to_pid, i, j, pte_shift, PTE_COW | PTE_P | PTE_U);

	// 				dprintf("pte val = %d\n", *(unsigned int*)(pte_shift<<12));
	// 			}
				
	// 			// set_ptbl_entry(from_pid, i, j, pte, PERM_COW | ~PTE_W);
	// 		}
	// 	}
	// }
	for(i = lo; i < hi; i++){
		pde = get_pdir_entry(from_pid, i);
		pde = pde>>12;
		if(pde != 0){
			// set_pdir_entry_fork(from_pid, i, (pde & PERM_MASK) | PTE_U | PTE_P | PTE_COW);
			// set_pdir_entry_fork(to_pid, i, (pde & PERM_MASK) | PTE_U | PTE_P | PTE_COW);
			
			pde_new = container_alloc(to_pid);
			// dprintf("pde_new = %d\n", pde_new);
			set_pdir_entry(to_pid, i, pde_new);

			// set_pdir_entry(to_pid, i, pde);

			for(j = 0; j < PAGENUM; j++){
				pte = get_ptbl_entry(from_pid, i, j);
				pte = pte>>12;

				if(pte != 0){
					set_ptbl_entry(from_pid, i, j, pte, PERM_COW);
					set_ptbl_entry(to_pid, i, j, pte, PERM_COW);
				}
			}
		}
	}

	// dprintf("map_cow() end\n");
}

void map_decow(unsigned int pid, unsigned int vadr) {
	
	// dprintf("\nIn map_decow(), pid = %d, va = 0x%08x\n", pid, vadr);
	dprintf("In map_decow()\n");

	// Local vars
	unsigned int old_pde=0, new_pde=0, pde_index=0, pte_index=0;
	unsigned int i, j, old_pte, temp_pte, new_pte;

	// old_pte = get_ptbl_entry_by_va(pid, vadr);
	// old_pte = old_pte>>12;
	// old_pte = old_pte<<12;
	// new_pte = alloc_page(pid, vadr, PERM_REG);
	// new_pte = new_pte<<12;

	// *(unsigned int*)old_pte = 69;
	// *(unsigned int*)new_pte = *(unsigned int*)old_pte;
	// new_pte = new_pte>>12;
	// set_ptbl_entry_by_va(pid, vadr, new_pte, PERM_REG);

	// new_pte = new_pte<<12;
	// dprintf("old_pte = 0x%08x %d, new_pte = 0x%08x %d\n", old_pte, old_pte, new_pte, new_pte);
	// dprintf("old_pte val = %d, new_pte val = %d\n", *(unsigned int*)old_pte, *(unsigned int*)new_pte);

	// old_pde = get_pdir_entry_by_va(pid, vadr);

	old_pte = get_ptbl_entry_by_va(pid, vadr);
	old_pte = old_pte & PERM_MASK;

	// rmv_ptbl_entry_by_va(pid, vadr);
	// rmv_pdir_entry_by_va(pid, vadr);

	new_pde = alloc_page(pid, vadr, PERM_REG);
	// dprintf("new_pde = %08x, %08x\n", new_pde, old_pde);
	// dprintf("new_pte = %08x, %08x\n", new_pde, old_pte);
	// set_ptbl_entry_by_va(pid, vadr, new_pte, PERM_REG);
	new_pte = get_ptbl_entry_by_va(pid, vadr) & PERM_MASK;
	// dprintf("set? %08x\n", new_pte);

	// *(unsigned int*)(new_pte<<12) = *(unsigned int*)old_pte;
	// new_pte = new_pte<<12;
	for(i = 0; i < 1024; i++){
		*(unsigned int*)(new_pte + 4*i) = *(unsigned int*)(old_pte + 4*i);
	}
}