From: Dave Mielke <dave@mielke.cc>
Date: Tue, 15 Feb 2000 18:52:48 +0000
Subject: Re: line-in input doesn't record
Message-Id: <marc-linux-sound-95064849627819@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-95064847827665@msgid-missing>
In-Reply-To: <marc-linux-sound-95064847827665@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

[quoted lines by Bryan Bolden on February 15, 2000, at 13:09]

>I have a tape recorder connected (through the tape
>recorder' s earphone jack) to the line-in of my sound card (is that right).
> now when I press play on the tape I do hear the voices on tape through my
>external spekers but when I test the recording 

If you do "aumix -q", you'll notice a "P" beside your current line-in setting.
This means that you can play, but that you cannot record, via that input. You
need to switch this "P" to "R", which means that you can both play and record
via the input. To do this, use a command like "aumix -i R".

-- 
Dave Mielke           | 856 Grenon Avenue | I believe that the Bible is the
Phone: 1-613-726-0014 | Ottawa, Ontario   | Word of God. Please contact me
EMail: dave@mielke.cc | Canada  K2B 6G3   | if you're concerned about Hell.
