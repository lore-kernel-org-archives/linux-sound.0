From: Rui Sousa <rsousa@grad.physics.sunysb.edu>
Date: Sun, 08 Aug 1999 23:48:54 +0000
Subject: File descriptors and Sound
Message-Id: <marc-linux-sound-93415570309034@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

Hi,

Can someone give me some pointers on how to get control
over /dev/audio by two different applications?

I realized that it's not possible to open /dev/audio
in two separate applications while trying to setup
speakfreely...

If the device is full-duplex how can I have one application
reading it and another writing?

Thanks in advance
-- 
Rui Sousa
