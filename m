From: ali <faali@mweb.co.za>
Date: Sun, 28 Mar 1999 06:55:30 +0000
Subject: Re: AWE64 and RH5.2
Message-Id: <marc-linux-sound-92260464420847@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

Hi!!

I also have the AWE64 and finally got (most) of it to work.
sndconfig wasn't much help on my machine either but here's what I did:

- Download the latest SB AWE64 driver from http://bahamut.mm.t.u-tokyo.ac.jp/~iwai/awedrv/
- Read the documentation - It tells almost everything you need to know
- Also, There's documentation in ./.../kernel_source_code/Documentation/sound/ 
- The AWE64 mini-HOWTO is also really useful

Some quick steps if you don't want to do a lot of reading...

- Get the driver
- At the very least, read the INSTALL.awe file.
- Install it. Recompile the kernel. (I compile everything as modules) 
- Go to Windows and copy down all info relevant to the soundcard eg. io, irq's
- run 'pnpdump' - Edit the /etc/isapnp.conf file to suit your card. There's a
description of  how to do this in the AWE64 driver documentation  
- restart the machine and load the modules with all parameters ie io, irq
etc. as described in AWE64 documentation 
- ...And ...as if by magic ...Your sound card works!!!!

On mine, everything except midi works ie I can play .wav and .mp3 files and all
but with midi, for some reason, even though the midi file is playing, I don't
hear any sound. If you have better results, let me know.

See ya

ali
