From: Benno Senoner <sbenno@gardena.net>
Date: Fri, 17 Dec 1999 13:47:34 +0000
Subject: Re:
Message-Id: <marc-linux-sound-94544453303571@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

On Thu, 16 Dec 1999, cmayes wrote:
> Hello, everyone. I have a ton of questions. 
>I'll keep this intro message relatively short to increase the possibility of
>someone actually reading it :-)  Plus, much of this may be off-topic. 
>If any of you can think of a better forum for my questions, please let me
>know. 

> 
> Recently, I've been hired at Magnitude Network, a company that provides streaming audio services for radio stations in Canada
>and the U.S. Upon my hiring I found, much to my dismay, 
>that the company was switching their Linux encoders (using real 5) to NT
>encoders! 
>The execs had decided to support Windows Media format, 
>which (for obvious reasons) was not readily available on the Linux platform. 

I'm thinking about if M$ will EVER release window media support for linux.
Consider that M$ is investing heavily in media technologies and cable
companies in order to keep their monopoly.
It's very simple: "if you don't run Windows you can't enjoy windows media etc)

Here in italy most Raido stations switched to windows media, and I'm sure
M$ paid them to switch to from realaudio to windows media.
scary !!

What we need is some free working audio streaming alternative or
RealNetworks opening up their specs.

Or we will really land into the same  IExplorer vs Netscape scenario. 


> 
> Recently (yesterday), I heard that some potential clients mentioned wanting to run Linux encoders rather than NT. 
>Although there aren't any definite plans, 
>I'd like to look into the possibility of setting up a Linux-based encoder that
>can:  
> - Run multiple encoders for a single audio source, possibly: 
> - mp3 
> - real 
> - Windows Media (possible WINE support?) 
> 
> I have a few ideas about this, but I am trying to keep this message concise ;-) 
> Would esd work in reverse (i.e. one input, multiple output), or is there a
> better/easier way?

I'm not sure but it could work, just run your multiple clients using
esddsp YOURAUDIOAPP

if it doesn't work ,
use the named pipes ( FIFO)
 just write a little app which does the following

while()
{
  read() from /dev/dsp
  write() to pipe1
  write() to pipe2
  .
  .
}

and then run:
mp3encoder <pipe1
realencoder <pipe2
etc.

  
> I'd really like to get this setup to work (reliably). It goes without saying that I'd very much prefer working with Linux 
>(or anything that's not MS-based, really). Plus, I won't have to keep
>installing and remotely maintaining (bleah!)  >NT on 80+ (and growing quickly)
>boxen across North America (excluding Mexico ATM).
>That would rule.  
> TIA, 
> 
> -Chris 

Benno.
