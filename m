From: David Olofson <audiality@swipnet.se>
Date: Sun, 24 Oct 1999 17:42:18 +0000
Subject: Re: streaming from disk to terminatorX added (via mmap)
Message-Id: <marc-linux-sound-94078824916955@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-94077890409185@msgid-missing>
In-Reply-To: <marc-linux-sound-94077890409185@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: linux-sound@vger.kernel.org

On Sun, 24 Oct 1999, Benno Senoner wrote:
> PS: Now if we could get one of these turntables recorded with special
> static waves (saw waves), we could add add turntable motion detection
> and get the same features as "finalscratch" on BeOS:
> scratching an audiofile in realtime using a real turntable.
> :-)

Uhm, I have just developed a sensor decoding method that could be
useful for this. It's probably overkill, as it's accurate to some 128
bits/period of the input signal with input signals of around that
resolution. It's just that I most probably can't release the
details... :-(

Anyway, I have a clue about how to do it, so I could give some hints
if needed.

And there are other ways than a special LP. For example, a quadrature
decoder; get two reflective optisensors (UV LED + photodiode in a
single package - handy! :-), and use an encoder stripe around the
turntable disk. The encoder strip should look like this:

Sensor 1: ####    ####    ####    ####    ####
Sensor 2:   ####    ####    ####    ####    ####

Note: 90 degree phase diff!

Then run the "sensor 1" signal into the U/_D input of a binary
counter. (Standard chip - use 4xxx chips [CMOS], as they're less
sensitive to Vcc errors. Do *not* use buffered chips as triggers for
reading the sensors - they can start to oscillate and fry!) The
"sensor 2" signal goes to the count input of the chip. The chip is
then hooked up to a parallel port or something, so that you can read
the current value.

Of course, you may also rip out the electronics from a mouse.
(Preferably a PS/2 one, as they have 30-150 Hz update rate, as
opposed to 10-30 for serial mice...) That's two channels and some
buttons + decoder and interface - and there are drivers. :-) Remove
the LEDs and photodiodes/transistors from the mouse PCB, and replace
them with wires to the new detectors.


//David


 =B7A=B7U=B7D=B7I=B7A=B7L=B7I=B7T=B7Y=B7   P r o f e s s i o n a l   L i n =
u x   A u d i o
-  - ------------------------------------------------------------- -  -
    =B7Rock Solid                                      David Olofson:
    =B7Low Latency    www.angelfire.com/or/audiality   =B7Audio Hacker
    =B7Plug-Ins            audiality@swipnet.se        =B7Linux Advocate
    =B7Open Source                                     =B7Singer/Composer
