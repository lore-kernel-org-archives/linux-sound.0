From: "Jirka Hanika" <HANIKA@ksvi.mff.cuni.cz>
Date: Fri, 22 Oct 1999 21:22:44 +0000
Subject: SNDCTL_DSP_BUSY
Message-Id: <marc-linux-sound-94063085304036@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

Hi,

a programming question.

I need an ioctl or some other API to find out whether the sound card 
has completely processed the buffers.  Something exactly like 
ioctl(SNDCTL_DSP_SYNC), but an asynchronous breed.
I have looked at audio.c and there is no such ioctl.

The only solution known to me is to write the neutral sample (silence)
asynchronously to the sound card until a bufferfarmfull bytes is 
written, then ioctl(SNDCTL_DSP_RESET).  This is however ugly as 
12-bit FAT.

In case there is no better approach available, what would you think of a 
new ioctl (say SNDCTL_DSP_BUSY)?

Jirka
