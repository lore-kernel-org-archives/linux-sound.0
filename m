From: Mike Wyer <mjw7@doc.ic.ac.uk>
Date: Fri, 25 Sep 1998 15:13:58 +0000
Subject: Re: Linux 2.0.36pre12 / Modular sound 2.0.36 test patch 1
Message-Id: <marc-linux-sound-90674388418018@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

On Fri, 25 Sep 1998, Mike A. Harris wrote:
>On Fri, 25 Sep 1998, Alan Cox wrote:
>>ftp://ftp.linux.org.uk/pub/linux/alan/...
>>2.0.36pre12 fixes the Alpha unknown syscall returning -EPERM bug, adds
>>Ensoniq to the PCI names and updates the parallel ide devices slightly.
>>
>>As far as Im concerned that is now it for 2.0.36. Linus please have a look
>>through it see what you think. I'm guessing you'll want to drop the
>>fs/nfs changes. If so be careful to leave the nfsroot change as its not
>>part of the FIFO thing.
>>
>>Also for modular sound freaks the test modular sound for 2.0.36 patch brings
>>2.0.36 roughly in line with the current 2.1.122+bits I sent Linus. Unlike
>>2.1.x it doesnt fix O_NDELAY so it wont break realaudio clients.
>
>I thought you abandoned modular sound for 2.0.x?

It's just a patch _for_ the 36pre code, not a new 36pre patch (if
that makes sense). 36 pre 12 doesn't contain the new sound drivers.
However, the sound patch alan mentioned patches against the 2.0.36 code
rather than the 2.1.12x code. So you end up with a stable kernel and the
option of using the new sound drivers.

There is a slight problem with it though- make xconfig dies on the sound
section:
Error: Invalid command name "istring"

Stack trace:
invalid command name "istring"
    while executing
"istring $w.config.f 13 5 "  Full pathname of MSNDINIT.BIN firmware
file" CONFIG_MSNDCLAS_INIT_FILE"
    (procedure "menu13" line 38)
    invoked from within
"menu13 .menu13 "Sound""
    invoked from within
".f0.x13 invoke"
    ("uplevel" body line 1)
    invoked from within
"uplevel #0 [list $w invoke]"
    (procedure "tkButtonUp" line 8)
    invoked from within
"tkButtonUp .f0.x13"
    (command bound to event)

This occurs in the file scripts/kconf.tk (surprise surprise).
Is this a hang-on from 2.1 and the Tk code used in xconfig there?
Or am I missing something? (Conceptually or physically).
Cheers,
Mike
--
          ///   Mike Wyer : <m.wyer@ic.ac.uk>   \\\
         //\\___________________________________//\\
      "I want to die in my sleep like my grandfather....
 ...Not screaming and yelling like the passengers in his car."
