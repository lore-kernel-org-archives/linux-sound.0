From: est@hyperreal.org
Date: Sat, 15 Jan 2000 07:17:47 +0000
Subject: Re: MIDI programming
Message-Id: <marc-linux-sound-94800580502574@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-94791780628504@msgid-missing>
In-Reply-To: <marc-linux-sound-94791780628504@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

> 	Can anyone give me a hint at writing a simple
> program to read MIDI keyboard input? I don't want to parse
> this input, just to test the presence of the keyboard under
> Linux.
> 
> 	Taras

dd bs=1 if=/dev/midi | od -t x1 --width=1

..works for me.  I strike a key and get:

0000000 fe
*
0000020 90
0000021 5d
0000022 35
0000023 fe
0000024 90
0000025 5d
0000026 00
0000027 fe
*

which is a bunch of activie sensing bytes, a note-on/note-off pair and
more active sensing bytes. :)

E
