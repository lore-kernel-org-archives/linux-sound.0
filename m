From: David Forrest <drf5n@mug.sys.virginia.edu>
Date: Sat, 25 Mar 2000 20:07:50 +0000
Subject: Re: news on ALS sound cards ?
Message-Id: <marc-linux-sound-95401576500060@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

hello,
  Unfortunately, I didn't really do any real work on the linux ALS driver,
I just noticed that the sb.o module seemed to work with my ALS200 card,
and updated the documentation a bit.

Since Avance does not have support, (per http://avance.com/avance/faq.htm
) nor does it publish sufficient data on its chips, development on newer
linux drivers for this company's chips are very slow.  I myself have
recently bought a soundblaster card since the linux support is much
better.

You could try using the OSS sound driver ( http://www.opensound.com/ ),
which looks like it has developed one, (
http://www.opensound.com/osshw.html ) or try a different sound
card.   The cheapest and quickest option would be to use the OSS
driver.  However, if you want to support companies who acknowledge linux,
return your Avance card and get a friendlier chip.

Also ALSA looks like it could develop one for the ALS4000, but hasn't yet:
( http://www.alsa-project.org/~goemon/ )

Dave.


On Sat, 25 Mar 2000 kgt@free.fr wrote:

> Hi,
> 
> Congratulation for your work, it's nice to see things are going on. I've
> just downloaded the 2.3.99-pre3 kernel and saw that the ALS100 and
> ALS200 chips are now supported :-)
> 
> Unfornutaly for me, I have just bought an ALS4000 chip based soundcard
> (Asound Express) and I think I have seen enough web pages to say that
> it's not supported yet (well, I've also tried to make it work by myself,
> but that's not a criteria:).
> So maybe you know something of the future for this card's support and
> could tell me whether I should buy a anotherone or wait a bit  ?
> 
> Thank you in advance,
> 
> Benatoll
> 

-- 
 Dave Forrest                                dforrest@virginia.edu
 (804)296-7283h 924-3954w      http://mug.sys.virginia.edu/~drf5n/
