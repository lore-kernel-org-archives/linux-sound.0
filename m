From: Benno Senoner <sbenno@gardena.net>
Date: Mon, 25 Oct 1999 14:32:02 +0000
Subject: Re: streaming from disk to terminatorX added (via mmap)
Message-Id: <marc-linux-sound-94089498426647@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-94077890409185@msgid-missing>
In-Reply-To: <marc-linux-sound-94077890409185@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

On Sun, 24 Oct 1999, David Olofson wrote:
> On Sun, 24 Oct 1999, Benno Senoner wrote:
> > PS: Now if we could get one of these turntables recorded with special
> > static waves (saw waves), we could add add turntable motion detection
> > and get the same features as "finalscratch" on BeOS:
> > scratching an audiofile in realtime using a real turntable.
> > :-)
> 
> Uhm, I have just developed a sensor decoding method that could be
> useful for this. It's probably overkill, as it's accurate to some 128
> bits/period of the input signal with input signals of around that
> resolution. It's just that I most probably can't release the
> details... :-(
> 

David, your solution looks nicely,
but I'm more for a plug-n-play solution:

2 turntable players
2 soundcards
1 PC loaded with mp3

use the 2 soundcard's inputs to detect turntable speed (py playing the static
waves on the turntable),
use the 2 audio outputs for the mix and prelisten (phones) channel.

IMHO the precision provided by sampling the turnables's static waves
is enough to get decent scratches, and the use of a "noise gate" when
the turntable is rotating at default speed will give you the final touch of
perfection.
:-)

David, I'cant remember but what would be the optimal method to detect
the speed of the turntables via audio input ?

form of the wave ?
SAW WAVE , which frequency ?

and then the algorithm ?
couting the number of zero crosses/sign changes ?
how o detect motion inversion ?
through looking at the resulting waveform ? :
if the next value is less than the previous 
AND you are not at end of the period (the jump is too big),
then you detected motion inversion.
right ?

The finalscratch people seemed wrong to think that only BeOS can provide
the horsepower to run a scratch-mp3s-on-turntable engine.

Seems that linux , will soon even begin to eat marketshare into the DJ sector.
:-)
( As David said: your next console could be powered by a GPLed audio engine
running Linux  :-)  )

Benno.
