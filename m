From: Guenther Sohler <guenther.sohler@newlogic.at>
Date: Wed, 12 Jan 2000 06:25:30 +0000
Subject: wav2mid again
Message-Id: <marc-linux-sound-94768726627799@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

Hello list,

As I have seen, that there is interest in helping me completing my wav2mid,
I'll explain my program detailly.

My program consists of more parts

1.) The first part gets dsp sample data from either /dev/dsp or a wave file.
The data is always 16 bit and mono. Frequency as low as possible ussually 11025
Hz. This data is fed in about 200Bytes portions to the next routine

2.) The next routine does dft on more frequencies
  Therefore at the beginning of the program  I have prepared many filters
differing in their frequency by 1.059. maximum and miniumum frequency are
determined by their period times  just as constants. The filters are typically
17 or 34 periods long, as It is sufficient to keep the neighbour frequency low
enough. I use an overall mask over the filter(not hanning, but just a
(1-cosx)/2.
If one filter collected enough data, it dumps it output and begins from
new.Obviously a higher frequency will dump more data. I additionally save to
center point of the filter with each data

3.) Tune recognizion
For beeing able to detect tunes I just play a pure tune and save its
frequencies on disk. I save tunes for different pitches and different timbres(I
have just learned this word, Taehong Park).
Obviously I renice the patterns somehow before saving them to disk(I zero those
frequency beeing less then 5% of the maximum peak)
Then I am just puzzeling, which combination of the frequencies fit best to the
reality

4.) midi tune recognition
If such a tune multiplication factor is above a certain value, this note gets
turned on at the time, which comes with this tune.
If such a tune multiplaction factor is below a certain percentage of its maximum
it note gets turned off. So many notes haveing start time, stop time, midi
voice, midi pitch, volume are stored

5.) Writing the midi: easy task, not to mention

In this program I can switch between Oscilloscope mode and Spectrum analizer
mode. The shape of a violine looks horrible in both views, whereas a whistle
saxophone, flute,etc looks nice.


For those interested, I can send them the source code(the source code is not
brand, which I have in my office, but for sure sufficent).
Any documentation is also missing, but the program has a little -h option :)
The most brand version at home contains documentation.


Dave P. : This program is far away from completeness

Rick M. : I do not exactlyt understand you, what you mean, but As I explained
my prg more in detail, may be, can explain your idea better, then  ?
Instruments like the guitar, harve decease after playing, but not instruments
like the violin(at least not when using the bow), or flute, saxophone
