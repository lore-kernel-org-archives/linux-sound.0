From: Britton Kerin <bkerin@best.com>
Date: Thu, 25 Feb 1999 03:19:46 +0000
Subject: semop() SEMMSL constant gone?
Message-Id: <marc-linux-sound-91991323821903@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org


I'm trying to compile a SEMOP intensive program and am wondering what
happened to this constant if anything, or if it's just me.  Mayby I'm
leaving out a critical header?  Here are the ones I'm using.

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <errno.h>
#include <signal.h>
#include <sys/types.h>
#include <sys/ipc.h>
#include <sys/sem.h>
#include <sys/shm.h>
#include <sys/wait.h>

Any help or advice greatly appreciated.

Britton Kerin
