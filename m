From: Bill Nottingham <notting@redhat.com>
Date: Mon, 29 Mar 1999 23:39:42 +0000
Subject: Re: problems with sound
Message-Id: <marc-linux-sound-92275128311228@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-92275025610407@msgid-missing>
In-Reply-To: <marc-linux-sound-92275025610407@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

Vikram Rayabhari (vikram@asterix.cis.ohio-state.edu) said: 
> but the problem is that I am not able to play any files. The CD player is
> working fine tho. playmidi gives the message :
> 
> open /dev/sequencer: Operation not supported by device

The es1370 doesn't have a midi sequencer.

> rvplayer gives out message :
> 
> ****audio: write error: 64 bytes errno: 11
> ****audio: write error: 64 bytes errno: 11

rvplayer runs into the same problem with the es1370 driver
that it does with kernels >= 2.2.

--
RealPlayer
=====

   Current releases of Real Player 5.0 depend on a bug in the sound
sub-system which is no longer there.  Consequently, they don't work.
Real is aware of the problem and should have an updated version of the
software available shortly.  In the mean time, you can always try
backing up your copy of rvplayer, and then editing it by:
   
dd if=/dev/zero of=rvplayer bs=1 count=1 seeke7586 conv=notrunc
dd if=/dev/zero of=rvplayer bs=1 count=1 seekf5986 conv=notrunc
      
If you're lucky, you'll then have sound....
	 
You may also need to edit it with
	    
dd if=/dev/zero of=rvplayer bs=1 count=1 seekp2554 conv=notrunc
	       
as well.  Alternately, download rpopen from
http://onramp.i2k.com/~jeffd/rpopen/ and pre-load it before you run
rvplayer (it's a shared object which blocks rvplayer from doing the
NONBLOCKing open of /dev/dsp).
--

Bill
