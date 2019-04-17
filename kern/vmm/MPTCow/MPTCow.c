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
	
    dprintf("\nIn map_cow()\n");

    // Local vars
	unsigned int i, j, lo, hi, pde, pte;

	// User space
	lo = VM_USERLO / PAGESIZE / PAGENUM;
    hi = VM_USERHI / PAGESIZE / PAGENUM;

    // Copies user space
 	for(i = lo; i < hi; i++){
 		// Gets pde from
        pde = get_pdir_entry(from_pid, i);
 		
        // Sets pde to
        pde = pde>>PAGE_SHIFT;
 		set_pdir_entry(to_pid, i, pde);

        //Maybe
        // pde = (pde & PERM_MASK) | PERM_COW;
        // set_pdir_entry_fork(to_pid, i, pde);
        // set_pdir_entry_fork(from_pid, i, pde);

        for(j = 0; j < PAGENUM; j++){
            pte = get_ptbl_entry(from_pid, i, j);
            pte = pte>>PAGE_SHIFT;
            set_ptbl_entry(from_pid, i, j, pte, PERM_COW);
        }
 	}
}

void map_decow(unsigned int pid, unsigned int vadr) {
    
    dprintf("\nIn map_decow()\n");

    // Local vars
    unsigned int old_pde=0, new_pde=0, pde_index=0, pte_index=0;
    unsigned int i, j, old_pte, temp_pte, new_pte;

    // Gets indices
    pde_index = (vadr & DIR_MASK)>>DIR_SHIFT;
    pte_index = (vadr & PAGE_MASK)>>PAGE_SHIFT;

    // Gets old pde and sets current pde to 0
    old_pde = get_pdir_entry(pid, pde_index);
    set_pdir_entry(pid, pde_index, 0);

    // Gets new pde and allocs new page
    new_pde = alloc_page(pid, vadr, PERM_REG);

    // Copy stuff
    for(i = 0; i < PAGENUM; i++){
        // Copies pte from old pde
        old_pte = *(unsigned int*)(old_pde + 4*i);
        new_pte = new_pde + 4*i;

        // Checks if changed pte
        if(i == pte_index){
            // Copies pte maybe
            // for(j = 0; j < PAGENUM; j++){
            //     // Copies from old_pte to new_pte
            //     *(unsigned int*)new_pte = *(unsigned int*)(old_pte + 4*j);
            // }

            // Copies with changed permission
            *(unsigned int*)(new_pde + 4*i) = (old_pte & PERM_MASK) | PERM_REG;
        }

        else{
            // set_ptbl_entry(pid, pde_index, i, old_pte>>PAGE_SHIFT, PERM_COW);
            *(unsigned int*)(new_pde + 4*i) = old_pte;
        }
    }
}