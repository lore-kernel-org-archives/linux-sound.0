From: fieschko@viconet.com (Mike Fieschko)
Date: Wed, 03 Feb 1999 15:47:03 +0000
Subject: Re: Is there any reason rvplayer5.0 wouldn't work with PPP 2.3.5 and
Message-Id: <marc-linux-sound-91806057207407@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

In an article on Sun, 31 Jan 1999 00:34:48 -0800 (PST),
 Miles Lane <root@amazon.com> wrote
 in list.Linux-Net about "Is there any reason rvplayer5.0 wouldn't work
 with PPP 2.3.5 and  kernel 2.2.1?": 

>I installed RealVideo 5.0 using the file from Real.com.
>I have a Crystal Audio sound card that esound and xgalaga 
>can produce sound on.  I configured rvplayer5.0 to use 
>TCP-only to penetrate my firewall (this works in on the same
>dial-in using Win98).  
>
>I get an "Error 1" after the rvplayer5.0 fills its initial
>buffers and then goes to connect to the realaudio server
>again.  "Error 1" means an unspecified error occured.
>(How helpful)
>
>Any clues out there?  Am I overlooking something?
>
>I have followed the instructions for configuring Netscape and 
>RealVideo libraries, plugins and mime types.  When I click on
>a RealAudio link on an HTML page, the rvplayer5.0 gets launched
>and the initial buffer queuing happens.  I even hear a pop from
>my speakers indicating the sound driver has at least been accessed.

What kernel version are you running?

From the Changes22.html (http://www.linuxhq.com/change22.html)

[begin quote]

RealPlayer 

    Current releases of Real Player 5.0 depend on a bug in the sound
	sub-system which is no longer there.  Consequently, they don't work.
	Real is aware of the problem and should have an updated version of
	the software available shortly.  In the mean time, you can always
	try backing up your copy of rvplayer, and then editing it by:

       dd if=/dev/zero of=rvplayer bs=1 count=1 seeke7586 conv=notrunc
	   dd if=/dev/zero of=rvplayer bs=1 count=1 seekf5986 conv=notrunc
	    


    If you're lucky, you'll then have sound.... 

    You may also need to edit it with 

       dd if=/dev/zero of=rvplayer bs=1 count=1 seekp2554 conv=notrunc


    as well.  Alternately, download rpopen from
    http://onramp.i2k.com/~jeffd/rpopen/ and pre-load it before you run
    rvplayer (it's a shared object which blocks rvplayer from doing the
    NONBLOCKing open of /dev/dsp).   

[end quote]
-- 

   Mike Fieschko, who lives in West Orange, New Jersey, USA
   fieschko@viconet.com
