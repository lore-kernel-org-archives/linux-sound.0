From: "Jacek M. Holeczek" <holeczek@us.edu.pl>
Date: Tue, 19 Jan 1999 09:56:43 +0000
Subject: Re: ESS ES1689 OSS/Free help needed
Message-Id: <marc-linux-sound-91674206123799@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-91650730927120@msgid-missing>
In-Reply-To: <marc-linux-sound-91650730927120@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

Hi,
As I still cannot get Hannu's sound driver, I need to stick to what
exists.
> playmidi for FM synth is broken as shipped in 5.2; there are updated
> RPMS available at ftp://ftp.redhat.com/home/notting/playmidi/;
Thanks. I downloaded the playmidi and now the OPL3 works ( that is what I
expect is used when I do "playmidi -f" ).
> > 	7. "playmidi -e (-D0) something.mid" ( uart401+WaveTable ? )
> > 	   doesn't work at all - the program does something ( you can see
> > 	   that it "plays" if you use the "-r" flag ), but there is no
> > 	   single sound to be heard
Sorry, but this behaves the same way.
The /dev/sndstat says it finds a Midi device: "0: ESS 1688" which is not
bad ( it should actualy say 1868, as the ES1869 has a shared interrupt,
too ), but I still do not get any sound from it.
I expect that in this case ( "playmidi -e -D0" ) it should
automatically play using the uart401 + the WaveTable ( Wave Blaster 
compatible using AdMOS QS1000 + AdMOS QS1001A ) which I do have.
Or maybe I should somehow initialize the uart401/WaveTable myself ?
Problems with .au and .wav files remain.
In the meantime I tried to play .au file using sox, but the result was
pure ( a much better result one gets using "cat" ), then I tried to play
.wav files using sox, but the results were also pure - I have the filling
that 8bit samples are quite ok, but 16bit samples are wrong ( the ES1869
is 16bit, compatible with 8bit SB/Pro ).
Recording sound using sox gives also pure results ( much better results
are there if one uses "dd" ). Samples recorded with sox can be played with
win95, but the pure quality remains.
In all cases above ( to play and record ) sox uses /dev/dsp, so maybe
there is a problem somewhere there ( I cannot "cat" .wav to /dev/dsp ).
Thanks in advance,
Jacek.
