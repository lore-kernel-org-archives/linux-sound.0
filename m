From: "Vegard Nossum" <vegard@peltkore.net>
Date: Sat, 05 May 2007 12:52:33 +0000
Subject: Unable to record
Message-Id: <63203.84.210.74.57.1178369553.squirrel@peltkore.net>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

Hello,

I am not able to use the line-in/microphone jacks with my sound card. The
sound card is a built-in Realtek ALC655. I am using kernel 2.6.20.9.

I have the choice between four capture streams, "Intel ICH7", "Intel ICH7
- MIC ADC", "Intel ICH7 - MIC2 ADC", and "Intel ICH7 - ADC2". When I
attempt to run arecord or Audacity with the first and the last streams, 0
and 3, I get a fixed signal that is different from zero. It does not
contain any data from the microphone. When I try to record with 1 or 2, I
don't get any data at all (in arecord, I simply get an empty file, and in
Audacity, the cursor doesn't move when recording is going on).

The motherboard data sheet says that there are only three analog stereo
sound inputs, line-in, CD, and AUX. I have one microphone input at the
front of the computer (connected to the microphone-front pins on the
motherboard) and one microphone and one line-in at the back. The cd-in
pins on the motherboard appear to be unused.

Audio playback works perfectly.

Can anybody help me debug this problem? I have compiled some information
about my system here:
http://vegard.afraid.org:1104/pub/alc655/
Also see sample arecord output.

Thanks.


Kind regards,
Vegard Nossum

