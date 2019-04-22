#ifndef _KERN_MM_MPTCOW_H_
#define _KERN_MM_MPTCOW_H_

#ifdef _KERN_

void set_pdir_base(unsigned int);
unsigned int get_pdir_entry(unsigned int, unsigned int);
void set_pdir_entry(unsigned int, unsigned int, unsigned int);
void set_pdir_entry_identity(unsigned int, unsigned int);
void rmv_pdir_entry(unsigned int, unsigned int);
unsigned int get_ptbl_entry(unsigned int, unsigned int, unsigned int);
void set_ptbl_entry(unsigned int, unsigned int, unsigned int, unsigned int, unsigned int);
void set_ptbl_entry_identity(unsigned int, unsigned int, unsigned int);
void rmv_ptbl_entry(unsigned int, unsigned int, unsigned int);

void set_pdir_entry_fork(unsigned int, unsigned int, unsigned int);

unsigned int alloc_page(unsigned int, unsigned int, unsigned int);
unsigned int alloc_mem_quota(unsigned int, unsigned int);

unsigned int container_alloc(unsigned int);

unsigned int get_ptbl_entry_by_va(unsigned int, unsigned int);
unsigned int get_pdir_entry_by_va(unsigned int, unsigned int);
void set_ptbl_entry_by_va(unsigned int, unsigned int, unsigned int, unsigned int);
void set_pdir_entry_by_va(unsigned int, unsigned int, unsigned int);
void rmv_ptbl_entry_by_va(unsigned int, unsigned int);
void rmv_pdir_entry_by_va(unsigned int, unsigned int);

#endif /* _KERN_ */

#endif /* !_KERN_MM_MPTCOW_H_ */