From: Bob Miller <kbob@jogger-egg.engr.sgi.com>
Date: Tue, 16 Mar 1999 22:57:05 +0000
Subject: Driver Writer's Questions
Message-Id: <marc-linux-sound-92163226831993@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

Hi.  I am trying to write a Linux sound driver.  I have some questions
that I hope someone here can answer.

1. (the big question) This device requires a single DMA buffer of up
   to 8 Kb in main memory.  It reads/writes the buffer circularly.  It
   can't chain buffers.  Can I use the OSS DMA routines to set that
   up somehow (how?), or do I have to write a non-OSS driver?
   What does this imply for mmap?
   
2. This device is capable of telling how many samples it has
   read/written, with an accuracy of 1 sample.  I'd like to export
   that via the SNDCTL_DSP_GET{I,O}PTR, ioctls, but I can't see how
   my driver can get control on those ioctls.

3. This device has memory-mapped registers.  I want to write a probe
   routine that can verify that the device is there at the address
   it's supposed to be.  Is there a Linux routine to "read memory and
   trap any fault"?

4. The mixer doesn't have a capability that corresponds to
   SOUND_MIXER_VOLUME.  If I don't implement SOUND_MIXER_VOLUME, will
   I be incompatible with 99% of the apps?  If I have to, I can fake
   it -- maintain a SW volume setting and merge it into the level
   I send to all the other faders...

That's enough questions for now.  Hopefully, these are easy for
someone who's familiar with the Linux sound architecture.

Thanks for any help.

					K<bob>
