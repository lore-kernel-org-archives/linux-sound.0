From: Paco <paco@OhKeePa.Net>
Date: Fri, 07 Apr 2000 20:14:41 +0000
Subject: Re: NEVERMIND! Re: can't compile emu10k1 drivers
Message-Id: <marc-linux-sound-95513848112670@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-95498277922101@msgid-missing>
In-Reply-To: <marc-linux-sound-95498277922101@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

On Fri, 7 Apr 2000, Rui Sousa wrote:

> Paco wrote:
> > 
> > I had to hack the Makefiles a bit, but I finally got the drivers
> > compiled and working.
> > 
> 
> What was the problem? So that I can fix it in CVS...
> 
> Rui Sousa
> 

Rui,

The first problem was that gcc kept complaining about "malformed options"
when trying to compile the driver for my Athlon.  The second problem was
the compilers inablility to find emu_wrapper.h .

To fix problem (1)
-----------------
In the Makefile.i386 (for 2.4), I had to modify the following line:

CFLAGS := $(CFLAGS) -DCPUh6 -march=pentiumpro -mpentiumpro
-malign-functions=4 -fschedule-insns2 -mwide-multiply
-fexpensive-optimizations

to read

CFLAGS := $(CFLAGS) -DCPU 686

I probably could have left most of these options alone.  Only the 
"pentiumpro" stuff was causing me problems.


To fix problem (2)
-----------------
Changed all lines like this:

#include <emu_wrapper.h>

to read

#include "emu_wrapper.h"


regards,
Chad
