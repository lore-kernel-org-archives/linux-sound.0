From: Mike <cekim@ix.netcom.com>
Date: Fri, 25 Sep 1998 02:21:06 +0000
Subject: opti linux alpha full dupleX
Message-Id: <marc-linux-sound-90671637106977@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

I have posted a few times to various linux news groups regarding this
problem.  I have made some progress, but I need some assistance from
someone who might have hacked through various kernel/sound issues
already.

Quick summary:

1. opti 82c931 works under OSS/LINUX eval with 2.0.35 kernel in full
duplex mode.

2. if only one DMA is assigned to dma/dma16 it records and plays
correctly in SIMPLEX mode.

3. if two dma's are assigned (0 and 1 in my case) it play correctly but
recording results in an infinite buffer overrun and subsequent effective
crash of the sound system (it is no longer available and will not be so
until I reboot).

4. Alpha 164LX RH5.1 base with 2.1.121 patched to 122 kernel.  OSS
system = that which comes with 2.1.121 (3.8XX)

I have reduced the mad16 driver to a hardcoded sequence which loads the
address/dma values both to the various registers and to the attachment
to the ad1848 driver.

I was hoping to find something in the mad16 driver which was not
correct, but it all appears to conform with the data sheet and the end
result is the same with the original driver (buffer overrun).

I added some debug to dmabuf.c and discovered:
(this is at about 1145 in the code)
1. qlen  is greater than nbufs by one (or perhaps the reverse, but I do
recall that the result is an underflow - the driver is looking for one
more than the card has to offer).

2. it is performing a dma on channel "0" despite the fact that the
driver assigned dma 1 as the capture channel.

This weekend, if I get a chance, I plan to perform the same strip of
ad1848 to find out why the dma channels are being misused (or understand
why that is correct?).

If someone out there could point me to an easier solution than
systematically tearing apart the sound driver structure, I would VERY
appreciative.

Thanks,

/Mike
