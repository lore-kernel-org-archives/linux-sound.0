From: Paco <paco@OhKeePa.Net>
Date: Tue, 15 Feb 2000 19:45:50 +0000
Subject: Re: line-in input doesn't record
Message-Id: <marc-linux-sound-95064849127782@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-95064847827665@msgid-missing>
In-Reply-To: <marc-linux-sound-95064847827665@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

On Tue, 15 Feb 2000, Bryan Bolden wrote:

> hello all!!  I am trying to begin recording/sampling of voice coming in
> from my line-in jack.  I have a tape recorder connected (through the tape
> recorder' s earphone jack) to the line-in of my sound card (is that right).

Well... if the tape recorder has a line-out you should really use that
instead, but the headphone output will work as well.  Just make sure you
don't turn up the volume on the tape recorder too much... it'll overload
the soundcard input and you'll get distorted data.

>  now when I press play on the tape I do hear the voices on tape through my
> external spekers but when I test the recording with :
> 
> dd if=/dev/audio of=/tmp/audio_test
> and then:
> cat /tmp/audio_test >/dev/dsp
> 
> all I hear is the sound from the mic input.  I have adjusted the line-input
> sound level through a mixer at a higher leven that the mic's level but I
> don't hear anything from the sampled audio from the tape despite hearing it
> from my external speakers.  any suggestions?

Using your mixer application, switch the "RECORDING SOURCE" from MIC to
LINE-IN.  Then you should hear the tape recorder input and not the
microphone input in the final recording.  (If you're trying to record from
both the mic and the line-in, you can't do it at the same time.)

regards,
Paco
