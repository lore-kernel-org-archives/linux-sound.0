From: Chris Ison <cisos@bigpond.net.au>
Date: Tue, 19 Nov 2002 06:22:11 +0000
Subject: why no floats in kernel?
Message-Id: <marc-linux-sound-103768733630620@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

I was wondering why floats cannot be used in the kernel, I did read it
some where, but I also notice befs and some other driver does use
floats.

anyways, the problem is, I need to know how to turn this math into ints,
yes I know I can bit shift but it doesn't help initially till I get
around the floating point result.

( sound rate / sample rate ) * (note freq / sample freq)


Thanks in advance
Chris Ison
