From: Keith Duthie <psycho@albatross.co.nz>
Date: Fri, 26 Feb 1999 21:58:15 +0000
Subject: Re: Can anyone help me with the Sound Blaster 64 PCI?
Message-Id: <marc-linux-sound-92000185418897@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

On Fri, 26 Feb 1999, Eduardo Rodriguez Esteban wrote:

> 	I'm trying to configure my SB 64 PCI but have not managed it yet.
> I've compiled my kernel with sound support, when booting I can read
> something like "sound started" and "sound completed" but I'm not able to
> hear anything.
Minor problem. When you don't know how to configure a sound card, its
better to compile sound support as a module, because then you don't need
to recompile for every change in configuration.

> 	I've cat a .au to /dev/dsp and /dev/audio but everything appears in
> my screen and then a message "/dev/dsp: not Configured"  :(  Could any of
> you help me, please? 
You don't have your sound card configured right.

First of all, the list you probably should have emailed is linux-sound.
Secondly, you can find out your sound card's irq and io-port by doing
cat /proc/pci
Thirdly, if you compile sound as a module, make sure you add to the module
configuration file (either /etc/modules.conf or /etc/conf.modules)
options sound traceinit=1
-- 
.sig under deconstruction. Please watch out for falling stars.
     +++ATM2           O-        +++ATL3           +++ATM1
