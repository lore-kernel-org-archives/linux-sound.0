From: Alexis DOMJAN <adomjan@horus.horus.ch>
Date: Wed, 28 Oct 1998 09:21:43 +0000
Subject: Re: Sound under 2.1.125
Message-Id: <marc-linux-sound-90957053300228@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-90956439330548@msgid-missing>
In-Reply-To: <marc-linux-sound-90956439330548@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

On Wed, 28 Oct 1998, Sangohn Christian wrote:

> I have Kernels 2.0.35smp and 2.1.125 with sound modules for the SB-AWE32.
> With 2.0.35 there is no problem.
> But I can't hear anything wtih 2.1.125. Kmix puts out:
> "There is no mixer support for your system" although "ls -l /dev/mixer" 
> is there:
> crw-rw-r--   1 root     audio     14,   0 Jul 21 02:45 /dev/mixer

The mixer device can exist; it doesn't mean that sound is supported.
To know if sound modules were loaded correctly, then just type
cat /proc/ioports and look if you see your sound blaster somewhere
(at 0x220 for example). 

Once you've compiled your sound card support using modules, when booting
you can type something like: modprobe sound io=0x220 irq=5 dma=1 dma16=5
then you must also load specific modules. I don't remember the names exactly,
but for example modprobe opl3 will load opl3 module, just do the same for
sb, awe32 support; ls /lib/modules/2.1.125/misc to see the sound modules.

> So how can I fix that?

Hope it helps you. If I'm wrong, hope that someone will correct me :-)

Cu!
Alexis
