From: Britton <fsblk@aurora.alaska.edu>
Date: Thu, 11 Feb 1999 05:18:18 +0000
Subject: successive mmap()s will not work to record sound?
Message-Id: <marc-linux-sound-91871041516692@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org


I have been trying to write a brec-like program that will record long
tracks of raw sound using many successive mmap()s of the same file, but it
isn't working.  I get stuff like this:

incorrect number of bytes written: Interrupted system call
Sound: Recording overrun 
<DMA somethingorother times> out - IRQ/DRQ config error?

ad nauseum

Does this mean that my code is not keeping up with the sound card?

Is this approach not feasible?  Here are the salient features of the
program: 

/* appropriate headers */

int target[10];               /* current file descriptors to write to */
char *region[10];             /* pointers to the current mapped file */
int nblocks;                  /* the total number of 65536 byte "blocks" */
int cblock;                   /* the current block less than nblocks */
int cmmap;                    /* the current mmap in 10 block loop */
pid_t pid;                    /* the pid of the msyncing munmaping child */

/* ioctrl dsp device with RATE BITS TIME and STEREO */

  /* figure out how many 65536 byte mmaps we will need */
  nblocks = (LENGTH*RATE*SIZE*CHANNELS)/(8*65536) ;

  for (cblock = 0; cblock < nblocks; cblock++) {
    cmmap = cblock % 10;
    printf("cmmap: %d       looping: %d\n", cmmap, cblock);
    /* open, make zero hole, and mmap the target region */
    status = target[cmmap] = open("targetfile", O_CREAT | O_RDWR,
             0644);
    if (status < 0) {
      perror("error opening target file");
      exit(1);
    }
    if (lseek(target[cmmap], 65535, SEEK_END) = (off_t) (-1)) {
      perror("lseek() error");
      exit(1);
    }
    if (write(target[cmmap], "", 1) < 0) {
      perror("write() error");
      exit(1);
    }

    region[cmmap] = mmap(NULL, 65536, PROT_WRITE, MAP_SHARED, target[cmmap],
                             65536*cblock);
    if (region[cmmap] = (caddr_t) (-1)) {
      perror("mmap error");
      exit(1);
    }

    /* record sound into mmaped region */
    status = read(dsp, (region[cmmap]), 65536);
    if (status != 65536) {
      perror("incorrect number of bytes written");
      exit(1);
    }

    /* fork a low priority child for msync with disk */
    if ((pid = fork()) < 0)
      perror("fork error");
    else if (pid = 0) {        /* child */

      /* make ourselves very nice */
      if (nice(19) = -1)
        perror("nice error");

      /* make sure the mmaped stuff gets written to disk "soon" */
      msync(region[cmmap], 65536, MS_ASYNC);

      /* unmap the current region, so it can be reused next time around */
      if (munmap(region[cmmap], 65536) = -1) {
        perror("munmap error");
        exit(1);
      }

      /* close the file descriptor to the cmmap */
      if (close(target[cmmap]) = -1) {
        perror("close error");
        exit(1);
      }
    }
  }
}


Any help or advice greatly appreciated.

Britton Kerin
