From: Greg Ward <gward-work@python.net>
Date: Fri, 24 Oct 2003 22:07:03 +0000
Subject: Kernel panic writing to /dev/dsp with cmpci driver
Message-Id: <marc-linux-sound-106703419820377@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

[cc'ing python-dev because there might be something funny in the
ossaudiodev module -- but some of you already know that!]

I've just upgraded to Linux 2.4.23-pre8 + RML's preemptible kernel
patch, and I have a pretty reproducible panic when writing to /dev/dsp.
Here's what lspci reports about the sound hardware:

02:03.0 Multimedia audio controller: C-Media Electronics Inc CM8738 (rev 10)

I'm using the cmpci driver.  Oddly, the panic only happens when using
Python 2.3's ossaudiodev module, which is a fairly thin wrapper around
the OSS API.  Here's a script that crashes my machine every time:

"""
#!/usr/bin/python2.3

import sys
import ossaudiodev

random = open("/dev/urandom", "r")
dsp = ossaudiodev.open("w")
while 1:
    sys.stdout.write("."); sys.stdout.flush()
    dsp.write(random.read(4096))
"""

(I'm quite sure that the panic has nothing to do with /dev/urandom,
since I discovered the it by playing Ogg Vorbis files, not by playing
white noise.)  The crash happens after about 10-12 dots have appeared,
ie. 10-12 4k blocks have been written.

Here's a C version of that script that does *not* crash my system:

"""
#include <stdio.h>
#include <unistd.h>
#include <fcntl.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <sys/soundcard.h>

#define BUF_SIZE 4096

int main(int argc, char ** argv)
{
   int nbytes;
   char data[BUF_SIZE];
   int source, dsp;		       /* input, output FDs */

   source = open("/dev/urandom", O_RDONLY);
   dsp = open("/dev/dsp", O_WRONLY);
   printf("source fd=%d, dsp fd=%d\n", source, dsp);
   
   while (1) {
      printf("."); fflush(stdout);
      nbytes = read(source, data, BUF_SIZE);
      write(dsp, data, nbytes);
   }
}
"""

Just wondering if anyone else has seen something like this in
2.4.23-pre8, either with or without the preemptible kernel patch.  I'm
going to try backing out that patch to see if the problem persists; if
so, I'll report back here with more details on the panic.

Oh yeah, this is a Red Hat 9 system -- the sound driver worked perfectly
with Red Hat's 2.4.20-20.9 kernel (which, from the source RPM, appears
to be 2.4.21-pre3 plus a bunch of Red Hat patches).

        Greg
