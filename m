From: Rui Sousa <rsousa@grad.physics.sunysb.edu>
Date: Thu, 13 Apr 2000 19:32:38 +0000
Subject: Re: [Emu10k1-devel] fragment size using emu10k1
Message-Id: <marc-linux-sound-95565913909441@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

paco@hydrofunk.org wrote:
> 
> Hi...
> 
> I've noticed a problem using the ioctl SNDCTL_DSP_GETBLKSIZE with my
> SBPCI512.  I'm not familiar with the underlying workings of the sound
> driver (emu10k1), and I really don't know if this is a kernel problem or a
> driver problem.
> 
> The problem is simple, when you issue the GETBLKSIZE call, the value that
> is reported back is wrong by a power of 2.  The call will report that the
> buffer size is "X" Bytes, but it is really only of size "X/2" Bytes.
> 
> This can cause problems in applications that attempt to use this
> information for malloc calls, or for applications that need to write
> data to the card in full fragments at a time.
> 

I don't see any problem. Can you go the utils/oss-test directory,
type make, run ./play. Compare the values of SELECTED BUFFER and
ACTUAL BUFFER, are they ok? If so compare your code with setup() in
common.c to see what the problem is.

Rui Sousa
