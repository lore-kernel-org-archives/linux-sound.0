From: David Jander <djander@alumnos.utfsm.cl>
Date: Wed, 23 Feb 2000 19:53:33 +0000
Subject: Onboard synth on Acer AW35 pro with ALSA ...
Message-Id: <marc-linux-sound-95134683402772@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org


Hi everyone !

I've got a Acer AW35 pro sound card, which has a (very common) Crystal CS4237B
chip plus a wavetable synth onboard (CS9236 or something like that).
Using OSS/lite I can use this synth (/dev/sequencer) and it sounds perfectly
well. This synth is supposed to be connected in parallel with the external
MPU401 interface (logically that is, of course).

Now I am trying ALSA 0.5.2, (kernel 2.2.12, sound working OK), and I
found a strange problem:
I use a sequencer program (Melys for ALSA, or any other) writing to
/dev/sequencer, and connecting the ports correctly to the MPU401 driver (using
aconnect), I am able to produce sound on a synth connected externally to the
MPU401/Joystick connector of the sound card, but the internal Wavetable synth
does not produce any sound at all. (Moving each and every slider on the mixer
doesn't help either).
Does anyone know about this issue ?
I may try to connect an oszilloscope to the digital audio signal pins of the
wavetable chip (I have already identified these), and see if I can trace any
signals crossing the wire, but I'll have to be too desperate to do this :-)
That could discard any mixer problems.

Any suggestions/help/advice from anyone ? Or should I contact ALSA
directly with this issue ?

Sincerely,

----------------------------------
David Jander J.                   
Electronics Student, UTFSM, Chile 
E-Mail : djander@alumnos.utfsm.cl 
