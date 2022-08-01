From: Adam Stylinski <kungfujesus06@gmail.com>
Date: Mon, 01 Aug 2022 02:13:39 +0000
Subject: CA0132 5.1 audio
Message-Id: <CAJwHY9X2JCQ6sg_ARsuVNXUT6y7wv78tM2O1q755WS23zuwq5w@mail.gmail.com>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

Hello,

I've been having this issue for about a year now where I cannot
reliably get 5.1 audio from my X299 motherboard.  I was wondering if
maybe this ML may have somebody more knowledgeable with these creative
chipsets (and the DSP firmware) that I could maybe point them to this
bugzilla bug report?

https://bugzilla.kernel.org/show_bug.cgi?idg071

Once it works (after I patch in the quirks from the X99 boards) after
a successful boot, it works until it's powered down.  But it really is
a dice roll whether or not the ports reliably get configured properly.
I don't know if this is a DSP issue, but it seems like it could be.
Is there maybe something I could try to make this work more reliably?
Maybe in the pause routines before the firmware download gets checked,
add another pause?
