From: Hamish Moffatt <hamish@rising.com.au>
Date: Thu, 11 Mar 1999 07:52:52 +0000
Subject: weird sound problem in 2.2
Message-Id: <marc-linux-sound-92113923028064@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

I'm having a strange problem with sound in 2.2.2. I have an SB16 PnP.
I'm seeing IRQ/DRQ timeout messages.

My isapnp.conf says

(CONFIGURE CTL0070/-1 (LD 0
(INT 0 (IRQ  5 (MODE +E)))
(DMA 0 (CHANNEL  1))
(DMA 1 (CHANNEL  5))
(IO 0 (BASE 0x220))
(IO 1 (BASE 0x330))
(IO 2 (BASE 0x388))
 (ACT Y)
))

Options used in loading the modules:

options sb io=0x220 irq=5 dma=1 mpu_io=0x330 dma16=5
options opl3 io=0x388

However, when I run 2.0.35, it works fine. My .config for sound on
2.0.35 says

CONFIG_SOUND=m
CONFIG_SB=y
CONFIG_AUDIO=y
CONFIG_MIDI=y
CONFIG_YM3812=y
SBC_BASE"0
SBC_IRQ=5
SBC_DMA=1
SB_DMA2=5
SB_MPU_BASE30
SB_MPU_IRQ=-1
DSP_BUFFSIZEe536

Any suggestions? Seems weird to me. Please cc me as I don't subscribe
to this list.


Hamish (hamish@debian.org)
-- 
Hamish Moffatt       Mobile: +61 412 011 176       hamish@rising.com.au

Rising Software Australia Pty. Ltd. 
Developers of music education software including Auralia & Musition.
31 Elmhurst Road, Blackburn, Victoria Australia, 3130
Phone: +61 3 9894 4788  Fax: +61 3 9894 3362  USA Toll Free: 1-888-667-7839
Internet: http://www.rising.com.au/
