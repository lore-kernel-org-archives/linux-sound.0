From: Deirdre Saoirse <deirdre@deirdre.net>
Date: Tue, 23 Feb 1999 01:10:58 +0000
Subject: Re: Laptop Sound?
Message-Id: <marc-linux-sound-91973249423164@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-91965800932306@msgid-missing>
In-Reply-To: <marc-linux-sound-91965800932306@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

BTW, I wrote OpenSound and asked. Their response was that I probably had
my sound IRQ set to 7, which was, by default, the parallel port. This
would cause choppy sound.

Indeed, it was set to IRQ 7. I can't wait until everyone goes home so I
can test this hypothesis and see if this is, indeed, the issue. :)

On 22 Feb 1999, Zygo Blaxell wrote:

> In article <Pine.LNX.3.96.990221202945.6008I-100000@rockhopper.deirdre.org>,
> Deirdre Saoirse  <deirdre@deirdre.net> wrote:
> >Thinking I might try something less dramatic than mp3s, I tried playing
> >CDs from the console, which works fine. However, I don't know if that's
> >going through the sound driver or what (I have no kernel sound support).
> 
> Playing a CD usually happens using the sound card's analog mixer, not with
> the sound output.
> 
> My guess is that your laptop is using power-saving features including
> slowing down the CPU, and the MP3's aren't being decompressed fast enough.  
> But that's only a guess.
> -- 
> Zygo Blaxell, Linux Engineer, Corel Corporation, zygob@corel.ca (work),
> zblaxell@furryterror.org (play).  It's my opinion, I tell you! Mine! All MINE!
> Size of 'diff -Nurw [...] winehq corel' as of Mon Feb 22 11:14:00 EST 1999
> Lines/files:  In 2948 / 53, Out 29300 / 428, Both 31518 / 461
> 

_Deirdre  *  http://disclaimer.deirdre.org  *  http://www.deirdre.net
"I would rather choose to have my leg bitten off than to buy NT"
Rob Narberes, Information Systems Manager, DNA Plant Technologies Corp
as quoted in (!) Computerworld
