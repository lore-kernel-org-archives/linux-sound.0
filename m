From: David Manifold <dem@pacificrim.net>
Date: Fri, 25 Sep 1998 16:23:25 +0000
Subject: Re: SB32 Problem
Message-Id: <marc-linux-sound-90674686519780@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-90671325305938@msgid-missing>
In-Reply-To: <marc-linux-sound-90671325305938@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

On Fri, 25 Sep 1998, Ricardo Peres wrote:

> Hi!
> 
> I have two problems: first, I cannot play midi files in Linux.
> I have RedHat 5.1 and a SoundBlaster 32 soundcard, have sound compiled in 
> the kernel, and everything else works fine.
> When I try to play a midi file, I get a message like "/dev/sequencer is 
> not configured"... Any ideas?

Well, you either forgot to say 'y' to MIDI support in the sound module, or
the /dev/sequencer device file is not set up.  It should be major 14,
minor 1.
crw-rw-rw-   1 root     sys       14,   1 Jul 18  1994 /dev/sequencer
You can re-create this with: 
rm -f /dev/sequencer;mknod /dev/sequencer c 14 1;chmod 666 /dev/sequencer

> Second, although I compiled the kernel with the SB32 low-level driver 
> from http://bahamut.mm.t.u-tokyo.ac.jp/~iwai/awedrv/ as a module, 
> whenever I try to `insmod sbawe` I get a message saying: "AWE32: not 
> detected". It is true that my soundcard is NOT a SB AWE32, just a SB32, 
> but I use it in Windows and everywhere else as AWE. What is the 
> difference between these two soundcards? How can I fix this (if it is 
> possible) ?

The SB32 is just an SB16 with more voices (or there are other changes,
but it is more like an SB16 than an AWE), so you should load the regular
SB driver.

David Manifold <dem@tunes.org>
