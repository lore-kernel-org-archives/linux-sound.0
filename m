From: "Thomas T. Veldhouse" <veldy@visi.com>
Date: Thu, 07 Oct 1999 01:20:49 +0000
Subject: Yamaha SA3 onboard sound?
Message-Id: <marc-linux-sound-93925942527736@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

Hello,

    I have the AL440LX motherboard with onboard sound.  The sound card is a
Yamaha SA3.  I know that the 2.2.12 kernel supports this card.  I was
wondering if anybody has had any luck setting this card up - and if so, how
did you do it?  I have been unable to find adequate docs for isapnp tool,
but then, I haven't really tried it because I am not sure that is the proper
route.  Here is the configuration I use:

### Sound support ###
/sbin/modprobe mpu401
/sbin/modprobe ad1848
/sbin/modprobe opl3sa2 io=0x370 mss_io=0x530 mpu_io=0x330 irq=5 dma=1 dma2=0
/sbin/modprobe opl3 io=0x388
/sbin/modprobe sound

And here is my output from /dev/sndstat:

OSS/Free:3.8s2++-971130
Load type: Driver loaded as a module
Kernel: Linux barley 2.2.12 #3 Wed Oct 6 17:45:31 CDT 1999 i686
Config options: 0
Installed drivers:
Card config:
Audio devices:
0: MS Sound System (CS4231) (DUPLEX)
Synth devices:
0: Yamaha OPL2
Midi devices:
0: MPU-401 0.0 Midi interface #1
Timers:
0: System clock
1: MS Sound System (CS4231)
Mixers:
0: OPL3-SA3 and AD1848 (through MSS)
1: MS Sound System (CS4231)

Can anybody help me out?

Thanks,

Tom Veldhouse
veldy@visi.com

P.S. The 4-front drivers work great, but I don't like the hassle with
loading and unloading them everytime I upgrade the kernel.  I also like
using the open drivers if at all possible.
