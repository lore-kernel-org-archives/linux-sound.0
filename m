From: David Jander <djander@alumnos.utfsm.cl>
Date: Wed, 01 Dec 1999 16:28:05 +0000
Subject: Re: Crystal cs4236: clicking noise
Message-Id: <marc-linux-sound-94406465207488@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-94390730003207@msgid-missing>
In-Reply-To: <marc-linux-sound-94390730003207@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

On Mon, 29 Nov 1999, Fernandez, Richard wrote:
>Hello,
>
>I have a Quantex H-1331 notebook running RH6.1
>
>I have sound up and running; I can play both music CD's and digital sound
>files.
>
>The problem is that when I play a sound file, in addition to the sound in
>the file, I also get a steady clicking noise. It sounds sort of like the
>popping noise you hear when you play old LP's.
>
>CD's play fine. The problem is only with files like .wav files.

Well, I don't know what your problem is. I know there is some trouble with the
CS423x driver (OSS-lite), which causes it to produce a horrible "click" at the
start of each digital sound output. Anybody knows about a fix for this ?
If you get clicks all the way along the sound, then I guess you've got BUS
problems with your notebook. The soundcard DMA doesn't get enough priority, or
some other device (maybe the video card) is taking over the BUS for too long.

>I'm not sure what other information would be helpful to include...

If you play a long wav-file or an MP3-song, do you get clicks at random
positions, or at a steady rythm ? May this ocurr also if there is no motion on
the screen ? Is the sound-file played entirely or does it "jump" ?

Greetz...

---------------------------------------------------------------------
David Jander J.                   | "M$-Windows sux, Linux Rulez !  
Electronics Student, UTFSM, Chile |  That's it !"
E-Mail : djander@alumnos.utfsm.cl |               -Me
