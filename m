From: Paul <pelaufer@csupomona.edu>
Date: Sat, 01 Jul 2000 07:52:33 +0000
Subject: Re: is it true ?
Message-Id: <marc-linux-sound-96243802511579@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

It is true that the Vibra16X is NOT supported in full-duplex mode in Linux,
*BSD, or OSS commercial. This is because the Vibra16X is a strange cookie and
Creative Labs doesn't even appear to have documentation for this card (how the
hell they wrote a windows driver I don't know - Alan had a contact in C.L. a
few years ago and that guy couldn't find the needed docs). So we're SOL on
that
front. I've recently recieved one of these cards from a fellow Linux user in
Canada for the purpose of attempting to figure out full-duplex operation of
the
card and implementing it in Linux. I am currently (with some success) reverse
engineering the windows driver to figure out how it ticks. I'm keeping a
journal of my progress and will post to this list when I have something worth
talking about :)

Paul Laufer

On Fri, 30 Jun 2000 08:05:56 Gianmaria Collazuol wrote:
> is it true that the sb model Creative ViBRA16X PnP is only partially 
> supported within linux and cannot work with 16 bits ? i.e. i'll 
> never exploit full-duplex stuff !
> thanks in advance for answers, cheers,
> gianmaria
