From: David Olofson <audiality@swipnet.se>
Date: Wed, 27 Oct 1999 02:03:38 +0000
Subject: Re: pci128 line-in help
Message-Id: <marc-linux-sound-94099053303283@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-94098365529736@msgid-missing>
In-Reply-To: <marc-linux-sound-94098365529736@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: linux-sound@vger.kernel.org

On Wed, 27 Oct 1999, est@hyperreal.org wrote:
> I can't seem to get my pci128 line-in to work.  This is using the
> (es1370) OSS driver distributed with the 2.2.7 kernel.  I've tried all
> the obvious mixer settings as well as all the private ioctl()s the
> driver has, checked my hardware, etc.  Can anyone think of anything I
> might be missing?

What version of the card do you have?

There seems to be two versions, as far as the connectors are
concerned; one that looks like in "Getting started" (that you get
with OEM cards, at least), and one with a much smarter design.

The older (?) ones have Aux In and Rear Out in the same jack, and the
"lineout=3D1" option swithes it from Line In to Rear Out.

On the new (?) one (that I have), the "Speaker Out" has turned into
"Front Out", and can be changed between line/speaker with two jumpers
on the card. There is a Line In where the Speaker Out jack used to
be, and yes, it works in full duplex with the two Line Outs. :-) On
this card, "lineout=3D1" only enables the output from the jack that is
now ony Rear Out. AFAIK, the new Rear Out jack has no other function.

If your card is of the latter kind, your problem might be that the
Line In is actually where the "manual" says Speaker Out is; that is,
the 4'th (last) jack counting from the one closest to the
joystick/MIDI port. Check the card.

If it's the "old" card, make sure you do *not* use "lineout=3D1". Also
experiment some with the mixer. Mine seems a bit dodgy with the
kernel driver... (Works great with ALSA, though.)


//David


 =B7A=B7U=B7D=B7I=B7A=B7L=B7I=B7T=B7Y=B7   P r o f e s s i o n a l   L i n =
u x   A u d i o
-  - ------------------------------------------------------------- -  -
    =B7Rock Solid                                      David Olofson:
    =B7Low Latency    www.angelfire.com/or/audiality   =B7Audio Hacker
    =B7Plug-Ins            audiality@swipnet.se        =B7Linux Advocate
    =B7Open Source                                     =B7Singer/Composer
