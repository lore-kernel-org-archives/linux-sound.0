From: Itai Nahshon <nahshon@actcom.co.il>
Date: Thu, 13 May 1999 16:36:22 +0000
Subject: Re:  SB16
Message-Id: <marc-linux-sound-92665164714802@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-92661039616424@msgid-missing>
In-Reply-To: <marc-linux-sound-92661039616424@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

>Hi all,
>
>    I am still having problems with configuring my SB16 sound card. 
>    I am using Slakware with kernal 2.0.30. I compile the kernal with 
>
>    Sound ? M
>    support for /dev/dsp and /dev/audio ? Y
>
>    Other I put N.

You must also enable Sound Blaster support!

While you do that I suggest that you also enable
the sequencer part and be able to play MIDI files.

Consider upgrading to a more recent kernel (2.2.x).

Itai
