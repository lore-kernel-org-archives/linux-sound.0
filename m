From: Guenther Sohler <guenther.sohler@newlogic.at>
Date: Tue, 11 Jan 2000 14:31:53 +0000
Subject: recognizing sounds
Message-Id: <marc-linux-sound-94761525425608@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

Hello list,

I am currently writing a tool 'wav2mid' , which should be capable of
recognizing tunes in wave files.
This works quite well

*       Wenn I just recognize the synthesizer's output read through dsp
*       When these are easy voices like flute, saxophon, whistle, ...
*       I achieved all tunes(and accords) of the song 'silent night, holy
night' to be recognized correctly. It is a 2 sound saxophone melody.
        The only tiny error at the moment is, that two equal tunes next to each
other will be recognized as a longer tune.

My problem is following: Recognizing the sound of strings(like the violin) is
very difficult as every period in time domain looks remarkably different from
each other. So also all the spikes in frequency domain change their amplitude
rapidely

Does somebody of you have experience in this topic ?

Thank you in advance.
