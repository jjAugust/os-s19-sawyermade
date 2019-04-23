#ifndef _KERN_MM_MPTCOW_H_
#define _KERN_MM_MPTCOW_H_

void map_cow(unsigned int, unsigned int);
void map_decow(unsigned int, unsigned int);

unsigned int proc_fork(void);

#endif
