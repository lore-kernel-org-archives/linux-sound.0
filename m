From: Derrick J Brashear <shadow@DEMENTIA.ORG>
Date: Sun, 29 Nov 1998 19:07:36 +0000
Subject: Re: equalizer application in software?
Message-Id: <marc-linux-sound-91236821204791@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-91233787226861@msgid-missing>
In-Reply-To: <marc-linux-sound-91233787226861@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

On Sun, 29 Nov 1998, Kadinger Andras wrote:

> I think there might be some audio multiplexing libraries (that takes
> audio output of different apps and mixes them together into one stream to 
> send to the audio hardware); GNOME/Enlightement at least has one, called
> esd or esound I think. Since audio multiplexing is a very good feature, so
> is an equalizer, therefore I think building the two together (or at least
> making connecting them together simple) is worth the effort.

esound. 0.2.4 is the most current on ftp.enlightenment.org.

To be honest the architecture used by NAS and to a greater extent by AF
are more appealing to me, namely, be as much like X11 as possible.
However, I do agree that an "audio wrapper" API like esound,AF,NAS, or
maybe even rplay (but probably not) would be a good and logical companion
for such an application.

In order for it to really be useful to me, I need to finish the next stage
of the Linux/Sparc audio midlevel, namely, non-fixed-size,
non-fixed-number buffers.

-D
