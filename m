From: Paul Dwerryhouse <paul@xenu.ee.mu.oz.au>
Date: Mon, 01 Feb 1999 00:30:49 +0000
Subject: Re: Is there any reason rvplayer5.0 wouldn't work with PPP 2.3.5 and kernel 2.2.1?
Message-Id: <marc-linux-sound-91782910530666@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org


There's a fix for this problem - a library needs to be downloaded and then
preloaded before the realaudio executable is run.

I can't remember where to get it from, but if you go to the Real website,
find their troubleshooting search page and type in "linux" and "2.1",
the resulting page will give you a pointer to the fix.

I've noticed, however, that under 2.2.x, there's a lot of clicking and popping
from one of the sound channels when there's network or disk activity. This
definitely didn't happen under 2.0.x - I've switched back and forth from one
kernel to the other and can replicate the problem in 2.2. Does anyone know
how to fix this? It's particularly annoying under Realaudio...

Cheers,

Paul.


On Sun, Jan 31, 1999 at 12:34:48AM -0800, Miles Lane wrote:
> 
> I installed RealVideo 5.0 using the file from Real.com.
> I have a Crystal Audio sound card that esound and xgalaga 
> can produce sound on.  I configured rvplayer5.0 to use 
> TCP-only to penetrate my firewall (this works in on the same
> dial-in using Win98).  
> 
> I get an "Error 1" after the rvplayer5.0 fills its initial
> buffers and then goes to connect to the realaudio server
> again.  "Error 1" means an unspecified error occured.
> (How helpful)
> 
> Any clues out there?  Am I overlooking something?
> 
> I have followed the instructions for configuring Netscape and 
> RealVideo libraries, plugins and mime types.  When I click on
> a RealAudio link on an HTML page, the rvplayer5.0 gets launched
> and the initial buffer queuing happens.  I even hear a pop from
> my speakers indicating the sound driver has at least been accessed.
> 
> Thanks!
> 	Miles
> 
> -
> To unsubscribe from this list: send the line "unsubscribe linux-net" in
> the body of a message to majordomo@vger.rutgers.edu

-- 
Paul Dwerryhouse                                        paul@xenu.ee.mu.oz.au
"The growing use of e-mail, not to mention Web-page publishing, threatens to 
reverse the trend towards illiteracy among the supposedly educated without at 
the same time improving their spelling". -- Michael Swaine, Dr. Dobb's Journal
