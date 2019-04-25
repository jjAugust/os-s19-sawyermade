#ifndef _KERN_MM_MPTCOW_H_
#define _KERN_MM_MPTCOW_H_

#ifdef _KERN_

unsigned int get_curid(void);

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

unsigned int get_curid(void);
void set_pdir_base(unsigned int);
unsigned int thread_spawn(void *entry, unsigned int id, unsigned int quota);
unsigned int thread_fork(void *entry, unsigned int id, unsigned int quota);

unsigned int container_get_quota(unsigned int);
unsigned int container_get_usage(unsigned int);

void proc_start_user(void);

unsigned int get_ptbl_entry_by_va(unsigned int, unsigned int);
unsigned int get_pdir_entry_by_va(unsigned int, unsigned int);
void set_ptbl_entry_by_va(unsigned int, unsigned int, unsigned int, unsigned int);
void set_pdir_entry_by_va(unsigned int, unsigned int, unsigned int);
void rmv_ptbl_entry_by_va(unsigned int, unsigned int);
void rmv_pdir_entry_by_va(unsigned int, unsigned int);

void cow_plus(unsigned int);
void cow_minus(unsigned int);
unsigned int cow_get(unsigned int);

#endif /* _KERN_ */

#endif /* !_KERN_MM_MPTCOW_H_ */