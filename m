From: Jason Wilfred Woodford <jwoodfd@kelvin.physics.mun.ca>
Date: Sun, 29 Nov 1998 18:13:49 +0000
Subject: Re: equalizer application in software?
Message-Id: <marc-linux-sound-91237460010100@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-91233787226861@msgid-missing>
In-Reply-To: <marc-linux-sound-91233787226861@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org


On Sat, 28 Nov 1998, Derrick J Brashear wrote:

> I don't suppose anyone's done an equalizer application in software, e.g.
> not a controller for a hardware equalizer as in an AWE? Presumably this
> would be something between the audio source and the audio device, or a
> library which could be used by applications desirous of such
> functionality.
> 
> (I assume no such application exists)
> 
> -D
> 
> 
> 

Hummm..... lemme think.

I know there is a program available somewhere to do a FFT (Fast Fourier
Transform) on a live real-time audio input. Perhaps if you take the
frequency spectrum from the FFT ( it looks like a really high definition
equalizer spectrum...... cool to watch), increase or decrease the
intensity of the frequency components according to your equalizer's band
settings, then recombine the components (a sort of reverse FFT), then you
get the original waveform, except it has been equalized.

What do we think??

Sounds like project..... Where is the prog. to do the FFT? On sunsite?

Feedback appreciated.


-/|\-/|\-/|\-/|\-/|\-/|\-/|\-/|\-/|\-/|\-/|\-/|\-/|\-/|\-/|\-/|\-/|\-/|\-
Jason Woodford                  Faculty of Education
Home: 579-2079 Office: 749-7503	Memorial University of Newfoundland
jwoodfd@kelvin.physics.mun.ca	St. John's, NF, CANADA
====================================
