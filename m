From: "Jim Deas" <jdeas@jadsystems.com>
Date: Sat, 08 Mar 2003 22:35:48 +0000
Subject: Using /dev/dsp from a kernel driver
Message-Id: <marc-linux-sound-104716240005049@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

I have a good tone generator running in user space.
This device uses /dev/dsp write and ioctl to do what
I want.
 I would now like to move this to the driver that creates
the audio data.
Right now I have to open both devices and transfer the
data via user space between the two devices.

How do I open and use ioctl from another driver?
I know about the ksyms but have not been able to
understand the move from opening a file pointer and 
using ioctls in user space to directly connecting two
drives using the kernels symbol table (ksyms).

Thanks,
J. Deas


