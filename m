From: "Eric B. Mitchell" <emitchell@altaira.com>
Date: Mon, 30 Nov 1998 16:17:50 +0000
Subject: Re: equalizer application in software?
Message-Id: <marc-linux-sound-91248037829442@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-91233787226861@msgid-missing>
In-Reply-To: <marc-linux-sound-91233787226861@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org



Derrick J Brashear wrote:
> 
> On Sun, 29 Nov 1998, Kadinger Andras wrote:
> 
> > I think there might be some audio multiplexing libraries (that takes
> > audio output of different apps and mixes them together into one stream to
> > send to the audio hardware); GNOME/Enlightement at least has one, called
> > esd or esound I think. Since audio multiplexing is a very good feature, so
> > is an equalizer, therefore I think building the two together (or at least
> > making connecting them together simple) is worth the effort.
> 
> esound. 0.2.4 is the most current on ftp.enlightenment.org.

The most recent "stable" release is 0.2.6, cvs snapshots are available 
from e.themes.org, or other gnome cvs sites.  With version 0.2.6, there
is a capability to connect a "filter" socket to the sound server.  A 
sample filter which simply copies data unchanged is included with the
source, so you can see how to interface with it.  

Basically, the server sends the mixed audio data to the filter.  The
filter process reads the information, processes it, and sends it back to 
the server.  The server writes the filtered data to the audio device.

Any decent Digital Signal Processing textbook should have the necessary
algorithms (and maybe even sample code) for implementing a bandpass
filter. The gsl (?) library may be of use for fft and perhaps even 
basic filter functions.

> To be honest the architecture used by NAS and to a greater extent by AF
> are more appealing to me, namely, be as much like X11 as possible.
> However, I do agree that an "audio wrapper" API like esound,AF,NAS, or
> maybe even rplay (but probably not) would be a good and logical companion
> for such an application.
> 
> In order for it to really be useful to me, I need to finish the next stage
> of the Linux/Sparc audio midlevel, namely, non-fixed-size,
> non-fixed-number buffers.
> 
> -D

-- 
+=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=+
| Eric B. Mitchell         mailto:ericmit@ix.netcom.com |
+=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=+
